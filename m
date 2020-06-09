Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA441F39CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 13:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgFILcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 07:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728937AbgFILcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 07:32:51 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5043FC03E97C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 04:32:51 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id w1so20383894qkw.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 04:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OJYZy0qeiiXbqWyW0tBnmc5IWhN4IwKx0EYM7GJeXgs=;
        b=iUVWtgaTkQaF9q/dHk+kpfeq+yoFcpJvLE3QDOmXb9atvJTluYv/B/9eV/rQquHK//
         zy7Xb+klbuxA4m3p3pGdSVd4xJ1LC0nwzJnoOqPeWRXXk8O5tnLkMnrUy6qNVR4d5V2s
         tVNYXRlYxyVnJtfxS67DWeAF4Wt/NTH8qSdZDVIjJXLmldIn0dWthhYzFe0g9zS1u7Vi
         Zor8wXTKbOsT0m2Q7DJORJMPTouGxh/AaEBOpCNsAR23dGaZc3Gw2vGfKQpvfThGJtaI
         AMkxVvJvFGpcnKyg+INyleZ4e3olaVfaxB02/42b2uY1LrV0VytHfCKHIrbxw2oKfCW5
         3/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OJYZy0qeiiXbqWyW0tBnmc5IWhN4IwKx0EYM7GJeXgs=;
        b=QDwqrqCwT5oOxyC81B2dWA3I9OFgACeWJhg11xoE3wfMI06t03aOE09u0E7oCQIguq
         JT3Dniw6T7wxvC70Zfsjwp6U/1aJfg/WWMTMwaqYnAH42kLQjVcnFBAbX7EWaqqHBUvu
         NjUZot8HBRcu+OPSvZ2AZHscHC+LcbNFsuEqKik19fWFvdyoFkWMqdhibt/VzJR9xqV1
         2WCH4PzhLEav+Eh5Dg0IV+duF+2khkuFcGU6FBg9kNNMnNsjKUqnguqWhDGTdnaEvXdt
         3tZoO/DNWUiHFCK9y+MqcCFi/m2Eo5sOr4Zr3Swt7p9UuylMwKtn8fLrL/YsDE4N0Y3H
         MgWQ==
X-Gm-Message-State: AOAM5323s9SEmeiNzlaVUzraqEPMz7F6Iy7q0PlBqUd5rh2C7Z1IUhoE
        EpoXBM63sKDTbb3oOpvqEb7ssEiS0/U=
X-Google-Smtp-Source: ABdhPJxkNwprmQKp1lyv0TPOCjKAw4CzftOtCXN5jTFdrmB3/xs+13QiJt1Rd4fU8zfp1FLWRsoN2g==
X-Received: by 2002:a37:9f0b:: with SMTP id i11mr26063168qke.481.1591702370277;
        Tue, 09 Jun 2020 04:32:50 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id w68sm9363397qkc.68.2020.06.09.04.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 04:32:49 -0700 (PDT)
Subject: Re: [PATCH 4/5] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-5-jonathan@marek.ca>
 <f3eabdb9-da43-9502-352a-1696babc114d@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <dc8f59c6-2fa9-f3a3-6d77-2d03a6d2776b@marek.ca>
Date:   Tue, 9 Jun 2020 07:33:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f3eabdb9-da43-9502-352a-1696babc114d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/9/20 5:52 AM, Srinivas Kandagatla wrote:
> 
> 
> On 08/06/2020 21:43, Jonathan Marek wrote:
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
> 
> Why not move this to imply SLIMBUS this will give more flexibility!
> 
> 

If you mean to change it to "select SLIMBUS", I'd prefer not to, because 
this would increase code size unnecessarily in my kernel.

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
> May be you can do bit more cleanup here, which could endup like:
> 
> 
> ctrl->regmap = dev_get_regmap(dev->parent, NULL);
> if (!ctrl->regmap) {
>      res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>      if (res) {
>          ctrl->mmio = devm_ioremap_resource(dev, res);
>          if (IS_ERR(ctrl->mmio)) {
>              dev_err(dev, "No valid mem resource found\n");
>              return PTR_ERR(ctrl->mmio);
>          }
> 
>          ctrl->reg_read = qcom_swrm_cpu_reg_read;
>          ctrl->reg_write = qcom_swrm_cpu_reg_write;
>      } else {
>          dev_err(dev, "No valid slim resource found\n");
>          return -EINVAL;
>      }
> } else {
>      ctrl->reg_read = qcom_swrm_ahb_reg_read;
>      ctrl->reg_write = qcom_swrm_ahb_reg_write;
> }
> 
> 
> 
> thanks,
> srini

I don't think this is better, it feels more obfuscated, and I think its 
possible we may end up with the mmio sdw having a parent with a regmap. 
(it is not how I did things up in my upstream stack, but in downstream 
the sdw nodes are inside the "macro" codec nodes)

I understand the '#ifdef CONFIG_SLIMBUS'/'dev->parent->bus == 
&slimbus_bus' is ugly, but at least its clear what's going on. Unless 
you have a better suggestion?

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
