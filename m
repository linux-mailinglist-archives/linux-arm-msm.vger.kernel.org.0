Return-Path: <linux-arm-msm+bounces-103357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN67Mouu4GkRkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:40:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8C40C803
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBADE3153BDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 09:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8CF39C002;
	Thu, 16 Apr 2026 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFnmPiGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E691339B94C;
	Thu, 16 Apr 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332054; cv=none; b=kqJIgf/sVvamhbAMAnQng8WqzSelGQSgstwTqxxF5GJ6jYMrQCZg4ykwhKVlTK9VhPj+n8G+Yw1a7IfinbA6a0pVztXddPZp1gQSAJQXc29OGlVG8zj60yAjSK9LVR0P8p0q8O9ml6xahj5cuVjYQAyWGncLTEg11JG0BEO/r4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332054; c=relaxed/simple;
	bh=B1RRUqquVdW0Z2ScrPkyprikjhhe5wk1q42Jz8yQIMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8vi6r7w5Novz9c++3Hr25yOaK/wImkSwH9kqj2grk4ajDPb773c5XjsfWlBGhx3G8kH6S/RjL1AJRw6kg3Z/rfGEG4jyMQvLi5QW/zx3t11/CftZmU1K6wRpGkNpI7CBOReC0WU8tOkWKA1V9sAM4A0IOFBiB1m1pBQbgyOJbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFnmPiGR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CD7C2BCAF;
	Thu, 16 Apr 2026 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776332053;
	bh=B1RRUqquVdW0Z2ScrPkyprikjhhe5wk1q42Jz8yQIMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFnmPiGRG2g4u3cAAxEUnbKmElcjOOGCiS/ozQ4tyShGTWY2tCzIgbDcMXBN1pg1c
	 FGWO0RAe0Ns9Uaf1i6IYr9HB/u9WHecwxHy60TMFocXhEVHOP460TTqg/jfyNhyO05
	 oZQNzr1MZBX+aEtr/B/n9RcrUmZBVIHGfqWgebk+9vlNbN6IsQlDkAxonCYHNdiTuJ
	 jxhSmX4EA1OldOWDP7Xl8R9LHejvWfP73p0tL1Re/lI9YQKcOiXk2UoXaiT+JAuogz
	 ex0Kng3vt+IBtnZJ9eefrJPw7/VVHeh7ZjRPfd13obqE6kcVOCZXkGQALa3ZMuHNeL
	 NWpZwKQBQnEvg==
Date: Thu, 16 Apr 2026 11:34:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: qcom: add IPQ9650 boards
Message-ID: <20260416-ruddy-bug-of-karma-95e841@quoll>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-3-b37eb4c3a1d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-3-b37eb4c3a1d1@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103357-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73F8C40C803
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 07:03:18PM +0530, Kathiravan Thirumoorthy wrote:
> Document the new IPQ9650 SoC/board device tree bindings.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


