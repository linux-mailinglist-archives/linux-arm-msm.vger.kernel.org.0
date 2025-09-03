Return-Path: <linux-arm-msm+bounces-71949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D41B42CA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 00:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CC033AD09B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 22:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCC52EDD7B;
	Wed,  3 Sep 2025 22:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcKsLSx+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A3C2EC0BF;
	Wed,  3 Sep 2025 22:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756937538; cv=none; b=Gat7gBfLyrmUjxiQoL7wkhEbPPzrx6aeo526dB8wFTuezPINkpDkPfKfEu51JP+q81VOVDqRdgHBiK0moHWdL/KH1YkHY1bn77gWH0UiLYd0xsFLAWkM+3E2IbomzoiQJNE3OoeP2TaRuY8BMhzCyRkzO2LjSKTX4IpOVvav6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756937538; c=relaxed/simple;
	bh=KaTnv84GnPG3OJxBa6o7jmCuAgppgtp0j7SdJLG75nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLJLaP86EkceaSMIZLPGy5qgK4HhRxY1jMMhPSsBLWatCrAhSALMdYO9N7mk9OdNgj6toFojo931D5DdFpDpD3KmdksFqhjoDdDVbNey6KLV4qMm52GhzcDEWJJ1akpLb5WL2RS9XizTcaNTGYbvIn7FfZm/ROp+EHEdxA/Qd2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcKsLSx+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1830C4CEE7;
	Wed,  3 Sep 2025 22:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756937534;
	bh=KaTnv84GnPG3OJxBa6o7jmCuAgppgtp0j7SdJLG75nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcKsLSx+llJx3DvpAo2w7wlwzqLU8UUZC5P+w+//y96qQ1NTfOx2/9F+QxSaViyVC
	 J9XQKMo4oT+B9lkS9Qud66IFw1UiMVlhCQtBel/NSCANoCw/J/H96As31VTGAaJUrp
	 cchb6zr8813vurLpQvNBwvMnflbvgMklVTaRMeGD+X/taCTGR+GuAVpU+zeE5WPCyn
	 9LC3C5EV3cF8lXCyS4+SL8pKevF/hrzhsBXzBc2Fj8BpgQ9hzIZ2w/jXFWFNs1IVCw
	 oE8aRbwCpUFfI51wqHhd98fH7S7agP5CvZ7Zbwug/hkmM90lkzwFUT9ejT3VZW5RN5
	 TW77DQ8nY2wHA==
Date: Wed, 3 Sep 2025 17:12:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, David Airlie <airlied@gmail.com>,
	Mahadevan <quic_mahap@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v8 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
Message-ID: <175693753228.2942059.6654668767074884756.robh@kernel.org>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
 <20250903-dp_mst_bindings-v8-3-7526f0311eaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-dp_mst_bindings-v8-3-7526f0311eaa@oss.qualcomm.com>


On Wed, 03 Sep 2025 14:58:14 +0300, Dmitry Baryshkov wrote:
> The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
> controller as compatible with SM8350.
> 
> Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
>  Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


