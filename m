Return-Path: <linux-arm-msm+bounces-38775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD50F9D5A19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A34E1F236EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7CA170A00;
	Fri, 22 Nov 2024 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7gAYW49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41C165EE3;
	Fri, 22 Nov 2024 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261121; cv=none; b=MYKDBlEyi8zunVU1/AH5CPiT/F72ZH5r4GBh2CgYrYbejjM+YAUo5eCI/LRhcLtKXkJrmdxIYaatD8eUWkvWY58RKuoYZkO0C74Q7aX9mK8jsNo+fOXzObg0f5fbE3ryd53cHv6eoKwDrjXPceXVHS8kiTXNtju/QzFamG9ukb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261121; c=relaxed/simple;
	bh=Il4u2JmKDCqigPfRRYGfxmRB1iP4DLOiIY1PedxhxEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc7Gw6x9C0comkNzqskkcW+SWTaPky3ac3yTStyCpAXOvI3Gy+TOmTmGmqrDvxl0uWMt0A0fLA/0utEwXfdHeRw83XdNwVqE3g3McxyTVI42+HGJtuNDs/5nnDJqPvgrrtvFtoadBxE59pXRdAr9iRajz5pbfJ3VgTUHsLiAZTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7gAYW49; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F754C4CECE;
	Fri, 22 Nov 2024 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732261121;
	bh=Il4u2JmKDCqigPfRRYGfxmRB1iP4DLOiIY1PedxhxEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7gAYW49N2xAlLY+uS+rUOgVk2yvCC40uzA0KE8BvOaEPCmP0L4ti3VAEea5+eidP
	 8AjTLg4COd0PPjfAPm28xiafKY2YinZXcdWbK88MyAfzxRZIT2+nnAodi7qGSW2GNz
	 UaaD89+d9An15M/84bRSyiXb1QX6X0t84Ny0KyuoirP84M7NFblj+YcIyramAFmQAD
	 r2eW1w6AZI4ErSacmpdjVUi3oM7mni+1FyOMlpkZJzNL87ON+Jfyjni5PBeY35l1ux
	 RKn+kJaTUhFu+766u3FZcMwHH8XP7dK4qXoI36hSk1EvPrMSuK/GkblOA+RI4S2SNa
	 6R86tJqYS7R5g==
Date: Fri, 22 Nov 2024 08:38:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_tsoni@quicinc.com, 
	quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the QCS615 QMP PCIe PHY Gen3 x1
Message-ID: <dpuqj6hsqourl7ln66maezhcpmdrnnju22u5vs7mvre5aotkki@y6p2bbkre6pf>
References: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
 <20241122023314.1616353-2-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122023314.1616353-2-quic_ziyuzhan@quicinc.com>

On Fri, Nov 22, 2024 at 10:33:09AM +0800, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Document the QMP PCIe PHY on the QCS615 platform.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


