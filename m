Return-Path: <linux-arm-msm+bounces-101767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PxBJ7np0Gk/CAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:36:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC939ACBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C0B3010DB3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 10:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1F7351C0C;
	Sat,  4 Apr 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUTF44zQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A23258EDE;
	Sat,  4 Apr 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775298962; cv=none; b=X894aulinmaUC1OoBRW4qlounthF3To70u8fflu2QrwI3Ryin1D3Q4uoEvJq+czLGhY8o/1OSVmveS0kqJHTT/DPAgj35RCIkemQXit2v9YShag5GFJdoZQRmF0HG5st8kn9PlE+k7V+erBiLZ6Jj/iRgtFMVFGZZJb+UJUhlMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775298962; c=relaxed/simple;
	bh=iQs4+wAEvGqLMsZvqvNU/VsvXhN2YZ9haUXqSaeLJfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6a2SZfENnusDvWbWBa0uQDGXgdVdAwNhmNNWitbDgYcDYGSLXJnw6j9Nlv7wHJEKM4a5YkroJ949OGFRrhubPtbjL5N/AIpKwWpNH1fspLlCqkAn2Br7fuJ296r1ZSZ8389gsmqyi/lSZFlrevHQvdXrvBgBGqdwfOEHZK6ZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUTF44zQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1073C19423;
	Sat,  4 Apr 2026 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775298962;
	bh=iQs4+wAEvGqLMsZvqvNU/VsvXhN2YZ9haUXqSaeLJfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUTF44zQTtUxDYGjVRCde6o86DFQ2BS+VKHSftiPzqD7VdxfUa3G+TllLOEezTks0
	 VZanB40NS82qXuD1MOah1RClWDATGRSrqHz27UlSOfGDnbyGCCXXrOq5mtxM5HNzmx
	 SSK5JXiDjqO7D8sE/cMZsNfRVGNc3FgWcHd0eVVcQUWN4hxy/jbi+Nhtb3eOd9UUjM
	 FNE0jUdLzR2apf1jjykxv6OL0Zfy3W3qbJAf2Ifwy9sKDsP3pOg49IrwJNdFv6DzV3
	 1fEVb5uTOyU8vfwIRjLRDJA+HiwfDkBf/ZILt52Ne7Wts8/91jnj9Cqf+hnD28w3r8
	 DonJnyb9akbLA==
Date: Sat, 4 Apr 2026 12:35:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Martinz <amartinz@shift.eco>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Casey Connolly <casey.connolly@linaro.org>, Alexander Martinz <amartinz@shiftphones.com>, 
	Petr Hodina <petr.hodina@protonmail.com>, biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: nfc: nxp,nci: Document PN557
 compatible
Message-ID: <20260404-antique-skylark-of-vigor-9dce8e@quoll>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-1-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-1-fbdce57d63c1@ixit.cz>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101767-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,shift.eco,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,shiftphones.com,protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F1DC939ACBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:58:46PM +0200, David Heidelberg wrote:
> The PN557 uses the same hardware as the PN553 but ships with
> firmware compliant with NCI 2.0.
> 
> Document PN557 as a compatible device.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


