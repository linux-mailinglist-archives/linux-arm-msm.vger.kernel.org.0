Return-Path: <linux-arm-msm+bounces-86652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C5CDEC31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 15:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C329C3000B06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 14:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281452253B0;
	Fri, 26 Dec 2025 14:23:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8071B6527
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758990; cv=none; b=OzU7qk7L5vcYeG+sNxF5hx03MyTckfrVtwKImKH7bdH6AnTaSzA37ttPDFxiJdCJeurAhMCSqdM82OH8YMxkkCQwfjX760MuaeGLLO/VTg3WuNWS/4T6LIQtchgoeidgt8OWIn/A91DjNUfPJmlnnbOXvtCcpUVN0l6FMJZgCaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758990; c=relaxed/simple;
	bh=gdT1EMVMcuvL149gCMzXwYKUxlWLS/RUJKDAfVcf2m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azGiz+IdThgBnJzdG+Nnavi/DK1/DH+XI1MvwnufyOtC1c8GkHzAd3edLvIpZwIKjWxTh+YMK2lPgIm2B2TLWGZLKfW5X2xPOsXmu+lJEgKRXYp/Euqb6/W2kXr5HS6bUNQB8vkY2L5FFntQBgJRBeCTymZgR2M9x6R+k9O0ry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1C0C23EA6F;
	Fri, 26 Dec 2025 15:23:04 +0100 (CET)
Date: Fri, 26 Dec 2025 15:23:02 +0100
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
	Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <aU6Z6pqinEYgSGd1@SoMainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
 <CAD++jL=X1hX6kmodcOC3+x-w6t+Vg6XTaCMab-Dn=vHAeD82Gw@mail.gmail.com>
 <aU6XXi2HmgjZY8CY@SoMainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aU6XXi2HmgjZY8CY@SoMainline.org>

On 2025-12-26 15:16:30, Marijn Suijten wrote:
> On 2025-12-26 14:21:37, Linus Walleij wrote:
> ...
> > Only nitpicks follow:
> > 
> > > +       if (ctx->panel_type == PANEL_TYPE_TC01 ||
> > > +           ctx->panel_type == PANEL_TYPE_UT01 ||
> > > +           ctx->panel_type == PANEL_TYPE_UT04) {
> > > +               mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> > 
> > The sofef00 driver tell us exactly what this sequence is:
> > 
> > #define sofef00_test_key_on_lvl2(ctx) \
> >         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
> > #define sofef00_test_key_off_lvl2(ctx) \
> >         mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
> > 
> > I would just rename these two to sofef01_test_key_on/off_lvl2()
> > and use the same helpers in this driver to follow the sofef00 pattern.
> 
> Right, yes.  I think I already brought this up in V1, that some existing
> Samsung drivers call this (the 0xf0 part) the MCS PASSWORD, others call it the
> LEVEL_2_KEY or USER_KEY or ACCESSPROT.
> 
> I'm curious (though should probably look up the patch history) where these names
> come from, which of these names match the sofef01/03/souxp00 DDICs provided
> here, and what they're supposed to mean (MCS: Magic Command Sequence?).

I should have probably looked this up before asking; Manufacturer Command
Sequence.

Likely a generic prefix someone came up with to label commands that are not
part of DCS.

> Then there are possibly a lot more constants we can glean from other drivers,
> though again without confirmation that it's identical on this DDIC.
> 
> - Marijn

