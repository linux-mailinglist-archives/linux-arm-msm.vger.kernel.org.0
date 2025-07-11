Return-Path: <linux-arm-msm+bounces-64492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5625B013FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C20F81C85FBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D95E1E1C02;
	Fri, 11 Jul 2025 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozfb4Ymi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79B1DFD96;
	Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752217463; cv=none; b=k6WucMa7hr7QoFg+m7IydeCEQhzBSfMUa7/vyn/i2J7xGc9YslCzEWNkvo7ZEsnmGsSNklyF+BcrzfRh5kYJO34umK+QwVXlg9o4X2EpNe8HD8odl3QQKmP+33BV6OEYiL5kmH2Uu6Wi3JJqqeSZmgk9FDHva0mB8RjVSXxehTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752217463; c=relaxed/simple;
	bh=uK5/A21fH/ybXkIrVUNquGOGWtk5qo5hMSx0pRcrghQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Id76hN7QiHljXSlMSvznYngPmJ1fYeDysuVWiCw6QUpu7FrSqnxH3Nga4Nll6wASZfzLTUpqyi2hWrsBEFdjxNDWz/TeKOyK8Wb2q0XvqMF/vikjYswbLEJkZh2WmFQUBBz0SGkVHFrrkyM+QFm3hgFCJkH7+x9UcfqNfPhr/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozfb4Ymi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7B7C4CEEF;
	Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752217463;
	bh=uK5/A21fH/ybXkIrVUNquGOGWtk5qo5hMSx0pRcrghQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ozfb4Ymiyjz9klNEQNJ7+XMATYrXDol/mZYRFbfu5CreWryhHBADzdHTjmGWT6pCI
	 2LI8Hg3YRs0dd48sDHV7Eivso+OTPLMGaTu1Xav9SaYjTT9eRvxnnxhOL1kS6k7eTQ
	 bXrKPl8f85Qk1zPAVj+UGD9+AU58t3/QWCmFB06enVeBKPHHaplP5gj24nlTkj0deB
	 Iopp5WPNP9nBuHVUExF+gSTKayUaynoxmromiXtiwoLlEmTz0YeOmQC4EfcF9HVpeZ
	 ex81Qyb0Ajht4BpSAF2dNL7n5bqyR5EY+VeBDQjOBjZSiSFHbzueV2hpjJqv5B0JRX
	 AsYgFP/435ZLg==
Message-ID: <1513c2dd4793403c32ccbbef4b5774e3@kernel.org>
Date: Fri, 11 Jul 2025 07:04:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
In-Reply-To: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@foss.st.com>, "Raphael
 Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Samuel
 Holland" <samuel@sholland.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shawn Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Thu, 10 Jul 2025 13:43:09 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

