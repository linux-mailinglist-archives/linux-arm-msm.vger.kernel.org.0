Return-Path: <linux-arm-msm+bounces-107727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKhsIDPIBmrjnwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:16:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621E54A694
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 406EA30B3A44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6329E3E3C6F;
	Fri, 15 May 2026 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaivMggv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F63C3E025B;
	Fri, 15 May 2026 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828978; cv=none; b=VhS6qEa9REep2+ZOPA/VUL2o5SkZsibCbXBq3qCBs9HOVfX6IhOoIQIKDAzFLU2FRjhha2gbv0npIwW5zTb9NacPyU4UqbN6k++lu0kU9bHiK9MVRPQRNJFHrRPUNB079LYewcEcEtC7gXNm3rvqKLwNqjHU0Y6en3HZKTRITys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828978; c=relaxed/simple;
	bh=Ve5/IMrj4xsmSOZKJKKjrEBQ45h0gts5SLa6/mW45YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwY3/LZwXdVjaqsMZ62It7TrzKsLBKopSKZ3oHKD5dD0RzCdNZp3aArrB5a7fP03f5Kbn4cnH40LVoqFopH/ew/NOP2Zrj9cPpl5HddFvu7UbmPklNpvoBu8Ui/eFc7Bq9yJ3UsAnv5wjwT6OgQFcGSwEj09bhtD68XnCkblBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaivMggv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2BDC2BCB0;
	Fri, 15 May 2026 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778828977;
	bh=Ve5/IMrj4xsmSOZKJKKjrEBQ45h0gts5SLa6/mW45YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FaivMggvlyZIe9SFYNTF62gPPfH+iX2XNzE0/dfcYGwIfk7y3SG1ULWFvQwvIwD6S
	 +9DqP7VyIljWt7WrHOmYveJ+jF0LoMIbjnO/uG9qMu32OdDxOkID0/C6+76Ijus701
	 L+PcQr2z31YxPxeyILVQVeTClpAllb0itH2qOX9Jy7wV8mCRQu+/D6UAPzFX8//j/G
	 WN/2u+sxgduj+jzPKY1E3sgpCRx59PU/IKb1wPcyhb6WFhdG8UvarjENvwZ+stYXBs
	 K7snKl3eIRQPYCHYoHOcgk37PLQ2HnLNjIGT+nGCyAuaqfSwa+899PXDCGhwxZmc3I
	 ZAk98HevBdzAA==
Date: Fri, 15 May 2026 09:09:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,sc8280xp-rpmh: Add
 reg and clocks for QoS
Message-ID: <20260515-lemon-shellfish-of-satiation-6ebb21@quoll>
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
 <20260507-sc8280xp-qos-v1-1-15135858cd98@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-sc8280xp-qos-v1-1-15135858cd98@radxa.com>
X-Rspamd-Queue-Id: 0621E54A694
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107727-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 10:25:12PM +0800, Xilin Wu wrote:
>  required:
>    - compatible
>  
>  allOf:
>    - $ref: qcom,rpmh-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-clk-virt
> +              - qcom,sc8280xp-mc-virt
> +    then:
> +      properties:
> +        reg: false
> +        clocks: false

You can drop clocks from here, already part of other "if:then:".



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


