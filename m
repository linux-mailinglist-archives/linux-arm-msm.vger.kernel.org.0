Return-Path: <linux-arm-msm+bounces-57610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F982AB3AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 16:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96CE919E2CD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 14:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D6C229B35;
	Mon, 12 May 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0cFB3JP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF4D22839A;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060627; cv=none; b=CSJs+xB9Wh8MZlQUjFsMxyfGoHKa17izxyea150fHK6Ee9TRCzM5na3a5g/z65++kwpamwnyL5jLN01ZRRlxPOLwM5FeHRTcJxzKLsI0I+z0dNgANkwpLMvpalQDOhCOd92sevNUC5z5XxffvfJnFRjnANq0zOoaRt+NiHS3VVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060627; c=relaxed/simple;
	bh=0LAPDXa5I0NdmsoCsYbDuS1YJZWQGmhLYM6Mki0Mgc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uf9f13GdnCwZ3UOfEeySPMNVTk7YMJGTGFZOFU6jAsqciAAOlXCwr+GyVI6oic/LRZUABA5gfG4YCwr2vypp3EukkyJj6mpkmWV2JraraSH7DCu0ZC78CrLIYvWuLu7Ay1FP4XzcDroPYK7epqZGZ3RA+JBWhBVKcAW9D3qNvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0cFB3JP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A8A8C4CEF4;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747060626;
	bh=0LAPDXa5I0NdmsoCsYbDuS1YJZWQGmhLYM6Mki0Mgc4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m0cFB3JPEoyG5mXQJqXFk513jDuvGFS2x6oPrtP7UfCRCvbSHB45vK5Bi0ZcKWh9X
	 FvFT7s1atJt2z2XIM/SGjK28Y2ycPMGk/hMx2iZ8gXLfyEGLZGOEcBZa+WpFVCshmF
	 vTIEvTAST9ox1Ev8ow8lkZeqhn5yI2xLx3myPQStLTulQLqjvEVM5FOU2hgvIeqjgq
	 X+BJTOKEeLLU/fyEPKGmV91ajPLvj9sT+UUpyVJ60mFggbz5iZyCSOuC0noxufz6np
	 /K/A6Og3I58z1jgcX30YK96P7ZURfAORS/AgBLI1UHI7MXKvaQGALbpvji5Qe4FyeW
	 PN22VI1V8I7kA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AF2C3ABC3;
	Mon, 12 May 2025 14:37:06 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 12 May 2025 18:36:47 +0400
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5018: enable the download mode
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-ipq5018-syscon-v1-2-eb1ad2414c3c@outlook.com>
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
In-Reply-To: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747060624; l=1075;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=zfAYNmt44Rxqlg/ZxmVRJXn5Sdnp96Uz5P6gJVc6Rpc=;
 b=otGj6mDMvVAeW3DAnmE1Q52E32RMPaedTO6pqYspuD6W7nLLCdgSbUcoPZ8FCW9RkP3EoOjvK
 vpkAT0R9w69DE2lsQLoC8nc9mo+VGfpPJ3n1Os6uxVbMzXJRwGyZzy1
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Enable support for download mode to collect RAM dumps in case of a
system crash, allowing post mortem analysis.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 8914f2ef0bc47fda243b19174f77ce73fc10757d..0abb00cfe4ce2f9bdea73deebedad8297f56322c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -79,6 +79,7 @@ opp-1008000000 {
 	firmware {
 		scm {
 			compatible = "qcom,scm-ipq5018", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x6100>;
 			qcom,sdi-enabled;
 		};
 	};
@@ -187,6 +188,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5018", "syscon";
+			reg = <0x01937000 0x21000>;
+		};
+
 		sdhc_1: mmc@7804000 {
 			compatible = "qcom,ipq5018-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x7804000 0x1000>;

-- 
2.49.0



