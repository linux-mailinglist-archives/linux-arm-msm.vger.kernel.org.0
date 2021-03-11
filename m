Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB36336BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 07:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCKGBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 01:01:44 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:20807 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhCKGBU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 01:01:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615442480; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8J/JgNXr6szzZFjZUCFer4YmlobEUjzipvX57ytXkHE=;
 b=o5EzV3yfMSDZfwfgZyMFBTaE7oWquXdRMzL8ZACPXQILpKjRy0+mLsGfo9bM7pg0YIKOSCs5
 CTEif4gFFh3AdP7Ebzc906ELF5L028dCbZPDr3dKGQoojIBz/157JuRavUvEkpSQ7LFkrIjO
 +i1ht9jD0Sadt+d+Iw6my7/5Hk8=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6049b227d3a53bc38f60ffef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 06:01:11
 GMT
Sender: gubbaven=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A313BC43461; Thu, 11 Mar 2021 06:01:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0C49C433C6;
        Thu, 11 Mar 2021 06:01:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 11:31:09 +0530
From:   gubbaven@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [RFC PATCH v1] Bluetooth: hci_qca: Add device_may_wakeup support
In-Reply-To: <YEjfjZ/5y+Z0r63Z@builder.lan>
References: <1615376496-13577-1-git-send-email-gubbaven@codeaurora.org>
 <YEjfjZ/5y+Z0r63Z@builder.lan>
Message-ID: <202e5c0a16b533e49940e34a2be31d79@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2021-03-10 20:32, Bjorn Andersson wrote:
> On Wed 10 Mar 05:41 CST 2021, Venkata Lakshmi Narayana Gubba wrote:
> 
>> Added device_may_wakeup() support.
> 
> This would be an excellent place to describe _why_ this is necessary,
> instead of just repeating $subject.
> 
> Something along the lines of the comment in the patch.
> 
> Regards,
> Bjorn
> 
[Venkata]:
Sure.I will update in next patch.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>>  drivers/bluetooth/hci_qca.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index de36af6..73af901 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1571,6 +1571,20 @@ static void qca_cmd_timeout(struct hci_dev 
>> *hdev)
>>  	mutex_unlock(&qca->hci_memdump_lock);
>>  }
>> 
>> +static bool qca_prevent_wake(struct hci_dev *hdev)
>> +{
>> +	struct hci_uart *hu = hci_get_drvdata(hdev);
>> +	bool wakeup;
>> +
>> +	/* UART driver handles the interrupt from BT SoC.So we need to use
>> +	 * device handle of UART driver to get the status of device may 
>> wakeup.
>> +	 */
>> +	wakeup = device_may_wakeup(hu->serdev->ctrl->dev.parent);
>> +	bt_dev_dbg(hu->hdev, "wakeup status : %d", wakeup);
>> +
>> +	return !wakeup;
>> +}
>> +
>>  static int qca_wcn3990_init(struct hci_uart *hu)
>>  {
>>  	struct qca_serdev *qcadev;
>> @@ -1721,6 +1735,7 @@ static int qca_setup(struct hci_uart *hu)
>>  		qca_debugfs_init(hdev);
>>  		hu->hdev->hw_error = qca_hw_error;
>>  		hu->hdev->cmd_timeout = qca_cmd_timeout;
>> +		hu->hdev->prevent_wake = qca_prevent_wake;
>>  	} else if (ret == -ENOENT) {
>>  		/* No patch/nvm-config found, run with original fw/config */
>>  		set_bit(QCA_ROM_FW, &qca->flags);
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

Regards,
Venkata.
