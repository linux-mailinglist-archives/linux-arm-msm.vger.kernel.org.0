Return-Path: <linux-arm-msm+bounces-52432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D192EA6EB59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 09:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62AE51699E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C71A155C87;
	Tue, 25 Mar 2025 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6jf3yMo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE732E3367;
	Tue, 25 Mar 2025 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742890803; cv=none; b=QZnS4JO01r0tsaMbXTIVMLCMvMu+YYPMwFJ80wwFoq9lbBLcc1MNMSNq9eYzhg9t4TuNVC51SqVOWMFR+HUlnsoQWbiHmimfxXTtfHo5lEXkfGopNzvMDYdLTcFHYdWrkdxEFGZSRY9lw2avnKi1LlCG1O4JcGDLzJJjsZq+9kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742890803; c=relaxed/simple;
	bh=65J1Y1jSFMd8igm1QVIoq+zLF9Z+4+XgAc0a1xWvHnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpLZsII/70LzcLEnwWwb+r+CtFzSnxsaONo7RaxMiyiqSqKS30bB8bam0mkpi+ICfmyqR4BwCPMM1lRi1eaJf5tL3MCrhF/J0BlSVpnoNmLAcGmHfggXhxtsXr8oxCnbiih3+pwKGdjoGc6Z6foxjn027WSSF0KXrFbWGAhmEME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6jf3yMo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68236C4CEE4;
	Tue, 25 Mar 2025 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742890802;
	bh=65J1Y1jSFMd8igm1QVIoq+zLF9Z+4+XgAc0a1xWvHnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l6jf3yMoj4H50aEmmsFF1RqWOzeqOM2AF3SVjbAL/zbpeSG+fy4J3hpSv5Df5THWB
	 b1CvSC7uhXXQXVIGGWa7DQPyUgzYNaxlLFE3X11nO009NFS1v5vxOCbcz2q5HQLO47
	 jGyWvFLf3zFsfPYKyEY3BW0P640l7+z0tOKD9RL+E8odECvzljhAJ3UMhBMubDM21A
	 NRdHpwY3ocx+Rn8DBStXxkvplcvW5kopp77si+B6K+jbGY2mWLs6HnBFnYoGaqTfZY
	 cm+Z8HbHeV0Lt5s2ZwalZlMifl0Gm1+Sga/s9MhwJ2iNA1eyK7Wrf0eWd8w4gzoiuK
	 yjMB81eHND6+Q==
Date: Tue, 25 Mar 2025 09:19:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kkumarcs@quicinc.com, 
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, 
	quic_leiwei@quicinc.com
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
Message-ID: <20250325-imposing-wine-jackdaw-fb0af2@krzk-bin>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-1-3ea8e5262da4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-1-3ea8e5262da4@quicinc.com>

On Fri, Mar 21, 2025 at 08:49:52PM +0800, Luo Jie wrote:
> The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
> input clock. The output clocks are the same as IPQ9574 SoC, except
> for the clock rate of output clocks to PPE and NSS.
> 
> Also, add macros for clock rates that are applicable specifically
> only for IPQ5424.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml        |  1 +
>  include/dt-bindings/clock/qcom,ipq-cmn-pll.h                   | 10 +++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> index f869b3739be8..bbaf896ae908 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> @@ -25,6 +25,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,ipq9574-cmn-pll
> +      - qcom,ipq5424-cmn-pll

Same comments as before... keep the order.

>  
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
> index 936e92b3b62c..e30d57001c38 100644
> --- a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
> +++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>  /*
> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
> @@ -19,4 +19,12 @@
>  #define ETH1_50MHZ_CLK			7
>  #define ETH2_50MHZ_CLK			8
>  #define ETH_25MHZ_CLK			9
> +
> +/*
> + * The CMN PLL output clock rates that are specifically applicable for IPQ5424
> + * SoC. For IPQ5424, the other output clocks and their rates are same as IPQ9574.

Just come with different header. Why was this called in generic way,
since we ask to name the headers based on compatible?

Best regards,
Krzysztof


