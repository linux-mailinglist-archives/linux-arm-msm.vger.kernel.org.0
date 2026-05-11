Return-Path: <linux-arm-msm+bounces-106905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG1FFze/AWq7jQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:36:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78E50CD9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D530730391C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB10E37475B;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIZaC71e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85963372675;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499234; cv=none; b=bBXchkdHsVWAjFWzBoiELQCAobCLd9RK/fdhRbxEJik38Upvx3EBraEPfff/ZVPE3gsSFV6rK99BYVS65HhEAQku+c84iW3ME4xURdgBaYGiOMDLFK9GjsvsjxDmduDrZlDahLCwRjK9WdAeNs80UkPECt8W2jxoqURNpp6GV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499234; c=relaxed/simple;
	bh=BvRaXHhUVTMKvhP8w+N3DX0eHRHTjSG0mWPxoEwGH2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oY4TgiWff4632FJoF2X6QIrzo04u4I6aUOFb9aX3C+h299Nb/ghZciCUoMK4aAKJ4hs7YTfkf/UusQiia6KKLyPj4y5rtRWUEkSm46X8Ws3PWTA+GUkIY6qsEQoVYWuc2cfyVhkHelLZzzlbRVC6odW4AZHYdyglI3x9ynTiQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIZaC71e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 560D4C2BCF7;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499234;
	bh=BvRaXHhUVTMKvhP8w+N3DX0eHRHTjSG0mWPxoEwGH2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JIZaC71eIIbsLFjW9h7dzZ13xv7CzxaPHsv0XveXn+LaKXSRHLhlvbgAbTD/0IKIH
	 H/HXinnfDkIP2XQNVr9FhfkAiKutqL7Zzae7laswqGdtbQAPJtiQ70EHtSrKcOscBf
	 dzNCZY/xqGErUnuVVtO3P2KMZrC1u+p3G1fsMEe5ym5aysemlaDseqYOviY6ONsfEc
	 UuIrdp31DiSVnHZZQxs1PMeWOXfY8JuG1PAq8T1gK6nkFNDFxvF7lyiHLRWAcQ5KwJ
	 pR+R42A7bPK/Lo8Taenl8I6udt3ehB5BHRaa5z9D9QPtOODYeQp8hzNOZA/sUZQ6nV
	 hyqSiGN8D2phg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F71CD4843;
	Mon, 11 May 2026 11:33:54 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 11 May 2026 18:33:54 +0700
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8550: add labels for thermal
 zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
In-Reply-To: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778499232; l=3018;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=CXTAgnet4ppJsOM7v8NkuaJ4ZX4sBruKC6TxmpiZmV8=;
 b=CDL/2mDZG+mA5bItxVRFwPfv0/q43HpDGxgv1f09vZhMBwSNp4gAlDkysYg9dVSRXXVcm6/e0
 dCoB0282p5JC5/13PSs3/hsV099oojLV+LqnUuX/lVnDJJQNmp0TreG
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: EB78E50CD9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106905-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Add labels for the cpuss, cpu and gpuss thermal zones so board files
can extend them with trip points and cooling maps through the &label
override syntax, instead of redeclaring the zones by path.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..a9c678fc9cb2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5764,7 +5764,7 @@ reset-mon-config {
 			};
 		};
 
-		cpuss0-thermal {
+		cpuss0_thermal: cpuss0-thermal {
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -5782,7 +5782,7 @@ reset-mon-config {
 			};
 		};
 
-		cpuss1-thermal {
+		cpuss1_thermal: cpuss1-thermal {
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -5800,7 +5800,7 @@ reset-mon-config {
 			};
 		};
 
-		cpuss2-thermal {
+		cpuss2_thermal: cpuss2-thermal {
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -5818,7 +5818,7 @@ reset-mon-config {
 			};
 		};
 
-		cpuss3-thermal {
+		cpuss3_thermal: cpuss3-thermal {
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -6028,7 +6028,7 @@ cpu6_bottom_crit: cpu-critical {
 			};
 		};
 
-		cpu7-top-thermal {
+		cpu7_top_thermal: cpu7-top-thermal {
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -6536,7 +6536,7 @@ reset-mon-config {
 			};
 		};
 
-		gpuss-0-thermal {
+		gpuss0_thermal: gpuss-0-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 1>;
@@ -6569,7 +6569,7 @@ trip-point2 {
 			};
 		};
 
-		gpuss-1-thermal {
+		gpuss1_thermal: gpuss-1-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 2>;
@@ -6602,7 +6602,7 @@ trip-point2 {
 			};
 		};
 
-		gpuss-2-thermal {
+		gpuss2_thermal: gpuss-2-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 3>;
@@ -6635,7 +6635,7 @@ trip-point2 {
 			};
 		};
 
-		gpuss-3-thermal {
+		gpuss3_thermal: gpuss-3-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 4>;
@@ -6668,7 +6668,7 @@ trip-point2 {
 			};
 		};
 
-		gpuss-4-thermal {
+		gpuss4_thermal: gpuss-4-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 5>;
@@ -6701,7 +6701,7 @@ trip-point2 {
 			};
 		};
 
-		gpuss-5-thermal {
+		gpuss5_thermal: gpuss-5-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 6>;
@@ -6734,7 +6734,7 @@ trip-point2 {
 			};
 		};
 
-		gpuss-6-thermal {
+		gpuss6_thermal: gpuss-6-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 7>;
@@ -6767,7 +6767,7 @@ trip-point2 {
 			};
 		};
 
-		gpuss-7-thermal {
+		gpuss7_thermal: gpuss-7-thermal {
 			polling-delay-passive = <10>;
 
 			thermal-sensors = <&tsens2 8>;

-- 
2.54.0



