Return-Path: <linux-arm-msm+bounces-2031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6327F959A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 22:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A8C280D82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ADE13AE1;
	Sun, 26 Nov 2023 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
X-Greylist: delayed 104 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Nov 2023 13:50:14 PST
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de [134.119.228.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BA1F0;
	Sun, 26 Nov 2023 13:50:14 -0800 (PST)
Received: from [92.206.191.233] (helo=note-book.lan)
	by smtprelay08.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <git@apitzsch.eu>)
	id 1r7MzJ-0003uK-1g;
	Sun, 26 Nov 2023 22:48:25 +0100
From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Date: Sun, 26 Nov 2023 22:46:20 +0100
Subject: [PATCH v2] arm64: dts: qcom: msm8939-longcheer-l9100: Add
 proximity-near-level
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231126-bqm5_prox-v2-1-b7defc3979ac@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAKu8Y2UC/23MQQ6CMBCF4auQWVtDB4vAynsYYqBMZRbS2mKDE
 u5uZe3yf3n5VgjkmQI02QqeIge2Uwo8ZKDHbrqT4CE1YI6FzGUp+udD3Zy3izjVqjKmzLFSCtL
 feTK87Na1TT1ymK1/73SUv/WfEqWQAjs96HOBPdXDpXM8f4Iej/SCdtu2L6IJnrukAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.12.4
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=

Consider an object near to the sensor when their distance is about 4 cm
or below.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v2:
- add R-b
- Link to v1: https://lore.kernel.org/r/20231016-bqm5_prox-v1-1-2acdc732be9d@apitzsch.eu
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index ff532fdc1826..e3404c4455cf 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -180,6 +180,7 @@ magnetometer@d {
 	light-sensor@23 {
 		compatible = "liteon,ltr559";
 		reg = <0x23>;
+		proximity-near-level = <75>;
 
 		vdd-supply = <&pm8916_l17>;
 		vddio-supply = <&pm8916_l5>;

---
base-commit: 8c9660f6515396aba78d1168d2e17951d653ebf2
change-id: 20231016-bqm5_prox-4958ff602855

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>


