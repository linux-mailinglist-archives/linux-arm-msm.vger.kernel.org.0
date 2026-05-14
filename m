Return-Path: <linux-arm-msm+bounces-107593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CARrGpHFBWrDbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:52:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A3541F1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6063430088BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C59A345CAE;
	Thu, 14 May 2026 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhuI8VOy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59006275B15;
	Thu, 14 May 2026 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763150; cv=none; b=nSc4lhLjElnw80bt1+uWLuoxIJ/JZ95DmxZ+Wr5E0l9y3z9fZjvVrIReqODHwIcglxXpShLXWhQlOjY/Pzwth8e7Z/pZPGR7kcPCMcii16mlsnm2Zj4SLXoNnqewr0kZoO5rLkxBtc20xbE6XNc95VW5WRgfAaRgYtz0R7JUoxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763150; c=relaxed/simple;
	bh=QrxNqoikqhG9/YKhK5vkcERVKm9U2wDdN7QvLO+4ieQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkCSArxCpT/IH5eMIGvB2Ha/RA5oUSqMQq4/In8FbUTK93GgJ80Bw4ZRyuqJGv2TykkSG60/PFvb8zAXSm/INIbZDKFA1TKxkcpkQko+t4sPoUaU5LooGdu2IFzIWUasxbGkkMk8BG/RreQ2KnUsPUy7D/eWy8JUH8Uz4pb/+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhuI8VOy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60005C2BCB3;
	Thu, 14 May 2026 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763149;
	bh=QrxNqoikqhG9/YKhK5vkcERVKm9U2wDdN7QvLO+4ieQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhuI8VOy6VF1n5G0zPoGFwwqKqRS4XXfb7yESQys47ZUoMp6+UgrdhZf9SpxlzTZM
	 MnBT22yONxKVrbh1hI5+se/y0oZteIeF3Tz2jVBkxQVEjg6bJ+Qz9VLcNSIBjCsngK
	 26fzOQXncR9I/OtaU/G2fDmdfp/iPStVdafvsFiNi9YemnuFs+CMpViqoBlAISZwCE
	 oisfrAOITSRi/tPDxvFSbmPqAlu4GXj+O5IMQLhLAoQLQtG8+K8geYYwqpt15bGktW
	 2Y/Fh+/mvscEbGK3lxE22aJIA1s6gEB1JN1C0DkRS1h++TQDLY6dWJWHpeCbNPvWK1
	 SOB+4Tf58+Fdw==
Date: Thu, 14 May 2026 14:52:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] soc: qcom: ice: Enable firmware managed resource
Message-ID: <20260514-provocative-golden-woodpecker-b3e494@quoll>
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
X-Rspamd-Queue-Id: DC7A3541F1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107593-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 08:37:47PM -0700, Linlin Zhang wrote:
> From: linlzhan <linlzhan@qti.qualcomm.com>
> 
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM (GPIOs).
> These resources are controlled by the driver via SCMI power and
> performance protocols.
> 
> The SCMI power protocol is used to enable and disable platform
> resources, including clocks, interconnect paths, and TLMM, by mapping
> resource state transitions to the runtime PM framework?s
> resume/suspend callbacks.
> 
> In this design, the ICE driver acts as an SCMI client, with clocks and
> power domains abstracted and controlled by the SCMI server in firmware.
> This implementation depends on pm_runtime_resume_and_get() and
> pm_runtime_put_sync(), which are available in the OPP tree?s
> linux-next branch.
> 
> v2:
> -- rebase the patchset
> -- update to/cc lists
> -- Link to v1: https://lore.kernel.org/all/20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com/
> 
> -- To Linux Community
> 
> v6:
> - Protect calling clock API with fw_managed flag in ICE runtime OPS callbacks.
> - Link to v5: http://shc-kerarch-hyd:8080/kernel_archive/20260324095703.1306437-1-linlin.zhang@oss.qualcomm.com/T/#t

Please do not include non-working links in public postings.

Best regards,
Krzysztof


