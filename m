Return-Path: <linux-arm-msm+bounces-98693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMAtOpfEu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:40:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA2F2C8D6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADF07324D526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1353B47E9;
	Thu, 19 Mar 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/eo8COd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A32A3B27D0;
	Thu, 19 Mar 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912503; cv=none; b=tfXvYWvkXw0C9CFvJ5PnbVIAEh90vrwdgjx6u/ygr/Htbtgft23LTymGGGPnBOeNzkqU5G6nH+FDWge4Q8BpUU7xksXD15bEez5wkH5dQxRoRaVc3kFdLL1gV4h6gUwrqsviPiwfp9cCUX9gOx2CveuAJXM45NBlyFp/n7B+rIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912503; c=relaxed/simple;
	bh=ZuWLd05PmPZETqBgn+Z4cPTznlv/SqZasbmpg5sZcXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgLxGmCV6FZJguHc3wlIsyUpy7xMPM0wBDuwQuLACN/CcwLB0H5YgLXC0xc9Cz1GodIVNUfGCFgVOWDM+nqreSXw/HQ2fJ0NFMG4UUEp0rB7a/FAlR2RDdQ7AhUpIVORTdUjbucqLgm5/bv5F6qHO9Yq0YZcxfkdfOCarhb0fYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/eo8COd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A8EC2BCB0;
	Thu, 19 Mar 2026 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912503;
	bh=ZuWLd05PmPZETqBgn+Z4cPTznlv/SqZasbmpg5sZcXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/eo8COdOnQW7nB+xPFOSGqlZJOzmGr3S2+Baei+qnwwPjUDFQm2ZGCXTxvN/IgRS
	 NQwuX9UF/DfJq0QDq8gadja47V3A8aoG/6HVbbVLHdGdDUgVzWPfa/2HPCSOntKZql
	 18By971USAX76KqTxyi+3oQmr0lKoTkKsL+2HdwnsurIU93l6MfO1oSnebguE8uQrg
	 gWP4huM+1FYRpudRhDatQhpk8EkCBSnRMx41boMnQaCxQpY7jHt/+7Zd5t12DraNeW
	 gafV9JNFYrcOV+QbHhZd9bNb7I6utlPnr2L//gC1W7L2xht6zogYIabaxdv/VRMDhT
	 OYmKOZM2vDx4A==
Date: Thu, 19 Mar 2026 10:28:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
Message-ID: <20260319-ibis-of-original-temperance-20caed@quoll>
References: <20260318-eliza-bindings-ipcc-v1-1-8f066c33ce7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-eliza-bindings-ipcc-v1-1-8f066c33ce7e@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.908];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4CA2F2C8D6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:26:49AM +0200, Abel Vesa wrote:
> Document the compatible for Qualcomm Eliza SoC Inter-Processor
> Communication Controller (IPCC).
> 
> It is fully compatible with the ones found on the other Qualcomm SoCs,
> so add it alongside them in order to have the generic compatible as
> fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


