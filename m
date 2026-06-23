Return-Path: <linux-arm-msm+bounces-114064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3bBbGrPZOWrIyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 02:56:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B696B30C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 02:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=q1vXSbLV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114064-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114064-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 291803043F96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 00:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18490385D78;
	Tue, 23 Jun 2026 00:56:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B67384CE2;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782176159; cv=none; b=IC+ThdcioWh7CPmkq4vnwRc0r95Z5Vhn0hIJwNY7C/lnw4XFXQTFLFMQ8h/7B+RVWufWWDxZpmEzSgEtRaw5dR0LqesAiEL/oHgK7OvgPfh6rFid00auz3GpQXVvS9cS0RCLPCRuW8q8CC5IqPLnq+kh2n5sH/OddJG4P6CS94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782176159; c=relaxed/simple;
	bh=NAQ2wPwIxNZQO7OtM7yBfMhOLpni9K/2uOT+0gTcdss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OuOK041SiPSQa0HJ8d2lhX3tFY8+okM/RTtfGR3Fuu9F+gZQ5HUt/88k0czhPedLSJvu4ba7DcaZOFBzRe4TPNyddj7JTBWa3KLbhYXOUNRqlcZoumB5CwlUVotgXyB1LzdBB5C/5gW2Tc1wBaEcoKu0Hu/oCvM3JpAu7ne/VTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1vXSbLV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6302AC2BCF5;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=NAQ2wPwIxNZQO7OtM7yBfMhOLpni9K/2uOT+0gTcdss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q1vXSbLV6q9wVvZSjX2Z9NxO07sUskAJXSNt/6c+Ggu4SEZWOy8o0JwmS46aFXNms
	 GCvT58oPF/x2PA2uErBIajK2ZCEjnzRKnYNjCf4kSaBI7ToprbfaE+tZwBsDuvAtkQ
	 mKNSSrVFYhfaO7Gm4ofolbpLZDozWVB8ox/t0PKWNp9dRmxgWwBy3zPFovvDiJKeJL
	 VRNIXjO8ZeQmXO5tsfXe8Aia3CehURxcE2yXhFGPpT4Om7hwSYxj6dPAUG/eaTmj+B
	 E3NemT2eBlfMRk44/DVZ1R4fLOVDDi44Rq0jMfsjJ+sNQDTdc5kLHA3xiBdl4JBMMC
	 tmRhl36qKbB6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4A4CDB476;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:24 -0400
Subject: [PATCH 3/8] arm64: dts: qcom: sm8450: Modify GPU operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=1067;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=UC8G+Beo5Ny4qD1bWQkjh6S3TFmJKL1P3wTRFImBETw=;
 b=V0HqhO1u+vHE2WkQyZ8w53tz9nq5vyJwjoEMcNSnSh9lQeJePF45vUwQO1oEV5l9C03S56ym5
 yuN/x2btOijA7GTkYxTOpmiR7wyBg3PEFIHlzEQG2lD3ssBubBG0T7a
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114064-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,proton.me:replyto,proton.me:email,proton.me:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01B696B30C6

From: Esteban Urrutia <esteuwu@proton.me>

These frecuencies don't exist in downstream device trees.
Both 220MHz and 285MHz belong to SM8475, and I'm not sure where 317MHz
came from.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e34e3c05bf74..5e331a25e22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2495,21 +2495,6 @@ opp-350000000 {
 					opp-hz = /bits/ 64 <350000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 				};
-
-				opp-317000000 {
-					opp-hz = /bits/ 64 <317000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-				};
-
-				opp-285000000 {
-					opp-hz = /bits/ 64 <285000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
-				};
-
-				opp-220000000 {
-					opp-hz = /bits/ 64 <220000000>;
-					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
-				};
 			};
 		};
 

-- 
2.54.0



