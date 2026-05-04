Return-Path: <linux-arm-msm+bounces-105713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD4hC4N++GmHwAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:09:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616D4BC330
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 13:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1634930095F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 11:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED7F3A75A5;
	Mon,  4 May 2026 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ea8gYidQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A2D3A6B92;
	Mon,  4 May 2026 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892410; cv=none; b=XesU8s3uNAVGhY8YOPwMF4SuWXXE3lvWpuS0xUkDOLiI8InvX9MgYehGmHAWPpIQjJAHHYUw0GbFrWRgcs51UkXWdRpN+ULtyxl6svMOrqUX/EI3iMWpR+9FvPEVp1phXjm4JOlgaWmn+J8Lv9j+DvGiXw8GDlZuN19B1/+kFvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892410; c=relaxed/simple;
	bh=Qekei4EBSl8zy90b3baTSwFNYdFd4J9Yt5RBNUtCJWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj8RwWddPxCvfgU81AmOErs1Xhm2igliJeWfvS0bSKDMD6iypwWXmIYgp+jXtgBiSgBOr25hSHLqXZd7wEhtAAupD+wz4bziFjNK11eNH6JWQCv3URSg5gdIDrwuPV7ePsoGn/VEjqqYzgiVHEjpvOeVciqxxhASfHdCJcKx7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ea8gYidQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE67C2BCB8;
	Mon,  4 May 2026 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892410;
	bh=Qekei4EBSl8zy90b3baTSwFNYdFd4J9Yt5RBNUtCJWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ea8gYidQNl+OaH9FchlMaM9K+7g6ktdoQHPZPXS4Qs92VgpYkUkRUPZEDZDwNx0VH
	 Drq+pTs9CBE039unHT2/+Hu4Ky2OnpMq6+A8jUev0t6NMD0HQV+aIGH7nMCjRD3l83
	 YM3CptFu9pWmZn7Oi69MAVLlQGL4YBL2n/vA4LEjJJHEYA9khVhT+eOxgIC4mqFkGu
	 xIDmYOJtKTgQY6T5hX+jrjcR0s7iGVUWLJJTh5JuvV5zfAPqGfRnDQpdfoZm6+YOCP
	 ol3dq2DVdr/RxOxqX/rLm7m6/r9I10FeSAQTYgaOBZPi7m9mgQt1vE11qcLQ+0rDAJ
	 jFc/WIwAKuRTg==
Date: Mon, 4 May 2026 13:00:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, 
	arnd@arndb.de, gregkh@linuxfoundation.org, 
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, 
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com, 
	inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com, 
	livelycarpet87@gmail.com, matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, 
	me@ziyao.cc, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	richardcochran@gmail.com, rohan.g.thomas@altera.com, sdf@fomichev.me, 
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com, wens@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
Message-ID: <20260504-fascinating-teal-tarsier-b116c8@quoll>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-9-elder@riscstar.com>
X-Rspamd-Queue-Id: 2616D4BC330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105713-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.293];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1c:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,riscstar.com:email,0.0.0.0:email,devicetree.org:url]

On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
> bridges.
> 
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> new file mode 100644
> index 0000000000000..d95d22a3761da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#

Filename and here: toshiba,tc9564-dwmac
(s/x/4/)


> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description: |
> +  This node provides properties for configuring the Ethernet PCI functions
> +  that are attached to the internal downstream port of the TC956x's PCIe
> +  switch.

Describe rather the hardware directly, not the DTS or the binding
itself.

Just say what is the hardware, what is consists of, what is less
obvious or usual (if there is such).

> +
> +  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PCIe
> +  switch together with a number of Ethernet controllers. These bindings
> +  cover only the Ethernet functions of these devices.

What about the rest of the hardware - a PCIe switch? Shouldn't it be
described?

> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus-common.yaml#
> +  - $ref: /schemas/pci/pci-device.yaml#
> +
> +unevaluatedProperties: false

Place both (allOf+unevaluatedProperties) after "required:".

> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  # We can't allOf reference Ethernet-controller.yaml because we end up with

s/Ethernet-controller.yaml/ethernet-controller.yaml/

> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a

But which schema requires pci@ for devices? If I am not mistaken, only
dtschema/schemas/pci/pci-bus-common.yaml requires it, and it does not
apply to actual PCI device.


> +  # small number of the properties are useful on TC956x so we can just reference
> +  # what we need.
> +  phy-connection-type:
> +    $ref: ethernet-controller.yaml#/properties/phy-connection-type
> +
> +  phy-handle:
> +    $ref: ethernet-controller.yaml#/properties/phy-handle
> +
> +  phy-mode:
> +    $ref: ethernet-controller.yaml#/properties/phy-mode
> +
> +  mdio:
> +    $ref: snps,dwmac.yaml#/properties/mdio
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    pcie {
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +
> +      tc956x_emac0: pci@0,0 {
> +        compatible = "pci1179,0220";
> +        reg = <0x50000 0x0 0x0 0x0 0x0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +        ranges;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        phy-mode = "10gbase-r";
> +        phy-handle = <&tc956x_emac0_phy>;
> +
> +        mdio {
> +          compatible = "snps,dwmac-mdio";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          tc956x_emac0_phy: ethernet-phy@1c {
> +            compatible = "ethernet-phy-id311c.1c12";
> +            reg = <0x1c>;
> +          };
> +        };
> +      };

Keep only one example, unless you have different properties (not their
values, but their presence),


Best regards,
Krzysztof


