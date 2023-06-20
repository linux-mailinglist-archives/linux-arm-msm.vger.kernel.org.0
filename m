Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBB47369BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 12:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbjFTKqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 06:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjFTKqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 06:46:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A29101
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:46:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f640e48bc3so5852284e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687257974; x=1689849974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OEONiMElW22BthF1fjztsXeD+/1OPlNWa3pMXZAonc=;
        b=Jb7ZARPuGbyUQk7eB0UwEASlp8yUdF17sLT+gHMGvVdXQsYSIIA6Muy2Rqr/N/vEPH
         EOviK+LwB6v/1L8SxmR9YbksO4Od4xlRD8NGKKvvgLJcIyl3aRCtM7NCz8/YsumS3Bwi
         oVkfJCDrCCB6BYgpxXZfVzsvpb1detvTmqb/lTIxSilsizoxVVhJjM8YVSHDGJRMu4p2
         I1IGJq9WRIPLP7Hckwn4MSi1vPC3q23wIwmcfN46CgssC43DPWO/I2y9QsLIoeXi1cck
         UYxlURF+5gmdcK5pK/J9mChsG8t13afxJ9jXfih3XE5WxRHH1EkP67VXlkOzckH0ZOEe
         5r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687257974; x=1689849974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OEONiMElW22BthF1fjztsXeD+/1OPlNWa3pMXZAonc=;
        b=ICrj+ZuZbifzbsgSEicOtLk+8oIihD2rYlJZ7+GZrTp4ZgLwbM8tGIDJDPIutyzR8P
         y036q0owWJJM4gwQIzV6X+TYvxmYxBu9xmHhzx3a472rshR2vJvD2pcJNhkHqEu+iT4S
         KlMNW0ahwSoBwjjo50V+nsAUHUQswO6hLW2wOTd6QcVzgOYvNKTcpiisCRtzd37g0+Gn
         PLk+PUzL5ScMUVodWtprPridB3UrsBLfF7/IeN4/ukRM71gc/qGFkeTg6U4Ex21PLsKC
         5RBmhaGlBPDx5rBRyArJHdtHprCABIFxj1EoPUOVa7y0jMPOZmyo5hds2ndAFuIO/sd4
         08NA==
X-Gm-Message-State: AC+VfDwFe3XSrlzr5nSh0nAq/4YphIVXQPm0CaiQNwUvMzWrP/4F/1kd
        dGR6UHfEUj2DNBitnhpunB+Stg==
X-Google-Smtp-Source: ACHHUZ4t3Za3V28XgfbEGJg5aA3qEvSd58VkdWSjY048vRyDsTEsKF7CDVSZfXBfuPjpsrrWO8B0KA==
X-Received: by 2002:a19:6544:0:b0:4f6:d7b:2f19 with SMTP id c4-20020a196544000000b004f60d7b2f19mr6331573lfj.24.1687257973811;
        Tue, 20 Jun 2023 03:46:13 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id y11-20020ac2446b000000b004f8792c5c75sm319675lfl.24.2023.06.20.03.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:46:13 -0700 (PDT)
Message-ID: <5b72eb45-d2fa-a3b7-5792-d496dbde4314@linaro.org>
Date:   Tue, 20 Jun 2023 12:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/8] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
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
 <20230620000846.946925-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-4-dmitry.baryshkov@linaro.org>
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
> The max_per_pipe_ib is a constant across all CRTCs and is read from the
> catalog. Drop corresponding calculations and read the value directly at
> icc_set_bw() time.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
This looks good, but doesn't apply on next-20230620

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
>  3 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 9902febc72c0..ba146af73bc5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -105,13 +105,12 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
>  	memset(perf, 0, sizeof(struct dpu_core_perf_params));
>  
>  	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> -	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
>  	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
>  
>  	DRM_DEBUG_ATOMIC(
> -		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> +		"crtc=%d clk_rate=%llu core_ab=%llu\n",
>  			crtc->base.id, perf->core_clk_rate,
> -			perf->max_per_pipe_ib, perf->bw_ctl);
> +			perf->bw_ctl);
>  }
>  
>  int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> @@ -199,9 +198,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  				dpu_crtc_get_client_type(tmp_crtc)) {
>  			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>  
> -			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
> -					dpu_cstate->new_perf.max_per_pipe_ib);
> -
>  			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
>  
>  			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
> @@ -217,7 +213,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>  
>  	for (i = 0; i < kms->num_paths; i++)
> -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> +		icc_set_bw(kms->path[i], avg_bw, kms->catalog->perf->min_dram_ib);
>  
>  	return ret;
>  }
> @@ -320,15 +316,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>  		 * 2. new bandwidth vote - "ab or ib vote" is lower
>  		 *    than current vote at end of commit or stop.
>  		 */
> -		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
> -			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
> -			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
> -			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
> +		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
> +		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
>  			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
>  				crtc->base.id, params_changed,
>  				new->bw_ctl, old->bw_ctl);
>  			old->bw_ctl = new->bw_ctl;
> -			old->max_per_pipe_ib = new->max_per_pipe_ib;
>  			update_bus = true;
>  		}
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e02cc2324af2..2bf7836f79bb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -16,12 +16,10 @@
>  
>  /**
>   * struct dpu_core_perf_params - definition of performance parameters
> - * @max_per_pipe_ib: maximum instantaneous bandwidth request
>   * @bw_ctl: arbitrated bandwidth request
>   * @core_clk_rate: core clock rate request
>   */
>  struct dpu_core_perf_params {
> -	u64 max_per_pipe_ib;
>  	u64 bw_ctl;
>  	u64 core_clk_rate;
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 1edf2b6b0a26..ff5d306b95ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1400,8 +1400,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
>  	seq_printf(s, "core_clk_rate: %llu\n",
>  			dpu_crtc->cur_perf.core_clk_rate);
>  	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
> -	seq_printf(s, "max_per_pipe_ib: %llu\n",
> -				dpu_crtc->cur_perf.max_per_pipe_ib);
>  
>  	return 0;
>  }
