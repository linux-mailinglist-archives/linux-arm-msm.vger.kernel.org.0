Return-Path: <linux-arm-msm+bounces-112522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DwtwHP2VKWqbaAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:51:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684566BAFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:51:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d1Tm7plb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112522-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112522-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB43D300C3A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 16:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496A933260D;
	Wed, 10 Jun 2026 16:32:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A829B200;
	Wed, 10 Jun 2026 16:31:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109120; cv=none; b=jU4/m0E4Ezcsu/b0qY9tOCxaXjUkly2OBLpCA7q1RktF4mP8CNW9YmEckF4t/9rNcwKJ3v/IdszVxjd8DICg8/rTDjmULNvfaje3TzY2BJPcjki5BZhtHDX+LheEyMltEPpFYSUIgY+G2TZrY42P7YalM8ki0vnCEmfXg/63iPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109120; c=relaxed/simple;
	bh=DdibHcW17NaYeY7NBSrmFBVCc8qzwxuZ3SMB++aGDug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smLRxfZH4dDvhgpX4gNqZO5BIxd9TjHHgfVBybu5uKv54o2BBM62HrQWpn23NA+Kj5VY4YrlNrjNNFODLBRyfKXr6qKnpJvzhg7eW60SMvg3ur23JHCyKHKVlRp0NSPDvCo/hGXOR2H87abvYt9Y3V+ErbcF+t3TCK1GJZYMqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1Tm7plb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF0A1F00893;
	Wed, 10 Jun 2026 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109118;
	bh=8rylpg5/2qRjADTJGQuBR2I2AKuLIqNa59sJOblkAtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1Tm7plbYMqROttw6XwBlHSuFjjVdbSYemoLSRS1zzEsgMn7dViwVWXh81tNaEm+1
	 a8oaGRsxUtbl4T/n++ZN4JTQybVcRsLdcxN6nXkhmuSd+A/zBr81ior37z0lwF6ilQ
	 gUERvMP1WsHTU2MN6qMst4m23cKfBFYuG9m1vEj+kAf208PrvW4eTNzySVju0zeQcM
	 QQIscwLm1+2wKISmmp75wbOBF8Qw+R2ajg9EvlMp9v44zJGQ48kpSwuB7RR9f9CMCa
	 /pZiyrKujORodONlvqHMnghtmvZHgcgJJMcgmE7kXj+xtpj1ypTsZ0FYk0mSMeE0Iq
	 fzxRPP877vFbw==
Date: Wed, 10 Jun 2026 18:31:49 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Document
 Eliza PCIe phy
Message-ID: <wmcngbykxdbbp7bks4at4voe2fylpeh57hiijwxreu6cdta4vn@evux3scmqn6n>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
 <20260608-eliza-v3-1-9bdeb7434b28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608-eliza-v3-1-9bdeb7434b28@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112522-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,evux3scmqn6n:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5684566BAFC

On Mon, Jun 08, 2026 at 02:18:13PM +0530, Krishna Chaitanya Chundru wrote:
> Add compatibles for the Eliza PCIe QMP PHY's, which supports Gen3x1 and
> Gen3x2 configurations.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index 3a35120a77ec..be4bbc327982 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -16,6 +16,8 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,eliza-qmp-gen3x1-pcie-phy
> +      - qcom,eliza-qmp-gen3x2-pcie-phy
>        - qcom,glymur-qmp-gen4x2-pcie-phy
>        - qcom,glymur-qmp-gen5x4-pcie-phy
>        - qcom,kaanapali-qmp-gen3x2-pcie-phy
> @@ -181,6 +183,8 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,eliza-qmp-gen3x1-pcie-phy
> +              - qcom,eliza-qmp-gen3x2-pcie-phy
>                - qcom,glymur-qmp-gen4x2-pcie-phy
>                - qcom,glymur-qmp-gen5x4-pcie-phy
>                - qcom,qcs8300-qmp-gen4x2-pcie-phy
> @@ -206,6 +210,8 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,eliza-qmp-gen3x1-pcie-phy
> +              - qcom,eliza-qmp-gen3x2-pcie-phy
>                - qcom,glymur-qmp-gen4x2-pcie-phy
>                - qcom,glymur-qmp-gen5x4-pcie-phy
>                - qcom,kaanapali-qmp-gen3x2-pcie-phy
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

