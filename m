Return-Path: <linux-arm-msm+bounces-70955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E656B3747F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 23:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00BE8361E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 21:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D1A1C5D4B;
	Tue, 26 Aug 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRVzx96c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5B30CD97;
	Tue, 26 Aug 2025 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244788; cv=none; b=iE73ca/rgZR6piSpsGr3aHo2EsUhuTe9CwiUAIUkFj6FGXUgxEm6j/OHb/ah+3LZ7WTwjUxMj6aBmEiVLSiawriCdNQr/3bWmCLVp7UGtbLMf/xfX49IsMr4yPJQSkgso5VjJvykvik1Jqb1dcDZnHiz6iUBAMvZBcDUAqLFCAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244788; c=relaxed/simple;
	bh=vSBMKA9L+YzJuJM25V0/ghKt9jA4Bvh8WFzzdoSLXyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiGf9ioWs3r2tQ5XC+UAZXn/TYXiKwwgocwl3zZcBruDRDzB0NzANN3HLwi4i64OrGc3CF5f27RvrzsqeFhtsAf8ICWLo1B7C9K7UiprfIfLOBDinrTs4sYcW873ydiRTyKEu+lZn/3PJt9q4nSHbVjwiScer3JkzYVkSM1K+Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRVzx96c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBCFC4CEF1;
	Tue, 26 Aug 2025 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756244787;
	bh=vSBMKA9L+YzJuJM25V0/ghKt9jA4Bvh8WFzzdoSLXyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRVzx96c9JzDI75qper0rXAaximc7QD/wUa4TfD+S3Lm41MWl3XrqiV5qqvsjX/Dh
	 9d6Px3CEmX70aVHZ2rEGV8sztGvXx/1AxEaSaSJ+Suye3GBCC9QKkr2Jxso1drJSe4
	 B4EFQg11Ih6+YMu8HWd4QUw06OYyc//TT4aSOFhre/mVnLl0GTcNahIQ/Tp0XT9WmQ
	 f1UJo2zt1g2BapeF+oMWI6dj/gKCqnOIrJhyZ4Oh+G+b108hhjIjQVKMaAQm8PoHbH
	 IeegxsRJCPk3S6nQS2VqtrDbRpVS7jrLeR3s8i5F3Hg3M6SSeUY4+cwgd11ysQho5C
	 q/1CsLtqzYr6w==
Date: Tue, 26 Aug 2025 16:46:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
	coresight@lists.linaro.org, devicetree@vger.kernel.org,
	Tao Zhang <quic_taozha@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: document the static TPDM
 compatible
Message-ID: <175624478567.528178.9412029558267421159.robh@kernel.org>
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-2-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822103008.1029-2-jie.gan@oss.qualcomm.com>


On Fri, 22 Aug 2025 18:30:06 +0800, Jie Gan wrote:
> The static TPDM device is intended for sources that do not require MMIO
> mapping. Its compatible string should be documented clearly, along with
> an example illustrating how to define a static TPDM node in the DT.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-tpdm.yaml     | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


