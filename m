Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7EC774BB36
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjGHB5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGHB5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:57:37 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3163E4D
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:57:35 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so41110421fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688781454; x=1691373454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wwkh8pKXmB000uFIXf7QzEd4TnjTv7TK1I8MwngSb1U=;
        b=cB0DDfVlNx81Qa+CdHuaDXkowhn0UIBmUijEi6/MK4yPEa5LPrIl5HUkqW9yOfi+Mj
         doGsz/KGFFXTl0+Ir/tAb8LAqdtRRZElhL4SOU/DiwFTJnd+1rwJrBJfQi3r4h8IkZFu
         b4yD7Uy69SEFgGgvHrzAt542Py0zA29Z2csDRAexDnt/4HncnOS1Q6ChYc0kxyoDddgS
         sVES9b9y1CFvAKw9wfIKtg3XD+welY86e7QwXV04tby9+P4vdcgWxuCrkl7DWxfU7HtS
         lazyUTHet/c79kSl5R7HDO2wt/FlfM68fEOeovmZ4M5R3tWdLXXmY3RNOF6j3GmZnghL
         3/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688781454; x=1691373454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwkh8pKXmB000uFIXf7QzEd4TnjTv7TK1I8MwngSb1U=;
        b=GxggbQxN7s+hj//e7Z3gNmbm0UilTokEVuaU+SAzHaG/kK72Roa40Sm1+8F92GQWCy
         cqp0H80ReZ4/vnsW590/PNhbZseEN//tQgjEjFd9tr+NVaB+PzEWmZgyGdRlA1lknsBh
         B/DnbM/ffpknnm0Fc8V9z2aTR8+iEZ6VITYEbHdVhecjC4ZSsHFsYFkt7zuJaeoay3tc
         BuKth2UCzN5vMK3isLOhXI391UE7B6A8Pp5+hxOqEc4wxphfKFepoEIpEsJq8cTI8Lj8
         b12wQIgRBgVP9UJCVLwKw5zMyN6jmQEFHgQiWqVjXNIZkAqkbOfcnB1NRAVcENPMvUIT
         uI5w==
X-Gm-Message-State: ABy/qLbEF2MDZM75LwqomdEAgKIuH2HzZGT0Ei4/M0aZTRJQRWcvdyqG
        iiEboJPm3rT5j14uTX+7wp7iDQ==
X-Google-Smtp-Source: APBJJlFDVaBc1zEui+gCBg4MQrnljMQkMGLMJ5lft3Q2Ug4r1ftxh54PBw/phWz3nZmMH8jMFkZIpQ==
X-Received: by 2002:a2e:8295:0:b0:2b6:9ab8:9031 with SMTP id y21-20020a2e8295000000b002b69ab89031mr2673029ljg.16.1688781454254;
        Fri, 07 Jul 2023 18:57:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w4-20020a2e9bc4000000b002b475f087desm1022235ljj.56.2023.07.07.18.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 18:57:33 -0700 (PDT)
Message-ID: <014ed874-6481-ba22-c3d7-4c2b082e515d@linaro.org>
Date:   Sat, 8 Jul 2023 04:57:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 6/6] drm/msm/dpu: Update dev core dump to dump
 registers of sub-blocks
Content-Language: en-GB
To:     Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com
References: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
 <20230622-devcoredump_patch-v5-6-67e8b66c4723@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v5-6-67e8b66c4723@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 04:24, Ryan McCann wrote:
> Currently, the device core dump mechanism does not dump registers of
> sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
> dpu_kms_mdp_snapshot function to account for sub-blocks.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 66 +++++++++++++++++++++++++++------
>   1 file changed, 54 insertions(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 7a2787279ba0..f7199a5c45ab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -890,6 +890,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   	int i;
>   	struct dpu_kms *dpu_kms;
>   	const struct dpu_mdss_cfg *cat;
> +	void __iomem *base;
>   
>   	dpu_kms = to_dpu_kms(kms);
>   
> @@ -903,9 +904,16 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   				dpu_kms->mmio + cat->ctl[i].base, cat->ctl[i].name);
>   
>   	/* dump DSPP sub-blocks HW regs info */
> -	for (i = 0; i < cat->dspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
> -				dpu_kms->mmio + cat->dspp[i].base, cat->dspp[i].name);
> +	for (i = 0; i < cat->dspp_count; i++) {
> +		base = dpu_kms->mmio + cat->dspp[i].base;
> +		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, base, cat->dspp[i].name);
> +
> +		if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->dspp[i].sblk->pcc.len,
> +						    base + cat->dspp[i].sblk->pcc.base, "%s_%s",
> +						    cat->dspp[i].name,
> +						    cat->dspp[i].sblk->pcc.name);

Nit (no need to resend to correct this): the "%s_%s" logically fits the 
next line, as it it related to the names rather than base address.

> +	}
>   
>   	/* dump INTF sub-blocks HW regs info */
>   	for (i = 0; i < cat->intf_count; i++)

-- 
With best wishes
Dmitry

