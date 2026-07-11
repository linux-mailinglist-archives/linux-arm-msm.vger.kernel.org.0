Return-Path: <linux-arm-msm+bounces-118514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jr08NZKeUmo+RgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:50:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A25742BAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 21:50:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CV9cizgU;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118514-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118514-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 313E0300FFAA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8D131691A;
	Sat, 11 Jul 2026 19:50:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9968313E1D;
	Sat, 11 Jul 2026 19:50:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799401; cv=none; b=cXYnTDQBjxZvciFt90HhVELFrINwNYsm7h70FArLYQFu5OZKQGUDMbGnqjW5Am5u8t5a3X+LV1EQSgKOQNGNA96U8Eb9rBuiO19OpK3yqeJdX3ttfzRJb6jgFmd1dGbvivh0+4aPzlbym2mpumYQiWBPvCBrKkfPFFsf+pLtuG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799401; c=relaxed/simple;
	bh=UD0X/VlrqvntugIHHINEwVGMXYZSo3+os2CpK2Uq+9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZajnVzYsOUYX3Ktc4uYFatQ3ibctYHB5ygTNfTWyKjlIanKQXMmMVIVCBPRd6d0GyeO9fzSCn0ImB0sd8UJLcPyKm2Pc+YZeyynjWG0KwW4KN8a94vHFy265aiCdqyZk57OqGxnpeD3OB0ulDESDLZG/qeKD6F/RUV7pDOx2sbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV9cizgU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3985C1F00A3E;
	Sat, 11 Jul 2026 19:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799400;
	bh=4KW0mDYxxvCs+MdA9V1BDmlww/e9OaKOFuPRGtfySv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CV9cizgUZHxiVfZXVePzS/iz1smxoeAzfg53JhpVEBDDs2dK+lKh4yPOFlQuvPZqT
	 0CMXJRjGOWp0LELoIf27NMEyB3rQL16ZTiK6wmedmZwiDiUW2sQd5L603zYP6zYS5S
	 +MFApwjk6Eo/G/nVi2hpt6/qjlzecRO7UCWU7ZeWNPneg1+MVCJZexWE/EFGGlePOF
	 dj1Hy3hFGSwb+r/S38zRYqlR9XQ52LBwmRbr0YX22TLYVwg/AEX5izEp3g+rdvwRIL
	 vTQnCZRxYFA5KhbHFySxlDjDhsA0spuS+VGh0pAapzjSDUUaXKxxqHLKMIafgHjjVF
	 p5xy1mvG0I5aw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH 0/8] SM8450 QoL changes
Date: Sat, 11 Jul 2026 14:49:40 -0500
Message-ID: <178379938594.163099.2250376340461760537.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118514-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:esteuwu@proton.me,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70A25742BAC


On Mon, 22 Jun 2026 20:54:21 -0400, Esteban Urrutia wrote:
> I've been mainlining an SM8475 based device for quite some time now and
> I feel now's the proper time to start submitting patches.
> I'm starting with the smallest part which are mostly modifications
> regarding the current support for the SM8450 SoC.
> 
> Regards,
> Esteban
> 
> [...]

Applied, thanks!

[4/8] arm64: dts: qcom: sm8450: Add missing PCM_OUT port
      commit: 9c510bde799765bf1d28004b0e6555e05565f464

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

