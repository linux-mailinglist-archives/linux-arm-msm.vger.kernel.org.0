Return-Path: <linux-arm-msm+bounces-43814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB883A003B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94BD5162E7D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 05:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7696B16EBE8;
	Fri,  3 Jan 2025 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="neFmcYS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997EDCA6F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 05:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883027; cv=none; b=W4css0r9C8FCT1O6vjUiIm6hqdTZwMAu+be5+UxYDr3a5qEkJ1LnFWETgO6p6WhM4RjLXR1lmnqGu6Nh7W9gNcElZ1vxwPbZnNsjPJKzeLsFBy5AELs6utLn79vzIDX1j4EDhGTbD9fEYM6ZVVdSX6pKkorY1PNKMA4TScLgT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883027; c=relaxed/simple;
	bh=EQ18TP4o7X0Ulpj4j+raYQTFHh+/8mbhtyshOrrD3ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1yht4/AYPiFAoyGwj3F8Ecau2psYP4io7+Ykl58mnWgrbp0gDH3B0gGt2BlecYW9Qo7b1ACq/o1pD0SRESqvnLiDU6knhnAdFvWVdQHeYHELowFCsd3wiLLLAbXVQZZqOFkpxgM+H3xk8w40I1JU+DI8aiDhtluNDRW96LujVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=neFmcYS/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54252789365so5214098e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 21:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883024; x=1736487824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31zsa9uWokXBXqyJkZuEHGz6c1PE9peb216t4vEVvbQ=;
        b=neFmcYS/XznD3NwtBpFkacc2TxaD66fytVS8QBnaU7GKV/5X5/e7FPbUZx0Gw5Rd0l
         XRFnGQwiglOR64gj+KSv3u1p4kGVAOSZLN9ZHJtjFKRc4FvcWxBH0jxF/Wyz5UHDqr/W
         AeMBI/M0dolzP7hkphI7jsuPdofNm6cN+/2QpgZ24E/RgQpUNGTLWgXZco3SWVE9CMbT
         x+jsqQXC7cD9FQU6nwriXyFx9rhpJm4rFvSL1RlrZuM3nW0uS5g0LEWuPj2+w1DLw4MU
         Osjx7YRpbwNJ3QcpgHOJVDGSFYPaY035h6iSJR+uw1U8h4VH4LtCbKFRWuf9mY9JFuXX
         16Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883024; x=1736487824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31zsa9uWokXBXqyJkZuEHGz6c1PE9peb216t4vEVvbQ=;
        b=XzgxbqhKdSYUNPUS0hIWlaK6ecq8/uvhq1JF0B1c/BZ0wQHU7SASlJC0Cljm8gy4qx
         TArNZFVTtsm7lZuIwbwko5G2sW4X69Y557P3KT2RDI6R2XhiqkmqZF0mVRl6GuyVrNJt
         FjNMfbILnHgwTQSWoCjFKi0pxmsQ7vP+uyVT4AVtLVqUh3OTlxkgn/BCHz72xVQkffVB
         aoMrwHZ9/rr95r5WgdNtq7xjBrb3dbJJ5KnPx48J7x2zRl/p/43VXmqxkL1HqbuV0nI7
         nwcvL7CUoG2Lvqc8Go6VdOLlZ16dcZhe5eBtxKdL8zKRFwqPUTh3XW4fiGf7iNYvWfiB
         +hKg==
X-Forwarded-Encrypted: i=1; AJvYcCX1JOZaCIyt/CKZzcrE58EuY/SJYfcFe6LVTUVE8zGBtMbIJ1dKY0qBm2n8kisuM5zLkz1/lyBxhNpuFVCx@vger.kernel.org
X-Gm-Message-State: AOJu0YwoxZ1msXuWCgAHPzWoZe1X4iD7bzumiqssdVfeya+4i44poFDK
	ahTcn4SUzRv1Z9bJpeQ52pNz/k4OD70q9HP1T2FUpN1yTPbK28t2s2EgkwMA18k=
X-Gm-Gg: ASbGncu30MMJHFOPL/gC5o1uUP/slrXnYWANo/+tAfxXEWSF4X/vbMDSgKN/C4QiyJH
	cP3v36BYbkWr8Shh8jiBfMri6OlT1AcrM8fWLYi5/OFGkHvxTxRT8ZO+ozjuSZJBm0m35iPmwZ4
	Hh72mdIcJjtxeREnBAmplRiuKRAlcBVMPrFkfsWysWZXgQlLEw9tnknEnOdwqKVcQ0NM0KBeLq5
	k2QiDN7HluLS7BjyC9Wuf7mx2Uylik6SMhVbKlpumTr7ajm8jHUkFKmTfViApxQBbhLPi7vf9SA
	iJjBAbMOS5aP2eOPIISs45q70pdgTbYyw0ts
X-Google-Smtp-Source: AGHT+IFoo4JY40n63oucLAnzSrd13WH+fz3nvNmn3VFzZCXWCOLcZPWt3kQ3D5JWqqyc0gi+DPH/Bg==
X-Received: by 2002:a05:6512:1193:b0:540:1d0a:581e with SMTP id 2adb3069b0e04-542295492ecmr15006993e87.28.1735883023775;
        Thu, 02 Jan 2025 21:43:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600768sm4149453e87.96.2025.01.02.21.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:43:42 -0800 (PST)
Date: Fri, 3 Jan 2025 07:43:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Cc: kernel@quicinc.com, andersson@kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, quic_akdwived@quicinc.com, 
	Sahil Chandna <quic_chandna@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add industrial mezzanine
Message-ID: <cectmx7ncdi5zhzvzsnlgk7ckdsc2wmdqa27q3r4stypj4uga3@mein42lgljoc>
References: <20250102190155.2593453-1-quic_nkumarsi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102190155.2593453-1-quic_nkumarsi@quicinc.com>

On Fri, Jan 03, 2025 at 12:31:55AM +0530, Nirmesh Kumar Singh wrote:
> From: Sahil Chandna <quic_chandna@quicinc.com>
> 
> Add DTS support for Qualcomm qcs6490-rb3gen2 industrial mezzanine
> board which uses QCS6490 SoC. This board enhances the capabilities of
> QCS6490 rb3gen2 core kit.
> 
> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> 
> ---
> Changes in V2:
> - Addressed comment by Konrad.
> - Validated dts bindings with dtb_checks suggested by Krzysztof.
> - Improved indentation/formatting.
> - Fixed bug encountered during testing.
> - Added dtb entry in makefile.
> - Link to V1: https://lore.kernel.org/all/20241206065156.2573-1-quic_chandna@quicinc.com/
> 
> ---
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  5 +++
>  .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 34 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6ca8db4b8afe..7c61e9e330d7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -111,6 +111,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM) += qcs6490-rb3gen2-industrial-mezzanine.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> new file mode 100644
> index 000000000000..7a067e8dc622
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> +*/
> +
> +/dts-v1/;
> +/plugin/;
> +#include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +/ {
> +pm7250b-gpios {

Something is very wrong here. This line has wrong indentation, this is a
pinctrl node under the root node (instead of the corresponding pinctrl
device), there seem to be no references to it, etc.

> +                pins = "gpio5";

Please use tabs instead of spaces for identation.

> +                function = "normal";
> +                power-source = <1>;
> +                output-high;
> +                input-disable;
> +                bias-pull-up;
> +                qcom,drive-strength = <3>;
> +        };
> +};
> +
> +&spi11 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +        status = "okay";
> +
> +        st33htpm0: tpm@0 {
> +		compatible = "st,st33htpm-spi","tcg,tpm_tis-spi";

Missing space

> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +

Drop extra empty line.

> +        };
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

