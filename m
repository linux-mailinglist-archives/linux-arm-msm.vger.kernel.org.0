Return-Path: <linux-arm-msm+bounces-108031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJLaH0G/CWrDnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA32561254
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C37BC3002D3A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436893932F7;
	Sun, 17 May 2026 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbZW3DMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0773D38F95A;
	Sun, 17 May 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023665; cv=none; b=qI/AvM32YHj6Knrxti3zVGXYHzimAQPkvlK2M9n429JKu2/FzHcgp5f54SgksCidDYXG+jDBp/umCQ4yOvtG7yTJ9I8HxxeYuzVzZUr/+bLrA9RcP8DosrE6x6cuV+KoyYJLcFu25EoyLQZFQMj5ab6jdRO9i0h/RkwP0drzEWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023665; c=relaxed/simple;
	bh=BvRaXHhUVTMKvhP8w+N3DX0eHRHTjSG0mWPxoEwGH2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+eTxZm8DojGG/YbkHQOIaUKNlbVHYYf53/hDdhq+JmHD9RKy2CiccnLoWFZv4XQkzWDygEByL2JTajBZPUW56R/tVXUUrzVUG6VrY9vbGdhlufFwyZjBHjJvCdMeLB243xFdXNqPgscWtYe7SsvEeTASYPQr2UHhwFZtIyabtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbZW3DMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D5C0C2BCF6;
	Sun, 17 May 2026 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779023663;
	bh=BvRaXHhUVTMKvhP8w+N3DX0eHRHTjSG0mWPxoEwGH2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fbZW3DMuezfKm/QhuBQiemw4Jxf3reqKw3iu7kU0Db8Ndm50P5GjPpEHY6uleSCk2
	 PzKYwAC4JwRnB2/0E3ZQJVCKSl+LdQa2N6SHBkan0ajJ6zoTD/6lLvpiSrCNFHWg4t
	 OokgpYAWHf6rMc/R4ienJBFrg4kiXRcnCDEAYZHI3JBX92fhD1mRih6tQgCtD7oS6s
	 8dj0XIVX7dsjPbmuurCyLj4zlglzUMLOg6kn4mIfFDpV5VQ42mMTsKxKT7lw5VMapK
	 dfw9MLgOKzDFSCr12HbSEKKQX3xImquyiyf2gnYNKKKACQy8me8h3ArLytJYhxcYNm
	 dc4BvY0BZLfww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDCACD37AC;
	Sun, 17 May 2026 13:14:23 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Sun, 17 May 2026 20:14:21 +0700
Subject: [PATCH v3 2/4] arm64: dts: qcom: sm8550: add labels for thermal
 zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-pocketds-v3-2-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
In-Reply-To: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779023659; l=3018;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=CXTAgnet4ppJsOM7v8NkuaJ4ZX4sBruKC6TxmpiZmV8=;
 b=NsRfos64bslkmHERiEcrL2qI3n4M3NDysI9tqF7HNYPOlfVqpx54/3Orbw+Ftm9uA6/m46Fy7
 hpcvZVJ/TjbBsXZjPIPjn+4lhOQ9I4QJH74kfrP0UDMmTvGAsuQ3kmv
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: CBA32561254
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108031-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
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



