Return-Path: <linux-arm-msm+bounces-66761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB6B12B9D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 19:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72FF07AD0A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 17:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951B8288514;
	Sat, 26 Jul 2025 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pl3Tr4qO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD080B;
	Sat, 26 Jul 2025 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753550237; cv=none; b=KFF2QPzh+299v4Jnso3Len1UXa1gdnUKjaJCanUsYXC5UvxtclS5F3ULnnBqPGeSJBtxaFFA/Mwms08Ze/QswawsgzLhGr2uosdbvhnxD9Zfz8kJW0/2Dg29h0tgxJpkSMCUuYllc76CgcGGVzx438w1xgbtkMw6h+wlXi9okrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753550237; c=relaxed/simple;
	bh=SbjFA9eOXVdNDH4J9M2fST9PDYOjLoIMnK2pzME1LKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUp3mT60mSOL6haC1JKdkITytoU0Laog+skUhdHUE65QxETVxV0El36+iYgkNpQlVPhjXGqYOzPS7vJrJ3mtezzNy7LwveoRpTDRc6UBTZlk3Iqo7uzc06AgNORHDcIo9ZnpTmfPyK3ceVcop4OSSjuOjv8Vj7rO4tIBDlN7Z8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pl3Tr4qO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294D2C4CEED;
	Sat, 26 Jul 2025 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753550236;
	bh=SbjFA9eOXVdNDH4J9M2fST9PDYOjLoIMnK2pzME1LKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pl3Tr4qOoOcp4SKxbAYlVlhJDpVUu1yT2BE8t31cCQzHoz2U3IzWkcTKX7k1HlcFW
	 Fmhsjxf+nlqWhgZR0fPI0M7YIPfav6CXu6IisZcn3rVPPv0zMofBb1+Rq1oTqroVNa
	 vIgl6MaenbLo9KhknKsc2sqbopZSzU7EmM4kLL4JQPyH7xwapmGQLFNGnhUqXvp/nx
	 vPMnPrAFJuHAPYqME8cShqCp2JzbQGe9kHDFxtmNB9JZGxFES6xLwP2dRXjEPI86wi
	 myNXPfxDuQAea0bmuasSmEVsITJn4Y/4M9hUvciRKoXNrMa83fYEcn2VyYuazJsww5
	 hkPEKP+KIOTsA==
Date: Sat, 26 Jul 2025 12:17:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 5/7] arm64: dts: qcom: lemans: Rename boards and clean up
 unsupported platforms
Message-ID: <ztnnerdg4xp6liqj7jjfyos5vsjuvppfrhyvhoczlki6riotaj@m6n7bk3phayl>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
 <20250722144926.995064-6-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722144926.995064-6-wasim.nazir@oss.qualcomm.com>

On Tue, Jul 22, 2025 at 08:19:24PM +0530, Wasim Nazir wrote:
> Rename qcs9100 based ride-r3 board to lemans ride-r3 and use it for all
> the IoT ride-r3 boards.
> Rename sa8775p based ride/ride-r3 boards to lemans-auto ride/ride-r3,
> to allow users to run with old automotive memory-map.
> 
> Remove support for qcs9100-ride, as no platform currently uses it.

As pointed out by Krzysztof, this has user impact, so we have to weight
the benefit of this against the impact on those users.

As such, this needs a proper problem description
(https://docs.kernel.org/process/submitting-patches.html#describe-your-changes)
and are there are three (probably different) set of developers/users
impacted it would make sense to split it in three patches.

Regards,
Bjorn

> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                    |  7 +++----
>  .../{sa8775p-ride-r3.dts => lemans-auto-ride-r3.dts} |  6 +++---
>  .../qcom/{sa8775p-ride.dts => lemans-auto-ride.dts}  |  6 +++---
>  .../qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi}   |  0
>  .../qcom/{qcs9100-ride-r3.dts => lemans-ride-r3.dts} | 12 +++++++++---
>  arch/arm64/boot/dts/qcom/qcs9100-ride.dts            | 11 -----------
>  6 files changed, 18 insertions(+), 24 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{sa8775p-ride-r3.dts => lemans-auto-ride-r3.dts} (59%)
>  rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dts => lemans-auto-ride.dts} (60%)
>  rename arch/arm64/boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} (100%)
>  rename arch/arm64/boot/dts/qcom/{qcs9100-ride-r3.dts => lemans-ride-r3.dts} (36%)
>  delete mode 100644 arch/arm64/boot/dts/qcom/qcs9100-ride.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a08..2a1941c29537 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -29,6 +29,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-auto-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-auto-ride-r3.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> @@ -126,8 +129,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
> @@ -140,8 +141,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
>  sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dts
> similarity index 59%
> rename from arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
> rename to arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dts
> index 3e19ff5e061f..0e19ec46be3c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dts
> @@ -7,11 +7,11 @@
> 
>  #include "lemans-auto.dtsi"
> 
> -#include "sa8775p-pmics.dtsi"
> +#include "lemans-pmics.dtsi"
>  #include "lemans-ride-common.dtsi"
>  #include "lemans-ride-ethernet-aqr115c.dtsi"
> 
>  / {
> -	model = "Qualcomm SA8775P Ride Rev3";
> -	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
> +	model = "Qualcomm Technologies, Inc. Lemans-auto Ride Rev3";
> +	compatible = "qcom,lemans-auto-ride-r3", "qcom,sa8775p";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-auto-ride.dts
> similarity index 60%
> rename from arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> rename to arch/arm64/boot/dts/qcom/lemans-auto-ride.dts
> index 68a99582b538..6af707263ad7 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-auto-ride.dts
> @@ -7,11 +7,11 @@
> 
>  #include "lemans-auto.dtsi"
> 
> -#include "sa8775p-pmics.dtsi"
> +#include "lemans-pmics.dtsi"
>  #include "lemans-ride-common.dtsi"
>  #include "lemans-ride-ethernet-88ea1512.dtsi"
> 
>  / {
> -	model = "Qualcomm SA8775P Ride";
> -	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
> +	model = "Qualcomm Technologies, Inc. Lemans-auto Ride";
> +	compatible = "qcom,lemans-auto-ride", "qcom,sa8775p";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> similarity index 100%
> rename from arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> rename to arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/lemans-ride-r3.dts
> similarity index 36%
> rename from arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
> rename to arch/arm64/boot/dts/qcom/lemans-ride-r3.dts
> index 759d1ec694b2..310c93f4a275 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-r3.dts
> @@ -2,10 +2,16 @@
>  /*
>   * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
> +
>  /dts-v1/;
> 
> -#include "sa8775p-ride-r3.dts"
> +#include "lemans.dtsi"
> +#include "lemans-pmics.dtsi"
> +
> +#include "lemans-ride-common.dtsi"
> +#include "lemans-ride-ethernet-aqr115c.dtsi"
> +
>  / {
> -	model = "Qualcomm QCS9100 Ride Rev3";
> -	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
> +	model = "Qualcomm Technologies, Inc. Lemans Ride Rev3";
> +	compatible = "qcom,lemans-ride-r3", "qcom,sa8775p";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
> deleted file mode 100644
> index 979462dfec30..000000000000
> --- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -// SPDX-License-Identifier: BSD-3-Clause
> -/*
> - * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> - */
> -/dts-v1/;
> -
> -#include "sa8775p-ride.dts"
> -/ {
> -	model = "Qualcomm QCS9100 Ride";
> -	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
> -};
> --
> 2.49.0
> 

