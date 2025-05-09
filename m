Return-Path: <linux-arm-msm+bounces-57487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F84AB1C76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 20:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93BBC1C2859A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 18:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A6B23F409;
	Fri,  9 May 2025 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOd74BLl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098E323E32B;
	Fri,  9 May 2025 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815986; cv=none; b=i63VxlrAgspu6uWi1JTYIFaQtMgTV/+ZrNtdz1B0f+OK0h7S9z8upacjxArrsYr+jU7FfKXfSnEesjoN91XLLTPsiCN4Ztu/XytJV0QLGxLtmNkUfOfN14NQsO95HaM2E47TTtX8mfAtRIlQtuhfOHZvadSP6lgv98gN1L5ePxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815986; c=relaxed/simple;
	bh=9tFcGorhL6voOakeXXFjagkhUDM5lruKobGMxyRZxWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8jldr+1eMazYdGJmCrp0pGy8wAmmN6daMK0qAbiT833oNvX+qAB1sOekw0SqbuRnf2rYws8wbFFbqp2u0CtfWpYkefZlGDjtJNE1XH4HT/dluM/NivTgRBdHCXxfBNeA9ulIKKsApvpNaaazIkyIgb0ghr+2LG2d773cDZEv0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOd74BLl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CDDC4CEE4;
	Fri,  9 May 2025 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746815985;
	bh=9tFcGorhL6voOakeXXFjagkhUDM5lruKobGMxyRZxWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOd74BLl0+zeMXfM3EV0HHE1Zy/0dZINU8gdkkEvIXPKtE+ieSfibZXGyZHYaWGy9
	 3R4BzoAGRqLd2BNSUbSRulcW54oyLceaqC8xCxdBMWhYb95dI7KZmAwU5cgdppF0gx
	 2Sc84OwBOI+92f3KTFIvkC9ORrAdYDXVrjeK++m/JsKf4QCTc2P0rUcJkXxrMYo+zh
	 UQwmXNRy4Zgi/I1/6ST9csS3q359ki4blTZX8Yvd80uGhe2iVdN/yv6P7c+E79hgAB
	 Oxpup4LLecWStUb5/w6Ujf/qmJIobPF1VMUhXnRqw6a8Kbdfn46xjILFBOQptOJULv
	 LnGlUNrglZmJQ==
Date: Fri, 9 May 2025 13:39:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, stable@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8150-pas: Add missing
 SC8180X compatible
Message-ID: <174681598302.3913409.18333226552734196520.robh@kernel.org>
References: <20250428075243.44256-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428075243.44256-2-krzysztof.kozlowski@linaro.org>


On Mon, 28 Apr 2025 09:52:44 +0200, Krzysztof Kozlowski wrote:
> Commit 4b4ab93ddc5f ("dt-bindings: remoteproc: Consolidate SC8180X and
> SM8150 PAS files") moved SC8180X bindings from separate file into this
> one, but it forgot to add actual compatibles in top-level properties
> section making the entire binding un-selectable (no-op) for SC8180X PAS.
> 
> Fixes: 4b4ab93ddc5f ("dt-bindings: remoteproc: Consolidate SC8180X and SM8150 PAS files")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


