Return-Path: <linux-arm-msm+bounces-85487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6ECC75E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 005A13017ED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85157350D49;
	Wed, 17 Dec 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POBGhnqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EF43385B6;
	Wed, 17 Dec 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971565; cv=none; b=I6GX/SVvEWC+inq6E+WIV4qWNZQWOJX5x0rKNXXm9BSmqb3eDR54gW/MowPjjCcNj4a8lE53Fgu37FaF54rQtFsHrmcjQfi3JXq5fVPupGzYtcCTJeNmtddGPF1X2esv0gcZUS4P4j7UzZZB0DAZJd0GmMO3/2jiH8nE6vJvJY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971565; c=relaxed/simple;
	bh=JLuYOBRJok5U9a7Z2KPzxqxZVOqP35KmsuLI4X1AaZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dILD9uuvk/RdiWL/Xtj8I5vpanC9JojObPRihRrfmdunflgabF/aC/RU21sJIQVm+fkwW0XOyJdvsEFZPAx9tB38TqeJvXrqGeqnkLYIjFlObuhT7Phlv4XKBcIx9ajjm9kmhGDVDwjEDXY/x+02bpufW+oaw9O1/nujDOyD9Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POBGhnqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E314FC116B1;
	Wed, 17 Dec 2025 11:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765971565;
	bh=JLuYOBRJok5U9a7Z2KPzxqxZVOqP35KmsuLI4X1AaZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=POBGhnquu1VnKC0SkU36/NIJpq7tX7mCqBKY1VvYs186OBRh4SO6rwKzfi5pP2hBo
	 wdWAWYQbjYw+MJZi3j05h8oW3UvvPRAto2MZ1DNznkojQLFxtf4ET7LWNne2i0Igtq
	 nXeazWGumOF8h6suUlYNMEJ5O5n6VKJexUFXcaHKCEkIOkOhGv0gBomNs0gkXLn6CU
	 W7ogdi+pRYTnZq1LN94bpuwPv+RsoEGo8oUdGF9TaQasCjBLNKAxIrt411+ObYK2Pg
	 zwaryrv5iyqmmG9N9h8DqKcsN6AKmgvytaMpR2YFooEPC03phDqmVwWcH4umzRGlYy
	 XcxRX8nkcegmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4796D6552C;
	Wed, 17 Dec 2025 11:39:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 17 Dec 2025 12:39:23 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: sdm845: Introduce camera master
 clock pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-sdm845-mclk-v2-1-7028c2d09145@ixit.cz>
References: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
In-Reply-To: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=cTUXa+N953sv5GxQGdBXyAR0p0U/nn2ORgNoDyha5zM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQpZrjyrLIEO33W/yON0eBpo3ZJGTkEg+d6onq
 vjDiyLzhlKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUKWawAKCRBgAj/E00kg
 cgzCD/9DaIPYE3l3aFYA49lwXZi905wJ7LMUxGqKLVRoMzQ3/2nWHPdD0bRc7dUgoF0sDLpNsX9
 XqF7/kCC3eILkDb4xeoygrI7dt2uqwGgtyFj5UDxK2y4jE+cmrhusQBbaS3nzXuaBkNAU6Axx8I
 w/5dwe6bWxk46Yfif1+zyDiZmXZFEPFG6d+RjXT2GGI7wlt6HxkEHb0GWu/kpcHN73RjsNFhSKI
 qcRjE2Kr4JWJFYlfjS7K/Imvos9LyPvTzYAkk+HGJjwqWatNp6b/kDVI5qKH4HFOw91Z4cRsyMJ
 p2yq0zcKu07cQWhf/qKNuTpJv7307I/bxNOol3FvNM+zNARIgR/bBTPQhyQtYSCxGAUxIT32hY8
 vFJ/YqePaXUYCS+1L3RjwJE0qT2Zxiql/Iy4uswP/Vh/J2fSyMMq8mT/lTnKdDy0Yb9HfKnGc5d
 40gogk/T26Sm+x2Wv7fJhqniUTcJqbujICHsVBCQ5bsGRCnCq0BfJUZzKD/9NsRDiM8Cfn4yaXn
 6HCXAPKY6nKmNFyV648p+xVoXLJjT7eYis/FyX++A2CX1lS7VTc3oy5Dg687XoIaSVPBZshwaZO
 6YBzP6e5oo10/LGjR+MZcPsX/BVoQowc9EV37sT8yH7SJNXKWEZkCSeb3UrYevXzMK7SEXbHt8f
 jDlw2c248fndF/A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Put clock pins configuration for camera master clock into the dtsi.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba7..c0f21a745fb0c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2805,6 +2805,62 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc_intc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk0_sleep: cam-mclk0-sleep-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_sleep: cam-mclk1-sleep-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_sleep: cam-mclk2-sleep-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_sleep: cam-mclk3-sleep-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			cci0_default: cci0-default-state {
 				/* SDA, SCL */
 				pins = "gpio17", "gpio18";

-- 
2.51.0



