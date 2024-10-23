Return-Path: <linux-arm-msm+bounces-35569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A39AC199
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 974E9282C1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAAA158875;
	Wed, 23 Oct 2024 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf4xxSiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E63D154439;
	Wed, 23 Oct 2024 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672182; cv=none; b=eIiSDcqY4BmAf2osAwarZu9sEGQ8/rNWWfavRxHEbyoUTXiDheRgEf221gOpe1hA2GedVprK3ph4IhfApjXgPV8L8omQKeW2PYzhrdgQXe3VYURVbP+9So1v4Uj6k4xsDTSOD2pzl6U0K0LIyZGUW0Nfz6xlAKizqXhlQAQ3M+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672182; c=relaxed/simple;
	bh=qP2O+eiJB8iJQfwbz4B5eYxZINBTQj25Ci5NIhjnAO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/+QrzQKauB0qNF3/W65JNKAQER5wh9tXSj4zOaIZ2fav/3+mV2n8yDxM6cSdZcA5JS7x4XxBI5GZILsbdF7izaOHMSeYB20V+LrzX+dJJjMlItWfqBlVlay/UQUE3/85+qDoYtsxmiuKCf5SeZPfGJN6Hq3m3vR33/4g/SUjc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf4xxSiF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF55C4CEC6;
	Wed, 23 Oct 2024 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672182;
	bh=qP2O+eiJB8iJQfwbz4B5eYxZINBTQj25Ci5NIhjnAO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qf4xxSiFOIOZzKtqrTLMLMIV3mwwAexv3DBcbYD3oxncB+ex6psESW/4fQq1+WvlM
	 iNbeUddsoqLJegxZd8lDElmi+NQ6ykFIinHYpYnEpGY1wZ9jT3TQO8Jzx62zU6yd7W
	 Ec9TucGeCLsuOyzfpVbJwi9jbrbyI6NYawVsU8msP8+RixANZUWZjjEd6hqnkJ2RBH
	 FqapQZB76CnfzBF/k8sCqWQG19qyZItvy7Ixf4ow2VZu3NzvLi1ahXnyMxHnZPL3M+
	 7LtW3dTPimBsO1R6J1vTOGP5lP5repUELMHrhQfyG/dy8RkT5SgCkZ6ueWEB4MTISz
	 WiCVheoVCWvVw==
Date: Wed, 23 Oct 2024 10:29:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document sm8750 SoC and
 boards
Message-ID: <q4tdx4tf5vlzky45bmrllxuwivtah43grl4sgcw4op5udoy3ve@baqlgxq7eyn7>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-2-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021232114.2636083-2-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:21:10PM -0700, Melody Olvera wrote:
> Document the SM8750 SoC binding and the boards which use it.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


