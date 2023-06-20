Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49170736A07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 12:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjFTK44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 06:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjFTK4z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 06:56:55 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE9E10E2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:56:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b4745834f3so34272961fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687258608; x=1689850608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFqY3JPIOHhrCDWe7opJVMIu2iuwa1Q7D1xQRKlMgbQ=;
        b=uRLcWOUWpEIQl6vz1xWRgHsilN6LvWK3L/02cDKUqJHNnzb4hwG+pxYVHl/+VYASRF
         nC6X79mVaUbV2G3YKCFY+lC/JYjNGWR5fp2Dbn59T9gHCSXoCxjbnHE5Zl8TkDBgREVv
         Ai9Et1hrlL9UIRmTGf8A3LJCO+iXgq580QUmnWOecZ5Ve9+3vaYkjoZ5En5Z/A7RJ+48
         BTkiJojsH97sqWJdy5YbfYSZUW3r8hiOs7z7x+UfIjWe+U5Iz9TCjgQAbnF+K2FHK7GG
         4RiGrnb2D6TdyK+8NK3Qa+uDZW5RDxhdETLXy7inyxXF6T64XzUiwAqZLh8jZKONWhCp
         Oc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687258608; x=1689850608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFqY3JPIOHhrCDWe7opJVMIu2iuwa1Q7D1xQRKlMgbQ=;
        b=Gk6DnGZleUFs39nYrv3AgcUB0gyS5MrkE3cWDiwqg0TwjYpuOD3poxlUgwBDUn5Ewb
         Ly6X8yS3iAu9WMP/yJlMLp1REn/TTv7w8M2H05cJn/tZ7gsmQzkRXHTq4Am/FuLoJ0ap
         +/AF8hTU/vBxQTycSBD7AhO/NPnTlC31rv6oSGlmcHCydaHf8AzqfnM4ap0/T+SYSZWw
         qIULbiXL2737brmN7TNb5NHC1JiIXExqIgjhGqYG1i/9dInwgTzFpViilyf7NKPP2LRO
         biCray8NQBYI2CMq3HL8SP/onyU6UEkkw+7jPaGrWZRhyVjL4Ggr30EIVkjEqvHwXmYH
         3prA==
X-Gm-Message-State: AC+VfDwqwOPbYjK8k/kAyLVlwMtgWSURjmuTvYyLJTs17XeViO2eKc5e
        /AMo13uOJQJYE2Bi4peLI4/TZQ==
X-Google-Smtp-Source: ACHHUZ6hCNdrCmb27LQnbm+NLckOTiA3YD8TuMMSXhmHUe5FnN3n3LlMF3AW9/tFmXxA+iXnNOXJsg==
X-Received: by 2002:a2e:a601:0:b0:2b4:4bb7:2618 with SMTP id v1-20020a2ea601000000b002b44bb72618mr7652691ljp.19.1687258608115;
        Tue, 20 Jun 2023 03:56:48 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id h19-20020a2eb0f3000000b002b3318c8d6fsm359850ljl.28.2023.06.20.03.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:56:47 -0700 (PDT)
Message-ID: <331b4f84-a852-3197-f26a-4f1f0368ef70@linaro.org>
Date:   Tue, 20 Jun 2023 12:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 8/8] drm/msm/dpu: remove unused fields from struct
 dpu_core_perf
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
> are not used by the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
>  3 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index f779ad544347..7f110d15b101 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -395,11 +395,9 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>  #endif
>  
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
> -		struct drm_device *dev,
>  		const struct dpu_perf_cfg *perf_cfg,
>  		struct clk *core_clk)
>  {
> -	perf->dev = dev;
>  	perf->perf_cfg = perf_cfg;
>  	perf->core_clk = core_clk;
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e1198c104b5e..623e2d058695 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -27,7 +27,6 @@ struct dpu_core_perf_params {
>  /**
>   * struct dpu_core_perf - definition of core performance context
>   * @dev: Pointer to drm device
> - * @debugfs_root: top level debug folder
>   * @perf_cfg: Platform-specific performance configuration
>   * @core_clk: Pointer to the core clock
>   * @core_clk_rate: current core clock rate
> @@ -36,8 +35,6 @@ struct dpu_core_perf_params {
>   * @enable_bw_release: debug control for bandwidth release
>   */
>  struct dpu_core_perf {
> -	struct drm_device *dev;
> -	struct dentry *debugfs_root;
>  	const struct dpu_perf_cfg *perf_cfg;
>  	struct clk *core_clk;
>  	u64 core_clk_rate;
> @@ -77,7 +74,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
>   * @core_clk: pointer to core clock
>   */
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
> -		struct drm_device *dev,
>  		const struct dpu_perf_cfg *perf_cfg,
>  		struct clk *core_clk);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4439147d2c35..5297cec68c9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1115,7 +1115,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		dpu_kms->hw_vbif[vbif->id] = hw;
>  	}
>  
> -	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
> +	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
>  			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
>  	if (rc) {
>  		DPU_ERROR("failed to init perf %d\n", rc);
