Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C97DD69B98C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Feb 2023 12:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjBRLEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Feb 2023 06:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjBRLEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Feb 2023 06:04:51 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4110F1A4B1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 03:04:49 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id w38so943238lfu.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 03:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXuh68GV1v7/hPtd7U1EjUQCELSSpW0ycnpWQTsoA5k=;
        b=YhXjaug3sThqcQ+BBifoo+urG2JwvSOFIynT+E9T6PVraeePN2I3dXP63Sww7UtS+U
         AYPETuvRDxUuP7qmx3pKjMkqhffAAmfleV8cwhapjAoI1YOENe9LsfmMsdjSzFvpra8Q
         UxFuuP545jmyn/ogBlH/WH04oU+PWbLyvSmRj7HM8n7dP+JB9/SpuO1P0m+bkiEmMxZN
         5eOSPYk2XjCKEfI2XfUP/eBGjyKMuVJ5WiaPAbZBfrv0qReXC3L98MU3N/x6t3tAycS4
         zLJdRmQfgYlBAuKkqBqQ/dDromI9b4+f/DmoA+vjHY5MHoE6ZFkzz6vmNg8HAEp0WxSf
         fcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXuh68GV1v7/hPtd7U1EjUQCELSSpW0ycnpWQTsoA5k=;
        b=iR/FsphSECtebO1744CW9GVLgImSLzUdqoy6s/xSoXIE9NHWE2WQ3clE3S9GSmuIBe
         Dg+IeZU6wmRc7Nr8+1Od1seCcIaJuOpJQl1eF66lyTOHhqKM664CSJQxhJirCG6dsA8u
         gUQCzT1NNwPr0/Qs604ZuPm4Sao6Z9Dc+FAQAP3YWkmrVdbkLcNxAwuSl1eSRpN8tdQ2
         CX6KCsnJWqYCnlSFNaWZsCAnHSO+XnBAbdFJV8BSIA+IGCgPmYL8H0OgvdcIfY+WNZOE
         R1JYmpLy/yDj4LSYLWt1nHFrhU+V7f28p3Ext0CfdCS+0U372L9yVocxbZxwEZ6rhTFg
         LvDA==
X-Gm-Message-State: AO0yUKV0H1netlLqHqTPnSEaG7HCmk2ccjohkfvmcTEBBoiWZxray9rJ
        wtEExqQjdE6nS8g+nf30KB67Jg==
X-Google-Smtp-Source: AK7set+anSNYEJwtdsETWW6Zi4WqCdH3ljEBlwUdS0tMcpV2KgQp4MYL2/zu9eIGNbS0P2YDc7hmWQ==
X-Received: by 2002:ac2:447a:0:b0:4dc:4cb6:6752 with SMTP id y26-20020ac2447a000000b004dc4cb66752mr2384113lfl.52.1676718287327;
        Sat, 18 Feb 2023 03:04:47 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
        by smtp.gmail.com with ESMTPSA id q3-20020a19a403000000b004d869c1861esm948374lfc.192.2023.02.18.03.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 03:04:46 -0800 (PST)
Message-ID: <82c84ba4-ca33-3ce0-fe86-efedfce04cda@linaro.org>
Date:   Sat, 18 Feb 2023 12:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU
 GPUs
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Emma Anholt <emma@anholt.net>, Chia-I Wu <olvaffe@gmail.com>,
        Dan Carpenter <error27@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-7-konrad.dybcio@linaro.org>
 <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.02.2023 22:07, Dmitry Baryshkov wrote:
> On 14/02/2023 19:31, Konrad Dybcio wrote:
>> Currently we only utilize the OPP table connected to the GPU for
>> getting (available) frequencies. We do however need to scale the
>> voltage rail(s) accordingly to ensure that we aren't trying to
>> run the GPU at 1GHz with a VDD_LOW vote, as that would result in
>> an otherwise inexplainable hang.
>>
>> Tell the OPP framework that we want to scale the "core" clock
>> and swap out the clk_set_rate to a dev_pm_opp_set_rate in
>> msm_devfreq_target() to enable usage of required-opps and by
>> extension proper voltage level/corner scaling.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
>>   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index ce6b76c45b6f..15e405e4f977 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -1047,6 +1047,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>       const char *gpu_name;
>>       u32 speedbin;
>>   +    /* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
>> +    if (!IS_ERR(devm_clk_get(dev, "core")))
>> +        devm_pm_opp_set_clkname(dev, "core");
> 
> Can we instead move a call to a6xx_set_supported_hw() / check_speed_bin after the adreno_gpu_init() ? It will call msm_gpu_init, which in turn sets gpu->core_clk.
> 
> Ideally you can call devm_pm_opp_set_clkname() from that function.


Or maybe completely drop gpu->core_clk and always use devm_pm_opp_set_clk_rate().
That would break non-OPP targets, last of which were probably added N=big years ago..
I'm not sure these would still work, as I think we've got rid of some ugly
clock getters that were looking for both "core" and "core_clk" etc.

See 8db0b6c7b636376789e356d861c3c6c35dcb6913 for what seems to be the most recent
example of non-OPP.

IMX51/53 also have no OPP tables and are using the (AFAIK) now-defunct _clk-suffixed
clock-names.

I'd be more than happy to rip out some of this legacy code and convert it
to something modern like OPP, but I'm not sure you guys would like it considering
the breakage on (arguably ancient and borderline retired) platforms.

This patch as-is "only" breaks non-OPP a5xx & a6xx (as they have .gpu_busy defined),
of which there are none..

> 
>> +
>>       adreno_gpu->funcs = funcs;
>>       adreno_gpu->info = adreno_info(config->rev);
>>       adreno_gpu->gmem = adreno_gpu->info->gmem;
>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>> index e27dbf12b5e8..ea70c1c32d94 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
>> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>>           gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>>           mutex_unlock(&df->lock);
>>       } else {
>> -        clk_set_rate(gpu->core_clk, *freq);
>> +        dev_pm_opp_set_rate(dev, *freq);
> 
> This is not enough, there are calls to clk_set_rate(gpu->core_clk) in msm_gpu.c which are called from the suspend/resume path.
Right, good catch.

Konrad
> 
>>       }
>>         dev_pm_opp_put(opp);
> 
