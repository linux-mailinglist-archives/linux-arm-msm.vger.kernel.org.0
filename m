Return-Path: <linux-arm-msm+bounces-50711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F0A57BE4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 17:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 036333AE7E8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87661E1E08;
	Sat,  8 Mar 2025 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLtFli/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328181720;
	Sat,  8 Mar 2025 16:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741451065; cv=none; b=GeeCU891/Dw1UTK8dyyhsxnaDVnlohFiUfLw3P/VZmIWp/SGLuO3XVpjxY0T3QDV+ig5tGq6Tg0N/Jp5lPWCS8IBrjw750RNY0NlpSPq9j+6GS83GkLpCHUhdNYM/tNtwFT9neLP7NBFx3k4vdfGVRIYRmMYaI9vHv9Zm+7k4yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741451065; c=relaxed/simple;
	bh=mxjT0AhbJ+fH5D/EKExE2eW9/MHvtfzCY9Y8SWeY37U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J99dZzilowK0UnkNR2npmQ+2/+z/EyVmDrojG0gfZ/vK/aWLX2ctPWPlyzzc6C5Ul0dIZSeeO0EzA9LgU+TLRTGMJYJa9Q1io2PzsYyMBWn84RkY0ifDWe9m0dH7BJqsidnzNmTCTG+Kq2iAKznM5b8XOTpCBBk2Qqw+uOB/oQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLtFli/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE880C4CEE0;
	Sat,  8 Mar 2025 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741451064;
	bh=mxjT0AhbJ+fH5D/EKExE2eW9/MHvtfzCY9Y8SWeY37U=;
	h=From:Date:Subject:To:Cc:From;
	b=MLtFli/MqO4Uv/vWJrQeJLZscaCJTFEAX5rQgbMV/KCi0OPTJwFFDxn108zqE0AUY
	 4ZUgcP7FesRx6Ue7uOOdz4kdyTTUmtA4A948l9KVk9tLi7hVhKQzE5tE2jdBC2s1FY
	 J01kx2JQ0NBb7QC9vGMVumOBCPshqKtYQMXQilbfH7g6ciLgaHrVwaaKThFBBJ0Oew
	 7hUcCwiqNnsZCK/LS7KMhr8eyiiREePVqzayZTU0kPVAGVOnsrtckXK2e/cJfdWNW4
	 /HjcnvNA8gHnY9x9aMea6CL8M569x+a0v9TrrnKl94utGlJEaIWr25mJTfc4gQ+wZ8
	 LE1juUi+x7pWw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 08 Mar 2025 17:24:15 +0100
Subject: [PATCH v2] dt-bindings: usb: qcom,dwc3: Synchronize minItems for
 interrupts and -names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-topic-dt_bindings_fixes_usb-v2-1-3169a3394d5b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC5vzGcC/42NXQqDMBCEryL73EiS4k/71HsUEZNsdaEmNqvSI
 t69qSfoy8A3A99swBgJGa7ZBhFXYgo+gT5lYIfO9yjIJQYtdSHPshRzmMgKN7eGvCPfc/ugN3K
 7sBFWSmfQVXVlL5AMU8RjTIJ7k3ggnkP8HGer+rX/eVcllECFZVcYh3WlboE5fy3d04ZxzFNAs
 +/7F+Ml9NnNAAAA
X-Change-ID: 20250306-topic-dt_bindings_fixes_usb-c00dbed787c9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741451060; l=1614;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=SIaQZaIKTd4vnJ9IAfLcrJh++UCApOBcXKazDbk+l/Y=;
 b=Amm4rC3YU4Z15RBVBr6EdjVNbFDukRdBlIfPI6IlqXe3lnfvIz1ugt1lS/EibcOQPYZW7+D/m
 QdDEMC4crwRCxk6QIpq0QTsAjnpNNYHkR/NL7+clIUOassRlqNIbZTr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It makes sense that ARRAY_SIZE(prop) should == ARRAY_SIZE(prop-names),
so allow that to happen with interrupts.

Fixes bogus warnings such as:
usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short

Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Use a better reference in the Fixes tag
- Link to v1: https://lore.kernel.org/r/20250306-topic-dt_bindings_fixes_usb-v1-1-e1e6a5bde871@oss.qualcomm.com
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a2b3cf625e5b3962f3acfe93de02f3cae2b6123d..64137c1619a635a5a4f96fc49bd75c5fb757febb 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -404,6 +404,7 @@ allOf:
           minItems: 2
           maxItems: 3
         interrupt-names:
+          minItems: 2
           items:
             - const: pwr_event
             - const: qusb2_phy
@@ -425,6 +426,7 @@ allOf:
           minItems: 3
           maxItems: 4
         interrupt-names:
+          minItems: 3
           items:
             - const: pwr_event
             - const: qusb2_phy

---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20250306-topic-dt_bindings_fixes_usb-c00dbed787c9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


