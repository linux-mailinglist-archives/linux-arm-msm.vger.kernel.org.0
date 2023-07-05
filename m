Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43FD4748ED0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 22:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbjGEUWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 16:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbjGEUWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 16:22:45 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B543A173F
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 13:22:43 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6f9edac8dso33023251fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688588562; x=1691180562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5iZ905fjA6D/RAQ/gXeEaWqQbihFHI1SgBsGMwVsQM=;
        b=LelmaoSKg0/bHeNHGzz+dNu9LzyFZD2EtFZhv5XZsuaOdemgPb2lmhJifBeZKSbJYZ
         ybK3I1FYEju/HzOnCOcEZaG+tBO2m5YzyLr6VEnY2f3WAOfvoNzMIzrVXb34xKMMfXKf
         78qETYq2pUA8eLiJ+C7EudLzXiWHpN+UIwrRN8RP2xcDyzEPLhpn0bZkBFb0hokWzQUa
         RGboRYtW2C065onQs33AvU4lj/SEuzsxdBOvOrWurgSAagF3E6HP9hSrZmlTcyzu4ARF
         F2V51DNXK1kS7/xnPuAZdMIdePvnXZvjI3QkVU3dbxLvROC38Qf4Vtd3gB8b/q216Gug
         9wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688588562; x=1691180562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5iZ905fjA6D/RAQ/gXeEaWqQbihFHI1SgBsGMwVsQM=;
        b=Kx+ZKO7xx90cmlDMvsvnwGwi1J5dPdfRx9DnlSfV1uc9Vo0bCLa3sAGMO7nb+tD/D5
         hGUcLv+RTJ/0tjuDKkoq8UebROUhhaauPZmGf5mN4jy/52zzp24RBA/mZBwJ5wsnF01V
         CeX6/Q1EY8GA6vFMwla/orqIdst+2iD2Akc7xULQuI8zbdcDwM0t4fPrzHQmKzARNV95
         5f8OpxljoM75yZskBSzRII6M0k7EQR6RwlrroInytOWTMZIONmWdtpuSZGeJQXUeSbfw
         WqjeFCIInCpwbRUs9qp6M48Vg0AruQ6N5bzPVRVW9qeuxZQkWmgHonAax+fWmuf/uiL2
         mr0g==
X-Gm-Message-State: ABy/qLaDIMMywDfpnmP8nGsBMrgoxsZMC6AtB+nEITEUZMTJSA6G0lod
        l5Rloc2NVzo2fCeg4l0bNCNnTDDCKhp48VRe3EE=
X-Google-Smtp-Source: APBJJlHKAqREBtzHkxQRp98+f2xj3PZy8rraOQUCsSlLvFiSn+JvY44XP0S2NaqAuwHIuMIU+qHneQ==
X-Received: by 2002:a2e:2c16:0:b0:2b6:e17c:151e with SMTP id s22-20020a2e2c16000000b002b6e17c151emr8460063ljs.48.1688588561772;
        Wed, 05 Jul 2023 13:22:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w15-20020a05651c102f00b002b6ef2fca66sm1355121ljm.41.2023.07.05.13.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 13:22:41 -0700 (PDT)
Message-ID: <cebe822f-2c00-4826-a48e-4344379b3e65@linaro.org>
Date:   Wed, 5 Jul 2023 23:22:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: Update dev core dump to dump
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
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-5-9e90a87d393f@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v2-5-9e90a87d393f@quicinc.com>
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

On 05/07/2023 22:30, Ryan McCann wrote:
> Currently, the device core dump mechanism does not dump registers of
> sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
> dpu_kms_mdp_snapshot function to account for sub-blocks.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 106 ++++++++++++++++++++++++--------
>   1 file changed, 82 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..c83f5d79e5c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -890,62 +890,120 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   	int i;
>   	struct dpu_kms *dpu_kms;
>   	const struct dpu_mdss_cfg *cat;
> +	void __iomem *mmio;
> +	u32 base;
>   
>   	dpu_kms = to_dpu_kms(kms);
>   
>   	cat = dpu_kms->catalog;
> +	mmio = dpu_kms->mmio;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
>   	/* dump CTL sub-blocks HW regs info */
>   	for (i = 0; i < cat->ctl_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
> -				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, mmio + cat->ctl[i].base,
> +					    "%s", cat->ctl[i].name);

This is not relevant to sub-blocks. If you wish to refactor the main 
block printing, please split it to a separate commit.

Also, please note that `msm_disp_snapshot_add_block(...., "%s", 
block->name)` is redundant. We do not expect formatting characters in 
block names. So, "%s" can be dropped.

>   
>   	/* dump DSPP sub-blocks HW regs info */
> -	for (i = 0; i < cat->dspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
> -				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
> +	for (i = 0; i < cat->dspp_count; i++) {
> +		base = cat->dspp[i].base;
> +		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, mmio + base, "%s",
> +					    cat->dspp[i].name);
> +
> +		if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->dspp[i].sblk->pcc.len,
> +						    mmio + base + cat->dspp[i].sblk->pcc.base,
> +						    "%s_%s", cat->dspp[i].name,
> +						    cat->dspp[i].sblk->pcc.name);
> +	}
> +
>   
>   	/* dump INTF sub-blocks HW regs info */
>   	for (i = 0; i < cat->intf_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
> -				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, mmio + cat->intf[i].base,
> +					    "%s", cat->intf[i].name);
>   
>   	/* dump PP sub-blocks HW regs info */
> -	for (i = 0; i < cat->pingpong_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
> -				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
> +	for (i = 0; i < cat->pingpong_count; i++) {
> +		base = cat->pingpong[i].base;
> +		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len, mmio + base, "%s",
> +					    cat->pingpong[i].name);
> +
> +		/* TE2 block has length of 0, so will not print it */
> +
> +		if (cat->pingpong[i].sblk && cat->pingpong[i].sblk->dither.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].sblk->dither.len,
> +						    mmio + base + cat->pingpong[i].sblk->dither.base,
> +						    "%s_%s", cat->pingpong[i].name,
> +						    cat->pingpong[i].sblk->dither.name);
> +	}
>   
>   	/* dump SSPP sub-blocks HW regs info */
> -	for (i = 0; i < cat->sspp_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
> -				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
> +	for (i = 0; i < cat->sspp_count; i++) {
> +		base = cat->sspp[i].base;
> +		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, mmio + cat->sspp[i].base,
> +					    "%s", cat->sspp[i].name);
> +
> +		if (cat->sspp[i].sblk && cat->sspp[i].sblk->scaler_blk.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->scaler_blk.len,
> +						    mmio + base + cat->sspp[i].sblk->scaler_blk.base,
> +						    "%s_%s", cat->sspp[i].name,
> +						    cat->sspp[i].sblk->scaler_blk.name);
> +
> +		if (cat->sspp[i].sblk && cat->sspp[i].sblk->csc_blk.len > 0)
> +			msm_disp_snapshot_add_block(disp_state, cat->sspp[i].sblk->csc_blk.len,
> +						    mmio + base + cat->sspp[i].sblk->csc_blk.base,
> +						    "%s_%s", cat->sspp[i].name,
> +						    cat->sspp[i].sblk->csc_blk.name);
> +	}
>   
>   	/* dump LM sub-blocks HW regs info */
>   	for (i = 0; i < cat->mixer_count; i++)
>   		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
> -				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
> +					    mmio + cat->mixer[i].base,
> +					    "%s", cat->mixer[i].name);
>   
>   	/* dump WB sub-blocks HW regs info */
>   	for (i = 0; i < cat->wb_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
> -				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
> +		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, mmio + cat->wb[i].base,
> +					    "%s", cat->wb[i].name);
>   
>   	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
> -		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
> -				dpu_kms->mmio + cat->mdp[0].base, "top");
> +		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0, mmio + cat->mdp[0].base,
> +					    "top");
>   		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,
> -				dpu_kms->mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END, "top_2");
> +					    mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END,
> +					    "top_2");
>   	} else {
> -		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
> -				dpu_kms->mmio + cat->mdp[0].base, "top");
> +		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len, mmio + cat->mdp[0].base,
> +					    "top");
>   	}
>   
>   	/* dump DSC sub-blocks HW regs info */
> -	for (i = 0; i < cat->dsc_count; i++)
> -		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> -				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
> +	for (i = 0; i < cat->dsc_count; i++) {
> +		base = cat->dsc[i].base;
> +
> +		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
> +			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
> +			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
> +
> +			/* For now, pass in a length of 0 because the DSC_BLK register space
> +			 * overlaps with the sblks' register space.
> +			 *
> +			 * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW catalog where
> +			 * applicable.
> +			 */
> +			msm_disp_snapshot_add_block(disp_state, 0, mmio + base, "%s", cat->dsc[i].name);
> +			msm_disp_snapshot_add_block(disp_state, enc.len, mmio + base + enc.base,
> +						    "%s_%s", cat->dsc[i].name, enc.name);
> +			msm_disp_snapshot_add_block(disp_state, ctl.len, mmio + base + ctl.base,
> +						    "%s_%s", cat->dsc[i].name, ctl.name);
> +		} else {
> +			msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, mmio + base, "%s",
> +						    cat->dsc[i].name);
> +		}
> +	}
>   
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
> 

-- 
With best wishes
Dmitry

