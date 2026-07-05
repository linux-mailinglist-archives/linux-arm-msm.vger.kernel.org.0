Return-Path: <linux-arm-msm+bounces-116528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eoZfLFQkSmrr+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:31:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F3770994C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 11:31:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DqoiyrNv;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116528-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116528-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B90D30107D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 09:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCBF30E831;
	Sun,  5 Jul 2026 09:30:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A521D130E;
	Sun,  5 Jul 2026 09:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783243855; cv=none; b=sODry+lRdTDN+MDB3YrGC9OKi3RRDerIqmnM6Vd+KpKztlv2Xo+7zm24t/8DIFL/WQ3+eK/Lg4ixG0PPPQ50VNngNCEMW3U+8Ly9CU4Syd2GoxUJlojQyRlvG4CUs2kynuRqqVWops5x4jQ5LcgRnTTBIGc83tE8iRAIL7n/yZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783243855; c=relaxed/simple;
	bh=Sl/1zG7AA9HFCmd5cnUMTSnR1PbWF+DJjNWoFDTnRaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0MjBepQZr/s+K06DU/axwz6pr3OcXVJWrmOmvPvzy4N5GkTci3Oqyuy4Wu0UEQyLuZeoiN1B8WMCdIIzoDbUC+pm4g4Ttjr7tgtPQaViZsKMuLl4hRQbLEOoufV1Awcpx9IrmWc+/hDLnTiFY1JGudJvVSmmNkVNUjflx/h9dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqoiyrNv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD4C1F000E9;
	Sun,  5 Jul 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783243853;
	bh=A/+7XMw6TDnawpnqLFqebmCehBIGM1AtWqgcs1tqMEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DqoiyrNvid+AYqgwh6SuXsZ2GoUUncFvMvkPNZ/v1nJuZF7Z35wRy83TuINgGriBY
	 LiSXekLIS8JiF1eLBxhK932RBivIKUPaiCuaNR61P7qoB99C6bZsg6bSG3M8JRYNal
	 emiX7LlwuMhq5WJfxxypPkCdf5/vlewAk4Xb+vkA0u4JyII+t7zz1EkTnThHshbTrM
	 w5/iYJ2fjSRsxhjHRLQsJiPERxUFFaBF08MHO7l0sBKdBNHwT/QFVIWIGxv39LsjW/
	 1oCnEWxdYpe0d6lmQaL23XhjnO098AzFW9WMW4+vtck1YTh/X40h1dSqSfWd2sjJMA
	 oMT0fj67nPoug==
Date: Sun, 5 Jul 2026 11:30:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Message-ID: <20260705-perfect-spectral-bullfrog-f1bfcc@quoll>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701165051.4122259-3-krishna.kurapati@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krishna.kurapati@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116528-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01F3770994C

On Wed, Jul 01, 2026 at 10:20:49PM +0530, Krishna Kurapati wrote:
> +  orientation-switch:
> +    description:
> +      Flag the PHY as possible handler of USB Type-C orientation switching
> +    type: boolean
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the PHY
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Incoming endpoint from the USB controller
> +
>  required:
>    - compatible
>    - reg
> @@ -78,6 +98,38 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,shikra-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 3

Wrong constraint, you already have maxItems set. You wanted minItems.

> +        reset-names:

minItems

> +          items:
> +            - const: phy_phy
> +            - const: dp_phy
> +            - const: phy
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs615-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 2
> +        reset-names:

maxItems.

> +          items:
> +            - const: phy_phy
> +            - const: dp_phy
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> -- 
> 2.34.1
> 

