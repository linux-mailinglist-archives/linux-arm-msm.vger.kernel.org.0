Return-Path: <linux-arm-msm+bounces-29711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1796A961FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 08:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76B49B23EBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 06:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB1214B959;
	Wed, 28 Aug 2024 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbDHE9bv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D530A1BC2F;
	Wed, 28 Aug 2024 06:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724826331; cv=none; b=kkh4o8BKsEMPYk4tpoC4ybmtTcpKxmi/o8NkdoQeucvRYec6RpCmlrPTC85UAQ+JVE3/U8mTfh0kd7ToRuu3Ib2FZdUUwJFV3IJP+iEuNr4Dt4fGJ8WXMQGzuioY7TpaVNxZ4bLzIlN/B9JnWFPVGIz6VVLmtOZMrajpB3pY1Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724826331; c=relaxed/simple;
	bh=3pJFadj/uOYX+IMAKfXMeRK5ez0VFC7d4Lt/cF61HuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKEv5PZKh2L/oTh1wIrkDQn3FMk19hhtIY5rb9SxhdPC0i+RkahItySlxYqNLsgdb09iuytGHjILbHxcLHKIBRdL6UbRe3E4nyHs5CFjCDeo7AmJc/EIbzB1mUk4Bx2MHGcouziLmgomN2sXTrPflUPrK/29YblMfkdGTue4Wu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbDHE9bv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDC9C58138;
	Wed, 28 Aug 2024 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724826329;
	bh=3pJFadj/uOYX+IMAKfXMeRK5ez0VFC7d4Lt/cF61HuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbDHE9bveipmpoB5W+YDPjZPqZeIb/9oGLVKJ0vnYHBzu43Hy59fRl9uvtoDPrhVI
	 5ytTsMO6GVToekDibDGFuUhgVmVejqcAGCuDC6fE5AVpsT/RRxDLEVQIWhDAf42U4f
	 bUv+g9Uj2h6D1Ldl17ohxe9nk5ypLxuNceK3GYmzQmNtuyhK6VEr7xqB/fp57ySqKs
	 jpOT++B5qunVW50KZUClPglx/blu6KYH68sh3OtfKFZslnKtWE9qfbDn/Zf/Xf08SC
	 gkOU+vXYWD1M+TSDG/cB8WlXSPRV+Ccan2+tRkEMvFUHRnenFGzQs71Jps/gQV0L45
	 wypTy1N/R9UmA==
Date: Wed, 28 Aug 2024 08:25:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
Message-ID: <22qkvfravm6sxiq3xfavahg2u6b2pwlyzqbqvd55zym5zef3gi@m4bsqkdvggty>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>

On Wed, Aug 28, 2024 at 10:02:16AM +0800, Lijuan Gao wrote:
> Add initial support for Qualcomm QCS615 RIDE board and enable
> the QCS615 RIDE board to shell with dcc console.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 197ab325c0b9..c5503f189847 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -110,6 +110,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> new file mode 100644
> index 000000000000..31d32ad951b5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "qcs615.dtsi"
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
> +
> +	chosen {
> +		bootargs = "console=hvc0";

Noooo, last time I agreed on this, you told me later it is different.

Best regards,
Krzysztof


