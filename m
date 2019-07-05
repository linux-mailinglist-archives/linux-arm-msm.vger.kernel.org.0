Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438EB60187
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 09:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfGEHds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 03:33:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43210 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfGEHds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 03:33:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8488260AA8; Fri,  5 Jul 2019 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562312027;
        bh=nPMhnj+zcNooc/1ChtGLQSB7ksNEaj/QPLBEWR76RO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BihSJiKeUDChR6i3Dp7K6l69lFTP6+7D7jDvkYQ4xNGZdjp+87ihRex3SwcxuVlOA
         7rEvma0l9tyeikvl41PXuopht8chWiBSiyboifQCdgg+Bjgm0wki4niVK26LyjMMj0
         0zYkqVR8c/7wh8B0e8hs4qlLmM9mveQEvUHHryLM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id ABF54607EB;
        Fri,  5 Jul 2019 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562312026;
        bh=nPMhnj+zcNooc/1ChtGLQSB7ksNEaj/QPLBEWR76RO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QBOBVX4Dag+b/K6K7G8Iza+n8Ph3SCMq4bPS0cIlgZuF5oTo2gb+epe0RRCFAmH6w
         vN3y/S+/ltKWEH8NS0Jrk7FidcVwwBAhCGJV+Cimb/xiCbWuWgTpdeAibIXvk7JVAs
         gOBRFRYZFF6HAZPcOT9SsAle7zI+lwNlFCJ8I5Os=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Jul 2019 13:03:46 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     marcel@holtmann.org
Cc:     linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, anubhavg@codeaurora.org
Subject: Doubt/issue in hci_dev_do_close
In-Reply-To: <a75d686f28a2c73562e9bbf5b601d37c@codeaurora.org>
References: <1553689723-21017-2-git-send-email-c-hbandi@codeaurora.org>
 <201903290535.u5TF12SC%lkp@intel.com> <20190328212320.GF112750@google.com>
 <a75d686f28a2c73562e9bbf5b601d37c@codeaurora.org>
Message-ID: <e0f4f7acffb3abd2c0d1790a7cd79905@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi Marcel/Bluetooth Maintainers,

In hci_dev_do_close first it is sending vendor specific shutdown routine 
and then after some operations it is sending
the hci_reset command.
However in vendor specific shutdown routine if vendor already powered 
off the vendor chip. In those cases it will not
send the HCI_RESET command. That may lead to bug or some cleanup 
operations not done properly in Chip.
Is there any specific reason why it is sending vendor specific shutdown 
routine first and then sending HCI_RESET command.


int hci_dev_do_close(struct hci_dev *hdev)
{
	bool auto_off;

	BT_DBG("%s %p", hdev->name, hdev);

	if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
	    test_bit(HCI_UP, &hdev->flags)) {
		/* Execute vendor specific shutdown routine */
		if (hdev->shutdown)
			hdev->shutdown(hdev);
	}

	cancel_delayed_work(&hdev->power_off);

	hci_request_cancel_all(hdev);
	hci_req_sync_lock(hdev);

	if (!test_and_clear_bit(HCI_UP, &hdev->flags)) {
		cancel_delayed_work_sync(&hdev->cmd_timer);
		hci_req_sync_unlock(hdev);
		return 0;
	}

	hci_leds_update_powered(hdev, false);

	/* Flush RX and TX works */
	flush_work(&hdev->tx_work);
	flush_work(&hdev->rx_work);

	if (hdev->discov_timeout > 0) {
		hdev->discov_timeout = 0;
		hci_dev_clear_flag(hdev, HCI_DISCOVERABLE);
		hci_dev_clear_flag(hdev, HCI_LIMITED_DISCOVERABLE);
	}

	if (hci_dev_test_and_clear_flag(hdev, HCI_SERVICE_CACHE))
		cancel_delayed_work(&hdev->service_cache);

	if (hci_dev_test_flag(hdev, HCI_MGMT)) {
		struct adv_info *adv_instance;

		cancel_delayed_work_sync(&hdev->rpa_expired);

		list_for_each_entry(adv_instance, &hdev->adv_instances, list)
			cancel_delayed_work_sync(&adv_instance->rpa_expired_cb);
	}

	/* Avoid potential lockdep warnings from the *_flush() calls by
	 * ensuring the workqueue is empty up front.
	 */
	drain_workqueue(hdev->workqueue);

	hci_dev_lock(hdev);

	hci_discovery_set_state(hdev, DISCOVERY_STOPPED);

	auto_off = hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF);

	if (!auto_off && hdev->dev_type == HCI_PRIMARY &&
	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
	    hci_dev_test_flag(hdev, HCI_MGMT))
		__mgmt_power_off(hdev);

	hci_inquiry_cache_flush(hdev);
	hci_pend_le_actions_clear(hdev);
	hci_conn_hash_flush(hdev);
	hci_dev_unlock(hdev);

	smp_unregister(hdev);

	hci_sock_dev_event(hdev, HCI_DEV_DOWN);

	if (hdev->flush)
		hdev->flush(hdev);

	/* Reset device */
	skb_queue_purge(&hdev->cmd_q);
	atomic_set(&hdev->cmd_cnt, 1);
	if (test_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks) &&
	    !auto_off && !hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
		set_bit(HCI_INIT, &hdev->flags);
		__hci_req_sync(hdev, hci_reset_req, 0, HCI_CMD_TIMEOUT, NULL);
		clear_bit(HCI_INIT, &hdev->flags);
	}

	/* flush cmd  work */
	flush_work(&hdev->cmd_work);

	/* Drop queues */
	skb_queue_purge(&hdev->rx_q);
	skb_queue_purge(&hdev->cmd_q);
	skb_queue_purge(&hdev->raw_q);

	/* Drop last sent command */
	if (hdev->sent_cmd) {
		cancel_delayed_work_sync(&hdev->cmd_timer);
		kfree_skb(hdev->sent_cmd);
		hdev->sent_cmd = NULL;
	}

	clear_bit(HCI_RUNNING, &hdev->flags);
	hci_sock_dev_event(hdev, HCI_DEV_CLOSE);

	/* After this point our queues are empty
	 * and no tasks are scheduled. */
	hdev->close(hdev);

	/* Clear flags */
	hdev->flags &= BIT(HCI_RAW);
	hci_dev_clear_volatile_flags(hdev);

	/* Controller radio is available but is currently powered down */
	hdev->amp_status = AMP_STATUS_POWERED_DOWN;

	memset(hdev->eir, 0, sizeof(hdev->eir));
	memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
	bacpy(&hdev->random_addr, BDADDR_ANY);

	hci_req_sync_unlock(hdev);

	hci_dev_put(hdev);
	return 0;
}
