Return-Path: <linux-arm-msm+bounces-92055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOFjL/QAhml0JAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 15:55:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6063DFF549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 15:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7F8F3003D2F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 14:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FDD42189B;
	Fri,  6 Feb 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diPyb16v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8577430BB81;
	Fri,  6 Feb 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389745; cv=none; b=b/cB8tuFStY4WFpWOVOSgCn2xC7HJhJ9GfcA1e4F5an3tE0U8+OTxfEknDSfObGKYC2FYDR9OPdGDCjzpSFHbYJB8+2+KGDNdoecNpNJGXEDQ7x3YO/kfAAIcPVw4pCEKv/VHhOdkxBSEBlAxxXqObl3jUMyFdfpUimUs0zJY10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389745; c=relaxed/simple;
	bh=K4D933CLNSrhBl61ujkOLQkUiB+hu1yKMNUMa0qCVf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMJwxSUgWy/s7w0MCMHiUOdooMXp4OQ5nA+3qhqgtg00mFgXtl0JZkMQ6Si4XOzg4z8gmv6qOglyywDgSy42xqL1Fdyv46/Dg0cd4mUVuHbxj1niUsVIV6OVTlRbHFnmdB2dvYbWhbUKZsaEiQKP6JXVoxYwtO/80EE9dTxXMY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diPyb16v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EA5C116C6;
	Fri,  6 Feb 2026 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770389745;
	bh=K4D933CLNSrhBl61ujkOLQkUiB+hu1yKMNUMa0qCVf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diPyb16vr4AvPEo+WYYsSvPdCeCDqFQhu4jx5xmcpZ+LId+oD+ijUN+PuSLd3vEB9
	 al/JZZTRPKxxNBfnCyIrUI61edWCDedxB93s0Z8jf2OfhFNavYRzhk4fBZrNxGIeOO
	 dngAo/sfAwYTzCSNSwoB/F/etZBkKsHydLlzn6UZMETxmBdMqeLSXhmrxWJPrAJWUC
	 MYMBlcCNqklcU6tmsS8hxgK0M0FH4/r3Do6+72ooYFVT7b65JJpfAEQcJJ9mWc/gnv
	 Uo2f7885I/U6hxvZTAFCMY3Reic5gUzhAQ1mPu+xfPzw5icpZip01XcA7Sp8DaYSDp
	 rbiuAM6ZaIE9g==
Date: Fri, 6 Feb 2026 08:55:44 -0600
From: Rob Herring <robh@kernel.org>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
Message-ID: <20260206145544.GA207233-robh@kernel.org>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92055-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6063DFF549
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 03:38:22PM -0800, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> independent High-Speed UTMI paths, depending on the SoC. Each path is
> distinct with its own HS-PHY interface, connector/controller wiring, and
> UTMI routing behavior. The EUD hardware sits between the USB2 PHY and
> the USB controller on each path.
> 
> The existing binding models only a single UTMI path and does not provide
> a way to associate the required High-Speed USB PHY. EUD relies on the
> HS-PHY on the selected UTMI path for link signalling and correct operation
> of the hardware.
> 
> Historically, EUD has worked on platforms that use a single UTMI path
> because the USB controller maintains ownership of the PHY during
> enumeration and normal operation. This implicit relationship allowed
> EUD to function even though the dependency on the PHY was not described
> in the binding. However, this behavior is not guaranteed by hardware.
> The current binding description is not sufficient for SoCs that expose
> two independent UTMI paths, where the PHY association and port wiring
> must be explicitly described.
> 
> Introduce per-path eud-path child nodes so each UTMI path can describe
> its HS-PHY, port connections, and the role‑switching capability of its
> associated USB port.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,eud.yaml           | 100 +++++++++++++-----
>  1 file changed, 74 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8..0507252dbf27 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -10,8 +10,11 @@ maintainers:
>    - Souradeep Chowdhury <quic_schowdhu@quicinc.com>
>  
>  description:
> -  This binding is used to describe the Qualcomm Embedded USB Debugger, which is
> -  mini USB-hub implemented on chip to support USB-based debug capabilities.
> +  This binding describes the Qualcomm Embedded USB Debugger (EUD), an on-chip
> +  mini USB hub that enables USB-based debug capabilities. The EUD block is
> +  positioned between the High-Speed USB PHY and the USB controller, where it
> +  intercepts the UTMI interface to support debug and bypass modes. EUD can be
> +  supported on up to two High-Speed USB ports.
>  
>  properties:
>    compatible:
> @@ -29,26 +32,62 @@ properties:
>      description: EUD interrupt
>      maxItems: 1
>  
> -  ports:
> -    $ref: /schemas/graph.yaml#/properties/ports

You are breaking existing users.

> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^eud-path@[0-1]$":
> +    type: object
>      description:
> -      These ports is to be attached to the endpoint of the DWC3 controller node
> -      and type C connector node. The controller has the "usb-role-switch"
> -      property.
> +      Represents one High-Speed UTMI path that EUD intercepts. This node models
> +      the physical data path intercepted by EUD and provides graph endpoints to
> +      link the USB controller and the external connector associated with this path.
>  
>      properties:
> -      port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: This port is to be attached to the DWC3 controller.
> +      reg:
> +        maxItems: 1
> +        description: Path number
> +
> +      phys:
> +        maxItems: 1
> +        description: High-Speed USB PHY associated with this data path.

Doesn't the DWC3 node have a phys property? You don't need it twice 
since you can walk the graph.

> +
> +      usb-role-switch:
> +        type: boolean
> +        description:
> +          Set this property if the USB port on this path is role switch capable.
> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
> +          between the PHY and the USB controller.
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description:
> +          These ports are to be attached to the endpoint of the USB controller node
> +          and USB connector node.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB controller.
>  
> -      port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: This port is to be attached to the type C connector.
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: This port is to be attached to the USB connector.

Both port 0 and 1 are attached to the USB controller?

Why can't you just add more port nodes to the existing binding?

Rob

