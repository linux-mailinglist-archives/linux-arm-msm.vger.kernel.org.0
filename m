Return-Path: <linux-arm-msm+bounces-51332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F66A6052F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 00:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E8F19C38E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 23:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D66F1F8733;
	Thu, 13 Mar 2025 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrkrBhnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7691F4E21;
	Thu, 13 Mar 2025 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741907851; cv=none; b=IJd55PViuCIYl9WRNh5qp3CT3Tl0i/xGn3qFtysH9e7wE4YaLWUDScAPXXTVxsNsza1hm9p44h7ou+4cAdkjkjDAoZJKauS6uHH6XxID9+UlVF3fKDfAjBPG+hOsvlYvvOCL+oD7E1KLHnFoMAx5SCP+Vzyo/DiOSo9dQxNx3Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741907851; c=relaxed/simple;
	bh=gI6Vkk5pCHvVr9ev1OnfwJmpTV6cEVLcUS5gCw6YFIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIecijh0/JnrxorBjvu4UXhTO+5e2nI6Ml3rpe0tx5iljAvtYsy+fznoNRhKA7tYHJKknsPv7BTX89K1USp17mCrR57KlRVRY1eqEYsmulPZgdkRD8ludKq3gjYF2RX99pjSYfQ2egKk0Kzji3lCP8/mu3vPcz0PkKVsIV8uwRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrkrBhnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13932C4CEE5;
	Thu, 13 Mar 2025 23:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907850;
	bh=gI6Vkk5pCHvVr9ev1OnfwJmpTV6cEVLcUS5gCw6YFIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrkrBhnBy64+OjE/MXzY1f53GutfxRbGgBOvbSBx8/8+f1Xk+9hzlFoIVChNlyT6r
	 buipkBH+b50As29cs96OvHLlE6MlHe/qFDS6fgZx5GuZY6MYlclmVIxFvRByw7Ssrt
	 xMonJLgCO64j8jRA85B1IWLXcdayvm8vqv2a2xOsGmsGaWrxBuuRKKXDlFlZj2Ao+b
	 g0bAKkX0TAur49zYccU4w6W8Htx6RCtoJZk0MeyICYSOBpSP/yVXZsbpKjOnYQCDAJ
	 wD66Dlp6NP9Q6GXeyyXLfQg5cUZM3a4talLaB4CtTSpYEqTcLDSi3x/cfqqr8MMt9g
	 Y524CVpN6PxnQ==
Date: Thu, 13 Mar 2025 18:17:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller
Message-ID: <5tt4wli2yodoet2l6r7ksq3o743nmi75hfksakqaxre3gmyr2a@zdotamju5ndp>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
 <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
 <d1814cd9-5c73-4ac5-a4ed-4cc2aae410d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1814cd9-5c73-4ac5-a4ed-4cc2aae410d0@quicinc.com>

On Thu, Mar 13, 2025 at 02:18:57PM +0530, Taniya Das wrote:
> 
> 
> On 3/13/2025 1:54 PM, Krzysztof Kozlowski wrote:
> > On Thu, Mar 13, 2025 at 12:29:43PM +0530, Taniya Das wrote:
> >  +
> >> +  '#reset-cells':
> >> +    const: 1
> >> +
> >> +  '#power-domain-cells':
> >> +    const: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clocks
> >> +  - '#clock-cells'
> >> +  - '#reset-cells'
> >> +  - '#power-domain-cells'
> >> +
> > 
> > I don't get why this binding is different than others and you do not
> > reference qcom,gcc.yaml? Is it not applicable here? Other gpucc do
> > reference.
> > 
> 
> Yes, I will fix them and resend.
> 

What is it that you will fix and resend? This patch or all other cases?

Please stop just throwing stuff at the list and until something sticks,
talk with the people who review your patches.

Regards,
Bjorn

> > 
> > Best regards,
> > Krzysztof
> > 
> 

