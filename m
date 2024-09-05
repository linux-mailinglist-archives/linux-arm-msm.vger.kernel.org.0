Return-Path: <linux-arm-msm+bounces-30926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E99AE96DAC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28DD51C232C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9500319DF58;
	Thu,  5 Sep 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dx7HlgU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCC419CD19;
	Thu,  5 Sep 2024 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725544148; cv=none; b=MlKMvty32bhJdCyAw5jxOWCdD+FDY6lmX1endpLPmLJPnNN10Ie/3nnMYCHD2S89kLyTlznc52dvReqklaoi4O4jv6riNXQHkXXH5iRSj0RzuF+k9Qs1z/QLxZuJSqUtKjOWP7qf6MSbcCJ98nDwamDCtSLOCqU1W7riQe+P31U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725544148; c=relaxed/simple;
	bh=Joq2JCaXbW4YK/rgb9cZ8tyR0mqtrR4IwUtCwP7MGGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtS/LvZtuUR31/EgaE/yLl924DryUCwZqkRvXJDPIDn7Qi4u43tRJ6yA8KwZB6oE8bhGqhbx6IPfoJujPAqxSUxNxRlMM4vPTwjqWYzfBf2J6pkqb4fQECVF1G8hRUePKxyuZBaUoHKSV53pi+8ngBAxkf2bDsQvtvlkDpOcp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dx7HlgU8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8CCC4CEC3;
	Thu,  5 Sep 2024 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725544148;
	bh=Joq2JCaXbW4YK/rgb9cZ8tyR0mqtrR4IwUtCwP7MGGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dx7HlgU8cYt/jXg18GIF01hWkX/S6b4n0BxWjipaql3Ky2KNDy4k4PWquXitNz9US
	 SS9wiwkeF02gCb/z/sXgboR03p6HCtQy8KxjsEU96X7FbHoMry0GUrH1CzsShEYzsW
	 lMb1dCAkjRXuIso5dRPcCeUljflmeNl0HxIa7nlfqpE+DENu+spIVL1dCXMPx3F3Da
	 2ie8A0q/Xjy92LWvSsV6lJ7QAZK1WqftwGqwm/Cinld2miE8PVp3hXaUoxe5pKPMFB
	 xYEIafwRgTt5muZh/JX4nKluoNxSJHq+R2svEvd63wU/XZ8N+rAefw9JLvaE7/lfRA
	 gCeOu4A8dluJA==
Message-ID: <33d4671e-ae76-4746-b402-8640103c76ee@kernel.org>
Date: Thu, 5 Sep 2024 15:49:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add uart18
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
 <20240903224252.6207-4-jerome.debretagne@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240903224252.6207-4-jerome.debretagne@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4.09.2024 12:42 AM, Jérôme de Bretagne wrote:
> Add the node describing uart18 for sc8280xp devices.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 14c3b1d6ad47..e068de274b56 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1013,6 +1013,20 @@ spi18: spi@888000 {
>  				status = "disabled";
>  			};
>  
> +			uart18: serial@888000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x00888000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;

This should be the _S2 clock

Konrad

