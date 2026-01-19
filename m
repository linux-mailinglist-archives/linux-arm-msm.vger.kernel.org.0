Return-Path: <linux-arm-msm+bounces-89626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143ED3A720
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B622C30973BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55006314A8A;
	Mon, 19 Jan 2026 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4n+kxt+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308151D5147;
	Mon, 19 Jan 2026 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822957; cv=none; b=SG6jfqHgP/wYxCaCCmPWVD4cwi626B7cv9Mnz6Wy9LAs+bLbb2s5btyeMYVeWBE3H0xDEyY7KbRT7mFFvD483ByRigPI/hQkMFv4rG9qnLsJdRuJSITKHy1swzDCnJsTtrwqGvRELFxNbyzzWYX4+JSsGG6EjUYzm3D8YuS1QbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822957; c=relaxed/simple;
	bh=p7BwBZ3CJoQk4HVe4nHFMeZrazckI11cQtdGd5Uk0oM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/1ENWRuE9Fk/fE/8iQRFSDRmWXS+JeDHi8gcUY/hiVoJlqK3sPBbfvg/ya37rgY7+99gvkN7bpPrWQU3Ecvzo+qRHB437ZrpYSaXcl3txrneUv1TmzFoB/Tpud/cfVzzWadbwuHQBgs9ntC0hYfg/qIlf97AUfmF9GWle0S0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4n+kxt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6043DC19423;
	Mon, 19 Jan 2026 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822956;
	bh=p7BwBZ3CJoQk4HVe4nHFMeZrazckI11cQtdGd5Uk0oM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E4n+kxt+DomryQl/qdyRD4EGO5UGOUHMNWVxtLEwty23OfrzrgjpsFBuSUuS4vQ6b
	 jCXa4bp5i23LVw/ux1NzQ2y4yLBlfqIsLzhxexOJ60qig2n9OzKlUBf8A2L5kd/Tme
	 rab+dmcsweAAflcel0p6Ijrb9IbeKkYioc94w7Dd3IfIjcNzUuQNV2nw+rX78na6xD
	 TzRblZATPChHaaAa4UT2ab2IxOvUPuQkHNlxNa+5rqGTEkT5T0u+ZxRgDzz+ztpFx4
	 MQCXkgaYooHAKQwDEwC1JSmNzaRUxvCyu235ShEG9ZGFjaDbECJ7D9Q0fw+l8MT1pQ
	 hPmUndch2A6QQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:23 +0100
Subject: [PATCH v2 01/10] dt-bindings: net: bluetooth: qualcomm: Fix
 WCN6855 regulator names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-1-6d1c75608bbb@oss.qualcomm.com>
References: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
In-Reply-To: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=2102;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ArYjsTFvVwtiWc2pr6zBuOLAPh5xnWBuoOEgYD+yios=;
 b=PL/FD9C+sG8CwGlEc5eP5d0GxP5DL68x/+i5DPcrVkfeFcdYVm2Q4jdKvwqogMMCLnK9GPdP3
 0f5++aVL9doBIVJ5if5Q3HHVy+GDCuiPN97CE42wOeJmboL3FO1tL7c
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") changed the vddrfa1p7-supply to 1p8
for whatever reason.

The schematics footprint for this chip definitely says 7 on the input
leg and the driver still expects 1p7. Bring it back.

Fixes: 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index 45630067d3c8..0beda26ae8bb 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -50,9 +50,6 @@ properties:
     description: VDD_RFA_1P7 supply regulator handle
     deprecated: true
 
-  vddrfa1p8-supply:
-    description: VDD_RFA_1P8 supply regulator handle
-
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle
 
@@ -68,7 +65,7 @@ required:
   - vddbtcmx-supply
   - vddrfa0p8-supply
   - vddrfa1p2-supply
-  - vddrfa1p8-supply
+  - vddrfa1p7-supply
   - vddrfacmn-supply
   - vddwlcx-supply
   - vddwlmx-supply
@@ -91,7 +88,7 @@ examples:
             vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
             vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
             vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-            vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+            vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
             vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
             vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;

-- 
2.52.0


