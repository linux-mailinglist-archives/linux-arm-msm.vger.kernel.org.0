Return-Path: <linux-arm-msm+bounces-94471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFMoCmq5oWkYwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:34:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBD1B9DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FE16301DD38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2729943D4F7;
	Fri, 27 Feb 2026 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/qYyFKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0370043C077;
	Fri, 27 Feb 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206167; cv=none; b=ttfZ2gwFalJZjmyl56kIHCEith8dvZR0LnqrB8qgGuKBFoaGVfCWE7ONlxuKfSatjdwxZkw1R9XjHR8TjpOJwcYR2TLRp5Hx0/j1k/v5TM7BEGSGHCPJ2XNKkpm59fDlVqGS9SKDG4I9g/WbjurSo8+w6xxgT5eHCoG2sloTxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206167; c=relaxed/simple;
	bh=v2SnPgmE4aBKZuGEkA9sLyr5Vjf+EYiBiHRo6uwPals=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XWySAbOeG6yvJN6/f+QjPpSEZ5WKrdMfAFaXbCuMIyHcVYWQ0KJ9AlDtn2RP9WMwTURFB4AQk5qHtvVTFPc/naUkcnjvO6AKkQ/A76VlQdi1pDF8RUB38r1CMvZgJr8N+TE+Kj4f9qJVsw/jME0HBbfAe5BGN/ot5hCvJ9ecJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/qYyFKt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8CFC116C6;
	Fri, 27 Feb 2026 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206166;
	bh=v2SnPgmE4aBKZuGEkA9sLyr5Vjf+EYiBiHRo6uwPals=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=O/qYyFKtkB/8FN6zkZaveH5pQniLFNln7sGd8BosO/+P6uhwFcv/rME9M+/VemePk
	 ZpBg6z4rTfI3g8nLqC/F7F10b/5Lu+BdgSxr4fsV7UZNUG178gXM/26BgELXsGAmne
	 7koxxxBNBNZ83UKtTmxEJsr+Win625jVj/dxeT12ml7W8/teMdfmXEuGLD5k+d40ur
	 ycDp4l7A49SqVOEbqd6wXcySAOPCF9KGCubVe1zIqj7dq9u543g564VP23sCuWVcdY
	 wMIPLRPD1Cb91z8TNwVfdSHfu4i4yVEpX+1t1TTMHhbUlE3k3foRSYzcVkoPwABluZ
	 bVcQy9LjSSBBg==
From: Vinod Koul <vkoul@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] phy: apple: atc: Make atcphy_dwc3_reset_ops
 variable static
Message-Id: <177220616334.330302.2835774532682598962.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 20:59:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94471-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33EBD1B9DD9
X-Rspamd-Action: no action


On Mon, 16 Feb 2026 12:04:14 +0100, Krzysztof Kozlowski wrote:
> File-scope 'atcphy_dwc3_reset_ops' is not used outside of this unit, so
> make it static to silence sparse warning:
> 
>   atc.c:2026:32: warning: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it be static?
> 
> 

Applied, thanks!

[1/3] phy: apple: atc: Make atcphy_dwc3_reset_ops variable static
      commit: b3fddddf3fb49c7472e73680d6ea5d771f9514e8
[2/3] phy: marvell: mmp3-hsic: Avoid re-casting __iomem
      commit: c77eee5b44b8d32d471cf17fa193b395e321ef37
[3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL pointer
      commit: b6b7d1ae0653dcaa356be31c0de221311e922ccd

Best regards,
-- 
~Vinod



