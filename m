Return-Path: <linux-arm-msm+bounces-27431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1889C9420EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 21:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2E641F24965
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 19:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1947218C93D;
	Tue, 30 Jul 2024 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKM4hSs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7648149C41;
	Tue, 30 Jul 2024 19:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722368728; cv=none; b=ZklC8vaDkQP/x4EHDEk30rKM3VthYtd2bZRPNMww0l6KDxMA6xsPeRIhrt9hG/q7ZoYFsiRkONN9d2LLtG7+metkFxQcPJvFNwvQlrLVdJSTFIdqTXhe0B/5WRb1F5Lwu2Xtw3cyBZo97U/FE+KjBa/rSfOVcdcgRe7PxOED7ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722368728; c=relaxed/simple;
	bh=Cn8UGTm+5clbj1815kjTPqeoSHJJ041j85Ym5yyD1oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBB1fsYZOlJHzo1pxWPC6Twk4g/RWSqQccxb4EN2TFFp6p2DIB8XMc/ep7OXneXaIdVlgQZTLnjhi/BMYZbX393oZgv+N80XWqFdN6ovRjhncd0xSvgPJKMfmP5aqbcrpDMM7U3e2HgZtZssnsyNBNsfBGv1iQGBdDysrOC9wNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKM4hSs9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34374C32782;
	Tue, 30 Jul 2024 19:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368727;
	bh=Cn8UGTm+5clbj1815kjTPqeoSHJJ041j85Ym5yyD1oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKM4hSs94pSbl8XDmbASUr+D13FvPq2tlNPTxpf1huOglb+fLDrpNZigvyNl2YhSM
	 /PTHADLsxd+sKipAXOlAppKGc4qbA44CDlEY86inE4tB2L/neWdCci6xc3Swsk2CMX
	 DnpHd5KRcM5Gh4n+G6GbvKbJPiAsq3unNoCQS2/ryvqhK7czQdp9nCw7YXcCx2B77z
	 NDZODbO2Qo8rsBRMW4LfooAeWKSOoJhV9wIVSvYBa3yGRoXMni5DHdYhbqpLpXkmM8
	 f3EN5y7N1Y506GilLvp5UOVLMvcZ+S7YZQcIR7HAP2NZ2hxp06u5MwCiZCTI2jINWy
	 0Cdw4phunBnuA==
Date: Tue, 30 Jul 2024 13:45:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: qcom: smd-rpm: add generic
 compatibles
Message-ID: <172236872511.2035012.2163751854672645367.robh@kernel.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
 <20240729-fix-smd-rpm-v2-2-0776408a94c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-fix-smd-rpm-v2-2-0776408a94c5@linaro.org>


On Mon, 29 Jul 2024 22:52:15 +0300, Dmitry Baryshkov wrote:
> Add two generic compatibles to all smd-rpm devices, they follow the same
> RPMSG protocol and are either accessed through the smd-edge or through
> the glink-edge.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.yaml      |  2 +-
>  .../bindings/remoteproc/qcom,glink-rpm-edge.yaml   |  2 +-
>  .../bindings/remoteproc/qcom,rpm-proc.yaml         |  4 +-
>  .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 74 ++++++++++------------
>  .../devicetree/bindings/soc/qcom/qcom,smd.yaml     |  2 +-
>  5 files changed, 38 insertions(+), 46 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


