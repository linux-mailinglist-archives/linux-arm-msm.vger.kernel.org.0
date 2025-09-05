Return-Path: <linux-arm-msm+bounces-72224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DCB4513F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A285E3B8793
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 08:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C248C2FD7D5;
	Fri,  5 Sep 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPwf3TVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C212797A3;
	Fri,  5 Sep 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060625; cv=none; b=Q1qBiMU3QgR5p0jon3ffZEzd0qOognaRgz7u/Mq+aose2CwUFeaSFCA66mDl4b3xVJVlv6j99fhkyxTpko5DRrtaQORO3Qa961EF0viX1BZqWpNTTeSVWKR9/b+eaUc6CyHGGBeNsNXVrlS60xX7ln+GFVHAFFXG+lPD+5vB9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060625; c=relaxed/simple;
	bh=6PHoWwsgos2vO1ljkGufasMWk4E1NTgVcy0xZdrHxho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkARKMDIpWuO97OKVv6hI+AGGKpIv8RMrr22DETfMrPFOyBR1vPDeaDhuweRSjk0jVic5xhZOk+SQHfL+qamlH2X4QKnozbGeDT1Y7Q4bWlDpaHQL+oJ/uZC4s6tm+6lE/un2+h9ggpb+JMC3iKbBTHYuyx4+YRmN4R+aM0vp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPwf3TVv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980AFC4CEF1;
	Fri,  5 Sep 2025 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060625;
	bh=6PHoWwsgos2vO1ljkGufasMWk4E1NTgVcy0xZdrHxho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPwf3TVv6ZgYxi/+rQ69QAef1ym8eeJMKwrgaFGe5jM0qbD+6evn2aNDD0daDA9ky
	 CGXziOS382j0yQSBYl39u0dMZYaF8vpf5QxFKRuAdX293jYpzhyjoMsB25IK+/LYzJ
	 bat8NHSd+9RuSMpzy0fPiJl+yZXwlXRD8E4kMNtkhiyQBkTlQLu3Kho1EE6BSMM1My
	 ijHcsTiviOCJl5BfoZHf3vmZEbtrke84+lMZowtuEWvpaFEq5Oc0gtTVZUGnQS61Bk
	 cyAUQo3LBOOZI2R5WF6d8OSS0WrFep3NFBgZmVF1b5oKlG3Yi2JmUtELRSSXsectoL
	 aSRVFO6gIIlfA==
Date: Fri, 5 Sep 2025 10:23:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: edp: Add Glymur platform support
Message-ID: <20250905-cuddly-viridian-coucal-134f8a@kuoka>
References: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
 <20250904-phy-qcom-edp-add-glymur-support-v1-3-e83c6b9a145b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904-phy-qcom-edp-add-glymur-support-v1-3-e83c6b9a145b@linaro.org>

On Thu, Sep 04, 2025 at 09:55:53AM +0300, Abel Vesa wrote:
>  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>  	.aux_cfg = edp_phy_aux_cfg_v4,
> +	.aux_cfg_size = ARRAY_SIZE(edp_phy_aux_cfg_v4),
> +	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
>  	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>  	.ver_ops = &qcom_edp_phy_ops_v6,
>  };
>  
> +static struct qcom_edp_phy_cfg glymur_phy_cfg = {

g<x

> +	.aux_cfg = edp_phy_aux_cfg_v8,
> +	.aux_cfg_size = ARRAY_SIZE(edp_phy_aux_cfg_v8),
> +	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
> +	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
> +	.ver_ops = &qcom_edp_phy_ops_v8,
> +};
> +
>  static int qcom_edp_phy_power_on(struct phy *phy)
>  {
>  	const struct qcom_edp *edp = phy_get_drvdata(phy);
> @@ -1141,6 +1365,7 @@ static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
>  	{ .compatible = "qcom,sc8280xp-edp-phy", .data = &sc8280xp_edp_phy_cfg, },
>  	{ .compatible = "qcom,x1e80100-dp-phy", .data = &x1e80100_phy_cfg, },
> +	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },

Don't stuff things to the end of lists.

Best regards,
Krzysztof


