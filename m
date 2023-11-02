Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0CA7DF3E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Nov 2023 14:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjKBNf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Nov 2023 09:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjKBNf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Nov 2023 09:35:29 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF60134
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Nov 2023 06:35:23 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99de884ad25so151798966b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Nov 2023 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698932122; x=1699536922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7SwsGibKGbdJjepchNvpsbDsuyTIGkbVWXHyca2x+c=;
        b=Z3/21Sl0Bavs/T2MVRALpqsG+uU+hpyDkN0wrDweyUQTzyCTLY95fleXBGs8DYMkVf
         EkZCNm/uYtOIRQcUix1I/XJLD7IHlA3sC0at4wm2/XLY5Sbg39ChLXoU1pVbPhalMWrv
         Ad0fnTsR/cWfWgW9d8fTv6VRRCl1yq+D78yevKdL+eh8htDzLe+LoAb5UbnrJqjniVwt
         N3/lQomhELmvdSjRxd9VPr60G8GDl0gv9+Y/Urv70YyU2rZUNpTnWCpjPOP9Ury+GPGG
         sQCBUmCRj2da40Al95XjPw29VmIvA56sDIr7TNs8aHd2+hlu8QjXZjU2jPRIjm6LpjdI
         Ma4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932122; x=1699536922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F7SwsGibKGbdJjepchNvpsbDsuyTIGkbVWXHyca2x+c=;
        b=UCkla792hy0AcpMfgfSeC/n1oBe13VzTW9cF1QlPepNyLjtJZMDD6SacyMTfghNcns
         UtXiVV60Bf4oTacBdvRoYHyt2D1CqcRPw2VSHWZsEi6W8hB7Fo0O7Ldz8k5B3CliFd5q
         K+5s11J2MhNHF+JEzHBe4A0Nia1LW3hxOP0q//+TPaGxq1Fp+j2rcxjvYDGcWVqSq+Ag
         bp4T/JZ45n/r44nAh6yTGuL/UXAvQyaW3c5fe0NlBOlZ/4DrOrd6GFG+qSjhjDEY/Sp4
         AoV61N0LfXoh+l1+irrRDpEg6c2pLchD0GAcgwyJ//NEaSBz/Da78lxEIvL9KI/exPKi
         Suaw==
X-Gm-Message-State: AOJu0YxF5TvG0iYB2cbd5wGYQ8oMlx5eWkbYq1DPFfkyc6yp1H4jucSX
        5wfPNAk7W8TTkvQHVL6engOCXg==
X-Google-Smtp-Source: AGHT+IEfWKTbsjiDpeENInLClErrNLufGM+69Kg8SgMHgqzumpXE9PMLGdB9bLQUgkwk5pejCYSWfA==
X-Received: by 2002:a17:907:318d:b0:9c5:6cf5:448a with SMTP id xe13-20020a170907318d00b009c56cf5448amr5406507ejb.44.1698932121645;
        Thu, 02 Nov 2023 06:35:21 -0700 (PDT)
Received: from [192.168.1.118] (abyj199.neoplus.adsl.tpnet.pl. [83.9.29.199])
        by smtp.gmail.com with ESMTPSA id rp18-20020a170906d97200b00985ed2f1584sm1138922ejb.187.2023.11.02.06.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 06:35:21 -0700 (PDT)
Message-ID: <9f088cfc-7b01-524c-1900-5acee6919ec4@linaro.org>
Date:   Thu, 2 Nov 2023 14:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 5/6] media: qcom: camss: Add sc8280xp support
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
 <20231102-b4-camss-sc8280xp-v1-5-9996f4bcb8f4@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231102-b4-camss-sc8280xp-v1-5-9996f4bcb8f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 02/11/2023 12:41, Bryan O'Donoghue wrote:
> Add in functional logic throughout the code to support the sc8280xp.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 23 +++++++++++++++++---
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |  1 +
>   drivers/media/platform/qcom/camss/camss-vfe.c      | 25 +++++++++++++++++-----
>   drivers/media/platform/qcom/camss/camss-video.c    |  1 +
>   4 files changed, 42 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 2eb3531ffd00b..2810d0fa06c13 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -513,6 +513,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   		r = &lane_regs_sm8250[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
>   		break;
> +	case CAMSS_8280XP:
> +		r = &lane_regs_sc8280xp[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sc8280xp[0]);
> +		break;
>   	default:
>   		WARN(1, "unknown cspi version\n");
>   		return;
> @@ -548,13 +552,26 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   	return lane_mask;
>   }
>   
> +static bool csiphy_is_gen2(u32 version)
> +{
> +	bool ret = false;
delete

> +
> +	switch (version) {
> +	case CAMSS_845:
> +	case CAMSS_8250:
> +	case CAMSS_8280XP:
> +		ret = true; > +		break;
return true

> +	}
> +
> +	return ret;
return false

> +}
> +
>   static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   				struct csiphy_config *cfg,
>   				s64 link_freq, u8 lane_mask)
>   {
>   	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
> -	bool is_gen2 = (csiphy->camss->res->version == CAMSS_845 ||
> -			csiphy->camss->res->version == CAMSS_8250);
>   	u8 settle_cnt;
>   	u8 val;
>   	int i;
> @@ -576,7 +593,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	val = 0x00;
>   	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
>   
> -	if (is_gen2)
> +	if (csiphy_is_gen2(csiphy->camss->res->version))
>   		csiphy_gen2_config_lanes(csiphy, settle_cnt);
>   	else
>   		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index edd573606a6ae..8241acf789865 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -579,6 +579,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   		break;
>   	case CAMSS_845:
>   	case CAMSS_8250:
> +	case CAMSS_8280XP:
>   		csiphy->formats = csiphy_formats_sdm845;
>   		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
>   		break;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 123e5ead7602d..21812d40716f4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -225,6 +225,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_660:
>   	case CAMSS_845:
>   	case CAMSS_8250:
> +	case CAMSS_8280XP:
>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -1522,6 +1523,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>   			break;
>   		case CAMSS_845:
>   		case CAMSS_8250:
> +		case CAMSS_8280XP:
>   			l->formats = formats_rdi_845;
>   			l->nformats = ARRAY_SIZE(formats_rdi_845);
>   			break;
> @@ -1600,6 +1602,23 @@ static const struct media_entity_operations vfe_media_ops = {
>   	.link_validate = v4l2_subdev_link_validate,
>   };
>   
> +static int vfe_bpl_align(struct vfe_device *vfe)
> +{
> +	int ret = 8;
return the value directly

> +
> +	switch (vfe->camss->res->version) {
> +	case CAMSS_845:
> +	case CAMSS_8250:
> +	case CAMSS_8280XP:
> +		ret = 16;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
Konrad

