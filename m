Return-Path: <linux-arm-msm+bounces-52433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D558A6EB70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 09:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96EE47A2B9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FCC197A7A;
	Tue, 25 Mar 2025 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxOv19OM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2271531E8;
	Tue, 25 Mar 2025 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742890927; cv=none; b=HMyEqp8G2wpz6h7tw34PTURUfuNqEmyB8yKgXdrFth470fTtJFzpWR3CWZBJNwxSxarfG8KaBO3dXVLeSJPjze94teHfscaW5c0Z3PJvQVGGYa8e0GoUcvWoQ7jF+abeuErv3SXLg8eY5AfpOiVXkzjJk8to2z1Bm8PhBawM9wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742890927; c=relaxed/simple;
	bh=9cAY2McCQXS48N57VtIiW94xQLdP98mhy8C3wDAuzFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KY04RAsZLNg6nwUNikU6icXQ8b9WdKkcHsrOrC/JxokZaTNMZDu5QIIXReQ/CNn9JToDcut9lwSc3N1i/zhCGpXhhga5odS3otfl0zYO4SWF3IMBEmMqt5xhINhrm2BQ5KhUViAw5UPxrlciM7KZcYX9I6xmSOvIRxi+MDDjcOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxOv19OM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394EEC4CEE4;
	Tue, 25 Mar 2025 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742890925;
	bh=9cAY2McCQXS48N57VtIiW94xQLdP98mhy8C3wDAuzFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxOv19OMcYl+EhDQ6JmMwr+BB8QSESmhtQo3KzTnvYw1Ru28mw0dDmiR6HN/TF4yx
	 XFo3AmJHVehi8pF9oP6/82cUtgvo0jO4ihb2N/E/WvaJwJROzXLpinttjjqjg522Jq
	 wBGJUr5MlVBR6JbbvN/E61TBhnILM5fDVUtPPW9drfyjytnu6ya79SOVbtoSkX9wOw
	 JZv2+9GsQPYvdbcbKuhGyxPChJCsacoRgz4iOO4Lf7FujbaLdeqvdohNCTA/VQ7bLk
	 6LIxLKWqEWlRhSraoODwPNLUsJ7+b3L5CO2jqKJWB4l89kQXxH8FNGT0ASCOWf3his
	 FwreK2GWIHRBw==
Date: Tue, 25 Mar 2025 09:22:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luo Jie <quic_luoj@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kkumarcs@quicinc.com, 
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, 
	quic_leiwei@quicinc.com
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
Message-ID: <20250325-victorious-flamingo-of-destiny-c778a3@krzk-bin>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-1-3ea8e5262da4@quicinc.com>
 <55eada15-222e-4b97-a519-95b5e3aa7c23@oss.qualcomm.com>
 <ba6cbf94-3e78-4c77-8c4f-908d3d90a1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ba6cbf94-3e78-4c77-8c4f-908d3d90a1b1@oss.qualcomm.com>

On Tue, Mar 25, 2025 at 12:59:49AM +0100, Konrad Dybcio wrote:
> On 3/25/25 12:57 AM, Konrad Dybcio wrote:
> > On 3/21/25 1:49 PM, Luo Jie wrote:
> >> The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
> >> input clock. The output clocks are the same as IPQ9574 SoC, except
> >> for the clock rate of output clocks to PPE and NSS.
> >>
> >> Also, add macros for clock rates that are applicable specifically
> >> only for IPQ5424.
> >>
> >> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> >> ---
> >>  .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml        |  1 +
> >>  include/dt-bindings/clock/qcom,ipq-cmn-pll.h                   | 10 +++++++++-
> >>  2 files changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> >> index f869b3739be8..bbaf896ae908 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> >> @@ -25,6 +25,7 @@ properties:
> >>    compatible:
> >>      enum:
> >>        - qcom,ipq9574-cmn-pll
> >> +      - qcom,ipq5424-cmn-pll
> >>  
> >>    reg:
> >>      maxItems: 1
> >> diff --git a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
> >> index 936e92b3b62c..e30d57001c38 100644
> >> --- a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
> >> +++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
> >> @@ -1,6 +1,6 @@
> >>  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>  /*
> >> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> >>   */
> >>  
> >>  #ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
> >> @@ -19,4 +19,12 @@
> >>  #define ETH1_50MHZ_CLK			7
> >>  #define ETH2_50MHZ_CLK			8
> >>  #define ETH_25MHZ_CLK			9
> >> +
> >> +/*
> >> + * The CMN PLL output clock rates that are specifically applicable for IPQ5424
> >> + * SoC. For IPQ5424, the other output clocks and their rates are same as IPQ9574.
> >> + */
> >> +#define NSS_300MHZ_CLK			4
> >> +#define PPE_375MHZ_CLK			5
> > 
> > Not a huge fan of this, such differences are only relevant to the driver
> > part in my view - bindings only let a consumer reference a specific piece
> > of hardware
> 
> Oh I the bindings are stepping into the frequency department already,
> hmm.. Then I suppose it's fine if the dt-bindings maintainers don't have any
> concerns


Nooooo, it was said these are output clocks, not rates. If these are
rates, then NAK.

Best regards,
Krzysztof


