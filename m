Return-Path: <linux-arm-msm+bounces-107794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLXXCx0CB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6154E529
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB40D308DFF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A543466B5D;
	Fri, 15 May 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9twNNOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8B44D013;
	Fri, 15 May 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842023; cv=none; b=dOKrejgdguV7J7Qp/yOejr6TeLTrpAqH5Xrk84V35BnVJq1uHA0W6GXbka9a+tQfMS8tYk+isWqOxRDRmsFG7jfAHKB6rB5pHsEq7EutwLVPghzK7yONMJ19EoTYntPVOOphiEyVSOWsBRODzlS/LrDGbute1V83dUhbp8S3IuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842023; c=relaxed/simple;
	bh=qnddXJyRkWFSlTnXxM/Hm3ZBZQJKwpA+7O6fCrA3myQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QU/0vLSNHt2w+LotH4FH4l+qnt6+U7E3/5DATl5vgJK3LnxS/UHbJdiw1hbUaiJ3hYcasnD6oOyqac/ljHmRfbR0fVotGlCwBzmasvj1qf94KLUpPBTFRs91hFgdwPeb50FTliOOMj2QHOv/I5isAuwHo+9oNq3aEJbdLe5pTSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9twNNOL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559ABC2BCB0;
	Fri, 15 May 2026 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778842022;
	bh=qnddXJyRkWFSlTnXxM/Hm3ZBZQJKwpA+7O6fCrA3myQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9twNNOLdqW1N+2dFFv//HqYxcLwPr3ufU3Q45knN+x1bqs5vagKdva5xpZBEPfEl
	 nBKrLVvkbxG4A1kb3gZsSAfBov532izmXrWgTPrDPN8GS7tvFR2a3YSzr4r4nUacxj
	 L8kzCdIsZoeOG10YPC+hDQmoMS3dqs9bC1JMI+E4e9bSb1dbqfwHW/v8d6rgILSxZo
	 LfA0+Bod3gDoy/e5VI3vEb3FrEg26s+L8uYosnPsXNHXW54qGRCOiZTLQXx2wRGHrf
	 MHGGrJUWV+T5Hi0iA3KX5otI+GcqlUkn84atZC8dBBe2weIu4dqVwyCfujq0tvxk2v
	 Srwrva9mWr6ng==
Date: Fri, 15 May 2026 12:47:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260515-optimistic-hedgehog-of-penetration-b34227@quoll>
References: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
 <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
X-Rspamd-Queue-Id: 27E6154E529
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 09:28:28AM +0530, Varadarajan Narayanan wrote:
> Document the PCIe phy on the ipq5210 platform using the ipq9574 bindings
> as a fallback, since the PCIe phy on the ipq5210 is similar to ipq9574.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> index f60804687412..1ac31439c20a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,ipq5210-qmp-gen3x1-pcie-phy

5210-qmp-gen3x1 here

>            - qcom,ipq6018-qmp-pcie-phy
>            - qcom,ipq8074-qmp-gen3-pcie-phy
>            - qcom,ipq8074-qmp-pcie-phy
> @@ -24,10 +25,12 @@ properties:
>            - qcom,ipq9574-qmp-gen3x2-pcie-phy
>        - items:
>            - enum:
> +              - qcom,ipq5210-qmp-gen3x1-pcie-phy

and here?

>                - qcom,ipq5424-qmp-gen3x1-pcie-phy
>            - const: qcom,ipq9574-qmp-gen3x1-pcie-phy

So it is or it is not compatible with 9574?

Best regards,
Krzysztof


