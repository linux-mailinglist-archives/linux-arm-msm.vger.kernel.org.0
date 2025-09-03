Return-Path: <linux-arm-msm+bounces-71948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA3B42C87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 00:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B93F3203606
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 22:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE7E2E62B3;
	Wed,  3 Sep 2025 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vihblv3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71C155333;
	Wed,  3 Sep 2025 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756937345; cv=none; b=rnVnrDs0sAr5OVzoAwUhLXRQiIzkUcNIYDqwXHLF1vYTWM6UB2cN5fANhh9B8VJJ9Gl4RV4dzLwjixagu3yRDyPXf7+bJv9t6QJEFpvMkW8mxSKY1ikYlp/tBNljisYxMa1rz6/wVDwjiuBiTrdiVlxeQrPUzjTkhc7a1teMmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756937345; c=relaxed/simple;
	bh=0O+pYvcP6Udtovv6oSsCQqzRCHJe9qRrZ983FZUlqGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pboQRHMp4mB4Nat2IAj8fyAMLbIV6zTXSiD1gZMqKHWFUDX1iqPWy9oU9a0I9ga6hKZSogd+LNUGyluqqcbaJC5CIeZc19owaT936p3V9Fg6iNHIQgB1OXFqXFHcltPGPDCItpoXwoMu8HmgQ4JsYL7kjDP1m/IvUAHxwpaV5ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vihblv3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E571C4CEE7;
	Wed,  3 Sep 2025 22:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756937344;
	bh=0O+pYvcP6Udtovv6oSsCQqzRCHJe9qRrZ983FZUlqGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vihblv3Wr8sXx6PoPDj/h2q53qErViSpt0q8TG/MRQMUTwkB01ldFvT+vg1/icXXQ
	 88s5NJrTzI6XEANuUVxx0R+ZSLCqXFx9hYuvgQkvQ6ZHhjaE3xCo2asY8U1tExIc7Y
	 j0StWU+VbWx8L+Xhmrg2sdBzTkHVUy/U9UL+F/n4J+/SCaDMd5nxX4jFxmfii3bpz3
	 6bMEEAyKGjqpZyZYO/gNyD3+LYICKHrehJt+oQaKms2JgGFPj3meQcXHDaFwBNR8v+
	 DH5eAY8gyGbSXqjCBIAbDChaYKyiTUZf4KHhm6Bs0lm5n3usXkCS1BVh9JU2OfvfXG
	 dUSSiWiQXrsNA==
Date: Wed, 3 Sep 2025 17:09:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abel Vesa <abel.vesa@linaro.org>, linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mahadevan <quic_mahap@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v8 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
Message-ID: <175693734157.2928047.13961803689697376626.robh@kernel.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-2-7526f0311eaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-dp_mst_bindings-v8-2-7526f0311eaa@oss.qualcomm.com>


On Wed, 03 Sep 2025 14:58:13 +0300, Dmitry Baryshkov wrote:
> Currently SM6350 uses qcom,sm8350-dp as a fallback compatible entry.
> This works, but adding DP MST support will reveal that this SoC is
> not fully compatible with SM8350 platform: the former one doesn't
> provide MST support, while the latter one will get it. DT schema for
> SM8350 is going to demand MST-related clocks which SM6350 doesn't
> provide.
> 
> Add new entry for SM6350 with fallback to SC7180 (which belongs to the
> same generation and also doesn't have MST support). SC7180 has been
> supported by the Linux kernel long ago (and long before SM8350 support
> was added).
> 
> Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


