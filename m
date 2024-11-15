Return-Path: <linux-arm-msm+bounces-38102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 404309CFB56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 00:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2427281948
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 23:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F197519004D;
	Fri, 15 Nov 2024 23:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IS2QwOQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286EC1A4AAA
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 23:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731714870; cv=none; b=rjjSu4bwO7L8qoXzNEoKutSxW0xtjzEOoQ6PoYc/VTEjtmE+/uqzpjUREKvnw2dJifJ9U/QINM9vP2M2QMxe9hNmtUsoCO7sVek8/X3Aara5F6JuvMfEkt6Og2xJK+k5ioaWMbtGDwcldSb7JpQh8KMV7pzVyxiegMK7FOVwpGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731714870; c=relaxed/simple;
	bh=ohZnjwCppmAAe34adkvbOkf1BKlIPRwXr1ntZ66jKPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBz+GmiZLeqiCJM0c5PSlrQrASPxjvikvcT4WQPzFHYD52nL7sZ5LSywzqHm+8CID/Y8ymQ9FZMMDyz62aHOooT5Lm5jYnul2nwkdWqv6jbo5Vk2bQfiHR3Ia3z+zE3Q7avsmGRDgSc3fUMrlumknRb5XPRzH/gYGBBRULTmgn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IS2QwOQ6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f53973fdso2102879e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 15:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731714867; x=1732319667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bsDfrNuq1BpNubvVDcm0g4dj6+LO9Y4mnLEzGIOpgQI=;
        b=IS2QwOQ6O5BmlP3pD7ErUtNAZc/S851WP/1nrwPx1GQlTUPKFYhrVVLMEOyeOtU3Uw
         X8pAcE5A9ey40t3H9wKTrDLfAgpNXR+DNqbe+McFDolOzX5epPpjI38VxMXWkpDh9Ox4
         26cQwPWeCd2ouE77JyyyvH4KcWCxnM0OcZ5CQpfLi+93Ky0wtXPqvr5U3MIvJ6SBr1o7
         3P/8vW+4ZCqX/JYRY7vFEZWmDX2oCtL2Yg+PIlbR4mET0Rlz4XgCvavVATbBRECuu9Qs
         pR8MbuX/HUtGW7cdcPrEoAX+Iw+tJlUHQkm6/BCkibBblg9DnlPl4uvfKUXD5IboPBw3
         dgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731714867; x=1732319667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsDfrNuq1BpNubvVDcm0g4dj6+LO9Y4mnLEzGIOpgQI=;
        b=NT0VeGVWhHd/EDCad4cKwZJAb8UKJQKi+V8jl+ml0aMBzvjMl9AYJMFuibjj29hiwO
         w8U0cfAAQ2PFhHN6TQ85/y/Cm187kYCh1Vh1/9D9PeF314et2T28syezPuZ6/qRqsvZA
         QwxeC17gmKRHWJWkZCy5Ww8BIByd3fVcxgaj6LP3MFQ+v13mlytez9WQV3Lkmg6hj1Ch
         qRljmLEaOZm5E6bXh4PuE5zli3po3dvvrl7/6dNdAhj8S1Bdin9lcrOdQYUDOXKqELIB
         0XrB2Am+tccGD1c4xJpNFQbiO0RTuUKHKb8usSjmWh0nHmK4tUZpj9E6RbWLdViOpj/H
         NZjg==
X-Forwarded-Encrypted: i=1; AJvYcCU2UTT/0KciswjYe7G3pAfCGkEB/zqq8F1QckC2d0rOcQ+el6/t+4yEgwRLMxF210NpjxwLQix1jC8+Uvdv@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxlC12wQJne2V6FmNsw0tHFMO4Dma2hFbITQDWHkEwSSDp0qA
	wNIXAwxSHhTVDYXu8+L5MNcI+sZsC1e5luHOOiuJA46lAE/uAzYuJ4qcQPm9LDA=
X-Google-Smtp-Source: AGHT+IF+oLgCV05CL+aBSpp2L550TWgjfBlBmMX9Xz6Y6OXkJiuMh4FE74Y/jwcZzIDt6D6AQ9Y5Xg==
X-Received: by 2002:a05:6512:3b9e:b0:539:fa32:6c84 with SMTP id 2adb3069b0e04-53da47cc059mr3021823e87.18.1731714867336;
        Fri, 15 Nov 2024 15:54:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69ae8015sm662861fa.77.2024.11.15.15.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 15:54:26 -0800 (PST)
Date: Sat, 16 Nov 2024 01:54:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <wfc6nkkm53tkruixgidhyqkcddcay4cxby5uq7lhh6gut6u7su@ok3lqh6fcxge>
References: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
 <20241115225152.3264396-6-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115225152.3264396-6-quic_wasimn@quicinc.com>

On Sat, Nov 16, 2024 at 04:21:52AM +0530, Wasim Nazir wrote:
> Add device tree support for QCS9075 Ride & Ride-r3 boards.
> QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
> boards but without safety monitoring feature of SAfety-IsLand
> subsystem.

Why do we need another set of DTS files? Should we expect more changes
to these DTS files?

> 
> Difference between ride and ride-r3 is the ethernet phy.
> Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |  2 ++
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 12 ++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5d9847119f2e..91c811aca2ca 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -116,6 +116,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> new file mode 100644
> index 000000000000..a04c8d1fa258
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride-r3.dts"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> new file mode 100644
> index 000000000000..9ffab74fb1a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dts"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> +};
> --
> 2.47.0
> 

-- 
With best wishes
Dmitry

