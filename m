Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E454B952C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 01:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiBQA5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 19:57:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiBQA5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 19:57:14 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAEA1AD89
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:56:54 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u16so5953629ljk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Hwfp/OQtDrohKTPClg8y0ZHlR72Rccgb37q08oBGNNU=;
        b=wCumKQyTDNnf03yAzx77D+z7zRRNqJ4/GpBs0W//gkl2tJsZtQ0WTYSnytdMx7z0cq
         nHnx79/Fpzha7WKPXs7RNNosMZ+tQv/9j6OxYlVpiLvO++veN61jxyQuHm/QinCYmpRp
         TL3uJ4O78M8B0JMlXOryRZ0LLciTPsscRWuLhRzqKGcK8A/LOd2SPQmaF6BZ+k4cZFAm
         RBZXCBfaB0jlhstTiAwDlWovJtu+E06x47IRmQAICFS49D5AZgNYcoNh5+y8n+HU6keq
         EByfRV7o3jpneA7pGXIQYkMrWdzRrl5doGupGYnxocTeyCMgY1j9XRVj4c94fLZ2NrKg
         AReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hwfp/OQtDrohKTPClg8y0ZHlR72Rccgb37q08oBGNNU=;
        b=hJMHalz/SXi2GhgqDupG48k2TjBt82xuYRCZchvs0EIeMgVIToEqvIXqIK/IbEMLsu
         8scWUK2j7R0fsaP1KeayOMJWlrUeobPNYoAzb5cQZVUFYH/CvkIb+eNrefEOoM+Io4q+
         mPBA+Uwa5pae1SPVEKAYMs1nzmBDfiitY7TvWWTvGhNFiOeuLa9/35UW8rSqRLYodLm8
         f2GJ/p0Hb6N19/kC+u+2J0bP6jMTm3nbAsByTpugxYavU5o3mopVwJGKzvE7f8gGFKMO
         WHhBHhwlyYlJWryHlMGVniGuAofPmCNEjgnluqKWn1SfFFbix6JycklBLvdbAfHhy0TT
         BaRw==
X-Gm-Message-State: AOAM533fhyt2EYDSR6t5640ZJQVECYZLFfuwluf9H/FFQkYCOaJQagd2
        TqxfyiSY1mw2hShhWXZmzNWa1A==
X-Google-Smtp-Source: ABdhPJywcCKmVMRJ7u3WwWkWGcT35bBfuJOChMjdMtRkeyMwmQJXwNnnrmgn8ej+Zgj41sCPxqvcUg==
X-Received: by 2002:a05:651c:1792:b0:235:1df3:7b8e with SMTP id bn18-20020a05651c179200b002351df37b8emr473604ljb.464.1645059413145;
        Wed, 16 Feb 2022 16:56:53 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1533330ljb.77.2022.02.16.16.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 16:56:52 -0800 (PST)
Message-ID: <bb35fa5f-b873-a345-714e-ce2e7a18b574@linaro.org>
Date:   Thu, 17 Feb 2022 03:56:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: simplify clocks handling
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
 <20220131210513.2177652-2-dmitry.baryshkov@linaro.org>
 <CAE-0n520mZdGaMWwjBEb7SSbLf31Sd7t3pe9dJ5FLVnsSVJZFg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n520mZdGaMWwjBEb7SSbLf31Sd7t3pe9dJ5FLVnsSVJZFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/02/2022 05:31, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-31 13:05:12)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 60fe06018581..4d184122d63e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -405,10 +394,11 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>>
>>                  trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
>>
>> -               ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
>> +               if (clk_rate > kms->perf.max_core_clk_rate)
>> +                       clk_rate = kms->perf.max_core_clk_rate;
> 
> Using
> 
> 	clk_rate = min(clk_rate, kms->perf.max_core_clk_rate)
> 
> would be type safer. And min_t() would be explicit if the types don't
> match, but we should try to make them be compatible.

Ack

> 
>> +               ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>>                  if (ret) {
>> -                       DPU_ERROR("failed to set %s clock rate %llu\n",
>> -                                       kms->perf.core_clk->clk_name, clk_rate);
>> +                       DPU_ERROR("failed to set core clock rate %llu\n", clk_rate);
>>                          return ret;
>>                  }
>>
>> @@ -529,13 +519,13 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>>   int dpu_core_perf_init(struct dpu_core_perf *perf,
>>                  struct drm_device *dev,
>>                  struct dpu_mdss_cfg *catalog,
>> -               struct dss_clk *core_clk)
>> +               struct clk *core_clk)
>>   {
>>          perf->dev = dev;
>>          perf->catalog = catalog;
>>          perf->core_clk = core_clk;
>>
>> -       perf->max_core_clk_rate = core_clk->max_rate;
>> +       perf->max_core_clk_rate = clk_get_rate(core_clk);
>>          if (!perf->max_core_clk_rate) {
>>                  DPU_DEBUG("optional max core clk rate, use default\n");
>>                  perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index 2d385b4b7f5e..5f562413bb63 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -21,7 +21,6 @@
>>   #include "dpu_hw_lm.h"
>>   #include "dpu_hw_interrupts.h"
>>   #include "dpu_hw_top.h"
>> -#include "dpu_io_util.h"
>>   #include "dpu_rm.h"
>>   #include "dpu_core_perf.h"
>>
>> @@ -113,7 +112,8 @@ struct dpu_kms {
>>          struct platform_device *pdev;
>>          bool rpm_enabled;
>>
>> -       struct dss_module_power mp;
>> +       struct clk_bulk_data *clocks;
>> +       int num_clocks;
> 
> size_t?
> 
>>
>>          /* reference count bandwidth requests, so we know when we can
>>           * release bandwidth.  Each atomic update increments, and frame-
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> index 131c1f1a869c..8c038416e119 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> @@ -29,7 +29,8 @@ struct dpu_irq_controller {
>>   struct dpu_mdss {
>>          struct msm_mdss base;
>>          void __iomem *mmio;
>> -       struct dss_module_power mp;
>> +       struct clk_bulk_data *clocks;
>> +       int num_clocks;
> 
> size_t?
> 
>>          struct dpu_irq_controller irq_controller;
>>   };
>>


-- 
With best wishes
Dmitry
