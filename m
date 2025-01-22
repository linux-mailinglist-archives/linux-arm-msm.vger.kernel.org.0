Return-Path: <linux-arm-msm+bounces-45860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC90A198C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A864A3A5486
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A2221325D;
	Wed, 22 Jan 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCwI+/MM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131E92B9A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737571611; cv=none; b=ExbMnXtQPDl6AZ+Mx6B0rNnBjEY34vXTkT+7tISOlOiaIgfn3CsAp5SVjk5G6zkY8AoN++Sk5ref5zwZDI0sFkNOo7AR8rRw0iCnHlmSIXVWOQPLtOW2k4AiPQbDmASGPN72gO6U0MouMk3iqVBty84HtiL8xOJOX1Lo73HjiJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737571611; c=relaxed/simple;
	bh=bp+kY2lHES9zGU+rJW0QRSDksZk6b9haSCgYekgmxlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdHKJc/1e4tX+qj6nBBKnkc9LpRGpZf52maG9bzSq7ocRc0iTDvaTz94P/SBlY8q9YWD4zK4BVOO8tlzKjEn/MhCfoaluAcQluwYHl/qtHALxn/zLBMJO1dC6VF2TkOncINXBXB7aPR18TubGzq2OGKQz1u5cPLcpzBdMT3iqMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCwI+/MM; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-305d840926fso76291fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 10:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737571608; x=1738176408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZEFbpSbAUkiwmQ8uyrBoj/KNvRbRy6SOSsvlQTYgI4=;
        b=gCwI+/MM1m7nHmFOTWAAKi0pJzvfu1hlbkL6/cRowaqFcA0zXjo46RfIxfQQpVbjt2
         9QdXzgzwtNp0RQDvnhBbmadhU180YM5udjl3eoB4bi4VO3r9SXtDnWRmlWrnx11wyA/M
         eSoiDJSBK65sd6NQ4s9oflEhibjcNbvPjW9speaAsMjbp4MJuXmaxP6unu7X0iwp5asu
         cHe2Thd15lYFskSe8OFMnA9btNb4utKHNXOCbvtvPZrqXTBlaubVGWuGHRHu7o6vwnCZ
         tvLG2vY1C7KxVLzlszrMLhMZXp2XEyzLrxOM+2gfOidbDu8kAI4b87odOXS0R1GF3wBS
         HQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737571608; x=1738176408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZEFbpSbAUkiwmQ8uyrBoj/KNvRbRy6SOSsvlQTYgI4=;
        b=gFiYfJczt+jDd/xmSEhpFEaCxXpsMdFsCj6guXEe5IxH80cROcchrt0MFTAdcN2LHn
         wmG1t+lxV9iH3NZKL1wwAx07TBXqpGEbfnusxbQwfFAJEY6EeZ7ApQc2TUv6Cbf6X8hB
         1pKRn0gcOu0GMj4VfKjq5IXafZ3L2Opa3sKQ4DHuB0htlvOhRCeJIkSM0Z64AZfpx+Jm
         vWJWiLtjAP2jatRj2RqKESwt3efHeAIhOL80Z9UksN9+ysS6KiFzzNgIUDz4fs+5wtif
         bpFt7rcRPqCQjWTyqJyc+N4qRQF0uAYds6uhbBlOaXYKMchbG8vKxvQZSd5Ld5Q10rDn
         PSYg==
X-Forwarded-Encrypted: i=1; AJvYcCXGMsR4gFaEfqyGdOmXO5iA4D5R1BkLKXuc9cyn6A2qyZ/zkakd9MeEGPNGhzU5zV4/9JyNqhCnGtNSIzjV@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjQTY/SIe/CPJutg8f7LugFfsz0cv7xv5bFvPTy73ojYvk1wa
	I7TIaXD4HBI2iC7GkulPKAjFWX7WG18QmaVscN8ftrdBKKmVU/24qQd2P2jRkW8=
X-Gm-Gg: ASbGncu9lEeA4yBEKi5fpFBNZq81ZwuOSZpqaX4VR+39aj8j9dQu2PNalhcEDHx3uAo
	4G4Q9u/7VwE/b8L/OEySOMMjZ5ofpGsXTOA2lKFbjf02iCC07DJp6b9PU8HQkfaPpD4FkyKvqkT
	j/HEbMxbzch39z3VCaMmuu+dpsXLPhc3kakeZpmH1YHGLhRMgRD1IeDdCk367pxgch8nGeT/OAV
	5+1urxDeai6SmEPpW7CbYSKIH5zQGhSJQbpj5xnDKD5RZ1Zyg+9xJStJt0vvqSvZzFCfu5wbyyq
	0NM6YR0BDmdn00o/5LUiaq7Y6+vN7gXSKvSqWa/A2AZBikwaQg==
X-Google-Smtp-Source: AGHT+IFys+iq/WjKPfLfUq0HQEutCO3s0upHIgjZZRoyH2OwhbXUd1xD4y0RlzcBd/5HaMHbhHocJg==
X-Received: by 2002:a05:651c:150b:b0:302:5391:3faf with SMTP id 38308e7fff4ca-3072caa0d1fmr79559321fa.17.1737571607991;
        Wed, 22 Jan 2025 10:46:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330cb8sm26717371fa.22.2025.01.22.10.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:46:46 -0800 (PST)
Date: Wed, 22 Jan 2025 20:46:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Cc: kernel@quicinc.com, andersson@kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, quic_akdwived@quicinc.com, 
	quic_uchheda@quicinc.com, Sahil Chandna <quic_chandna@quicinc.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add industrial mezzanine support
 for qcs6490-rb3gen2
Message-ID: <f4xffmfwkwrenulklmwzjjmdfdhcf5cwundyfen54e2codrmlj@htzjpvk5vopp>
References: <20250122101424.1810844-1-quic_nkumarsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122101424.1810844-1-quic_nkumarsi@quicinc.com>

On Wed, Jan 22, 2025 at 03:44:24PM +0530, Nirmesh Kumar Singh wrote:
> Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine board.
> 
> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> 
> ---
> Changes in v3:
> - Fixed tpm pinctrl node label.
> - Addressed comments by Dmitry.

Which ones? Pleas be more specific in changelogs.

> - Improved indentation/formatting.
> - Link to V2: https://lore.kernel.org/all/20250102190155.2593453-1-quic_nkumarsi@quicinc.com/
> 
> Changes in V2:
> - Addressed comment by Konrad.
> - Validated dts bindings with dtb_checks suggested by Krzysztof.
> - Improved indentation/formatting.
> - Fixed bug encountered during testing.
> - Added dtb entry in makefile.
> - Link to V1: https://lore.kernel.org/all/20241206065156.2573-1-quic_chandna@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>  .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 35 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6ca8db4b8afe..16ac008c58d2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -111,6 +111,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-industrial-mezzanine-dtbs	:= qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> new file mode 100644
> index 000000000000..1498f32bd069
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> +*/
> +
> +/dts-v1/;
> +/plugin/;
> +#include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +&pm7250b_gpios {
> +	tpm_spi_reset: tpm-spi-reset-state {
> +		pins = "gpio5";
> +		function = "normal";
> +		power-source = <1>;
> +		output-high;
> +		input-disable;
> +		bias-pull-up;
> +		qcom,drive-strength = <3>;
> +	};
> +};
> +
> +&spi11 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	st33htpm0: tpm@0 {
> +		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpm_spi_reset>;

Missing reset-gpios property. Otherwise there is no point in specifying
the pinctrl.

> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

