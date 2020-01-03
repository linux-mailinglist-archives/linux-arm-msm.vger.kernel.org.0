Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9FF12F5E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 10:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgACJCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 04:02:23 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:14270 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726390AbgACJCV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 04:02:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578042140; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cOuStBIW64t8rbbT+AdioiTO1Ufaf24eO4l1n6XmGvE=;
 b=ffPMq/3CWIB9TmIo90m0nCuLuHCl+mLdWQx1vPjrf3c7gplUppbOIsV75qCts+XTG0bAQ1Tj
 qUGrrCvYf8xFk46Il79j+BJZ6HbevM2IOvVlb/VN908uCzD9d57xbgLIDl2wkrur8ok5xBdf
 dFaD4OpdYd6aHtbNg4aJ4bDrbJk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0f031a.7f77d9557b90-smtp-out-n02;
 Fri, 03 Jan 2020 09:02:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 560FCC4479F; Fri,  3 Jan 2020 09:02:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9270BC433CB;
        Fri,  3 Jan 2020 09:02:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 03 Jan 2020 17:02:17 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v3 4/4] Bluetooth: hci_qca: Add HCI command timeout
 handling
In-Reply-To: <fe752fb28dbefd87f103a4986df55e20@codeaurora.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
 <20191227072130.29431-4-rjliao@codeaurora.org>
 <20200102190727.GB89495@google.com>
 <fe752fb28dbefd87f103a4986df55e20@codeaurora.org>
Message-ID: <beb3178477c790e1a5b98e67471286c7@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

在 2020-01-03 14:33，rjliao@codeaurora.org 写道：
> 在 2020-01-03 03:07，Matthias Kaehlcke 写道：
>> Hi Rocky,
>> 
>> On Fri, Dec 27, 2019 at 03:21:30PM +0800, Rocky Liao wrote:
>>> This patch adds the HCI command timeout handling, it will trigger 
>>> btsoc
>>> to report its memory dump via vendor specific events when hit the 
>>> defined
>>> max HCI command timeout count. After all the memory dump VSE are 
>>> sent, the
>>> btsoc will also send a HCI_HW_ERROR event to host and this will cause 
>>> a new
>>> hci down/up process and the btsoc will be re-initialized.
>>> 
>>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>>> ---
>>> 
>>> Changes in v2:
>>> - Fix build error
>>> Changes in v3:
>>> - Remove the function declaration
>>> - Move the cmd_timeout() callback register to probe()
>>> - Remove the redundant empty line
>>> 
>>>  drivers/bluetooth/hci_qca.c | 45 
>>> +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 45 insertions(+)
>>> 
>>> diff --git a/drivers/bluetooth/hci_qca.c 
>>> b/drivers/bluetooth/hci_qca.c
>>> index ca0b38f065e5..026e2e2cdd30 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -47,6 +47,8 @@
>>>  #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
>>>  #define CMD_TRANS_TIMEOUT_MS		100
>>> 
>>> +#define QCA_BTSOC_DUMP_CMD	0xFB
>>> +
>>>  /* susclk rate */
>>>  #define SUSCLK_RATE_32KHZ	32768
>>> 
>>> @@ -56,6 +58,9 @@
>>>  /* max retry count when init fails */
>>>  #define QCA_MAX_INIT_RETRY_COUNT 3
>>> 
>>> +/* when hit the max cmd time out count, trigger btsoc dump */
>>> +#define QCA_MAX_CMD_TIMEOUT_COUNT 3
>> 
>> nit: MAX_CMD_TIMEOUTS?
>> 
>> Similar to QCA_MAX_INIT_RETRY_COUNT on which I commented earlier I 
>> don't
>> think the 'QCA' prefix adds value here. The constant is defined in the 
>> driver
>> itself and isn't related to hardware.
>> 
> 
> OK
> 
>>> +
>>>  enum qca_flags {
>>>  	QCA_IBS_ENABLED,
>>>  	QCA_DROP_VENDOR_EVENT,
>>> @@ -123,6 +128,8 @@ struct qca_data {
>>>  	u64 rx_votes_off;
>>>  	u64 votes_on;
>>>  	u64 votes_off;
>>> +
>>> +	u32 cmd_timeout_cnt;
>> 
>> nit: cmd_timeouts?
>> 

btusb is also using cmd_timeout_cnt, prefer to align with that

>>>  };
>>> 
>>>  enum qca_speed_type {
>>> @@ -1332,6 +1339,11 @@ static int qca_setup(struct hci_uart *hu)
>>>  	if (!ret) {
>>>  		set_bit(QCA_IBS_ENABLED, &qca->flags);
>>>  		qca_debugfs_init(hdev);
>>> +
>>> +		/* clear the command time out count every time after
>>> +		 * initializaiton done
>>> +		 */
>>> +		qca->cmd_timeout_cnt = 0;
>>>  	} else if (ret == -ENOENT) {
>>>  		/* No patch/nvm-config found, run with original fw/config */
>>>  		ret = 0;
>>> @@ -1462,6 +1474,38 @@ static int qca_power_off(struct hci_dev *hdev)
>>>  	return 0;
>>>  }
>>> 
>>> +static int qca_send_btsoc_dump_cmd(struct hci_uart *hu)
>>> +{
>>> +	int err = 0;
>> 
>> The variable is pointless, just return 0 at the end of the function.
>> 
> OK
> 
>>> +	struct sk_buff *skb = NULL;
>>> +	struct qca_data *qca = hu->priv;
>>> +
>>> +	BT_DBG("hu %p sending btsoc dump command", hu);
>>> +
>>> +	skb = bt_skb_alloc(1, GFP_ATOMIC);
>>> +	if (!skb) {
>>> +		BT_ERR("Failed to allocate memory for qca dump command");
>> 
>> "These generic allocation functions all emit a stack dump on failure 
>> when used
>> without __GFP_NOWARN so there is no use in emitting an additional 
>> failure
>> message when NULL is returned."
>> 
>> Documentation/process/coding-style.rst
>> 
>> hence the logging is redundant, drop it.
>> 
> 
> OK
> 
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	skb_put_u8(skb, QCA_BTSOC_DUMP_CMD);
>>> +
>>> +	skb_queue_tail(&qca->txq, skb);
>>> +
>>> +	return err;
>>> +}
>>> +
>>> +static void qca_cmd_timeout(struct hci_dev *hdev)
>>> +{
>>> +	struct hci_uart *hu = hci_get_drvdata(hdev);
>>> +	struct qca_data *qca = hu->priv;
>>> +
>>> +	BT_ERR("hu %p hci cmd timeout count=0x%x", hu, 
>>> ++qca->cmd_timeout_cnt);
>> 
>> Is there any particular reason to print the counter in hex instead of
>> decimal?
>> 
>> Should this use bt_dev_err() since we have a hdev in this context?
>> 
> 
> OK
> 
>>> +
>>> +	if (qca->cmd_timeout_cnt >= QCA_MAX_CMD_TIMEOUT_COUNT)
>>> +		qca_send_btsoc_dump_cmd(hu);
>>> +}
>>> +
>>>  static int qca_regulator_enable(struct qca_serdev *qcadev)
>>>  {
>>>  	struct qca_power *power = qcadev->bt_power;
>>> @@ -1605,6 +1649,7 @@ static int qca_serdev_probe(struct 
>>> serdev_device *serdev)
>>>  		hdev = qcadev->serdev_hu.hdev;
>>>  		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
>>>  		hdev->shutdown = qca_power_off;
>>> +		hdev->cmd_timeout = qca_cmd_timeout;
>>>  	}
>>> 
>>>  out:	return err;
>>> --
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>> Forum, a Linux Foundation Collaborative Project
