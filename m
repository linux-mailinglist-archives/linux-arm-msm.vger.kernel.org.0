Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF19368C5C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 19:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjBFSap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 13:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjBFSao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 13:30:44 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7760424119
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 10:30:42 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so36853984ejc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 10:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jYmi9IvnFIypy0mds4wMWCZZJQWX6LaMpS3CK15Nck=;
        b=meb3gpgNV8yB3mS6e4DHFRab1mSjoBU1gs/uHV8RbeJ9ixwvDP3EFdHrl5gakVyEXs
         el94qLuYPpmldddxpgwWxG9Z3edGYOVQkE0BcwE0EvanV6ZGm9GsEoE1uZF0V4B5GabJ
         sLlRy5R+CjUVYLEpAXny8VmNeiJi9g3s3yWm5+wZwODLewLy+3iBxUayAmqR5WZDUSo5
         gLJCOIKNizbpMkjTNGHLGejUlOlfBw5jTeO1MAv7WDwm21EYgARwg08KJDPiYKYnn2Kl
         mHW590FmluZhKrOhCZ3jPQaovHMwSojFwlfGSG+9r2js9ihTfpxs4oEM4QmDvfQpyvRP
         neTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/jYmi9IvnFIypy0mds4wMWCZZJQWX6LaMpS3CK15Nck=;
        b=a4qvmkGJvu+QfbR0p9I3XH9jxqH4zuMt1h9My7LkUxOOnXNSJGlg7y6FdgIs3Wk7ES
         jf9C4CUsZwB0MsAn7Ytols75jRzfZjpYh+9yE9E1kzHGxXTN1C060Yfo3kSiGpQOctmX
         PLYUzo9MDydQpu6QQEVkik4QkJAcQRqUPFW8BQAlNDhL+V374SuSlJkc3CG6F9Rz7Sm9
         5Vm1u663m3tQxBPQ97sUQ8kyfrUhfPMQDAOhJHqZew94LWh/W9SmJwbdwGByg0jFPDIt
         SSwGx/IHMKVu71sAupacai8h3fi2vOYjsJNSeXaVoU3pzdhvOECj3iQloZbU5nJjxlaz
         PTWg==
X-Gm-Message-State: AO0yUKU+O6WD7ZzAf/3fGPw0QWJrs3DwgfLdiwiu1YbMVnhzpVGcYvhl
        huqZWsOse84UxdeHCPYJqZPDiGw8oWmLSYzQ
X-Google-Smtp-Source: AK7set9h7k+5/mLKiqGh8P5Hj7oMyP9YAgx1ZMwdMQ1pClIoToN8Rko8Eh30kdGfwAF1NAkOZG3vcA==
X-Received: by 2002:a17:907:9706:b0:878:4c4e:1c6a with SMTP id jg6-20020a170907970600b008784c4e1c6amr421164ejc.3.1675708240771;
        Mon, 06 Feb 2023 10:30:40 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id ui4-20020a170907c90400b0087848a5daf5sm5837441ejc.225.2023.02.06.10.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 10:30:40 -0800 (PST)
Message-ID: <b5592c00-87ff-dcf7-7342-56c4c593fc42@linaro.org>
Date:   Mon, 6 Feb 2023 19:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU
 GPUs
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Emma Anholt <emma@anholt.net>, Chia-I Wu <olvaffe@gmail.com>,
        Dan Carpenter <error27@gmail.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-7-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230126151618.225127-7-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.01.2023 16:16, Konrad Dybcio wrote:
> Currently we only utilize the OPP table connected to the GPU for
> getting (available) frequencies. We do however need to scale the
> voltage rail(s) accordingly to ensure that we aren't trying to
> run the GPU at 1GHz with a VDD_LOW vote, as that would result in
> an otherwise inexplainable hang.
> 
> Tell the OPP framework that we want to scale the "core" clock
> and swap out the clk_set_rate to a dev_pm_opp_set_rate in
> msm_devfreq_target() to enable usage of required-opps and by
> extension proper voltage level/corner scaling.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
Welp, as-is, this breaks devfreq on GPUs with a GMU.. Will fix..

Konrad
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 817599766329..c85ae3845a4e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -1047,6 +1047,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	const char *gpu_name;
>  	u32 speedbin;
>  
> +	/* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
> +	devm_pm_opp_set_clkname(dev, "core");
> +
>  	adreno_gpu->funcs = funcs;
>  	adreno_gpu->info = adreno_info(config->rev);
>  	adreno_gpu->gmem = adreno_gpu->info->gmem;
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index e27dbf12b5e8..ea70c1c32d94 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>  		gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
>  		mutex_unlock(&df->lock);
>  	} else {
> -		clk_set_rate(gpu->core_clk, *freq);
> +		dev_pm_opp_set_rate(dev, *freq);
>  	}
>  
>  	dev_pm_opp_put(opp);
