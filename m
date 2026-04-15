Return-Path: <linux-arm-msm+bounces-103236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HwSC09D32nzRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:50:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8340189D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 333C0301371F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164243932C9;
	Wed, 15 Apr 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdKeyfnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E517E3859CE;
	Wed, 15 Apr 2026 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239432; cv=none; b=KFT+E+1wT3DWNqnswclVCYbfHSLmDU7ChDI+FT4QnqbagFZTGUi/AmVZMf5qpaStCkO8wPz1oF+0j7plC5VaoB69A7Iman55RMJ90ShaWGNhGBio4KmlGgVPHtoLKtkcwE3JjO8IjWBvObbyUxqfcPs2wb+MJladxXucXLQy5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239432; c=relaxed/simple;
	bh=b6dM+g3zcR4Nm5rqv1+/vz817x/xjh8qmOtbTgMGBqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH49XlDckseFa3Fsnk77rZ0polsFUaK7Uqlaa+9pvrPd+jQanBX1fC9TiQ+x3CFePEZYkJm3KMl00q0EPYht4OlZMLIGMMlfiWP4Yz2CAMkhtZrXSXa7UKIsbUBpGzjra24MAQrPuev9LIQ08DBKrQneU1vc4aJ9STfuxQ0+zPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdKeyfnW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B69C19424;
	Wed, 15 Apr 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776239431;
	bh=b6dM+g3zcR4Nm5rqv1+/vz817x/xjh8qmOtbTgMGBqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdKeyfnW726LC/PuCaknDfnfOTqsswVZYIGhBAlyzC1I4nfG3L+PR57C07q3CqrdJ
	 9Srr5qQw7sEOGiECYDaZ9VV5mkbAgN1OKOylA1f7jjNqOdRLVLCrvGP9DVjF48U4Sj
	 FTKSUsJy7KoCvgPuIG+QZ74S3ZtQDk5b7aKaiwJdCzCrAS+GmtWVvB6BOIdh3mnNC5
	 gp4Vb1awnbnTapwbaEMIPhRZ7mG2Khr1njBM8djZgkSA59+8rYowIYnfKh0jc93qu+
	 j7ySb7VeCoUIUpKDFCM4+vDCDUNrd/+RG2ZAR81cPu6b2SqZ+4gEnmEXOKFeX1Te0O
	 j3cRUcH3UNAUQ==
Date: Wed, 15 Apr 2026 09:50:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103236-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 93A8340189D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> 
> 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
>    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
>    follower to form a single 8-lane PCIe Gen5 interface
> 
> In bifurcation mode, the hardware design requires controlling additional
> resources beyond the standard pcie3a PHY configuration:
> 
> - pcie3b's aux_clk (phy_b_aux)
> - pcie3b's phy_gdsc power domain
> - pcie3b's bcr/nocsr reset
> 
> Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> 8-lane bifurcation configuration.

Do you describe PCI3A or PCI3B or something combined PCI3?

> 
> The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> requiring the clock-names enum to be extended to support both
> [phy_b_aux, pipediv2] options at index 5. This follows the existing
> pattern used for [rchng, refgen] clocks at index 3.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
>  1 file changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,glymur-qmp-gen4x2-pcie-phy
>        - qcom,glymur-qmp-gen5x4-pcie-phy
> +      - qcom,glymur-qmp-gen5x8-pcie-phy

That's the same device as 5x4, no? One device, one compatible and this
suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?


>        - qcom,kaanapali-qmp-gen3x2-pcie-phy
>        - qcom,qcs615-qmp-gen3x1-pcie-phy
>        - qcom,qcs8300-qmp-gen4x2-pcie-phy
> @@ -68,20 +69,27 @@ properties:
>        - const: ref
>        - enum: [rchng, refgen]
>        - const: pipe
> -      - const: pipediv2
> +      - enum: [phy_b_aux, pipediv2]
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: PCIe PHY power domain. For PHYs supporting
> +          bifurcation mode, this is the leader PHY power domain.
> +      - description: Additional PCIe PHY power domain for PHYs supporting
> +          bifurcation mode, used by the follower PHY.
>  
>    resets:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 4
>  
>    reset-names:
>      minItems: 1
>      items:
>        - const: phy
>        - const: phy_nocsr
> +      - const: phy_b
> +      - const: phy_b_nocsr

And now I doubt that all the changes here are for duplicated node.

Maybe just the commit msg is confusing and instead of describing some
node which combines two other phys just say what device is here being
described.

Best regards,
Krzysztof


