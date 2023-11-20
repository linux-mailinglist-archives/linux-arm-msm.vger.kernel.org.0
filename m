Return-Path: <linux-arm-msm+bounces-1171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE87F152C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 15:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C64761F24AE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AD31BDF8;
	Mon, 20 Nov 2023 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="2EFIumOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68CB10EA;
	Mon, 20 Nov 2023 06:03:46 -0800 (PST)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 3CD67408F0;
	Mon, 20 Nov 2023 19:03:40 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1700489020; bh=luFC7my9PJ6B7z1i59mt1ERZ1dlWg9/dkHvKsguCUSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=2EFIumOnwWrgKhwBCBCO2272lSCiqSdUGvQJNk57pm0yww1zUrsGJR+gH+IWYAo5Z
	 SR48mDvjEAFsk5ode5AF8cV+9HrAEhFvD8yL3BvpEKYNT8DHDwbR1xgXDwcvVw/EQD
	 gaXHCvdpiWUIEM0aFmk/jmgVf0LFtxOKF9yYT43fl8VV3bwSndfK46g8OTZDGCmFqI
	 aM7L2pXBedIWJFK/n/8cCOurFQ3nc+heruBKRzhwZBBrWr70IZUq6vFj/bywNMB9cR
	 sYP3ULGTkboNYOkOD0eIPzUwcPO4aCxA7t5sa+8XYRi6+z937pJiaGWqt9pBTdNHUG
	 rMbktoSlcK23g==
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 20 Nov 2023 19:03:03 +0500
Subject: [PATCH v4 1/3] dt-bindings: mfd: qcom,spmi-pmic: Add pm8916 vm-bms
 and lbc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231120-pm8916-dtsi-bms-lbc-v4-1-4f91056c8252@trvn.ru>
References: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
In-Reply-To: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=luFC7my9PJ6B7z1i59mt1ERZ1dlWg9/dkHvKsguCUSo=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBlW2c6DqBL7FqK9Osl121enWxioHz4Jo9CZKI+X
 fEfW5dX1qSJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZVtnOgAKCRBDHOzuKBm/
 datRD/4sCHsa/7oYl28AW2Rx9iMsFxxPitshJGaVmsC40v5X1WEOdTzt2K81dCKCHQvYwe4uWJI
 Lf/Se6LVQwNR/MRhkQmQejvusx5MOOn732bWsnyrbg2lw9705iFWgn0k+IDMgohPtzzS44+BtUR
 xWVUEanmdG2hzAiEVTA0+LAk4nWU41J9lt+aqwmJrwE7xV60kuN7tOCD4ku5IiuyT7E4gb7Wwn7
 jNfDrK777nrMd0ENq8nCLQfOBvl1g9i1fpm5hWovctCDZ/YNpvVrMTIHU9C38N6RLlyS7n2vWua
 KHWSWOEMHHG6bKfyoAUrcHRkjNPcM8NCF/g6y7NU0VZr3GsLlWjrMgDNMeSiPfhh7xO/uG//Gtm
 Z2k/kf2J4S8WtkyZ7dmtAtivvqf+8JrZ+x5hMaIcEWeNh+lNX+7Z6FJDeSljwhbCra29V15kIiZ
 E5mnt5iEF0wiHyCpyxqsi/vIqMYxXDWyIuGt3+YMnmuK6VaZiEqOmukL5WQefhb2kVVGiCu/FXC
 tCP9ZiRoGscpZFCMmaO9WWkiAcNyP29WcgzwALVAuKNrk1wFsdB3sJGMhETDrI5cRuuteK8sa/T
 uVTjmOVdJ/RptZPx5P5bPmAOGSstOYgZdqytJ+9mnDAo2Sic1PSzAZ891StyXu9kSjsRYMXi8gs
 NjlFXUsyWuAVxtg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

PM8916 (and probably some other similar pmics) have hardware blocks for
battery monitoring and charging. Add patterns for respecive nodes so the
devicetree for those blocks can be validated properly.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 9fa568603930..49103e07032a 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -134,9 +134,15 @@ patternProperties:
     type: object
     $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
 
+  "^battery@[0-9a-f]+$":
+    type: object
+    oneOf:
+      - $ref: /schemas/power/supply/qcom,pm8916-bms-vm.yaml#
+
   "^charger@[0-9a-f]+$":
     type: object
     oneOf:
+      - $ref: /schemas/power/supply/qcom,pm8916-lbc.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
       - $ref: /schemas/power/supply/qcom,pmi8998-charger.yaml#

-- 
2.41.0


