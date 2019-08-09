Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271D587118
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 06:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405327AbfHIEvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 00:51:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40792 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfHIEvh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 00:51:37 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C718561418; Fri,  9 Aug 2019 04:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565326296;
        bh=iw4lsWYTbQS4yhyC0rTNbF2CidP7RA8CNdq3sqREgIc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aWqbSXqCBWTfkL7DL813WgFK4a+utOGpUzfftFgQjhxacQlndREE6BuWuQxh4Bmdn
         kfL74d1zK8AkPlU2Fc8QkvrVH4qQpFWeWKpyVgEZ2l1hwVXzu1Qw7mPgU3Zl5cVKKm
         BtJ7tV16NKyrAV0NAfpxmKQiIHR8hy2OR7I7D88A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 12B3760ACF;
        Fri,  9 Aug 2019 04:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565326295;
        bh=iw4lsWYTbQS4yhyC0rTNbF2CidP7RA8CNdq3sqREgIc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DmKF8B8C7sNb8KHEDTPTrPYPY2im9cOTwMIHphvvKCZ8KvcvPq0pP5cdepjL5+bkX
         1C6o39vccWw8Vj7AQX0b+kkD5TDHfsJqXBRvjC/RRDiMtJNUVsVbHtMjgnlojY5CPL
         yJzYqvHYbMJVRGOL9o/ypERI2pZezBXEydqB42cY=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Aug 2019 10:21:35 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        anubhavg@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: wait for Pre shutdown to command
 complete event before sending the Power off pulse
In-Reply-To: <83f6833dd901e42e2f86d20ff0898526@codeaurora.org>
References: <1565256353-4476-1-git-send-email-c-hbandi@codeaurora.org>
 <83f6833dd901e42e2f86d20ff0898526@codeaurora.org>
Message-ID: <69e95b7d65f5c58f94473dcbe116d0d2@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bala,

On 2019-08-08 16:25, Balakrishna Godavarthi wrote:
> Hi Harish,
> 
> On 2019-08-08 14:55, Harish Bandi wrote:
>> When SoC receives pre shut down command, it share the same
>> with other COEX shared clients. So SoC needs a short
>> time after sending VS pre shutdown command before
>> turning off the regulators and sending the power off pulse.
>> 
>> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
>> ---
>>  drivers/bluetooth/btqca.c   | 5 +++--
>>  drivers/bluetooth/hci_qca.c | 2 ++
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index 2221935..f20991e 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -106,8 +106,9 @@ int qca_send_pre_shutdown_cmd(struct hci_dev 
>> *hdev)
>> 
>>  	bt_dev_dbg(hdev, "QCA pre shutdown cmd");
>> 
>> -	skb = __hci_cmd_sync(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
>> -				NULL, HCI_INIT_TIMEOUT);
>> +	skb = __hci_cmd_sync_ev(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
>> +				NULL, HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
> 
> [Bala]: nit: can you also add reason in commit text for adding
> HCI_EV_CMD_COMPLETE
[Harish] - I will add reason fo HCI_EV_CMD_COMPLETE in commit text and 
post new patch.
> 
>> +
>>  	if (IS_ERR(skb)) {
>>  		err = PTR_ERR(skb);
>>  		bt_dev_err(hdev, "QCA preshutdown_cmd failed (%d)", err);
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 16db6c0..566aa28 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1386,6 +1386,8 @@ static int qca_power_off(struct hci_dev *hdev)
>>  	/* Perform pre shutdown command */
>>  	qca_send_pre_shutdown_cmd(hdev);
>> 
>> +	usleep_range(8000, 10000);
>> +
>>  	qca_power_shutdown(hu);
>>  	return 0;
>>  }
> 
> Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>

Thanks,
Harish
