Return-Path: <linux-arm-msm+bounces-29759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B996259F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE96BB23128
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A11171E49;
	Wed, 28 Aug 2024 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV0qkUy3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920A4171671;
	Wed, 28 Aug 2024 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843557; cv=none; b=Nxh++9jX25P+OVmh4zV4YJ1Oua5B9z8ApyOegbKm94KpH0LGzcriYWzVKeKltCf7FiQaA/v5owV6o9YiJvSJEZsTrLI47vXr/QKEvlA9QAFhnx+qLu42gR8Vm2fBcbNnRr+vy65UZBnSPMRyxo8C0L6O1JkeIiQMZD+PB/MsbmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843557; c=relaxed/simple;
	bh=s1QIMF4RlOwqmoH8z+Wonlgf5+E5pMBBBGozx8B7p5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVEjPR061ZMM334aKW/t9SmWKei0iDzbS6dH1Bj5lI9xw6+qJxcAy6iVTrtSsejFbKuAu6gd+Q5LmDZ9Ck3Hfr397Xj43jyyQwAN2q6nOAOxn3bFbhhiWyfPzMJT+kM2gKcKVGeThTmZUTY3KcjT7S7qIrOs1BXfGibXtDEYTwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV0qkUy3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DACFC98EC6;
	Wed, 28 Aug 2024 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724843557;
	bh=s1QIMF4RlOwqmoH8z+Wonlgf5+E5pMBBBGozx8B7p5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LV0qkUy3m3tc8CgGItnFIXYbaipSqdQsNp+xtjOmrNe6RN8Hae+FX+f/2yc5DuX47
	 kBuFQO+5BNs4/uv459BXoy4c3aiRgozN2bAmE8yPVlPrX6giWaj9e6rhcMbsUGQWtc
	 bna37ZP2MljP8ZYxR2SL1DJzxJCXQzFQqf5QEb3Ux2DRl1EL0b/fNxBsb1ejIU+QDU
	 DRco5z4n1oMo5trRylRMFd01GNlTWD3B0E8T7cUppmSjdNxtzuZj4b1j8EpFE9UBaw
	 02bGFlknIwadC3dTCBi6daZCQV7KN9XLCiMs9Ozps/kZYh2dCIkXpnwCdJJzvNIblu
	 Eiuuo1U/fvgaQ==
Message-ID: <a70715da-bca5-40e8-be19-034bab8118de@kernel.org>
Date: Wed, 28 Aug 2024 13:12:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
To: Lijuan Gao <quic_lijuang@quicinc.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 4:02 AM, Lijuan Gao wrote:
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

Missing chassis-type (probably = "embedded")

Konrad

