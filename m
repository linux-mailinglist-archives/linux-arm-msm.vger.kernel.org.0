Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719016DFE82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 21:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjDLTLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 15:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjDLTLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 15:11:02 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C2230E0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:11:01 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id e3so4257538ljn.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681326659; x=1683918659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpqluWrnWMTubE/cFzjVHZve1zESMR3i708t3K0QezE=;
        b=YBzt5UkInJL4OPy0J89uP8JftVkp8m+rIO8P+werBLotfWtm4lXO+DzAMSdNlI1kCT
         MaLE+ckEneZVMbJbacrsDZLQrX8GIWte5V3gvcNLMGObaTJ8BXbX4dAZVCatP5H/oKxd
         34IF6eGEQFNQ69N0WfcgqhEaBLKl49FB+C5+xCBFOaBZ7vRPA+e/vPscIZNJdn5bP0G0
         IIETqi/c2kP++loVvYqz1EEWBYjkmRa0O+5UNrqfOHiT+na/yGJLOkXLEQX8Nv/lKCUv
         MmXl+PKh7I9cLXSF2am0ceGe1goLHpgnIqBh1mvTNASGJzul4TARpYJHb9Bv7lz9HR2l
         Qvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681326659; x=1683918659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpqluWrnWMTubE/cFzjVHZve1zESMR3i708t3K0QezE=;
        b=KosEUmW+gfoZYEJx57LZIDLRc0HssCbqz2gIFH7YkQyP4KIc+KsexM0tDKTYlQp9Wu
         SC3q/F7GvEC9IEmmeic2BbhBSS+Yzztyd9bnZtZ6elGrpfgCsEGT2tLXXJ8+1FsLUoG1
         /meG9gRBTPsb1/pkz9BrFjI5o0NWT1W+umcb8Pc+jg1ozcMzM1MRt/yHR8XWXeJpS/qN
         TF1dY1V8WpJqqM18ONAVON/GHqMPbf6MffM2Z+0YBpZ+ExtLeD94jKpOiUNCCRs0lp/M
         6fbKEKw3NETCiP+ki63lYOyteQeyjgY+12jpl28hJvsytoO276zfs6jf8/7hHW2Lm7XW
         4hZw==
X-Gm-Message-State: AAQBX9dDe3apwnwGigh0MSkhu8gLyvmV/XyQgeTOi1+2XVXU3znJDxlq
        77TKTkpbSXvu9xDHqYw2NLGUhg==
X-Google-Smtp-Source: AKy350ZFqTiVr89sT0WqMkVS6KtQGGCdlAZbREyiE5hodrT7M4RHD4CXKaHnpzGwIzC6Xrjy+d4FdQ==
X-Received: by 2002:a2e:8415:0:b0:2a2:47a8:728b with SMTP id z21-20020a2e8415000000b002a247a8728bmr911418ljg.13.1681326659144;
        Wed, 12 Apr 2023 12:10:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e87c9000000b002a7852b60f6sm1151473ljj.58.2023.04.12.12.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 12:10:58 -0700 (PDT)
Message-ID: <e0ff8203-8fdb-4833-92cf-447ccb823f8f@linaro.org>
Date:   Wed, 12 Apr 2023 22:10:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 1/8] drm/msm/dsi: use new helpers for DSC setup
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-1-0108401d7886@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v5-1-0108401d7886@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2023 22:09, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Use new DRM DSC helpers to setup DSI DSC configuration. The
> initial_scale_value needs to be adjusted according to the standard, but
> this is a separate change.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Since you are resending this patch, you should also include your S-o-b tag.

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 61 +++++---------------------------------
>   1 file changed, 8 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 961689a255c4..74d38f90398a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1731,28 +1731,9 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>   	return -EINVAL;
>   }
>   
> -static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> -	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
> -	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> -};
> -
> -/* only 8bpc, 8bpp added */
> -static char min_qp[DSC_NUM_BUF_RANGES] = {
> -	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
> -};
> -
> -static char max_qp[DSC_NUM_BUF_RANGES] = {
> -	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
> -};
> -
> -static char bpg_offset[DSC_NUM_BUF_RANGES] = {
> -	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> -};
> -
>   static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
>   {
> -	int i;
> -	u16 bpp = dsc->bits_per_pixel >> 4;
> +	int ret;
>   
>   	if (dsc->bits_per_pixel & 0xf) {
>   		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
> @@ -1764,49 +1745,23 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>   		return -EOPNOTSUPP;
>   	}
>   
> -	dsc->rc_model_size = 8192;
> -	dsc->first_line_bpg_offset = 12;
> -	dsc->rc_edge_factor = 6;
> -	dsc->rc_tgt_offset_high = 3;
> -	dsc->rc_tgt_offset_low = 3;
>   	dsc->simple_422 = 0;
>   	dsc->convert_rgb = 1;
>   	dsc->vbr_enable = 0;
>   
> -	/* handle only bpp = bpc = 8 */
> -	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
> -		dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
> +	drm_dsc_set_const_params(dsc);
> +	drm_dsc_set_rc_buf_thresh(dsc);
>   
> -	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> -		dsc->rc_range_params[i].range_min_qp = min_qp[i];
> -		dsc->rc_range_params[i].range_max_qp = max_qp[i];
> -		/*
> -		 * Range BPG Offset contains two's-complement signed values that fill
> -		 * 8 bits, yet the registers and DCS PPS field are only 6 bits wide.
> -		 */
> -		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & DSC_RANGE_BPG_OFFSET_MASK;
> +	/* handle only bpp = bpc = 8, pre-SCR panels */
> +	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> +	if (ret) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> +		return ret;
>   	}
>   
> -	dsc->initial_offset = 6144;		/* Not bpp 12 */
> -	if (bpp != 8)
> -		dsc->initial_offset = 2048;	/* bpp = 12 */
> -
> -	if (dsc->bits_per_component <= 10)
> -		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> -	else
> -		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
> -
> -	dsc->initial_xmit_delay = 512;
>   	dsc->initial_scale_value = 32;
> -	dsc->first_line_bpg_offset = 12;
>   	dsc->line_buf_depth = dsc->bits_per_component + 1;
>   
> -	/* bpc 8 */
> -	dsc->flatness_min_qp = 3;
> -	dsc->flatness_max_qp = 12;
> -	dsc->rc_quant_incr_limit0 = 11;
> -	dsc->rc_quant_incr_limit1 = 11;
> -
>   	return drm_dsc_compute_rc_parameters(dsc);
>   }
>   
> 

-- 
With best wishes
Dmitry

