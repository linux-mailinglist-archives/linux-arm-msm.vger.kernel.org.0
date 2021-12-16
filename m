Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7697247702B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 12:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236690AbhLPL1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 06:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236388AbhLPL1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 06:27:20 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3288C06173F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 03:27:19 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id q16so2779513wrg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 03:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rDIUjDX6gtKBD1gdD+dKFebSAfDuwKtdCmSczzKHMfM=;
        b=OxjXJbs+eNQX+QZ1ssddZShI26uB80pfSYXBakdblRWXkkNNohv7NZkdRBiykPT5u9
         UbvMZXUPYlHlSULAPAhIyaYxx4tU7+vqPGnNK1cpEzEfIf0RGy9M0IbE2uCwfvNIAJEs
         0xtw7V6C152Ox3/VkzSh3yDSwBBfejuEJAyHJc+HjaSYRzZ7YFy9H1iV3E2RDxAhZ/lj
         dPsfXvrs7AEqO4tU9OLiUMc9sDTXWImf+Q7ILydb+AR8/jLcX2q31XEaIbkd7CBc5b7L
         nXCODJ1/0julC+GBvvDd3RPZkn6JUHR65b4A701d35tDBiwoJD8m5uAnhH2JlRHlkTWs
         HmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rDIUjDX6gtKBD1gdD+dKFebSAfDuwKtdCmSczzKHMfM=;
        b=ExxeaAI7DkdCCG5hcwp7KSxkhtfjzaCpiI/8Cr0rxy1/kPjzzVj+6d3ufPjKwoO3xh
         rNxKFbnQLsGk5UF//CAhpifTuJM0OBy3F538mU60NrnLYjsnBHLqeg19CN/ZLk2t9i+z
         N0OZrX6dFfPyxYKftVjzn51C9BxLDMw00sKfX+6pJc49KNVDpti/Vk0+7UPP022xV9MX
         sRYQkc6Uqc+sUBPdOHX3kpAKLwS+mCMb14cRoPjkeutmkK7eLoNk+wGiUGRC7vB7njZt
         LO8AdeM4mv1yIOjkJFORgnpr55O5J96e7yzbn/CPsCPeKl4QLMzoTBu7nJO1tJAz7kU4
         KEUQ==
X-Gm-Message-State: AOAM5302RkSCbS9O77bVFBqCeigeYZSNJV1QsU0dR/k4N9LOOFDy6hvy
        BO5/yjOu6YxOJ6kFbyyVe0HsqjwZy+lUcw==
X-Google-Smtp-Source: ABdhPJzWbiQpdgtEXiHNVshhItAmT/S/onaU4BHbBgkoqs/MLGcT6pCGlZLZhDUYnoLDdKU+66zKxg==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr8793166wri.8.1639654038270;
        Thu, 16 Dec 2021 03:27:18 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id g13sm6026242wrd.57.2021.12.16.03.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 03:27:17 -0800 (PST)
Subject: Re: [PATCH v2 6/8] misc: fastrpc: add secure domain support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
 <20211209120626.26373-7-srinivas.kandagatla@linaro.org>
 <YbeS7KXj1slU2qgf@ripper>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0bdc9250-670d-453a-4474-d240da3894f2@linaro.org>
Date:   Thu, 16 Dec 2021 11:27:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbeS7KXj1slU2qgf@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13/12/2021 18:37, Bjorn Andersson wrote:
> On Thu 09 Dec 04:06 PST 2021, Srinivas Kandagatla wrote:
> 
>> ADSP/MDSP/SDSP are by default secured, which means it can only be loaded
>> with a Signed process.
>> Where as CDSP can be either be secured/unsecured. non-secured Compute DSP
>> would allow users to load unsigned process and run hexagon instructions,
>> but blocking access to secured hardware within the DSP. Where as signed
>> process with secure CDSP would be allowed to access all the dsp resources.
>>
>> This patch adds basic code to create device nodes as per device tree property.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/misc/fastrpc.c | 61 +++++++++++++++++++++++++++++++++++-------
>>   1 file changed, 51 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 79fc59caacef..50f8e23b6b04 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -240,12 +240,15 @@ struct fastrpc_channel_ctx {
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>> +	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> +	bool secure;
>>   };
>>   
>>   struct fastrpc_device {
>>   	struct fastrpc_channel_ctx *cctx;
>>   	struct miscdevice miscdev;
>> +	bool secure;
>>   };
>>   
>>   struct fastrpc_user {
>> @@ -1876,7 +1879,7 @@ static struct platform_driver fastrpc_cb_driver = {
>>   };
>>   
>>   static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
>> -				   const char *domain)
>> +				   bool is_secured, const char *domain)
>>   {
>>   	struct fastrpc_device *fdev;
>>   	int err;
>> @@ -1885,15 +1888,21 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>   	if (!fdev)
>>   		return -ENOMEM;
>>   
>> +	fdev->secure = is_secured;
>>   	fdev->cctx = cctx;
>>   	fdev->miscdev.minor = MISC_DYNAMIC_MINOR;
>>   	fdev->miscdev.fops = &fastrpc_fops;
>> -	fdev->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "fastrpc-%s", domain);
>> +	fdev->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "fastrpc-%s%s",
>> +					    domain, is_secured ? "-secure" : "");
> 
> Will this not result in existing userspace using the wrong misc device?

No, we will end up with

fastrpc-cdsp
fastrpc-cdsp-secure

based on the qcom,non-secure-domain DT property

so we still have the same old name, as long as the dt-property is 
correctly set.

> 
>>   	err = misc_register(&fdev->miscdev);
>> -	if (err)
>> +	if (err) {
>>   		kfree(fdev);
>> -	else
>> -		cctx->fdevice = fdev;
>> +	} else {
>> +		if (is_secured)
>> +			cctx->secure_fdevice = fdev;
>> +		else
>> +			cctx->fdevice = fdev;
>> +	}
>>   
>>   	return err;
>>   }
>> @@ -1904,6 +1913,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	struct fastrpc_channel_ctx *data;
>>   	int i, err, domain_id = -1;
>>   	const char *domain;
>> +	bool secure_dsp = false;
> 

> Afaict this is only every accessed after first being written. So no need
> to initialize it.

that's true, I can remove this in next spin.

> 
>>   
>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -1927,10 +1937,31 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	if (!data)
>>   		return -ENOMEM;
>>   
>> -	err = fastrpc_device_register(rdev, data, domains[domain_id]);
>> -	if (err) {
>> -		kfree(data);
>> -		return err;
>> +
>> +	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> +	data->secure = secure_dsp;
>> +
>> +	switch (domain_id) {
>> +	case ADSP_DOMAIN_ID:
>> +	case MDSP_DOMAIN_ID:
>> +	case SDSP_DOMAIN_ID:
>> +		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>> +		if (err)
>> +			goto fdev_error;
>> +		break;
>> +	case CDSP_DOMAIN_ID:
>> +		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>> +		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>> +		if (err)
>> +			goto fdev_error;
>> +
>> +		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>> +		if (err)
>> +			goto fdev_error;
>> +		break;
>> +	default:
>> +		err = -EINVAL;
>> +		goto fdev_error;
>>   	}
>>   
>>   	kref_init(&data->refcount);
>> @@ -1943,7 +1974,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	data->domain_id = domain_id;
>>   	data->rpdev = rpdev;
>>   
>> -	return of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>> +	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>> +	dev_info(rdev, "%s complete for %s with secure flag(%d) return: %d\n",
>> +			__func__, domains[domain_id], secure_dsp, err);
> 
> I would prefer that we don't spam the kernel log with such useful
> information, in particular since it will happen every time we start or
> restart a remoteproc with fastrpc. So dev_dbg perhaps?

agree, will change.
> 
>> +	return err;
> 
> I think that in the event that of_platform_populate() actually failed,
> you will return an error here, fastrpc_rpmsg_remove() won't be called,
> so you won't release the misc device or release &data->refcount. This
> issue exists in the code today though...

Thanks, that is a good point I will see if I can fix that in next spin.

--srini

> 
> Regards,
> Bjorn
> 
>> +
>> +fdev_error:
>> +	kfree(data);
>> +	return err;
>>   }
>>   
>>   static void fastrpc_notify_users(struct fastrpc_user *user)
>> @@ -1970,6 +2008,9 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	if (cctx->fdevice)
>>   		misc_deregister(&cctx->fdevice->miscdev);
>>   
>> +	if (cctx->secure_fdevice)
>> +		misc_deregister(&cctx->secure_fdevice->miscdev);
>> +
>>   	of_platform_depopulate(&rpdev->dev);
>>   
>>   	cctx->rpdev = NULL;
>> -- 
>> 2.21.0
>>
