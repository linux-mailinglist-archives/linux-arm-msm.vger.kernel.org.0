Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9A3869FE6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 23:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjBVWYM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 17:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbjBVWYL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 17:24:11 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3482D15A
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 14:24:04 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e24so3153179ljj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 14:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFsXN2BkZ/RtolezxjM7dDKYfNV11Lc1vqUvttS4mlw=;
        b=EO7o8Ns9MEY+Vh5cokgOBBxNj0LOGUUYcFICQVhp94Yyl/rbGVY6JsxxpSqQ9DmxLm
         KuFYfQEZqvQXaxTjCQ6PcGQxC7f/qfK3gJpn2KBX722q1z0bqaHnd2Y1lcBCZaArBZVk
         LahoDPCcvm0KugK8P2WJ9yfZORyBnvAguWxw7SuuFiuFUL0wQslMP/jvZvgml0jmk27y
         X+YokOiuB7vQ3gKr5g2vruW9CbqsYfdy38JaO+1VlaA9Zscp+sQH1/og58sig5BeYcy/
         THU/NLvjGzXflybeX6PAofpwP6xRL3Y9Q4UKnwXHxtzN1HmEvslzcegyuutNMkrJ6IV6
         x1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFsXN2BkZ/RtolezxjM7dDKYfNV11Lc1vqUvttS4mlw=;
        b=uWPP3X/NsXvBt0Gb39J7hMKe3UrcveIBSMgAN/Woo88ZQ1T3gME7mFMmevAbxBsMPJ
         aBnyBpcRMFzNUmOVLgy91CNJ4XPl1jdI8MvrnyAAUpk7Wv3r5+LYQNorWm+1qyT9JsCA
         /3CYuAWFlnzZ2nxC2ejYBPHWiqZrCkFqT9f8MmiD+80/Ta0eiJt2Txbn4215q1s3yVII
         rwzjQOkq4WURiXHjwF/g/iCMSrzid4AWIDaqXu5rikDx/DGG57KJ3y778+3XNA3gcRYf
         hOn+yNmf64Je+ARkFX8sTpZHXkAPSAOOvJm1E0VEpWaDv6xC9qez5ih8gb7xd+kDrgJN
         3O0g==
X-Gm-Message-State: AO0yUKW2KoWgRFyNvSSq2OP1vYeuzRwiiBOlQpuMuk/oRryrruibA3KH
        9gw1SJFsgH4ZpD7cflSwfniFTA==
X-Google-Smtp-Source: AK7set8qGhDntQjNsikMcGB/gQgCeoI7Q4nEM7aJGrr9UfpLQLCdYcTNNDqbEPkyDenS/LcmAzpDRg==
X-Received: by 2002:a2e:a99b:0:b0:293:42b2:5f4f with SMTP id x27-20020a2ea99b000000b0029342b25f4fmr3537269ljq.17.1677104642948;
        Wed, 22 Feb 2023 14:24:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e9d4c000000b00295945c9d69sm455080ljj.50.2023.02.22.14.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 14:24:02 -0800 (PST)
Message-ID: <9b535af0-7159-14b3-560f-197c7153b78c@linaro.org>
Date:   Thu, 23 Feb 2023 00:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/5] drm/msm/a2xx: Implement .gpu_busy
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-2-01021425781b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-2-01021425781b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Implement gpu_busy based on the downstream msm-3.4 code [1]. This
> allows us to use devfreq on this old old old hardware!
> 
> [1] https://github.com/LineageOS/android_kernel_sony_apq8064/blob/lineage-16.0/drivers/gpu/msm/adreno_a2xx.c#L1975
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index c67089a7ebc1..6258c98e5a88 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -481,6 +481,33 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>   	return aspace;
>   }
>   
> +/* While the precise size of this field is unknown, it holds at least these three values.. */
> +#define PERF_MODE_CNT		GENMASK(2, 0)
> + #define PERF_STATE_RESET	0x0
> + #define PERF_STATE_ENABLE	0x1
> + #define PERF_STATE_FREEZE	0x2

These should go into a2xx.xml.h

LGTM otherwise.

> +static u64 a2xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
> +{
> +	u64 busy_cycles;
> +
> +	/* Freeze the counter */
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_FREEZE));
> +
> +	busy_cycles = gpu_read64(gpu, REG_A2XX_RBBM_PERFCOUNTER1_LO);
> +
> +	/* Reset the counter */
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_RESET));
> +
> +	/* Re-enable the performance monitors */
> +	gpu_rmw(gpu, REG_A2XX_RBBM_PM_OVERRIDE2, BIT(6), BIT(6));
> +	gpu_write(gpu, REG_A2XX_RBBM_PERFCOUNTER1_SELECT, 1);
> +	gpu_write(gpu, REG_A2XX_CP_PERFMON_CNTL, FIELD_PREP(PERF_MODE_CNT, PERF_STATE_ENABLE));
> +
> +	*out_sample_rate = clk_get_rate(gpu->core_clk);
> +
> +	return busy_cycles;
> +}
> +
>   static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   {
>   	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
> @@ -502,6 +529,7 @@ static const struct adreno_gpu_funcs funcs = {
>   #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
>   		.show = adreno_show,
>   #endif
> +		.gpu_busy = a2xx_gpu_busy,
>   		.gpu_state_get = a2xx_gpu_state_get,
>   		.gpu_state_put = adreno_gpu_state_put,
>   		.create_address_space = a2xx_create_address_space,
> 

-- 
With best wishes
Dmitry

