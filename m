Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB01668A78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 04:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjAMD4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 22:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbjAMD4j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 22:56:39 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A11252
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:56:38 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id s5so13762496qtx.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WEXvS80oIrRB2IaO18xxTkaLF1VC2xSDduqcFWFnr6g=;
        b=l730iHY6KjaoqGu8oQQorZL++1Hp+4YBP0evjx8RucytNZBlcpqY4DmDuy8VJ2QV7j
         EmdtbrpJFxzOD+ThV5IiIKOTE6ZwjFMX8EjgT0tRUh/e6sXbMkQvS/J2Ix8gZYgKZ8bR
         0z3reIQsmbxoX0ia7iT1hqfHxAcbfTpyklhPg1qHmcrk6cMIWdg0Da9w4gHnYjKq4N74
         5s/VU8N/oIvF8gP0udvVyh7nWgyVHrSfsvZ77u0P9t1rEcbYAvASw3iIMBu/obrxWhXB
         0qwqFfBdb8QQhAvRK18sQN14048OJadbuSTlnW62VPQ2iMZP6TLmTETj+Fpnr7xsBM54
         z4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEXvS80oIrRB2IaO18xxTkaLF1VC2xSDduqcFWFnr6g=;
        b=p3tdZqacw4Sqsws3NfdKBR8Dq+BTBYjJU0+t7S0QtawipYmdEtby4Aq73HjDD8IMt2
         wSf6RWGvcymi/jzWkTuaS2qwk1zFEwvV4uKP6q/lw47N1EH3Ui9I7bocWHuo3+zbeyN1
         kp+tePQGpKQKcQaOjne/fYfnwCo4iwYkOp9wst4FtD9zlm6Hp00u1jMKZuQ5glCcOupp
         z5LhuQ4Id2PJ+dD9XUxGYU+v7+y8ve5O2kRyW6fzclqo+h3OR7Ns14MGMfiV6R1Bj1E1
         bCGODSMCKchYojl8OZOowNvpvhv25/TDE89NrLYbGJ2MN3X+NuAbotfo30vUmOZLbJd6
         X7JA==
X-Gm-Message-State: AFqh2kovID0SJ3aPu03RXpEJ9nNxlqsNOsQBxymNHzoSKYrWfWkEgjIV
        o4jll2Mr4QYpLlYK8zql4k0=
X-Google-Smtp-Source: AMrXdXsY3WcecR4+LjGjEdAs2Mn/ee4WgTRpvntw6Ar5AnZb7ungLJZK8tUMNpLSadjlGWm4K+dtiA==
X-Received: by 2002:ac8:710d:0:b0:3ad:ef42:fea7 with SMTP id z13-20020ac8710d000000b003adef42fea7mr21398207qto.1.1673582197127;
        Thu, 12 Jan 2023 19:56:37 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::e680])
        by smtp.gmail.com with ESMTPSA id g19-20020a05620a40d300b006cec8001bf4sm12232045qko.26.2023.01.12.19.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 19:56:36 -0800 (PST)
Date:   Thu, 12 Jan 2023 22:56:34 -0500
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Robert Foss <rfoss@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: add hw revision 410
Message-ID: <Y8DWcoDMviTK89pa@radian>
References: <20230113015420.116071-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113015420.116071-1-mailingradian@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 12, 2023 at 08:54:20PM -0500, Richard Acayan wrote:
> The Snapdragon 670 uses similar clocks (with one frequency added) to the
> Snapdragon 845 but reports DPU revision 4.1.0. Add support for this DPU
> with configuration from the Pixel 3a downstream kernel.
>
> Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0f3da480b066..6a077a9ef7a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -504,6 +504,25 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>  	},
>  };
>  
> +static const struct dpu_mdp_cfg sdm670_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x45C,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.highest_bank_bit = 0x1,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2B4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2BC, .bit_off = 8},
> +	},
> +};
> +
>  static const struct dpu_mdp_cfg sdm845_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -1154,6 +1173,11 @@ static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK("10", 3);
>  static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>  
> +static const struct dpu_sspp_sub_blks sdm670_vig_sblk_0 =
> +				_VIG_SBLK("0", 4, DPU_SSPP_SCALER_QSEED3);
> +static const struct dpu_sspp_sub_blks sdm670_vig_sblk_1 =
> +				_VIG_SBLK("1", 5, DPU_SSPP_SCALER_QSEED3);
> +
>  #define SSPP_BLK(_name, _id, _base, _features, \
>  		_sblk, _xinid, _type, _clkctrl) \
>  	{ \
> @@ -1185,6 +1209,19 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>  		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>  
> +static const struct dpu_sspp_cfg sdm670_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
> +		sdm670_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
> +		sdm670_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
> +		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> +		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
> +};
> +
>  static const struct dpu_sspp_cfg sdm845_sspp[] = {
>  	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
>  		sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> @@ -1832,6 +1869,11 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>  	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>  };
>  
> +static struct dpu_dsc_cfg sdm670_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400),
I remember changing this, but it seems the compiler error is still here. Sorry
for that.

> +};
> +
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> @@ -2533,6 +2575,30 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
>  	.mdss_irqs = IRQ_SM8250_MASK,
>  };
>  
> +static const struct dpu_mdss_cfg sdm670_dpu_cfg = {
> +	.caps = &sdm845_dpu_caps,
> +	.mdp_count = ARRAY_SIZE(sdm670_mdp),
> +	.mdp = sdm670_mdp,
> +	.ctl_count = ARRAY_SIZE(sdm845_ctl),
> +	.ctl = sdm845_ctl,
> +	.sspp_count = ARRAY_SIZE(sdm670_sspp),
> +	.sspp = sdm670_sspp,
> +	.mixer_count = ARRAY_SIZE(sdm845_lm),
> +	.mixer = sdm845_lm,
> +	.pingpong_count = ARRAY_SIZE(sdm845_pp),
> +	.pingpong = sdm845_pp,
> +	.dsc_count = ARRAY_SIZE(sdm670_dsc),
> +	.dsc = sdm670_dsc,
> +	.intf_count = ARRAY_SIZE(sdm845_intf),
> +	.intf = sdm845_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sdm845_regdma,
> +	.perf = &sdm845_perf_data,
> +	.mdss_irqs = IRQ_SDM845_MASK,
> +};
> +
>  static const struct dpu_mdss_cfg sdm845_dpu_cfg = {
>  	.caps = &sdm845_dpu_caps,
>  	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> @@ -2840,6 +2906,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>  	{ .hw_rev = DPU_HW_VER_301, .dpu_cfg = &msm8998_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_400, .dpu_cfg = &sdm845_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_401, .dpu_cfg = &sdm845_dpu_cfg},
> +	{ .hw_rev = DPU_HW_VER_410, .dpu_cfg = &sdm670_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_500, .dpu_cfg = &sm8150_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_501, .dpu_cfg = &sm8150_dpu_cfg},
>  	{ .hw_rev = DPU_HW_VER_510, .dpu_cfg = &sc8180x_dpu_cfg},
> -- 
> 2.39.0
>
