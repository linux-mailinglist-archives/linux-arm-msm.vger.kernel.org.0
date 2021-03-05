Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80CB32DE47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 01:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhCEAXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 19:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhCEAXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 19:23:12 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6A4C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 16:23:12 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id x13so179557qvj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 16:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8oQVoZxbOpv1MAN0E+Lnn1at05JDDd6c6sg5qtjxamw=;
        b=Z8Z0Tq2TrgX9ihGAVrq/1f4udIW3734GFDpSvmXM3iASqbDkWWLASm1qlZNPqKOvug
         kMTmvEo8O/Jctp3Y0ptSTJ3xZ8FGTVyVgVyEktyf3V33g6ZYDRTeFVCVhgOKQyyOnv6A
         OruXBbs/p32GJeDascR0k5EA8lL1epg/ROrqAveVpZkhqisj25CWTRkoDazpFhjY8XhE
         dXOZ/mWQy5qhKoE4VmfWmceoMKg/p7pc2gXhX6O0GvdZtwaWL1N7oh5U+qX1HcWt3ABA
         /0FAT42KjjOczdc5UyAZIUmYK2ulReuMtd3qL9f8J7sXPH3zTbnmJ0EiSja/X0mRhZ4w
         bMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8oQVoZxbOpv1MAN0E+Lnn1at05JDDd6c6sg5qtjxamw=;
        b=l7V6FQS6f7yOdz4I3ZBOItM/4ymSZZ8mfHVt/hLHvpf7FMN2KzmFovkcwtGjPpgU9y
         etr54HtKBe19nk1yKUR80DEH42PMT8m9artaDt4AhnbwUv9YKpOLMACAeYNPz+BfLvBZ
         eyP8Lz/TyD2bSgFS8nNyyBlZR7nZyyHrfDuB6QkyAGV9M0mYzA/d1PDSK+2dvoA2ORJt
         A47RU+fSvEvybsnChk0L9IVjvShRgyHIvSUn5mGdjfRVfL9suWC8Z+pjPgYOGt+FygKo
         B0ZlhFK0z5kl6ixHzkPbWK7ZysmKCbsVlDS4f8h9RxCt7V3BGVmjapNzPVM9WWb+SBcJ
         eZ1A==
X-Gm-Message-State: AOAM532lD7W6aHiaKE9q1FJvFK7sx5TQvO2VQKh0oBd4yGEf0eDXhUup
        AJ469/Y7SpCnqkR2h37MNnykiA==
X-Google-Smtp-Source: ABdhPJzKbrlBmq/TpdqOM3gollrTlr5so0MYSLgPialXtEsbtlzmBUP/XTfqustD6wHurs1xWKmxxQ==
X-Received: by 2002:a0c:8304:: with SMTP id j4mr6725616qva.18.1614903791323;
        Thu, 04 Mar 2021 16:23:11 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id o30sm707087qkl.17.2021.03.04.16.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 16:23:10 -0800 (PST)
Subject: Re: [PATCH] pinctrl: qcom: lpass lpi: use default pullup/strength
 values
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210304194816.3843-1-jonathan@marek.ca>
 <YEF13ad1wpTzeV9i@builder.lan>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <4dca7cc0-4510-9093-b7d2-7d6ba23a09fc@marek.ca>
Date:   Thu, 4 Mar 2021 19:21:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <YEF13ad1wpTzeV9i@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/4/21 7:05 PM, Bjorn Andersson wrote:
> On Thu 04 Mar 13:48 CST 2021, Jonathan Marek wrote:
> 
>> If these fields are not set in dts, the driver will use these variables
>> uninitialized to set the fields. Not only will it set garbage values for
>> these fields, but it can overflow into other fields and break those.
>>
>> In the current sm8250 dts, the dmic01 entries do not have a pullup setting,
>> and might not work without this change.
>>
> 
> Perhaps you didn't see it, but Dan reported this a few days back. So
> unless you object I would suggest that we include:
> 

I did not see it. But feel free to add tags.

> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
>> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 369ee20a7ea95..2f19ab4db7208 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -392,7 +392,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
>>   			  unsigned long *configs, unsigned int nconfs)
>>   {
>>   	struct lpi_pinctrl *pctrl = dev_get_drvdata(pctldev->dev);
>> -	unsigned int param, arg, pullup, strength;
>> +	unsigned int param, arg, pullup = LPI_GPIO_BIAS_DISABLE, strength = 2;
>>   	bool value, output_enabled = false;
>>   	const struct lpi_pingroup *g;
>>   	unsigned long sval;
>> -- 
>> 2.26.1
>>
