Return-Path: <linux-arm-msm+bounces-25725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0592C2AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34B71F260ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E3015B116;
	Tue,  9 Jul 2024 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfYEGBbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756201B86CC;
	Tue,  9 Jul 2024 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546939; cv=none; b=ZJl2yu6/6WKyl+X/rG7pXJsTv/GjCO0Dc6f1YAuhzTOFj75zO6bRb0xyqW2bIIyPQ+AtrTSaYpTrHfOVt18lRqqGNIL/Yr+zqLhgPzSRQQIpunjIvN0qFPgJBu4PBYaSbEpq+FtMdb+nnblFgmjuQUzSvnMJr22yCAi5Gm4on9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546939; c=relaxed/simple;
	bh=ebW9j0Or29bAV/OIYS8+7Sgp+Pfi23j95sT/HNjJOEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyDaNiOxyv04uSc0CGcnCIIUVgUt8iU3JXT8sNqUBqZJhHJOa878O8xsqN0OwBCj2wR3+fVe7bx2SZh1NyBAOFth6VOoNHTWdDL6zoiImWdOAZSckWQnKusuim0KjsBR8vnk5g5JdvRFLLINFGPNl7qY5T+CgfyXz99OxpmCPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfYEGBbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E133C3277B;
	Tue,  9 Jul 2024 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720546939;
	bh=ebW9j0Or29bAV/OIYS8+7Sgp+Pfi23j95sT/HNjJOEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfYEGBbAmynhpSyZHeUQnL2N2IIoI1WBzjnjOUrC8QYYNbT1aAtAjGkmcif4ylXoH
	 J4ZKX8RcICZpHp/t8deTJ6FeE+2LXMK9qqSpF3r//6DgLQu/iWGc+KDLdSS/lY0xi7
	 a05sEC041+4R21N+LMTJ4NgQGHpQp6kB4VoXLWrVuO86CmjQJ/XqMUsEyDfuJnfsXn
	 Zx9MA7VQQlb0UwbiJMh3qaMU+6B9DJN0oxOLNNGa9t4X92OUm3UCr6vQJRDT9S95Vp
	 exiu0JgErVkBja86lV9E7w7eGAe/tQhDpwWJxmXuARBfHyNepEApKZYNsn6ZJrN/Bd
	 lwmLIzbMVIi3A==
Date: Tue, 9 Jul 2024 18:42:12 +0100
From: Simon Horman <horms@kernel.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@quicinc.com,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] net: stmmac: dwmac-qcom-ethqos: Add QCS9100
 ethqos compatible
Message-ID: <20240709174212.GM346094@kernel.org>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>

On Tue, Jul 09, 2024 at 10:13:16PM +0800, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 
> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Changes in v2:
>   - Split huge patch series into different patch series according to
>     subsytems
>   - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> ---
> Tengfei Fan (2):
>       dt-bindings: net: qcom,ethqos: add description for qcs9100
>       net: stmmac: dwmac-qcom-ethqos: add support for emac4 on qcs9100 platforms
> 
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml  | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml   | 2 ++
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>  3 files changed, 4 insertions(+)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233

I'm assuming that this is a patch for net-next.
But the commit above is not present in net-next,
and this series doesn't apply to net-next.

Please rebase when preparing v3.
And please designate the target tree in the subject.

	Subject: [PATCH net-next v3] ...

Thanks!

