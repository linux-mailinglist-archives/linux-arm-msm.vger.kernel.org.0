Return-Path: <linux-arm-msm+bounces-86535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C5CCDBD74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E08473013E82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B968B334C36;
	Wed, 24 Dec 2025 09:43:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057827B359
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569433; cv=none; b=bYU97jGD9BbZWUmNdHieFpnmAG1G+LE/oVtbrLAluHZrzU/vgRrJMNn1JpzLsMI2CqKkRFIFeC8CRAzlM3wefj4pDGLkEKqfV/QpoTY2r2GW0py9MYUHbBRzYl07P5jloBJCzLh4DoCU1lVWC2zoLUt3U4tZjThqs8KnNwR+gMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569433; c=relaxed/simple;
	bh=cqrRVlT5zEkk7a+GLMF4w0WtQOwiW5t7Wwt+reF+RlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcxg7bLqVFCDFBL5+PWLHFQcM0KYe2fuLbex907kr+YJ9iquPcbr5pRP0Ro3Xv4MGH4qtT0mdVjMNKMrILwQSOsT+oej+LNUvWvAzQQ8RvY4+fdwq9WSIyjQlSnzJv0sJe1AkY6EtYb4CW5U4sWb0XT3CdKgd7v4UARa4v8m5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0537A1F6CD;
	Wed, 24 Dec 2025 10:43:42 +0100 (CET)
Date: Wed, 24 Dec 2025 10:43:41 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 07/11] drm/panel: Add panel driver for Samsung
 SOFEF03-M DDIC
Message-ID: <aUu1N2GTzCc3wOcH@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-7-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-7-82a87465d163@somainline.org>

On 2025-12-22 00:32:13, Marijn Suijten wrote:
...
> +static int samsung_sofef03_m_probe(struct mipi_dsi_device *dsi)
> +{
...
> +	ctx->vddio = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(ctx->vddio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->vddio),
> +				     "Failed to get vddio regulator\n");
> +
> +	ctx->vci = devm_regulator_get(dev, "vci");
> +	if (IS_ERR(ctx->vci))
> +		return dev_err_probe(dev, PTR_ERR(ctx->vci),
> +				     "Failed to get vci regulator\n");
> +
 
In case someone wonders why this is inconsistently *NOT* using regulator_bulk
while the other patches are; this was a last-minute clean-up whose fixup! commit
I seem to have lost in a separate branch.  This will be incorporated in v3
together with the whitespace fix in the comment.

- Marijn

