Return-Path: <linux-arm-msm+bounces-112071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z+H4NOHXJ2ro3AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:07:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B26565E1CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hshcncq7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112071-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112071-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3433130BE435
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ABA3E3C73;
	Tue,  9 Jun 2026 08:59:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE303939BC;
	Tue,  9 Jun 2026 08:59:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995544; cv=none; b=if42tO3A7q+WpuZfcj07oYxPytn2MnbsO1lbDfL1Scwd480NFy2jP8DeUJHlQLAbu93RFHO8Rt1ZDiCEG45SAnwW4y/iF0eD/mHF/Aza6CWpx8L7YsfElz2/Fk5rZMHXmG3NZmAwgyrDwcgACNTyY+hA4wZ93endbIOubcGyq3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995544; c=relaxed/simple;
	bh=9Y3n5I1pFwLBFXOzP3YWYLlAIAHwU8YrmcG9zjXipOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ri9sTvxozkdRO2vKwxsdzpI3GUuQ1q/l58PZ7QZpEAnQTRK5GrGyHGX6c7S7dIOOIv5OysLbvI4ixWVH9r9NbO4wsHyHXB/6Ghk3JDyWkmv2N6PQxpPBL/0SFLxqgoXTohYvriQY9xzlCNhDn87BeZQ5cz07vu2AVKIBh7S8fnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hshcncq7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B238A1F00893;
	Tue,  9 Jun 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780995542;
	bh=6pDUabs7/gUhZjsFM2LQBImVyXUMF5qnHoThUXm5aaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hshcncq7twzWJqwX53p+T8Xga3DJoQDg6PlLMy/NDp9xUfXc2RxG7bfkjHvn4tKQB
	 YmYnzIXzQWAtorw3gV2wqFGgEdMRX8OB6yVWXQBg2NxOo1iSIdZ6tQQoVfyL1Nu8aM
	 m/fHrgs0mMW+2NgJPhk+FLpWL9PaBDam4Fy6KXSqA15lgwbOujZfLOjdfv6MoGD42b
	 XjKG2BM2udutmat6/Ah1iR5sGnFfBcs8hjMzJam6CFDzDlthT3wWS2JUTfXOaOYhTd
	 DCxhROpca7Foghn7oIGU82HGXfj6CrCBUKIJZhBfzL+8agRLKT186Rkile5JVlzRaY
	 C2tqLp2DBK7mw==
Date: Tue, 9 Jun 2026 10:58:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
Message-ID: <20260609-bouncy-guan-of-mastery-bf78e4@quoll>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
 <20260608-eliza-v3-2-9bdeb7434b28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-eliza-v3-2-9bdeb7434b28@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
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
	TAGGED_FROM(0.00)[bounces-112071-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B26565E1CC

On Mon, Jun 08, 2026 at 02:18:14PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe controller present in Eliza SoC is backwards compatible with the
> controller present in SM8550 SoC. Hence, add the compatible with SM8550
> fallback.
> 
> Eliza requires 6 reg entries, 8 clocks and 9 interrupts, so add the
> corresponding allOf constraints.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
> index 3a94a9c1bb15..fb706b1397a3 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
> @@ -20,6 +20,7 @@ properties:
>        - const: qcom,pcie-sm8550
>        - items:
>            - enum:
> +              - qcom,eliza-pcie
>                - qcom,kaanapali-pcie
>                - qcom,sar2130p-pcie
>                - qcom,pcie-sm8650
> @@ -91,6 +92,55 @@ required:
>  
>  allOf:
>    - $ref: qcom,pcie-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,eliza-pcie
> +    then:
> +      properties:
> +        reg:
> +          minItems: 6
> +        reg-names:
> +          minItems: 6
> +

This could be just one if:. Much less code, but I don't mind this
approach.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


