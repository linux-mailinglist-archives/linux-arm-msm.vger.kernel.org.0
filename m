Return-Path: <linux-arm-msm+bounces-65831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881BDB0B927
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 01:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08713B2338
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 23:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E47B223DDD;
	Sun, 20 Jul 2025 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7iMMtxp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727021F3D58;
	Sun, 20 Jul 2025 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753053515; cv=none; b=OiMMXt6yRmviZDEws31Ifax75X608A68TnM6hrPW3+m0XUGNL8GsypGKit4FT5pSLGMEKn7wHcta1OpmcnhSbictpMLATBDmA0Ca28us0CR7ZCyHY/Qft6+STPdeKeBvg/ryTBMXMyilIGbDw2j9gfdbock3x5Frk0nLiz5zB8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753053515; c=relaxed/simple;
	bh=wE12OVYUMSkIfQIML1DpI9SGBAtn9/cL1ip1LoX88Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dD0gKYteKJ/JADgascL6sX8A8V6Pk1kwdJi1buR9Hat/e6x9oqCJLUhHSmez/8DkANNIKHyedL1gS38rQR1QJac2/PFuek8GXyrAM9SYhHnS30B4TRtpQCpvYVFEx/9zcgw8HCn9J/shViep7E3oGJ1khBC8LslFU6kOXRNwBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7iMMtxp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA044C4CEE7;
	Sun, 20 Jul 2025 23:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753053514;
	bh=wE12OVYUMSkIfQIML1DpI9SGBAtn9/cL1ip1LoX88Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7iMMtxpQnG1VHKffkSlFcKRXEhteWQ79hIXorVqYriBOqXX2Q5vvikYeEdbnJy1D
	 7Son+APSMEd4E5/MxIRSV+8ktmCvYN1BICElHnu641y22jlXOUQXyUe1NKHRuy0Qq7
	 o5laifDbqGQ2TUge/EccvlOZoyrnnXNgVZCW64pJLruav9Vmyh5FcWSJTVE1N6B1EM
	 WfFuZ8wwYXbKiQmkUE1TQERvGlL6IISfQmPRC9hA+ejDUChAzZ10fcK2eG3GMsu/Tf
	 zDB4Rl9NFNWTylnzenj3EJDgAwJlg3n9urrLcxddbohCZ6ATWVH8wbnFYEV9at5Xtq
	 3t2BCc4dE+kNA==
Date: Sun, 20 Jul 2025 18:18:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom-soc: Document new Milos and
 Glymur SoCs
Message-ID: <175305351182.3053856.2874798725106628715.robh@kernel.org>
References: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>


On Wed, 16 Jul 2025 18:24:13 +0200, Krzysztof Kozlowski wrote:
> Extend the schema enforcing correct SoC-block naming to cover Milos
> (compatibles already accepted by some maintainers for next release) and
> Glymur (posted on mailing lists [1]) SoCs.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com/ [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I asked for documenting the Milos name at v2 of Milos patchset... it did
> not happen and patches are already being accepted.
> 
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


