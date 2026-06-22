Return-Path: <linux-arm-msm+bounces-113962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lTeQOZgKOWpFlwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 956196AE90B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:12:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QuRZAWOI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113962-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113962-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A359530233D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1A03A48CA;
	Mon, 22 Jun 2026 10:12:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E3E36A343;
	Mon, 22 Jun 2026 10:12:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123129; cv=none; b=nYWX8RPUoyhp19H+DNaez8wKxJSkzqYt56moGUlcmVNhoKN6u4GFKwqAF+mICkkcH7S4qNKzwLqrDHHIS9SZuYRaDt66accNlxpQpJKhlNVsdIvUCQHDlpWjPC1MoDkcz/AMpvk3BTVxSAGv9Dcq6ZF/KczMqcWE6F05j2+qWQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123129; c=relaxed/simple;
	bh=1nAQS62EBcOu0iUVyearxm2CaXQMgwwSXJtMvTcBZ98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3V7I8gi7cuwpIsfvjJnkQnMVHm1d1Jb2UN/FPCrmcVashyBA/dU6ircN+vnMjU/6YGreqVfM+zlTiqffCM+b5y+XLWigSjeXB0ly7vMHCNkpz0eu3wL5NQINZ50qxXiSWVdbbDgsAbnFtgMrlmNk6PeGG2VBfHJsNhRoc71jUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuRZAWOI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E011F000E9;
	Mon, 22 Jun 2026 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782123128;
	bh=Jn4/Enltn0XRI+JIEI0VhV6sFnQsw4jLRUscnEk74fI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QuRZAWOIeZO+RZ8uLXIkdqnqaiVfj1GmzkQDbqcVwNLicYx+F+r5SaL8SqGqe7zpy
	 NEvij+nnJoVL/qTx4DbMHTdpYoBs2fFLxg6+UFA8HPSW0K77C3hqYII42bX9rFp5f2
	 4gE5W9Lob1HPEurFnB7aQqPvq7IjTcbBMvxqrPl40E9Z5AT42f0CiFNi/vLgOVLTei
	 +96aqEES6K0CB+LOAcM2mKOvIbu2GucFla0n9NvjVtKjy3oAhvRf1k3NCGvH8LBPZW
	 JA09aUg+nziab4j4A78r+dn/PZlDkxzdKIBwtK+3YUxlyPOUM8K/i6BW9vcLoXRqAj
	 piid7sh/yAohg==
Date: Mon, 22 Jun 2026 12:12:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <20260622-brainy-observant-crocodile-d57bef@quoll>
References: <20260618-hawi-pcie-v3-0-f31880bfb3ec@oss.qualcomm.com>
 <20260618-hawi-pcie-v3-1-f31880bfb3ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-hawi-pcie-v3-1-f31880bfb3ec@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113962-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 956196AE90B

On Thu, Jun 18, 2026 at 10:00:32PM +0000, Matthew Leung wrote:
> Add a dedicated schema for the PCIe controllers found on the Hawi
> platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 202 +++++++++++++++++++++
>  1 file changed, 202 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
> new file mode 100644
> index 000000000000..fb3145f89f7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/qcom,hawi-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hawi PCI Express Root Complex
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Manivannan Sadhasivam <mani@kernel.org>
> +
> +description:
> +  Qualcomm Hawi SoC (and compatible) PCIe root complex controller is based on
> +  the Synopsys DesignWare PCIe IP.
> +
> +properties:
> +  compatible:
> +    const: qcom,hawi-pcie
> +
> +  reg:
> +    minItems: 5
> +    items:
> +      - description: Qualcomm specific registers
> +      - description: DesignWare PCIe registers
> +      - description: External local bus interface registers
> +      - description: ATU address space
> +      - description: PCIe configuration space
> +      - description: MHI registers

Why is MHI optional?

> +
> +  reg-names:
> +    minItems: 5
> +    items:
> +      - const: parf
> +      - const: dbi
> +      - const: elbi
> +      - const: atu
> +      - const: config
> +      - const: mhi
> +
> +  clocks:
> +    minItems: 6
> +    items:
> +      - description: PCIe Auxiliary clock
> +      - description: PCIe Configuration clock
> +      - description: PCIe Master AXI clock
> +      - description: PCIe Slave AXI clock
> +      - description: PCIe Slave Q2A AXI clock
> +      - description: PCIe Aggre NoC AXI clock
> +      - description: PCIe Config NoC AXI clock

Same here - does that mean that once instance does not have this clock?
If so, mention this in commit msg.

> +
> +  clock-names:
> +    minItems: 6
> +    items:
> +      - const: aux
> +      - const: cfg
> +      - const: bus_master
> +      - const: bus_slave
> +      - const: slave_q2a
> +      - const: noc_aggr
> +      - const: cnoc_sf_axi
> +
> +  interrupts:
> +    minItems: 8
> +    maxItems: 9
> +
> +  interrupt-names:
> +    minItems: 8
> +    items:
> +      - const: msi0
> +      - const: msi1
> +      - const: msi2
> +      - const: msi3
> +      - const: msi4
> +      - const: msi5
> +      - const: msi6
> +      - const: msi7
> +      - const: global

Here as well - why is global optional?

> +
> +  resets:
> +    minItems: 1

Same here?

> +    items:
> +      - description: PCIe core reset
> +      - description: PCIe link down reset
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: pci
> +      - const: link_down
> +
> +required:
> +  - power-domains
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: qcom,pcie-common.yaml#

Best regards,
Krzysztof


