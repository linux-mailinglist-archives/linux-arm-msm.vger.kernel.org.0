Return-Path: <linux-arm-msm+bounces-102439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHiyEYJm12myNggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:42:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C86B3C7DC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5462C3012EAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C573A255A;
	Thu,  9 Apr 2026 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moYNRuwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208823A1C9;
	Thu,  9 Apr 2026 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724158; cv=none; b=nKOgQnafbBmwF+YXAHph4SO/3m7ov2+C2uM4A9fyT8rl/EKcZPx8ZYGhFVVKji5EoKSXJ/q2DwgCPPKjA1KzbyuV2rNV8goWidWtA/0KeGvL7Nz1wkhvM5NlpdiboZ8XRb37qlxc0xw7BzEsOfD8Tz9sOayf/gOp4UW4Shx9S0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724158; c=relaxed/simple;
	bh=L92ved0pFUYYKpQLMwReBr9CQy0AKKSBMb7wd6mY7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U77norzU788HOkJy6SdODEj0UtMpxY+E9NTFXHZ8xdDJJTfrOhH1OTIXor/Qk1SUaGfUZmxW/SufrqqTihIEyzyOTj/XU9BSpAOEXlA80yk6E8fYOR9DVB8yE7no43U3+84fyUjB37/sg85G43tCiJjA3LH0lgdD7ZwKV10x5Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moYNRuwW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3BAC4CEF7;
	Thu,  9 Apr 2026 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724157;
	bh=L92ved0pFUYYKpQLMwReBr9CQy0AKKSBMb7wd6mY7d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moYNRuwWkHJZwIBWpSlEYQ5Wq83ETVG3701fYQbNZFBT5Z0WBldtGuf8ffN0ogN8P
	 QnPWaFA0vTRwEQ9N60tm265GGQOPBlqv6HmbAPV6TkMP43E9CiraBUytqtNDc+jFY8
	 RMwZ6efAsXITlaEj1bPlTccJKtCRLBMvttVJ8QTULEYoPV/VpDA7+OOeE23tt+0wBS
	 pEnTK9sf4vFWR0nWobfkDadgq59DTq8kOMWunOAiJK6ZPBwA5qdRRpWjijThnMGEt3
	 ch86pA9NTqDq1ovk9MlXy05Rfig8UjJMAuJPO8lapdoeWcjrQxWAC3wumREhqSvtx/
	 JJFeD+o++WYSw==
Date: Thu, 9 Apr 2026 10:42:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650
 family
Message-ID: <20260409-gentle-auk-of-teaching-6ff50e@quoll>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
 <20260408-ipq9650_soc_ids-v1-1-e76faac33f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-ipq9650_soc_ids-v1-1-e76faac33f77@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102439-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C86B3C7DC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 03:28:34PM +0530, Kathiravan Thirumoorthy wrote:
> Add SoC IDs for Qualcomm's IPQ9650 family.

I don't see board compatibles being posted, so this could be the place
where you briefly describe the SoCs, including differences between them.

> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 6 ++++++
>  1 file changed, 6 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


