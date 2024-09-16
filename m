Return-Path: <linux-arm-msm+bounces-31833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE097A486
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F7D1C21842
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 14:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1955B1586C9;
	Mon, 16 Sep 2024 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzYPAk6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC420157E6B;
	Mon, 16 Sep 2024 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498386; cv=none; b=GqFcDwNZ0BP37NaADj6ZkNY1wjslNz1nav4o3eOxi4isW/13RJ8qfsLLVNBw+N1iNustpnMiY2/AC5McoQakLXQ+TmdyFu1aSxv882jCl6DvccgfMEdXipbind4epvX197yhrpoW9jQxKc5oJgSQwylgChfQBABN8NjJo8X0NLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498386; c=relaxed/simple;
	bh=ctZwLzZwC/S01hY87aaTXyQxeQL1P/gwLYvLGpwJ9ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQIZ48+pjpU12VBtOf0qyJq4pRfStXNaojnjbgFxVTEOK9MGtJ6uxgiXyWD91n2YMgHoanDxPK5vxK+7M8n8TCFG/R3AJ2KcQp6qz9WZINnUYE2HUhYz+1UxI7tshVmAuw+MsGMQuszBtsXudRx76YALPaVUPhnsfAKgtnnSbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzYPAk6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56461C4CEC4;
	Mon, 16 Sep 2024 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498385;
	bh=ctZwLzZwC/S01hY87aaTXyQxeQL1P/gwLYvLGpwJ9ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzYPAk6vU0dptH0UPZ7h+cKXnSR27tIxN6AzthzifB2bvw+U38KVuOX1ZzHumkhd2
	 P+E1PVKkXedgw0oJXY3T6nZfUEBrE0Gj5MOPRpwMOHVbEFm5fTY/4/GKg1jCJlrVZi
	 +mvh4Gz3TbgbiJgzR8Ua7kRxOXL09ODDu8R084FX+AYzOw9vtLZTL8KSIViFuyACN1
	 APHGWmCD1yG3UnebYl9SdaszcSHQMjs6vMrSzH9pbq7r5bSfh0h7sBVzGW1BQga6e8
	 gJkvJpLLWCy6pc/AyK8ZLwoV0hvr9aBJLgc1M8uonFXm7UdrkrSxOodM1AVEU2r3Vc
	 1lNAPMsxTK8GQ==
Date: Mon, 16 Sep 2024 16:53:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: phy: Add QMP UFS PHY comptible for
 QCS8300
Message-ID: <ztpetznwid2om6vylyl2boi665ch3wnkprkmzcq6bem6cqhqtf@ogsi657y4kex>
References: <20240911-qcs8300_ufs_phy_binding-v2-1-c801a2d27a84@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_ufs_phy_binding-v2-1-c801a2d27a84@quicinc.com>

On Wed, Sep 11, 2024 at 02:56:16PM +0800, Jingyi Wang wrote:
> From: Xin Liu <quic_liuxin@quicinc.com>
> 
> Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
> on the SA8775P.
> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
> Changes in v2:
> - decoupled from the original series.
> - Use fallback to indicate compatibility with SA8775P.
> - typo fixup
> - Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 46 ++++++++++++----------
>  1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index f9cfbd0b2de6..626a2039e177 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -15,26 +15,31 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,msm8996-qmp-ufs-phy
> -      - qcom,msm8998-qmp-ufs-phy
> -      - qcom,sa8775p-qmp-ufs-phy
> -      - qcom,sc7180-qmp-ufs-phy
> -      - qcom,sc7280-qmp-ufs-phy
> -      - qcom,sc8180x-qmp-ufs-phy
> -      - qcom,sc8280xp-qmp-ufs-phy
> -      - qcom,sdm845-qmp-ufs-phy
> -      - qcom,sm6115-qmp-ufs-phy
> -      - qcom,sm6125-qmp-ufs-phy
> -      - qcom,sm6350-qmp-ufs-phy
> -      - qcom,sm7150-qmp-ufs-phy
> -      - qcom,sm8150-qmp-ufs-phy
> -      - qcom,sm8250-qmp-ufs-phy
> -      - qcom,sm8350-qmp-ufs-phy
> -      - qcom,sm8450-qmp-ufs-phy
> -      - qcom,sm8475-qmp-ufs-phy
> -      - qcom,sm8550-qmp-ufs-phy
> -      - qcom,sm8650-qmp-ufs-phy
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-qmp-ufs-phy
> +          - const: qcom,sa8775p-qmp-ufs-phy
> +      - enum:
> +          - qcom,msm8996-qmp-ufs-phy
> +          - qcom,msm8998-qmp-ufs-phy
> +          - qcom,sa8775p-qmp-ufs-phy
> +          - qcom,sc7180-qmp-ufs-phy
> +          - qcom,sc7280-qmp-ufs-phy
> +          - qcom,sc8180x-qmp-ufs-phy
> +          - qcom,sc8280xp-qmp-ufs-phy
> +          - qcom,sdm845-qmp-ufs-phy
> +          - qcom,sm6115-qmp-ufs-phy
> +          - qcom,sm6125-qmp-ufs-phy
> +          - qcom,sm6350-qmp-ufs-phy
> +          - qcom,sm7150-qmp-ufs-phy
> +          - qcom,sm8150-qmp-ufs-phy
> +          - qcom,sm8250-qmp-ufs-phy
> +          - qcom,sm8350-qmp-ufs-phy
> +          - qcom,sm8450-qmp-ufs-phy
> +          - qcom,sm8475-qmp-ufs-phy
> +          - qcom,sm8550-qmp-ufs-phy
> +          - qcom,sm8650-qmp-ufs-phy
>  
>    reg:
>      maxItems: 1
> @@ -85,6 +90,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,msm8998-qmp-ufs-phy
> +              - qcom,qcs8300-qmp-ufs-phy

Not needed.

BTW, please be sure you organize your patchsets per subsystem. IOW, that
you do not split same subsystem bindings patches into separate
patchsets.

Best regards,
Krzysztof


