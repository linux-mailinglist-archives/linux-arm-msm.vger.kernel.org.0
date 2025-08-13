Return-Path: <linux-arm-msm+bounces-68991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DBB24AEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 15:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78921BC8406
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F8D2EFD98;
	Wed, 13 Aug 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ue8xZgup"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596C22EF67E;
	Wed, 13 Aug 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092482; cv=none; b=WmWybOLTUsTubGxLsDI0A1xTUocFbc02L56oonT/NI59PASo9xEdl9ylN2Z6KkT5Md0KptwkOuRmhypGYsstZvtkZVGo61scXIrdkq5YL/O9BmWfJGKcZsqUM+NYstm7goed3Mzyb8qxuDp6JYnJF6PiNDcfxxJQIymtmML2Yr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092482; c=relaxed/simple;
	bh=75ouafMcM1RjH+OPfqPokKQM96pO03FrNAvY+f1w4rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFXNNe2DjfxIyXLEMw7hCVifEzZAphlMPx4T7e4ctePkbo41T2UvsxtDNgy1k5Pu0x489/3xgtczD1A76zUAIViIpj42F9Xyvp700GthRAPEgWkIS/s1u42f2n9cJBYyFxu0KCjPjrQ8W/n7xlII0IBYUlC4jX/ncQ6nWgDNnxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ue8xZgup; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6D6C4CEEB;
	Wed, 13 Aug 2025 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755092482;
	bh=75ouafMcM1RjH+OPfqPokKQM96pO03FrNAvY+f1w4rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ue8xZgupZ2fj4mz+/5wAFT15002hRkaONYVFAbqNeIgg8azyWa7iK/J2eodrdY1a5
	 /a/MQAyrRYvkz4K/no/ljvc16eJDqVQ+b6uohxsmlg7cEknHiMKFvp4C4jGY5fsG6t
	 zVjdZOVfGyIZ3U2fWicUDzzj/kN6snx+s8ormGhust17E05YXIfdA0yH0SyIxuKZ6c
	 AM03ro2iboMqZGct4GvlFCZo407CYVP973LdclVevz0oJJf+gSJ5tWXtHKoCCzz/+Z
	 ps0CoGp89+Tl8Y2v2YmSMPsRxjWCT42PyXQWtGblsn5yf1DKIuAFX7NIE/HD8N3QnC
	 ymh1RqmY9fc6A==
Date: Wed, 13 Aug 2025 08:41:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
Message-ID: <2ckimmzf6swpmckgaxw4ys4ocxhhno3pzx7fidqgzftfhww6tt@jiq2q72jgonf>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>

On Wed, Aug 13, 2025 at 01:25:18PM +0530, Taniya Das wrote:
> The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
> this to the TCSR clock controller binding together with identifiers for
> the clocks.
> 

Very nice, thank you!

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
>  include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> index 2ed7d59722fc7e1e8ccc3adbef16e26fc44bf156..2c992b3437f29b38d9c73e3c600f2c55e0b8ae98 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> @@ -8,12 +8,14 @@ title: Qualcomm TCSR Clock Controller on SM8550
>  
>  maintainers:
>    - Bjorn Andersson <andersson@kernel.org>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>  
>  description: |
>    Qualcomm TCSR clock control module provides the clocks, resets and
>    power domains on SM8550
>  
>    See also:
> +  - include/dt-bindings/clock/qcom,glymur-tcsr.h
>    - include/dt-bindings/clock/qcom,sm8550-tcsr.h
>    - include/dt-bindings/clock/qcom,sm8650-tcsr.h
>    - include/dt-bindings/clock/qcom,sm8750-tcsr.h
> @@ -22,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,glymur-tcsr
>            - qcom,milos-tcsr
>            - qcom,sar2130p-tcsr
>            - qcom,sm8550-tcsr
> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..72614226b113bb60f1e430fc18e13c46c8b043d3
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
> +#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
> +
> +/* TCSR_CC clocks */
> +#define TCSR_EDP_CLKREF_EN					0
> +#define TCSR_PCIE_1_CLKREF_EN					1
> +#define TCSR_PCIE_2_CLKREF_EN					2
> +#define TCSR_PCIE_3_CLKREF_EN					3
> +#define TCSR_PCIE_4_CLKREF_EN					4
> +#define TCSR_USB2_1_CLKREF_EN					5
> +#define TCSR_USB2_2_CLKREF_EN					6
> +#define TCSR_USB2_3_CLKREF_EN					7
> +#define TCSR_USB2_4_CLKREF_EN					8
> +#define TCSR_USB3_0_CLKREF_EN					9
> +#define TCSR_USB3_1_CLKREF_EN					10
> +#define TCSR_USB4_1_CLKREF_EN					11
> +#define TCSR_USB4_2_CLKREF_EN					12
> +
> +#endif
> 
> -- 
> 2.34.1
> 

