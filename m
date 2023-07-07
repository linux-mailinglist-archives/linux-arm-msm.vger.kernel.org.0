Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD3C74BA18
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 01:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjGGXs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 19:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjGGXs4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 19:48:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B99A210B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 16:48:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fb7589b187so3998565e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688773733; x=1691365733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAR6us1ginvwagA6iA1+ZaHnkbJvmRpkHBkWSUBw4zI=;
        b=uvURydsxo0LbzY1Q2/aSupUNVxlZygjxYAVrQQTXCMyb6IBVHYTbhYrVjGjci+T9A0
         eEWuurCTIQwj3ixFqT4DnLakYtWPRFyl/umtiCSS7VY612cIH0moX3/+/RziJ+shmQ1G
         wlLlbGyGSXT3sqHu0A2FhHX3zaNtG3CZK4PHThIs2Hfct+jXhVFfSzTv9Fkoe1/2cKtq
         I+luCdnTat4CCdrfyVvoKadAeFWHRTFEp8vcsbRb4sL7UjGOK0sPZkO14r/Y5YmXq44l
         79GzX4jVFVZTruJMert2w8/8Df+LjwYRcT1TRDYoW8jH9lX2H+1PQLPJkXPjl8XSfigU
         j7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688773733; x=1691365733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAR6us1ginvwagA6iA1+ZaHnkbJvmRpkHBkWSUBw4zI=;
        b=G2w6nKUf/2WW20uuFN/j0yKG4NHy+7ri/AK5k9CYt63KzSWaAeb7Y580LJps/O2b3m
         PjEYkmyxBb2QSBnHNLLJsFvAhTAtgM23TVZX9Ws+ByWbE38qfKtY6AA3V5kGBXDUEBYh
         scFhSasgXRbSScOErFKXzBFn71ONnW8MlXAZhZ4Q0J+lSa6GB7ikTmO5SrqkDT6NI6Nj
         xljCPj+289Tn2lsQu9j/HRCAlfIKmDpiFdErQ1G3gftTAUa9oFisAxc5O0FmaUUuDNw3
         w3IAeCTiIMjEyCajbM05hKmAaKQUtPFBK51yWRwwrVDF3ejDS2kh/XONvmqzwFcebJD4
         N6Vw==
X-Gm-Message-State: ABy/qLa54XrCZi3N3gDrMpEPNQeWZ9Wm9+aFExf3mYYj1rRztO5QT+L1
        IvWplm3G7AWDwCCwkrsJ31aU4SVrzlQYPKPRnY0=
X-Google-Smtp-Source: APBJJlHcwTn6+gi0XyaxHfo/sKdp+Jvp0ZA0w7IT0pnTqhPPEhXuvL62dJE/e7VxTOTaT1cPNxe/Ng==
X-Received: by 2002:ac2:58e4:0:b0:4fb:9772:6639 with SMTP id v4-20020ac258e4000000b004fb97726639mr4153871lfo.6.1688773733550;
        Fri, 07 Jul 2023 16:48:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o15-20020ac2494f000000b004fba09ae900sm838031lfi.149.2023.07.07.16.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 16:48:53 -0700 (PDT)
Message-ID: <cc312e51-e0c0-c1f9-aa56-60cf95e23b79@linaro.org>
Date:   Sat, 8 Jul 2023 02:48:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
 <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
 <81ff3de5-4fe4-9c01-5655-78f5311f7817@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <81ff3de5-4fe4-9c01-5655-78f5311f7817@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 02:25, Konrad Dybcio wrote:
> On 7.07.2023 22:37, Dmitry Baryshkov wrote:
>> It was noticed that dpu_kms_hw_init()'s error path contains several
>> labels which point to the same code path. Replace all of them with a
>> single label.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> it's the first time I'm seeing this code
> 

It is Suggested-by, not something else. And you pointed it out in 
https://lore.kernel.org/linux-arm-msm/6d598438-f10f-8678-7878-829b8b3ae790@linaro.org/

> Konrad
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>>   1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index c11b3ab572ab..e7ac02e92f42 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	if (!dpu_kms->catalog) {
>>   		DPU_ERROR("device config not known!\n");
>>   		rc = -EINVAL;
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	/*
>> @@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	rc = _dpu_kms_mmu_init(dpu_kms);
>>   	if (rc) {
>>   		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>>   	if (rc) {
>>   		DPU_ERROR("rm init failed: %d\n", rc);
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dpu_kms->rm_init = true;
>> @@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   		rc = PTR_ERR(dpu_kms->hw_mdp);
>>   		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>>   		dpu_kms->hw_mdp = NULL;
>> -		goto power_error;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>> @@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>>   			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
>> -			goto power_error;
>> +			goto err_pm_put;
>>   		}
>>   
>>   		dpu_kms->hw_vbif[vbif->id] = hw;
>> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
>>   	if (rc) {
>>   		DPU_ERROR("failed to init perf %d\n", rc);
>> -		goto perf_err;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
>> @@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   		rc = PTR_ERR(dpu_kms->hw_intr);
>>   		DPU_ERROR("hw_intr init failed: %d\n", rc);
>>   		dpu_kms->hw_intr = NULL;
>> -		goto hw_intr_init_err;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dev->mode_config.min_width = 0;
>> @@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   	rc = _dpu_kms_drm_obj_init(dpu_kms);
>>   	if (rc) {
>>   		DPU_ERROR("modeset init failed: %d\n", rc);
>> -		goto drm_obj_init_err;
>> +		goto err_pm_put;
>>   	}
>>   
>>   	dpu_vbif_init_memtypes(dpu_kms);
>> @@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>   
>>   	return 0;
>>   
>> -drm_obj_init_err:
>> -hw_intr_init_err:
>> -perf_err:
>> -power_error:
>> +err_pm_put:
>>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   error:
>>   	_dpu_kms_hw_destroy(dpu_kms);

-- 
With best wishes
Dmitry

