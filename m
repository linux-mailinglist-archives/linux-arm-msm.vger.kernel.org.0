Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C023D19A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 00:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhGUVrO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 17:47:14 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17072 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhGUVrN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 17:47:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626906469; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gxkqvfAkmupw/r15o2I7kgibu4nM6gPe+r3+Ugpvvcs=;
 b=ZB/V0nzMTY8IsptqgT9qN7aKJO2jGXW2ASe+l9MD2OEe2DmwjxlCHmHIBMJMrjmb+vyKHC8u
 bycfc8dwMHme6VPIKOFnoZiErLrX0YZaZ4p3HvAIqDhaW7hdH9Ijk9ngcJ0q6QAUekl/kSoa
 H2L3FmSKiVs9ofEnJ08hReAjRT4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60f89f4d4815712f3a126eb5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 22:27:25
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95F24C4338A; Wed, 21 Jul 2021 22:27:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DEFAC43460;
        Wed, 21 Jul 2021 22:27:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Jul 2021 15:27:24 -0700
From:   hemantk@codeaurora.org
To:     bbhatt@codeaurora.org
Cc:     manivannan.sadhasivam@linaro.org, bqiang@codeaurora.org,
        linux-arm-msm@vger.kernel.org, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, bbhatt=codeaurora.org@codeaurora.org,
        hemantk=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
In-Reply-To: <0da23f32f4313c0b701bafc078942a4e@codeaurora.org>
References: <1626831778-31796-1-git-send-email-bbhatt@codeaurora.org>
 <4214f00fa8cbcced4f389125b392f3b3@codeaurora.org>
 <0da23f32f4313c0b701bafc078942a4e@codeaurora.org>
Message-ID: <dc0f806dde7494629a4e4f85b0ba5b7e@codeaurora.org>
X-Sender: hemantk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-21 11:07, Bhaumik Bhatt wrote:
> On 2021-07-21 10:52 AM, hemantk@codeaurora.org wrote:
>> On 2021-07-20 18:42, Bhaumik Bhatt wrote:
>>> A dl callback can be received anytime after mhi_prepare_for_transfer
>>> has been called. There is a window where the callback may happen
>>> before the probe initializes the qrtr_mhi_dev state. Move the
>>> mhi_prepare_for_transfer call after the registering the endpoint.
>>> 
>>> Once moved, the reverse can happen where qrtr will try to send a 
>>> packet
>>> before the channels are prepared. Add a wait in the sending path to
>>> ensure the channels are prepared before trying to do a ul transfer.
>>> 
>>> Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>> ---
>>>  net/qrtr/mhi.c | 20 +++++++++++++++-----
>>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>> 
>>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>>> index 29b4fa3..22b0395 100644
>>> --- a/net/qrtr/mhi.c
>>> +++ b/net/qrtr/mhi.c
>>> @@ -15,6 +15,7 @@ struct qrtr_mhi_dev {
>>>  	struct qrtr_endpoint ep;
>>>  	struct mhi_device *mhi_dev;
>>>  	struct device *dev;
>>> +	struct completion ready;
>>>  };
>>> 
>>>  /* From MHI to QRTR */
>>> @@ -50,6 +51,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint
>>> *ep, struct sk_buff *skb)
>>>  	struct qrtr_mhi_dev *qdev = container_of(ep, struct qrtr_mhi_dev, 
>>> ep);
>>>  	int rc;
>>> 
>>> +	rc = wait_for_completion_interruptible(&qdev->ready);
>>> +	if (rc)
>>> +		goto free_skb;
>>> +
>>>  	if (skb->sk)
>>>  		sock_hold(skb->sk);
>>> 
>>> @@ -78,11 +83,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device 
>>> *mhi_dev,
>>>  	struct qrtr_mhi_dev *qdev;
>>>  	int rc;
>>> 
>>> -	/* start channels */
>>> -	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
>>> -	if (rc)
>>> -		return rc;
>>> -
>>>  	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
>>>  	if (!qdev)
>>>  		return -ENOMEM;
>> would it be good to init completion variable here (call 
>> init_completion) ?
> You mean just before setting qdev->mhi_dev? I don't see why that would
> make a difference
> mainly because the qcom_mhi_qrtr_send() will only happen after endpoint 
> is
> registered and DL xfer cb will also only come in after we have prepared 
> the
> channels and completed ready with dev_data already set.
looks like qcom_mhi_qrtr_send is not going to get called directly. i was 
thinking
what if this api is called before init_completion() returns. if it is 
only possible
through ep.xmit call back only, can you move it right above
qdev->ep.xmit = qcom_mhi_qrtr_send; ?
> 
>>> @@ -90,12 +90,22 @@ static int qcom_mhi_qrtr_probe(struct mhi_device 
>>> *mhi_dev,
>>>  	qdev->mhi_dev = mhi_dev;
>>>  	qdev->dev = &mhi_dev->dev;
>>>  	qdev->ep.xmit = qcom_mhi_qrtr_send;
>>> +	init_completion(&qdev->ready);
>>> 
>> 
>>> 
>>>  	return 0;
> 
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
> Forum,
> a Linux Foundation Collaborative Project

Thanks,
Hemant
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

