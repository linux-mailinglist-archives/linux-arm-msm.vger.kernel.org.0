Return-Path: <linux-arm-msm+bounces-114068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jkiwKbfZOWrLyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 02:56:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DE6B30D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 02:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=nRMSK61R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114068-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114068-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B20C9303F725
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 00:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9418D387569;
	Tue, 23 Jun 2026 00:56:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E6385D89;
	Tue, 23 Jun 2026 00:56:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782176160; cv=none; b=UtwqjZS9dtIwyo31QO1jJBDzqw4iAJTuxAiNK1lAamXs+K0UT7adRGWKRu37UZba/jpMMKRwE4dShx8OwE/XCMvb7kq6/OqA0YdJ+E3c9s2P/1/q3xUQi7BlunaruUWwfSTOsWHq9cvRS4Lplp0BTOeqgkmy6Gl4AKH+9Lux61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782176160; c=relaxed/simple;
	bh=1g64L8/SrBqId9q3KIZ6p2+e6E7DhsIhWfkLiC3FzPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FH+Vgp7hYPEJ3W0WZpcfMCpBV15c6IjydiXBk6fFQl/rdFhNWKczXN1tISd1JSAMYyRKLM6LcjI11RfAhxC3yEwWO37aagfGeBXMozFzbb/lO6WCG/6FgFIzLtJ4xkl0klfuMMkt7ZVEhyKUEP3TJ1MBkq0E+CG6Oq+Jp2BnjF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRMSK61R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1945C4AF52;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=1g64L8/SrBqId9q3KIZ6p2+e6E7DhsIhWfkLiC3FzPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nRMSK61RV5rGq6Q1ITpoA4Bx2Mp56Ze7MOzlYXpNK69SlgJPGtulCP1wBue/SB0oM
	 6LD6sCclYSvM+MljLSuhl+h2jvMxLLl+N0w8u0B8r9gZd83A4pD49TEXneizsm1F9T
	 3pjxJ7k4foNorxLzGW9g8fEe0CSQFBhrFJ5Yyad1yexNcVa6WMWUOQ294lzvRt1KSb
	 yTlJca2VJpc09kjIkupZAkdil8GfFGpcN2opKfF4RJzvxwsB1gDzGIgiJzgEKOxC/4
	 cSEVgwpdCor+hRaOTDSxxkUnu8txfvuDicOOSYuUv+Ll8zvxufkEEo4HLTa75AsPd0
	 E/erRaj5AtjdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970BECDB46F;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:29 -0400
Subject: [PATCH 8/8] arm64: defconfig: Add SM8450 camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-8-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=617;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=tJTk/lG/kNTnUjOLpx+gWVzUbilr34jSWya5odqqhqs=;
 b=qSquq9luNtdbeWsRumnnqskxOKb6XsFmPQk/wqQyMxMqshJHpQq5fAYeBMGjGEGP/BW3Zq/30
 KQKqkVP7EE1BbZmsUl2lhoH3RDA25jfGC+mzxoned9J0JrGpVs7snP3
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114068-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:replyto,proton.me:email,proton.me:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 567DE6B30D5

From: Esteban Urrutia <esteuwu@proton.me>

Add SM8450 camcc as a module since it's enabled in SM8450 dtsi.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..8c50c16ee0b8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1541,6 +1541,7 @@ CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_6350=m
 CONFIG_SM_CAMCC_MILOS=m
 CONFIG_SM_CAMCC_8250=m
+CONFIG_SM_CAMCC_8450=m
 CONFIG_SM_CAMCC_8550=m
 CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_CAMCC_8750=m

-- 
2.54.0



