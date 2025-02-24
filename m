Return-Path: <linux-arm-msm+bounces-49191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E8A429A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 18:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA283B00E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 17:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F16264A75;
	Mon, 24 Feb 2025 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMt+CR2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFCA2641DA;
	Mon, 24 Feb 2025 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740417825; cv=none; b=HwWEP1OksrplbeN9h5S96fLl6yDanGy7OXM8UNuIFUhriJvoi/bRzQrWFjtib6/ivtK/W7/GRnlxAwbpaJhiAgLdDO+1mekPzaMIYgNjCgwNa+1Z8vr/76G3nPrQPo1HVX8sh96f8Sk4gGv5Y8I6VA52K0SNwn1lH/gEOAggCCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740417825; c=relaxed/simple;
	bh=VRzmzKwfkmV/SsmodSt2tTi4F0g1wvkHl9yIrrDB7OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/ihJBJPDQUkw41kw+IhIWQFGNSr9fdycqCOYvhox0EhhUoj5uN3yCowuDe5IZc/ev2WeVCiEsGNRhsjtpBmSY4KHTuFBicPZd3zy8bQkTliBNOhK7wYgm2YS1D+3vMZsQLj2aD5kmLo3uY2h+9lxgAzgs8IO0hADULUaVQn15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMt+CR2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8C8C4CED6;
	Mon, 24 Feb 2025 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740417825;
	bh=VRzmzKwfkmV/SsmodSt2tTi4F0g1wvkHl9yIrrDB7OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMt+CR2A9wqhSwtNmbETDqNEElQZLf2gzHZolLxoktxpkWHA7/Jmt+PpbuMGupBss
	 Ia2XpnfV+lm7LE80cGoMXq5xfAkElQeNiDiryNFhuphXuOEVTSGjf9zMcPfR2C48ro
	 VvdZkrD49M29bTU9BGxDun6REFI7fI2DSPupdbidZlDB9B/BSd3iQ4ojPqzMlGKHAD
	 5jJibDwRQceEW4qArPFgJBD7o6FZIuWBUomcWJCSqR14sqr96Ge7CU2YWefOX7uwLf
	 KzpBaPnMEw5HRQ3D1reVCZ7yB1P9N7sp/+Lyro15sGC4hVBNPayVafMSZXOoUbMUqF
	 pTXqPIPQNkI7w==
Date: Mon, 24 Feb 2025 11:23:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: freedreno@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
	Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 07/21] dt-bindings: display/msm: qcom,sm8750-mdss: Add
 SM8750
Message-ID: <174041782271.3553565.17982761584486770776.robh@kernel.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-7-3ea95b1630ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-7-3ea95b1630ea@linaro.org>


On Fri, 21 Feb 2025 16:24:17 +0100, Krzysztof Kozlowski wrote:
> Add MDSS/MDP display subsystem for Qualcomm SM8750 SoC, next generation
> with two revisions up of the IP block comparing to SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Properly described interconnects
> 2. Use only one compatible and contains for the sub-blocks (Rob)
> ---
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++++
>  1 file changed, 470 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


