Return-Path: <linux-arm-msm+bounces-89439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE488D335EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8DA530EC090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110D833E373;
	Fri, 16 Jan 2026 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UUtAsG7F";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xs4C8Uw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8D33DEE1;
	Fri, 16 Jan 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578990; cv=none; b=eaDMZrMkVmusYptQddtDQstHh8YZQLmgAVEHA9gdhyv1ICC1GKoAciEIH8l5c0LsK1Tz2Hv/gmtD8iy4RwbF0cqWpip47Sxekucd1p0NnsMaogY9Jx3tBWJCfC8ZLOn7OSqsPPC1s7Ivw8M6xxqw395Oig1w+2vjNSDC4+6K9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578990; c=relaxed/simple;
	bh=VFaCfbTzspjIFLkBNe5/3NnB7u2/yZK1b0qYCRgmDKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XB7xd+YCHdlRZUmA03g8m3HZWfuK29EKyAFKuynLDEZWLLVTrL/fxHhCSZiPj/+KqsFjchbRwUG573mSSF5KtcFbfAY3V2gTv/Ax5yWwmjSFPEP7sOoaAk5BCpPU5nBuG/Jfz8H6A3H2PucGu2FYWLOjw/B+Uc/OaIIZscscJvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UUtAsG7F; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xs4C8Uw5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578903; bh=jshATM7V8XA6Arha5w1nsKi
	ECHnRPyTHQJ0toZfe/yM=; b=UUtAsG7Fur9PaC/NnjdEYqUA8dKVgYVNN2T2vDhmxzx17ieoRD
	DJxma1Yy+oW8hG/Edn4x7jABVx2Ilwwy9B/A0mLRQ8RJJpzo97keHXXmuYXHvziqhkXC8v4yhzF
	APU5w1A5ERXcFrQ9yHnu5BYmyRshL+1nWxF4G6VrQHEupp+oms9F73p4Me77ldYi7Dd1lYR/2O4
	tPFPTgY018spCLlYwLU0+cNhpP53DtxrKgbAf3NayA84eSdoIpeKMYzfmTr9j+OJEcaDbLs6Hze
	46yihQg93T+F4pdk88vckNfWFAMbI6bEZLLGW5ZF8fyDksezkMFqX0Gh3z2IXE4TfLg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578903; bh=jshATM7V8XA6Arha5w1nsKi
	ECHnRPyTHQJ0toZfe/yM=; b=xs4C8Uw5/eiGq3DrvbXtmC47XdU4W10/KBaZ4MtbdxRAqN+04l
	ieTKZoVBGJlirC9g3qnnRd4qwnF6jJ6ZQWBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 16:54:45 +0100
Subject: [PATCH v2 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set
 memory-region for framebuffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-xiaomi-willow-v2-3-4694feb70cdb@mainlining.org>
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
In-Reply-To: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768578900; l=1017;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=VFaCfbTzspjIFLkBNe5/3NnB7u2/yZK1b0qYCRgmDKk=;
 b=zvweg9i4g2cKm4m8iUeBk9LLhgZ5WacUq0LYcO93maS9jjiMcalYKG25t/3t/CRDpeGebAiKt
 4IDuLiVvHHQBJnzarHf+DSSfKvZy/cI+nWmYbCWdFPimmO92gzLA2D4
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Use memory-region property for framebuffer instead of reg.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index d5e5abdb3b2f..4e1444abc29b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -33,7 +33,7 @@ chosen {
 
 		framebuffer0: framebuffer@5c000000 {
 			compatible = "simple-framebuffer";
-			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1080>;
 			height = <2340>;
 			stride = <(1080 * 4)>;
@@ -62,7 +62,7 @@ gpu_mem: gpu_mem@57515000 {
 			no-map;
 		};
 
-		framebuffer@5c000000 {
+		framebuffer_mem: framebuffer@5c000000 {
 			reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
 			no-map;
 		};

-- 
2.52.0


