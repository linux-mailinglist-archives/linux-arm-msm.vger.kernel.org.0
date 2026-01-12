Return-Path: <linux-arm-msm+bounces-88622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67353D152B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E11B3090DE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB30832ED27;
	Mon, 12 Jan 2026 20:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fC6VNZhp";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zQnkrNbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6B732693D;
	Mon, 12 Jan 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248851; cv=none; b=S1QEf9LyS54Tic7ENmXl0pkGnWfYkDrkGEgvjnca5cMwYAG0+BDSzP5yifhwrms1SkUEGcoreq5myDjOECpZuxQ3EMmg9iylV19QgQQz8wXVyxuCDDRf4CVWsYQ9PkKEyK54HSDqUwBDJ1RFgRKyd74yvc1OQ7qYybLIxdmJBbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248851; c=relaxed/simple;
	bh=QwsF8gMV9JHivMocPcRXkku5fWYJqEehBs0t7m8lR18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kgmXNQm7cGaoQbmPdCy7tvz0Pm4fun9ZUrWOITiP5tnVN//fG6WwsCTtXLfP5ERpaK9WdHRtALAy3JO0EotXNgvNwdP6rq8oB57Lb8+pjFX12XME83dqMzFbe+msNRdcTRu3W9QlvwgGs0zAhdvyiuNg+3oXzgva4Bx6C64/zCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fC6VNZhp; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zQnkrNbK; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248816; bh=qE92xuMEkpmQquWp+hJYlYJ
	gc1rdtQiMrbgdJFf+XrI=; b=fC6VNZhp9QkU5LRVLFcmQtqxVEArT6jHi56YOIB1f4Ub9cHMQq
	5ZjIAi4XbzHSHY51araf0jGq66IHqbu18exFmZWluK6DIbGJwmcpDViuUurpFBJwk3dVSLc7p8F
	cJiHSpGpgoAEA8xA/Sixi6DzzgAo2XK6N+iweiajvnkZL3AgF3e5l5ABIKDzYchy1NS5g3lXttv
	pX05LJ1vEagpmgyN9O72+vUaYZTNkmKPEF55IH2SxMBps4ClqN9lMbIqJ/7VJf5+VUBhDIw1WTM
	dgkVqGsh/1OdkCROwihTVHX8ivR3mRUgRkpdrDPoyTlGmn9//Qz/SbdgerxSfKu9fXw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248816; bh=qE92xuMEkpmQquWp+hJYlYJ
	gc1rdtQiMrbgdJFf+XrI=; b=zQnkrNbKLzfuyqGfzzCjy88W/V2Ngx8VbPt9G0R6tkjwuK8W2r
	L6b6xMvp07FsHJBTLTTkfY5zdVTTvbERN4AQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 12 Jan 2026 21:13:24 +0100
Subject: [PATCH 1/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix msm-id and
 remove board-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
In-Reply-To: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768248812; l=981;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=QwsF8gMV9JHivMocPcRXkku5fWYJqEehBs0t7m8lR18=;
 b=PYltWUKHXOzLBh4iVVsRMuNXSZ6Jq7fApwm3goNOCAWT8p48iY8gU/q3X8CIyTrzLaeHG3gbL
 rNAam8Baev4AHeEFLA6dSaDFRjMqWehfb0JzC34i0oTzlRl/pEr6qod
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Correct msm-id what should contain the version 0x10000 and remove
board-id it is not necessary for the bootloader.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 68a237215bd1..bf03226a6f85 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -18,9 +18,7 @@ / {
 	compatible = "xiaomi,ginkgo", "qcom,sm6125";
 	chassis-type = "handset";
 
-	/* required for bootloader to select correct board */
-	qcom,msm-id = <QCOM_ID_SM6125>;
-	qcom,board-id = <22 0>;
+	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
 
 	chosen {
 		#address-cells = <2>;

-- 
2.52.0


