Return-Path: <linux-arm-msm+bounces-102208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHdsMZgv1WmU2AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4699A3B1C84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8669E3057A91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 16:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D117030F55F;
	Tue,  7 Apr 2026 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvI26XIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B11A4F2F;
	Tue,  7 Apr 2026 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578393; cv=none; b=ixmN94qCKYVylLXmLDc2xO69ymBXOuGN15wyxEKZw7c0q8vDmymOK0smQnziECLb4/2wSRH2XiSRgMFTEG/zayvSUR/SqHyHiLtKdyUIn/1S93H1KksIDalvlFXGXgx9f0VoP0y5F4OJRTAhr1IUiItLdx2rslDPSNFRb488U/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578393; c=relaxed/simple;
	bh=BU7sBThUtcK5sM5FxqZ5b7vi7KzzAI5uMjGipaSr3Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqIC6kCPnh1ltLvKRsiI1mx03FZgHFbHw8zgQXf8Hcql9zaew0tizXwt4l8F5jnZrhNyhZL3CGyxZWOaJ3bdKl94JZ1WuUCcA85ST0NiXQTW3trog6vCdZsIoPBr36NUwXSwiH5lDRtcXWGoHuG9OiFsRx3H8ZSdhrNwYh39heM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvI26XIl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2BAC19424;
	Tue,  7 Apr 2026 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578393;
	bh=BU7sBThUtcK5sM5FxqZ5b7vi7KzzAI5uMjGipaSr3Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvI26XIlfrxoKpynrw8j4j7F84fpqZ0MBBnmWNCTPUleDTf1CEeu1KL5dp1YvHz8E
	 /RX1Sg9E9GvNsWWfRgZEj1QLuU5ryQVU26UHUh7g9bW0t8LSw16PM3bKf89G+iuIUm
	 K0Kiw33NFbSa38MegXdGR2FskZmYoDDCv0CCuWzRzGi7z+u/yXr66Zg+ObVVavGcV6
	 ElndDPXe7l9jTml6WLGemlcNuZMkTAIeQL4BnvdsIa2RfTeMpvM917oF/Pgq+v8ED3
	 fQXsyQJs3hNrQratHD8jEVIFxi/NXb2A9VsBqk03WY9z9n36nERQOEDk1W3z+nHjOL
	 w7ZjGJR5PZOLg==
Date: Tue, 7 Apr 2026 11:13:11 -0500
From: Rob Herring <robh@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <20260407161311.GA2666255-robh@kernel.org>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-1-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-1-ce0fc07f0e52@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102208-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4699A3B1C84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:15:28AM -0700, Qiang Yu wrote:
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
> 
> The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> requiring the clock-names enum to be extended to support both
> [phy_b_aux, pipediv2] options at index 5. This follows the existing
> pattern used for [rchng, refgen] clocks at index 3.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 45 ++++++++++++++++++----
>  1 file changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..25717bc9be98824e38f3c27c3299fbd1f2e7e299 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,glymur-qmp-gen4x2-pcie-phy
>        - qcom,glymur-qmp-gen5x4-pcie-phy
> +      - qcom,glymur-qmp-gen5x8-pcie-phy
>        - qcom,kaanapali-qmp-gen3x2-pcie-phy
>        - qcom,qcs615-qmp-gen3x1-pcie-phy
>        - qcom,qcs8300-qmp-gen4x2-pcie-phy
> @@ -68,20 +69,23 @@ properties:
>        - const: ref
>        - enum: [rchng, refgen]
>        - const: pipe
> -      - const: pipediv2
> +      - enum: [phy_b_aux, pipediv2]
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

Once there is more than 1, you have to define the order and what each 
one is for.

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
>  
>    vdda-phy-supply: true
>  
> @@ -183,6 +187,7 @@ allOf:
>              enum:
>                - qcom,glymur-qmp-gen4x2-pcie-phy
>                - qcom,glymur-qmp-gen5x4-pcie-phy
> +              - qcom,glymur-qmp-gen5x8-pcie-phy
>                - qcom,qcs8300-qmp-gen4x2-pcie-phy
>                - qcom,sa8775p-qmp-gen4x2-pcie-phy
>                - qcom,sa8775p-qmp-gen4x4-pcie-phy
> @@ -201,6 +206,17 @@ allOf:
>          clock-names:
>            minItems: 6
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,glymur-qmp-gen5x8-pcie-phy
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2

else:
  maxItems: 1

> +
>    - if:
>        properties:
>          compatible:
> @@ -223,11 +239,24 @@ allOf:
>          reset-names:
>            minItems: 2
>      else:
> -      properties:
> -        resets:
> -          maxItems: 1
> -        reset-names:
> -          maxItems: 1
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,glymur-qmp-gen5x8-pcie-phy
> +      then:
> +        properties:
> +          resets:
> +            minItems: 4
> +          reset-names:
> +            minItems: 4
> +      else:
> +        properties:
> +          resets:
> +            maxItems: 1
> +          reset-names:
> +            maxItems: 1
>  
>    - if:
>        properties:
> 
> -- 
> 2.34.1
> 

