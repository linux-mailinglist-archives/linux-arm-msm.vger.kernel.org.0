Return-Path: <linux-arm-msm+bounces-57898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E905AB7332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9879A4C7035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2986A1A9B4D;
	Wed, 14 May 2025 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBeY9E/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB31CFBC;
	Wed, 14 May 2025 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747244864; cv=none; b=KEfnyRcSI2kq9Uw+JDd++4jExwnwI4jrrrSOBScBJYrHkY5Fk8Uh+T8ojDjhickLkjLOQSU686vQWtylcGLMm/I8GASagVDLXbIqLT6i6holmVjcynUyaIUu7SdVE43laQHJZkzMnWcZjMmMg5Gt+oiLXbXSRfQt62VdeNZeOPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747244864; c=relaxed/simple;
	bh=/dQkEDngC+KpH2Gbfq1uiafn+knBm0KwLnMJlW/Shd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HcIYl/5ODd3bOfGZUKFYUg7OZoN3x3thB85qHYCTJ9iUv3zs4ItHGbNl7MnM+K/HR8tZTrON6DAeCXatQHUUpD8t7c0Zph2Yh212/bIXo1FnvrC3iMmbG/wJIlUat5O0Hc9vIWxI6JlzFNBhK5njYe8p2cZXXH7eerD1TucYmgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBeY9E/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46F1C4CEED;
	Wed, 14 May 2025 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747244860;
	bh=/dQkEDngC+KpH2Gbfq1uiafn+knBm0KwLnMJlW/Shd4=;
	h=From:Date:Subject:To:Cc:From;
	b=OBeY9E/SuVOD92u+Iyz048LEu62xxzZ6tt3E8FyTSPif5R2MpeE/PUMaj4oxeBb51
	 vjlQVyBf0LxONz0CYWxPPQMK/0Wv5FqGoYkrz6lCBuAvuusY5E+wo3Zd/7aL0IkY6x
	 gpCtQ83CP9d8mnb/YNx+pCJypgnYOvd4oQINRYp2Llhs/soYkh+1cwDIr3ZGG64oNi
	 aF9I52+Gxs/MgancBmEatL+DIq8JDq0komSf8B+McGSL5d4exry1HZbRSS1pv6LCXA
	 +s8D4um+VFgzGiVbncIi2d2lpYzWplSRDdZttXlyHBi4iLBsG6CIHVibtWG853aSud
	 n6K6j6Ymzecxw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 19:47:16 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-romulus: Enable DP over Type-C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-romu_dp-v1-1-6242d6acb5e5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACPXJGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3ZL8gsxk3aL83NL4lAJdQwNDI8tk8yTz5LREJaCegqLUtMwKsHn
 RsbW1AIkbUPRfAAAA
X-Change-ID: 20250514-topic-romu_dp-10129c7b7cfa
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747244857; l=1332;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=idWeA+jW5u6yON1W9MjSzJfFsemDmLMoRNpUHcOfINo=;
 b=u4CCp0uUoBNJwxVoPfpd4Lm6k/Yol/9lrp5dCVZi8jzk2l4y9afghQ5abndQXE6EUfpF0HEsY
 KqMJsdqgOGbCdgy7hkeFqE5cY0Nc6rxWWJ5AbgRA6EXCavEqrhZ2by7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Both ports seem to work, just like on other X1E laptops.

Tested with a Type-C-to-HDMI2.0 dock (translating into up to 2 DP lanes
worth of bandwidth).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 26ae19b34b37e0e3c67eb4543de898e94e62c678..0fd8516580b2679ee425438cb73fd4078cb20581 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -944,6 +944,24 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250514-topic-romu_dp-10129c7b7cfa

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


