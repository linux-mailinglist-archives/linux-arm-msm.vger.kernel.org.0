Return-Path: <linux-arm-msm+bounces-65910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A176CB0C691
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 16:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 755091700CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 14:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3212DA77E;
	Mon, 21 Jul 2025 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4x3Q2iZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1BD1E5B6D;
	Mon, 21 Jul 2025 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108723; cv=none; b=EZZeCFjrJYfmyoOi/mqY4cW26aoAlykcxAn8g53I0zJK3Lwvm+qCafLMqR1agvGPRnvDAM0c6fhIzYcrPBLqAIuFpdMlfCM/V7Kl4ijN9Wk5LIXC+OFrUlS32eiCBLaYk6CK+2I0h+oHOoqMXxRti4x0T2y7k02ZA5iZUEPWAMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108723; c=relaxed/simple;
	bh=Rvu0r8kwgBxipAxQiYHn7UFFSL0RRcLSxbSDcMmsCk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5FESYZ+i1htr1l10Gf8WCSgIpABrvUvefuaJyYUsM/xm6SjZIQ0acOJ97GjIC6iUGOe+G1QftbTovy7EmosWpXRBvVySW51Zyga9EsRETznO+01ZiC9zvU1/sAtMsuvK5m7oOolKZDwgM3/U+wAcLGxHKdfMamD6WPYjLsXsYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4x3Q2iZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6F8C4CEED;
	Mon, 21 Jul 2025 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753108722;
	bh=Rvu0r8kwgBxipAxQiYHn7UFFSL0RRcLSxbSDcMmsCk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4x3Q2iZ7jBgZLWFnMQ7KoznQ+yd8/iBXZmW7dlOp2v2fOhN8IxBa2mQhqQ1D+YEq
	 fjSPPj4Hc70435n9pdpKMWfnO4d6DMNFPBiUplWNay19MoO3K4vpbeO+oBeYltrzay
	 TDHWDzpLwB5IxfYo57stXFmkV0bfQbo+udRi7Wiov0HblyScULYG7yPu0qdiUigdcW
	 MnSkg8iWLCOwqo2sVSkmwmgBl5IwCwbQ1J46C3uGXt/9MxOof/4mgPdFLL2d7mjVH3
	 JzigV2dqnJK5/3fykFefCnvac0mg0pz2elB0F+emFCnTEFDNUmdcV24Qgy1zawoi6Q
	 JiGAWOREpG5GQ==
Date: Mon, 21 Jul 2025 09:38:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>,
	Mahadevan <quic_mahap@quicinc.com>, Simona Vetter <simona@ffwll.ch>,
	Sean Paul <sean@poorly.run>, Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	freedreno@lists.freedesktop.org,
	Michael Turquette <mturquette@baylibre.com>,
	cros-qcom-dts-watchers@chromium.org,
	Danila Tikhonov <danila@jiaxyga.com>,
	David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>, linux-clk@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
Message-ID: <175310872113.600678.8339317766064145962.robh@kernel.org>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>


On Sat, 19 Jul 2025 12:14:45 +0300, Dmitry Baryshkov wrote:
> 
> On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> the controller). Reflect that in the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> laptops. Please include this patch into the series (either separately
> or, better, by squashing into your first patch).
> 
> ---
>  .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


