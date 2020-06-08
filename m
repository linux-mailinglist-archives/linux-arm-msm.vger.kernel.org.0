Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEF71F2196
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 23:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgFHVqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 17:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgFHVq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 17:46:29 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06ADC08C5C3
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 14:46:29 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id z1so16054553qtn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 14:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2SoI77pqTaGvRTzdFLL+4cUrlHtHWwOHJ2bi4DD4V5I=;
        b=TPMOfmMkjAWQpRvyAWNgKS8CVQx+KxepR6CXLYdLa00P09Flq/2SFRbVkWJmu6glEa
         KedbQ+EqBoxVRl9Vgoowwyr/0+352H/yslstu6p5r8C8zEvuP9bVfxOtl37Ds8XkZliA
         EJkYqOEqI+SSs6uVixnBNLA4KylTLEMr2onNKRD2034LvTo/x9X4M+JxfT6/HBjX/92g
         ctMfXzYRsAoVH8aI4UyZVot2U9Ez0wY07NhuUf7MqE1DyQZ+pc3A5ODHclRxcNSBXUgX
         yVr8OlycGfXzK663N6yXJtdlm779EA+Ny18/JxzDBOoCEk7dhQcPWTxb2H7oiCr+DVrN
         OGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2SoI77pqTaGvRTzdFLL+4cUrlHtHWwOHJ2bi4DD4V5I=;
        b=rpRR3YvGp03I7c9xwEEAuyv/v806xEyJRMw3itHWdOvYSDiSjFZPGJL34CE7/Ti9zi
         RFDziGGxFWSbfSCXMzIaN/2aAG/f+Usv0AO0Nx/D4V0kieqq0tU437JhatEjjcsqtmd6
         8mEE2Z+86Bn7b/16PmaNH1XcJLH7JycDKCJ2LEvKrlTXDDlCJ5y/RD0Rur5QsRmUweKH
         KFhsr+Ix68H0//OgFdxSohctGE/zVDaYHEOXTegFY3uvGUDn7grpL2e67ssK3DV4nque
         6hCBOVvelOLZigRuOz2jWUTLuHsh+oqJ9e1RgNO0ZzBcQTsGL0e27vGPhy/V4eLQ/1B2
         aXnw==
X-Gm-Message-State: AOAM5333dMfbWaXpqvpRVmqlvTHmfZk9KAffgtAGMeyDfSTLNmwXs4F4
        VzKc6laEilPBHIXDjTOUh/2whXBoBKU=
X-Google-Smtp-Source: ABdhPJyL821xsu8dJkNsdy3Q3az4y/x5eRBCArOM2hadFlL5rouQD7KkmT0pFW/ifQxNfyIoUEpbdA==
X-Received: by 2002:ac8:4542:: with SMTP id z2mr24184885qtn.90.1591652788659;
        Mon, 08 Jun 2020 14:46:28 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id x41sm9373670qtb.76.2020.06.08.14.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 14:46:28 -0700 (PDT)
Subject: Re: [PATCH 4/5] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-5-jonathan@marek.ca>
 <33017798-9546-12dc-b857-493f56c3d557@linux.intel.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <a6153b51-22c4-e065-8e9e-e458b15fe4a4@marek.ca>
Date:   Mon, 8 Jun 2020 17:46:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <33017798-9546-12dc-b857-493f56c3d557@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/8/20 5:20 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 6/8/20 3:43 PM, Jonathan Marek wrote:
>> The driver may be used without slimbus, so don't depend on slimbus.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/soundwire/Kconfig | 1 -
>>   drivers/soundwire/qcom.c  | 5 +++++
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
>> index fa2b4ab92ed9..d121cf739090 100644
>> --- a/drivers/soundwire/Kconfig
>> +++ b/drivers/soundwire/Kconfig
>> @@ -33,7 +33,6 @@ config SOUNDWIRE_INTEL
>>   config SOUNDWIRE_QCOM
>>       tristate "Qualcomm SoundWire Master driver"
>> -    depends on SLIMBUS
>>       depends on SND_SOC
>>       help
>>         SoundWire Qualcomm Master driver.
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 14334442615f..ac81c64768ea 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -769,13 +769,18 @@ static int qcom_swrm_probe(struct 
>> platform_device *pdev)
>>       if (!ctrl)
>>           return -ENOMEM;
>> +#ifdef CONFIG_SLIMBUS
>>       if (dev->parent->bus == &slimbus_bus) {
>> +#else
>> +    if (false) {
>> +#endif
> 
> 
> maybe:
> 
> if (IS_ENABLED(CONFIG_SLIMBUS) &&
>      dev->parent->bus == &slimbus_bus)
> 
> 

It won't compile like this, because "slimbus_bus" is not defined when 
CONFIG_SLIMBUS is disabled.

>>           ctrl->reg_read = qcom_swrm_ahb_reg_read;
>>           ctrl->reg_write = qcom_swrm_ahb_reg_write;
>>           ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>>           if (!ctrl->regmap)
>>               return -EINVAL;
>>       } else {
>> +
>>           res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>           ctrl->reg_read = qcom_swrm_cpu_reg_read;
>>
