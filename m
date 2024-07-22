Return-Path: <linux-arm-msm+bounces-26804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08679938F49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 393ED1C20FDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6277A16CD35;
	Mon, 22 Jul 2024 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="iqPUVlX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E874D16A38B;
	Mon, 22 Jul 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721652451; cv=none; b=GfvApiNH8Z5loDWDRSCsSN5I8MlPI3hNa0dM8RMN1ierEXwd35+MH9GEab+9FibsZgo3L6d9QFkV93qfy1FjpSac/NSJCukHIbSBr651DP2471/+qn4t0zQ/BjL6YCw8zcBoMGGY/2Vp0vopPMrr5Q4qkL7ESm85shn7VCfYcug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721652451; c=relaxed/simple;
	bh=Aw1Z3TjECflXLfakeTDiIH8VUBM7J0RBPuDtK3QNd64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mF0+L0fIiGaMZQ6+0IGlKhl/C7nmXME+t8skqw30NLE5WelmOQubp/+PVyJjmMjpVjI9Ph/njvAl3tpwz4UNDsyJM/bz/7ftXMwriNAa0kH4c2N5EM6/Ylb057TM13b/7D97SJ7ghCwV/+0Hx5fd7je8Q/V6uBYuak/KsHgtmiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=iqPUVlX4; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 55C6F4053F;
	Mon, 22 Jul 2024 17:47:20 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721652440; bh=Aw1Z3TjECflXLfakeTDiIH8VUBM7J0RBPuDtK3QNd64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iqPUVlX4hqC9t4t+QS95rDTdonwxd2axjnEVEjEazMyMeSD/vMlo6tbpwVp66teH0
	 7h19tQGTpAKCj88TcrUVCd1B9xgWhr+crjrbL28C3CJDrUnz/iGSQSLsmOYSoR9hKC
	 TBf3TOs/JpmxkeamRCvVESpZ5R7egPX2YV9jIGpgTKTbgXxNJYAKiPhqN3PjIeGs3T
	 SHN28iS10s3/r9AVc015xULqf07XhueCmOHW0xHdrZgGCcTcXFo4K5C8/q+SCkgDl1
	 gfh2Efdzh66vHU2agiqR+sbAhJGA1GgiqtxJ8XPz9FdPE233Ek0avtTTKUecySK8LQ
	 nqt1syYdNRRog==
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 22 Jul 2024 17:47:12 +0500
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add msm8916/39 based Lenovo
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-msm89xx-wingtech-init-v2-1-0c981bbc5238@trvn.ru>
References: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
In-Reply-To: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=Aw1Z3TjECflXLfakeTDiIH8VUBM7J0RBPuDtK3QNd64=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmnlTWxRBquLPCVyTolj2vGmZaIqcV0cpHaO5Wa
 YBRRHPCxTKJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZp5U1gAKCRBDHOzuKBm/
 dTN7D/9JqddYKIu1oompc3f5kg2MbCVHrV504MvlLvynBsP0Zu18XhVHpi4y8IBSwDQVygqge1f
 lZ6PBRyTv+ADmSnxrbLf7MP2fpu+x7ek+YNE04vlo60EuyzzYgSpwuReDzDrMnzC4oEMnqtxNxN
 xqxlZAMF2s6/sIvdfhjmmhR/mKXc4mJkXwL5l6TDu7kYJHVfDHmJvTxrol3ECKuoD1f6gWz4Zu9
 W0O6Ts+4QgQ4qMK61q4+g5dr6PrgC0a0L9h5Y6sPYcuYkkfSZA25H14mkorSfMdN57ErkBg4/gO
 QHJ7qPfAn1jcaWy2oHKIT0zjL4sx41f4gQ7fdOt37LN6don2a4XDp0xdKQs4+aO9fMpVtYCitQ2
 3j3zmte3Aa70/zS4UKfTWOAm4rKFqsMAatd0IbMJRLffHABeNlxpKC5sbOY8iSCYnmJfyOrTPcu
 8UtGQX9c1sddFimPzA4edDrVnkH3i/ZqI7HH56sMgK7SPPCeM8RiO1vaK5hIqlBLnBSu5gkenkV
 X07/tJ+ahEDrs4CeGB6CY+oFSCsUYyd8FagwjnSonHTIobZqWypJ4NsNm8aj36S3UL10ecyJhE/
 wt+7vGehEZfzRN3VKwfRqcwbMXfPoWf+CmZOKrNs/rCfml7eoSa307ZGjA50Su9wE175IOLlssr
 FEhLmuFhv2F/S/A==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Add compaitble values for some variants of Lenovo A6000/A6010/A6020
devices. These devices are based on designs from Wingtech so use it's
vendor prefix and part numbers for compatibles.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..a3f28f08f5d6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -155,6 +155,11 @@ properties:
           - const: qcom,msm8926
           - const: qcom,msm8226
 
+      - items:
+          - enum:
+              - wingtech,wt82918hd
+          - const: qcom,msm8929
+
       - items:
           - enum:
               - huawei,kiwi
@@ -162,6 +167,8 @@ properties:
               - samsung,a7
               - sony,kanuti-tulip
               - square,apq8039-t2
+              - wingtech,wt82918
+              - wingtech,wt82918hdhw39
           - const: qcom,msm8939
 
       - items:
@@ -234,6 +241,8 @@ properties:
               - samsung,serranove
               - thwc,uf896
               - thwc,ufi001c
+              - wingtech,wt86518
+              - wingtech,wt86528
               - wingtech,wt88047
               - yiming,uz801-v3
           - const: qcom,msm8916

-- 
2.45.2


