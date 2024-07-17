Return-Path: <linux-arm-msm+bounces-26417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CF933956
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE294282CFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 08:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B263987B;
	Wed, 17 Jul 2024 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzMi1FmG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6F20DC3;
	Wed, 17 Jul 2024 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721205938; cv=none; b=IqQHVAhZCxP1/sZrMQsEchy+6+i+dQp+RDESjotvugC/KCAgXJxS0SYE9nvTJnJJGciF34xlUW2/HIPDxo1njfiSuZJBw1PsZHkClv/64LahS7ABzocnDb59S923tZerQy0Spd1wI72hhciUeTjd3yZhf2v90SnaRYbQC6KmqVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721205938; c=relaxed/simple;
	bh=y4wPa9h3p40/pMFjH/crjKU/1U1FOm38vMfi1U8m0Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDyKNpCetP7CiXROSKmIBlD8+4WpJ0K5DKD9yDRFKyY0gBhxXSAWGVKq0aJDpv7Ob6prh5c12Otn945evgsT6Td3Y1hS+VvBlP42c4wToSTT1x2vj5F1+VOOzF1FvjYAHuO7fgSKxqHe65A07adKaBsvP1GSvWcVGzo9GPvvjsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzMi1FmG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA30C32782;
	Wed, 17 Jul 2024 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721205937;
	bh=y4wPa9h3p40/pMFjH/crjKU/1U1FOm38vMfi1U8m0Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzMi1FmG4J2pugn6p6+nGY3KxrBJU/1iiGh2Q50d4M3GwXxMWfEuomRSwBnRwlf/A
	 8vFzH/JP3xTFiqULx+hTVihxqDnJJQwwN7tDmuCy0fgRjjBsG2qh89QBxcrjgLhwjc
	 TJo70dLyAUApJjS8uzhAuzn55bfICOT/SX+0lzVcsM3D2PveHfKOfQJPsYFUP1hTwT
	 SOOGRnRIOIv+K6seAdMnyHonnSILrO4afMTirLGOhg+L4FJT4gV6+HBGFYwkTLXpC7
	 Wr/2k80ISqvLFzGvqy/LAIBt/aVJ6SldzdGJ8bbOQbLqeunRmNYqGX678uueE99ga8
	 yUeMwsf6M2WEw==
Date: Wed, 17 Jul 2024 10:45:31 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>, de Goede <hdegoede@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: {a,i}pq8064: correct clock-names in
 sata node
Message-ID: <ZpeEq_QmV-aerpCW@ryzen.lan>
References: <20240716105245.49549-1-rayyan.ansari@linaro.org>
 <20240716105245.49549-2-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716105245.49549-2-rayyan.ansari@linaro.org>

On Tue, Jul 16, 2024 at 11:45:59AM +0100, Rayyan Ansari wrote:
> Correct the clock-names in the AHCI SATA controller node to adhere to
> the bindings.
> 
> Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>

Hello Rayyan,

This patch is 1/3, so first in the series.
A patch that is first in the series usually has no other dependencies.
(Unless referencing another series in the cover-letter.)

So is this a fix that can be sent out separately and picked up the
QCOM maintainers / ARM DT maintainers directly, or does this patch
actually depend on patches 2-3 ?

If the former, I suggest that you send out patch 1/3 as a standalone
fix, since it does not need to be blocked by unrelated DT binding
conversion.

If the latter, perhaps reorder the patches and improve the commit log
for this patch.


Kind regards,
Niklas


> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
>  arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 81cf387e1817..277bde958d0e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -889,9 +889,9 @@ sata0: sata@29000000 {
>  				 <&gcc SATA_PMALIVE_CLK>;
>  			clock-names = "slave_iface",
>  				      "iface",
> -				      "bus",
> +				      "core",
>  				      "rxoob",
> -				      "core_pmalive";
> +				      "pmalive";
>  
>  			assigned-clocks = <&gcc SATA_RXOOB_CLK>,
>  					  <&gcc SATA_PMALIVE_CLK>;
> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> index da0fd75f4711..dd974eb4065f 100644
> --- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
> @@ -1292,7 +1292,7 @@ sata: sata@29000000 {
>  				 <&gcc SATA_A_CLK>,
>  				 <&gcc SATA_RXOOB_CLK>,
>  				 <&gcc SATA_PMALIVE_CLK>;
> -			clock-names = "slave_face", "iface", "core",
> +			clock-names = "slave_iface", "iface", "core",
>  					"rxoob", "pmalive";
>  
>  			assigned-clocks = <&gcc SATA_RXOOB_CLK>, <&gcc SATA_PMALIVE_CLK>;
> -- 
> 2.45.2
> 

