Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418C03D2CFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhGVTKE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:10:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10118 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhGVTKC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:10:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626983437; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bBVqSY6i8vfMhg4A9+M4eCLLJvU7ydQvACGifQY2egc=;
 b=pFxicCqtn2wwEowKkn3vGG3Gud7+P5rOnSFyHd2TtqO8MF45Ee2ReOwO0MbNs4H4XBacL9Df
 iRAcj2n66Gp6moyFB8opKqih71H6TSPh+VNAG7n5V2VjSpIpWFly1SG81KqCwVJYrDEruWKy
 CelJ3mqtA2A6EhEoO9hjnANVi1A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60f9cc0afcf9fe7b78f9af3b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 19:50:34
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1924DC43143; Thu, 22 Jul 2021 19:50:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD67CC43460;
        Thu, 22 Jul 2021 19:50:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 22 Jul 2021 12:50:32 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     hemantk@codeaurora.org
Cc:     manivannan.sadhasivam@linaro.org, bqiang@codeaurora.org,
        linux-arm-msm@vger.kernel.org, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, bbhatt=codeaurora.org@codeaurora.org,
        hemantk=codeaurora.org@codeaurora.org
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <0e06bf8a7132cc9539e4d9b1e41b8863@codeaurora.org>
References: <1626831778-31796-1-git-send-email-bbhatt@codeaurora.org>
 <4214f00fa8cbcced4f389125b392f3b3@codeaurora.org>
 <0da23f32f4313c0b701bafc078942a4e@codeaurora.org>
 <dc0f806dde7494629a4e4f85b0ba5b7e@codeaurora.org>
 <0e06bf8a7132cc9539e4d9b1e41b8863@codeaurora.org>
Message-ID: <62daad3e0074400ee7011f55a6f255ac@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-22 12:04 PM, Bhaumik Bhatt wrote:
> On 2021-07-21 03:27 PM, hemantk@codeaurora.org wrote:
>> On 2021-07-21 11:07, Bhaumik Bhatt wrote:
>>> On 2021-07-21 10:52 AM, hemantk@codeaurora.org wrote:
>>>> On 2021-07-20 18:42, Bhaumik Bhatt wrote:
>>>>> A dl callback can be received anytime after 
>>>>> mhi_prepare_for_transfer
>>>>> has been called. There is a window where the callback may happen
>>>>> before the probe initializes the qrtr_mhi_dev state. Move the
>>>>> mhi_prepare_for_transfer call after the registering the endpoint.
>>>>> 
>>>>> Once moved, the reverse can happen where qrtr will try to send a 
>>>>> packet
>>>>> before the channels are prepared. Add a wait in the sending path to
>>>>> ensure the channels are prepared before trying to do a ul transfer.
>>>>> 
>>>>> Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
>>>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>>>> ---
>>>>>  net/qrtr/mhi.c | 20 +++++++++++++++-----
>>>>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>>>> 
>>>>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>>>>> index 29b4fa3..22b0395 100644
>>>>> --- a/net/qrtr/mhi.c
>>>>> +++ b/net/qrtr/mhi.c
>>>>> @@ -15,6 +15,7 @@ struct qrtr_mhi_dev {
>>>>>  	struct qrtr_endpoint ep;
>>>>>  	struct mhi_device *mhi_dev;
>>>>>  	struct device *dev;
>>>>> +	struct completion ready;
>>>>>  };
>>>>> 
>>>>>  /* From MHI to QRTR */
>>>>> @@ -50,6 +51,10 @@ static int qcom_mhi_qrtr_send(struct 
>>>>> qrtr_endpoint
>>>>> *ep, struct sk_buff *skb)
>>>>>  	struct qrtr_mhi_dev *qdev = container_of(ep, struct qrtr_mhi_dev, 
>>>>> ep);
>>>>>  	int rc;
>>>>> 
>>>>> +	rc = wait_for_completion_interruptible(&qdev->ready);
>>>>> +	if (rc)
>>>>> +		goto free_skb;
>>>>> +
>>>>>  	if (skb->sk)
>>>>>  		sock_hold(skb->sk);
>>>>> 
>>>>> @@ -78,11 +83,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device 
>>>>> *mhi_dev,
>>>>>  	struct qrtr_mhi_dev *qdev;
>>>>>  	int rc;
>>>>> 
>>>>> -	/* start channels */
>>>>> -	rc = mhi_prepare_for_transfer(mhi_dev, 
>>>>> MHI_CH_INBOUND_ALLOC_BUFS);
>>>>> -	if (rc)
>>>>> -		return rc;
>>>>> -
>>>>>  	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
>>>>>  	if (!qdev)
>>>>>  		return -ENOMEM;
>>>> would it be good to init completion variable here (call 
>>>> init_completion) ?
>>> You mean just before setting qdev->mhi_dev? I don't see why that 
>>> would
>>> make a difference
>>> mainly because the qcom_mhi_qrtr_send() will only happen after 
>>> endpoint is
>>> registered and DL xfer cb will also only come in after we have 
>>> prepared the
>>> channels and completed ready with dev_data already set.
>> looks like qcom_mhi_qrtr_send is not going to get called directly. i
>> was thinking
>> what if this api is called before init_completion() returns. if it is
>> only possible
>> through ep.xmit call back only, can you move it right above
>> qdev->ep.xmit = qcom_mhi_qrtr_send; ?
>>> 
> Ah. OK. I see your point. I will do that and upload a v2.
> 
On second thought, this is not required because the ep.xmit() will not 
be called
until the qrtr_endpoint_register() is done.

So this version should be fine IMO.

>>>>> @@ -90,12 +90,22 @@ static int qcom_mhi_qrtr_probe(struct 
>>>>> mhi_device *mhi_dev,
>>>>>  	qdev->mhi_dev = mhi_dev;
>>>>>  	qdev->dev = &mhi_dev->dev;
>>>>>  	qdev->ep.xmit = qcom_mhi_qrtr_send;
>>>>> +	init_completion(&qdev->ready);
>>>>> 
>>>> 
>>>>> 
>>>>>  	return 0;
>>> 
>>> Thanks,
>>> Bhaumik
>>> ---
>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>> Forum,
>>> a Linux Foundation Collaborative Project
>> 
>> Thanks,
>> Hemant
>> ---
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
> 
> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
> Forum,
> a Linux Foundation Collaborative Project

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
