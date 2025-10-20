Return-Path: <linux-arm-msm+bounces-78063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7805BF3AC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 23:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 032634E3563
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 21:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8223C2DF71B;
	Mon, 20 Oct 2025 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Co1KxcnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA41258ECB;
	Mon, 20 Oct 2025 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994783; cv=none; b=St0+veJ/G0UzTAmzEjkr/MkrUHrcWjpPpW1TIhmsSFt20pF5AcSWnPb8SLv56VxtITbRzGM6m7NYAkfocsOjv0iQznr2t2OLLYYR9zVSkSVzLm23eRl3QIenrV1RlvsB18mATn6CM2ri2okYoRHQ60YLHK+EwixyF8Hnpa5v9cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994783; c=relaxed/simple;
	bh=tfk6qX8NCv5KhgKGHT4nhdjDwIFmULmDydrvZ0XRVvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XcWrUdsNY6gM6rxsni5hJGJJfBx232W3wahZjH/cTl/ECTuu235BLBGmijfoTYUFEAlCqgoaetJjy8wpvxXSwjtFblySzPuQvU+UM2gDlyGI0A0ABEa/kzKFlfmWx07CfBugqkDK0Hn979CA8sXIOYeJvuaFWqm7SCEOOeTS8dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Co1KxcnQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8276C113D0;
	Mon, 20 Oct 2025 21:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760994782;
	bh=tfk6qX8NCv5KhgKGHT4nhdjDwIFmULmDydrvZ0XRVvw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Co1KxcnQqo1WvkCxtL6n/WsWCughHHLPM6+s2NInRacU2XLUYtilJ5O2BA+RerSHx
	 A+bySGldTuH9E8oUzNXR8LvbZAYZZ8jPJcfEZl3Ev0xG5B32o28e2JtyctfyMQrj6Q
	 7/AaMDZMdYshNlXy49MlsftTz2QjAvKf8qgHnIb8ERfK1sdF0qSf+fWKIF46WY8+1X
	 J1r3E+HhOiJoWwnk0QXW2fgUCQwZ8nX49bwH38BS5rnYcryxCFhalvG+XZiFdtDlJT
	 vrSySID5YtP6L3fLkD+Mh4iMAySpLgHFLhktwvRvbpjWrortZ3/rKJMzQfmpQY+Hk3
	 zdzyCEbTvH54A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94145CCD19F;
	Mon, 20 Oct 2025 21:13:02 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 20 Oct 2025 23:12:56 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845: Define guard pages within the
 rmtfs region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-sdm845-use-guard-pages-v1-1-64d714f8bd73@ixit.cz>
X-B4-Tracking: v=1; b=H4sIANel9mgC/x3MSQqAMAxA0atI1gbaoDhcRVy0NtYsHGhQBPHuF
 pdv8f8DyklYoS8eSHyJyr5l2LKAaXFbZJSQDWSotoYMaljbqsZTGePpUsDDRVbsJvI0O+Mby5D
 jI/Es9z8exvf9ANN3t0RoAAAA
X-Change-ID: 20251020-sdm845-use-guard-pages-9c2b2fa0b71e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Sajna <sajattack@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2915; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=E2eVtp9CZo235rNLq7eCdbNC0gKfjdqyqcrfaduc4TA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo9qXdl3mY7plSvTx0oldYpigYKjtk6zobkvdyJ
 cbZnG1oJDuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPal3QAKCRBgAj/E00kg
 chXkD/9f5U607VemeAM2+jdhdbFPYzpHwX7OZtx3hLqgJkBJN1dC0xGvHiG8H0K4EUHbCQkhRxv
 QwdSeKNbcJmUs8xH8KxYUiLo3jHCeaAyp1keRtpIdDlFBZ5L1pR+vK9LN4blahQM4bLI7ZB1W0b
 MxurXBTOm3AGlwAhRpBv0kV7b/4N+gQnbI646YbQtobSx3glV46lXUj3BmbsLC6OcFAuRnpFU+7
 OzNOkX2Zc9nd+ftZ1nCr4IWACQ2xXxjJWJ3upw7pk5SoLc+mrJmo0+7rpZxDtVJ0SyFsb1xoBLs
 PaqkliW6Ncalr4WSghdwrVJ1E6n52lD3Pw5n553/CG1JD6TM5YWSCAZaeVOgXhlIdoquZL7ATeC
 YT5jTDo0C8O4sSsvBSfgW28XtNFZJvP8EIshF1KTww8/fo+v5pxkgvpdHJVO8hG1IVgeHJC2eck
 EYR9wcVX35nG4YQ4OyOsAX6zDrIBRhgq9C/yRJtj4kSYiNdbTFfkzU2oFQ3Q3WVSEzASkxsQtNc
 pa/Hce6ETuvOEHLJWDk5rRfjvt/Y/BuNCAZgYU6wvHNx7ghZFuWFZJ5qffWsiJLLwIndUeH3Dpr
 5qbOA7GXDqXdkN0uQe5lajrqiopiU6fwLCXlCGzfzrdD2TcWftF9oCuUybgIamLwQgZzOxuAz/6
 1Fw6sSftNiMU1ew==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Use qcom,use-guard-pages property instead of polluting device-tree with
lower and upper rmtfs guard nodes.

No functional change intended.

cosmetic: set name the node rmtfs-region.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Tested on OnePlus 6T.
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi      | 17 +++--------------
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 18 +++---------------
 2 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 99dafc6716e76..83b98bad19dd2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -99,26 +99,15 @@ memory@9d400000 {
 			no-map;
 		};
 
-		/* rmtfs lower guard */
-		memory@f0800000 {
-			reg = <0 0xf0800000 0 0x1000>;
-			no-map;
-		};
-
-		rmtfs_mem: memory@f0801000 {
+		rmtfs_mem: rmtfs-region@f0800000 {
 			compatible = "qcom,rmtfs-mem";
-			reg = <0 0xf0801000 0 0x200000>;
+			reg = <0 0xf0800000 0 0x202000>;
+			qcom,use-guard-pages;
 			no-map;
 
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
-
-		/* rmtfs upper guard */
-		memory@f0a01000 {
-			reg = <0 0xf0a01000 0 0x1000>;
-			no-map;
-		};
 	};
 
 	gpio-keys {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index dcfffb271fcf3..61d63003fa371 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -75,32 +75,20 @@ key-vol-up {
 	};
 
 	reserved-memory {
-		/*
-		 * The rmtfs_mem needs to be guarded due to "XPU limitations"
-		 * it is otherwise possible for an allocation adjacent to the
-		 * rmtfs_mem region to trigger an XPU violation, causing a crash.
-		 */
-		rmtfs_lower_guard: rmtfs-lower-guard@f5b00000 {
-			no-map;
-			reg = <0 0xf5b00000 0 0x1000>;
-		};
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
 		 * but given the same address every time. Hard code it as this address is
 		 * where the modem firmware expects it to be.
 		 */
-		rmtfs_mem: rmtfs-mem@f5b01000 {
+		rmtfs_mem: rmtfs-region@f5b00000 {
 			compatible = "qcom,rmtfs-mem";
-			reg = <0 0xf5b01000 0 0x200000>;
+			reg = <0 0xf5b00000 0 0x202000>;
+			qcom,use-guard-pages;
 			no-map;
 
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
-		rmtfs_upper_guard: rmtfs-upper-guard@f5d01000 {
-			no-map;
-			reg = <0 0xf5d01000 0 0x1000>;
-		};
 
 		/*
 		 * It seems like reserving the old rmtfs_mem region is also needed to prevent

---
base-commit: 606da5bb165594c052ee11de79bf05bc38bc1aa6
change-id: 20251020-sdm845-use-guard-pages-9c2b2fa0b71e

Best regards,
-- 
David Heidelberg <david@ixit.cz>



