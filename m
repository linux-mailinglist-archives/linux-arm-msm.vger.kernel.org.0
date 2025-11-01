Return-Path: <linux-arm-msm+bounces-80010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0658C285E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 20:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54E32189F3B2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 19:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89CC274B56;
	Sat,  1 Nov 2025 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kH9Y+8IL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875A24E00F;
	Sat,  1 Nov 2025 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762023877; cv=none; b=LFGszcm1J2UHknGsszpAIGPzaLsvQFHLLbnuPLLjdl77u1Whn0FqwbLv2FeQ1bgs+gdVgxDCYHnfRkCKlTRY7EjlOzjgt8odHDEHPsc2WLd0PYTg6N/P8i29VtnVj97KtWqLSJE9Bq1FCPQGS2K9RYF65sNNdA8u9DmOgisY0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762023877; c=relaxed/simple;
	bh=5N11yKVyBA+qauA6wVJCmMj0NiycKObSE7fCGo3xjys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoId8jIXNr+jvB44gh9c9Smt5+46KHIAvAipTWb+ngp/IIASrZ8Bn0t80Im8KZYTByhBziJJtL0gpcKCzxncuXtfVNay7x+W7lr5zfQH+mua7u3ixLZyYaOgPOa3/g71+hSQ3BUOVpPQvdDeS1DbtKGB8OHfx9yH+30cD6MJhJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kH9Y+8IL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8B0C4CEF1;
	Sat,  1 Nov 2025 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762023877;
	bh=5N11yKVyBA+qauA6wVJCmMj0NiycKObSE7fCGo3xjys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kH9Y+8ILueNnKPneXNt5fwfPm/ofB3cPnMshe3SJPi/HKx6qXT4ahLSrckAwChBkq
	 TBKyMmmSPR31BfhE16ouOKlKt6kDLIdJe+DXs94mxHF+alnlEXZ8XE4DB5M/3VMOAc
	 9+vRVL+5kJE5HrolhJSgQJCDpe1eliPa1Dy3WnpdFTDLZ/Lxn72G1Y6GqiHDHMzwrs
	 eYkibhh/VegjtSqDVM1nvx720IiemqdXGmER5MPdTIoGxEXIxYJ2bPUdLEEZkGeQPB
	 FZfYyxSjAR3Po6zeSDbgcRhTbmuooNYW4dZu9gd6Jufm1XLDAbNyPcsBA8ZZkbB1cl
	 ovpMI5VBmd5mA==
Date: Sat, 1 Nov 2025 14:07:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add header file for IPCC
 physical client IDs on Kaanapali platform
Message-ID: <hwrbtnxy2jy5wimgvr6s4de2iuu44njnefmxlgzn5onj47b7b3@l5nj3zhhgvc5>
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
 <20251031-knp-ipcc-v3-2-62ffb4168dff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-knp-ipcc-v3-2-62ffb4168dff@oss.qualcomm.com>

On Fri, Oct 31, 2025 at 12:41:45AM -0700, Jingyi Wang wrote:

Whenever you have a subject line that ends in "on <soc/platform>",
that's a good indicator that you're missing something in the subject
prefix.

Compare:
arm64: dts: qcom: Add header file for IPCC physical client IDs on Kaanapali platform

with:
arm64: dts: qcom: kaanapali: Add IPCC client IDs


Also, now that this is "devicetree", it would make sense to merge them
together with the users. Or at least after we've introduced
kaanapali.dtsi...


I don't think you need to resubmit this though, I can fix up the subject
when I merge. But please get to the point where it makes sense to merge
them as fast as possible.

Regards,
Bjorn

> On earlier platforms, Inter Process Communication Controller (IPCC) used
> virtual client IDs and performed virtual-to-physical mapping in hardware,
> so the IDs defined in dt-bindings/mailbox/qcom-ipcc.h are common across
> platforms. Physical client IDs instead of virtual client IDs are used for
> qcom new platforms like Kaanapali, which will be parsed by the devicetree
> and passed to hardware to use Physical client IDs directly. Since physical
> client IDs could vary across platforms, add a corresponding header file
> for the Kaanapali platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-ipcc.h | 58 +++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-ipcc.h b/arch/arm64/boot/dts/qcom/kaanapali-ipcc.h
> new file mode 100644
> index 000000000000..125375a4aac0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-ipcc.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DTS_KAANAPALI_MAILBOX_IPCC_H
> +#define __DTS_KAANAPALI_MAILBOX_IPCC_H
> +
> +/* Physical client IDs */
> +#define IPCC_MPROC_AOP			0
> +#define IPCC_MPROC_TZ			1
> +#define IPCC_MPROC_MPSS			2
> +#define IPCC_MPROC_LPASS		3
> +#define IPCC_MPROC_SDC			4
> +#define IPCC_MPROC_CDSP			5
> +#define IPCC_MPROC_APSS			6
> +#define IPCC_MPROC_SOCCP		13
> +#define IPCC_MPROC_DCP			14
> +#define IPCC_MPROC_SPSS			15
> +#define IPCC_MPROC_TME			16
> +#define IPCC_MPROC_WPSS			17
> +
> +#define IPCC_COMPUTE_L0_CDSP		2
> +#define IPCC_COMPUTE_L0_APSS		3
> +#define IPCC_COMPUTE_L0_GPU		4
> +#define IPCC_COMPUTE_L0_CVP		8
> +#define IPCC_COMPUTE_L0_CAM		9
> +#define IPCC_COMPUTE_L0_CAM1		10
> +#define IPCC_COMPUTE_L0_DCP		11
> +#define IPCC_COMPUTE_L0_VPU		12
> +#define IPCC_COMPUTE_L0_SOCCP		16
> +
> +#define IPCC_COMPUTE_L1_CDSP		2
> +#define IPCC_COMPUTE_L1_APSS		3
> +#define IPCC_COMPUTE_L1_GPU		4
> +#define IPCC_COMPUTE_L1_CVP		8
> +#define IPCC_COMPUTE_L1_CAM		9
> +#define IPCC_COMPUTE_L1_CAM1		10
> +#define IPCC_COMPUTE_L1_DCP		11
> +#define IPCC_COMPUTE_L1_VPU		12
> +#define IPCC_COMPUTE_L1_SOCCP		16
> +
> +#define IPCC_PERIPH_CDSP		2
> +#define IPCC_PERIPH_APSS		3
> +#define IPCC_PERIPH_PCIE0		4
> +#define IPCC_PERIPH_PCIE1		5
> +
> +#define IPCC_FENCE_CDSP			2
> +#define IPCC_FENCE_APSS			3
> +#define IPCC_FENCE_GPU			4
> +#define IPCC_FENCE_CVP			8
> +#define IPCC_FENCE_CAM			8
> +#define IPCC_FENCE_CAM1			10
> +#define IPCC_FENCE_DCP			11
> +#define IPCC_FENCE_VPU			20
> +#define IPCC_FENCE_SOCCP		24
> +
> +#endif
> 
> -- 
> 2.25.1
> 

