Return-Path: <linux-arm-msm+bounces-74612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A912FB9A78F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58FE07A4730
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 15:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DC030C373;
	Wed, 24 Sep 2025 15:07:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3781B6D06;
	Wed, 24 Sep 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726478; cv=none; b=F7Wcq5UIx6KkfldbHDZcwmQpCxqbZAUxYo8R8ylnceV3Hhk5y8eDbjPMp9dh0FOPnPxbzwMYvbxecsIwYJ6WqDd0nhXDO0hprVJ4d7EwPW4K0YXVkCyTt0g03KuMmaGRGW/O7yqiQYoLB+eKG6T9T7Ur+CTxW88xKwO+AcU/Atc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726478; c=relaxed/simple;
	bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llTJWEJIOySC6YBHOTZR05ohg/fwWxQgQ8KW2TNrVnaD5Q5hGxnqLCzB/KNKOFIsEjTrSrYMrgfEur5nT60HFGLAnAixzh7WWx822p4YqwpgjELF0qBy/m8VwplvlJbe/QqH6Hm8uShTjzAu6X9KP+t0t91vdE88HPD1O9UruEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1758726442t33b7eb77
X-QQ-Originating-IP: Fsm/D9yroVI2+CHNI3//z/SKXGG0MzyxOXkIUTx2+74=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Sep 2025 23:07:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14160160660269297962
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 24 Sep 2025 23:07:09 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Radxa Dragon Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-radxa-dragon-q6a-v4-1-10d584f2c806@radxa.com>
References: <20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com>
In-Reply-To: <20250924-radxa-dragon-q6a-v4-0-10d584f2c806@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726438; l=921;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
 b=mlbCD/up2Oh6hEpPYYGoBXgkYD+oBqdXJZ2ZCpbhXPPmcxHEvXqCncv3M+bFhkKBlPbvwn0IJ
 ckeKkJAp5IPBDL6hu5LfChWk0nOwbvoE0QcnphVyOPvYyJuKZv5N7Gc
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OGKsKZu6aOWmkulnyvr8iZOigOnLCRkIuuz2vgZ79q40gtetxnSt0Rkj
	1OW4UMnkVYYiRe1nW32NQIf2KS1bXi+8yGy5C5+P57IgiUa43wJAocN5lrXydIOiizE0j8s
	Xxyc67QK4ttQpF4Oh5a4WQWgNU9ZKXYQhZxW8N2WzCzWNtT3dPpAs8fRLo2B1Nq06QLyjmi
	6yea7Nf6YuqJX/AU8Bml1gkpl6RpPXi/ovHiCR+gRhJhm58oj5h+l762wJED7givOhjbhSD
	AjBq8Gk7g1Td4lhjeYTnAqt4gWXLdGCOrIvltXgn12nNxFC4aHjd88G+GmgsACEIdrSz0Yl
	QG9dlPmorCB3I+4kyu4Wk55IcnoFz1a35HrWg0Au2whq4s476rEZlpeMklAsGBpQRxhMOUg
	5MVIA/TZhgBKVDVpgHSr+OCh2VGfl93AiDenQFxDNeq73kQk3KNEhb2XIt91muWhbOAmRdZ
	3jcgcX5a4694z0hBkCdIExP4QTUBPDQngqWg/H2tbVtZWAP6RkFevWBJF6U8SdAze2FLF+z
	snZ63x5hL5lsIjfhJx353ycP3z9omyfO4BFoLs60UrxDNHpN0Axpmp2G5vFrjmIVp0a37qV
	8odn9t/FRK/llD6NwnTzV9qbdKSW2EEPxi0jRoyTs+oFYW04qKYKAfFXPG/NG7MFWBUYPih
	UVbJAiOTyT4UrsmpcEhY7cUNsMC1sVVTucP5Nkounrfm+FkqGWaK/YNCf3YBBf7KelJeiOt
	t3WWVT9TJZCyH9XzIYsqpcadDwR5xYBtNJVJycBGm+vbBCLWJLAKcYtMUOXa28a8f867rAG
	S9Qn9tLbSX52Tktz520FvnnasHM/u0B3PcZDPOQ7iwvdwkFgsz69Hx6+wYDxKSTgCpLeeKT
	qaTdM+o8RI5ftRs81/P0dAnG5Ep4CHGImoGJd/4yY8eILpTZRpxWefj5b2YOJOhk7Zj+xOT
	bbGoz+PGBTwq8MARedS/C83YDPJ61ov/1D3cSnSVAPMBgyQCtRzLvBPGtII1NNyolm8VLS5
	k0fnQi9Q==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A is a single board computer, based on the Qualcomm
QCS6490 platform.

Document the top-level compatible for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f3686f1647b9e2ea192c175b0b96d48a..a7469a51adf0d6ebc1bf25acce8f125a844dcdbf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -339,6 +339,7 @@ properties:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - radxa,dragon-q6a
               - shift,otter
           - const: qcom,qcm6490
 

-- 
2.51.0


