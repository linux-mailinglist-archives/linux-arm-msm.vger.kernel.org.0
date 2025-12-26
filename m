Return-Path: <linux-arm-msm+bounces-86651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFBCDEC18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 15:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BE063000B26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 14:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A107D2264AB;
	Fri, 26 Dec 2025 14:16:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FE1B6527;
	Fri, 26 Dec 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758593; cv=none; b=s3o2ma2dZvug0I5KyLxiHtsJLSMqng7+UZP88QoilSEDECp4yhxv9APQ64ClQaNqY+moRG/jMG+U42Gd2v1agRahwpRfqjRnxb1CFnahmgm2PJBpQYssKUe4Txp1IPr3ZFmq/2e9jTW4HDz1mHF5U+7TugzhKTm8+eGgYKdpO9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758593; c=relaxed/simple;
	bh=qpKoDBbx5oy5dKdvKC0dGmgSorgea4gG16c9e42P1ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+xSHrJtoFcsRBLPBpG45f2FEoNIgm+06rsWdKY6MytsK0YQ86PP0yrft96bbERSIdZijFM6NUVJGL3ZDYsi4yjgW4MciSij/rfIbDCw8qsm9/WZDZXsuq2ZtW7KDW+tyi027ZqE/8WI9E1VhysBCswWlRxk63CIkv4nRC36eeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 579113EA9E;
	Fri, 26 Dec 2025 15:16:29 +0100 (CET)
Date: Fri, 26 Dec 2025 15:16:28 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <aU6XXi2HmgjZY8CY@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
 <CAD++jL=X1hX6kmodcOC3+x-w6t+Vg6XTaCMab-Dn=vHAeD82Gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jL=X1hX6kmodcOC3+x-w6t+Vg6XTaCMab-Dn=vHAeD82Gw@mail.gmail.com>

On 2025-12-26 14:21:37, Linus Walleij wrote:
...
> Only nitpicks follow:
> 
> > +       if (ctx->panel_type == PANEL_TYPE_TC01 ||
> > +           ctx->panel_type == PANEL_TYPE_UT01 ||
> > +           ctx->panel_type == PANEL_TYPE_UT04) {
> > +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> 
> The sofef00 driver tell us exactly what this sequence is:
> 
> #define sofef00_test_key_on_lvl2(ctx) \
>         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
> #define sofef00_test_key_off_lvl2(ctx) \
>         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
> 
> I would just rename these two to sofef01_test_key_on/off_lvl2()
> and use the same helpers in this driver to follow the sofef00 pattern.

Right, yes.  I think I already brought this up in V1, that some existing
Samsung drivers call this (the 0xf0 part) the MCS PASSWORD, others call it the
LEVEL_2_KEY or USER_KEY or ACCESSPROT.

I'm curious (though should probably look up the patch history) where these names
come from, which of these names match the sofef01/03/souxp00 DDICs provided
here, and what they're supposed to mean (MCS: Magic Command Sequence?).

Then there are possibly a lot more constants we can glean from other drivers,
though again without confirmation that it's identical on this DDIC.

- Marijn

