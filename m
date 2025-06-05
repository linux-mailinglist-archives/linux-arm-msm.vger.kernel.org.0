Return-Path: <linux-arm-msm+bounces-60423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44420ACF9AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 00:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04B1B16DE46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 22:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93D627E1AC;
	Thu,  5 Jun 2025 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxLY3wDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C0917548;
	Thu,  5 Jun 2025 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749162744; cv=none; b=UoJZg5LhcObfhJQ1c9+dHhZy+xsdJTQsmsKwZ0SezHNOw6smQDQmeeaoDlbIlLhZeIEqW7cWa5DP0c76AX6W3SuVSTKQwvpvuogvOu2sSwICxQh6wml+jtedRWVGhYLTLUMCluTSfM1fXiwo0yefLkmYTQkEBBoHKsyWZ/qG6Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749162744; c=relaxed/simple;
	bh=bSOvzXClskVrCx7RtSl03xmNekxUy/NSjbkZTpo3POw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFY/jVD0nU/S9LWyrWTrlo+We6nildv1f71iDmbVamS67nGjtq0nc1lWMhj7O99EuoV2b07iMJJTYqmG/UPIHAmF5p6OMHrSDPYXQou1buxRXIXod2dlq/dzcNvajPOgRFPh5KV5yKUG4RU4heSnPJnDPIYb20EBk0zw0GnbnoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxLY3wDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F06C4CEE7;
	Thu,  5 Jun 2025 22:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749162744;
	bh=bSOvzXClskVrCx7RtSl03xmNekxUy/NSjbkZTpo3POw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxLY3wDnoMyoY+nghxY1Drb7vMG7UkSP+4d80bP/S4aioa1iaTsyh5gEYDynGmaYO
	 4j4m5oXsFm+7tfoMjLknS0RoqJk8OksEZv6glbMnjZzhMt/ReYihV7osGY6MgkI2Oj
	 NUBuPz8xjkvM3YTffcfgddhfCxg/hOSw7axJEZ8bARn+acIpajh0tbgjX5bYaFjam6
	 YuQpYzuUG91X5iFrOUUO1HXGI+KZ4NYyBHICxPBoP7v2mI8AmdYIiZyNL8P40PLbzU
	 pJPgmB6nDnnfG3kgZ82jseD5dmiVA2wmFNbsForJtcS0g6rvA/Qk2hyoIrFMvkpcrY
	 W++f06QKISeuA==
Date: Thu, 5 Jun 2025 17:32:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Yongxing Mou <quic_yongmou@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Mahadevan <quic_mahap@quicinc.com>, Sean Paul <sean@poorly.run>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <174916273839.3372439.12068616039739952601.robh@kernel.org>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-1-f925464d32a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-1-f925464d32a8@oss.qualcomm.com>


On Fri, 30 May 2025 10:47:24 -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add x1e80100 to the dp-controller bindings, fix the
> displayport-controller reg bindings, and drop
> assigned-clock-parents
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml       |  2 ++
>  .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml  | 12 +++++-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


