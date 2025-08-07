Return-Path: <linux-arm-msm+bounces-68032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F46B1DBBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC0118970FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5193926E173;
	Thu,  7 Aug 2025 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0rf1jvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B74926CE29;
	Thu,  7 Aug 2025 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584412; cv=none; b=YblEg85fmNOJ8wiWStEnALA3iLT1BKACNLMjEEfSb4Qp0KTk63asl2/oKnE2Ftecavk03Xjq8NK3fTqlNLn6o8JMXxTQ0cqilkFpQOkXiyoZHrsW2R82/iM80ZlO+3Xl4K+0j2WHIB35qmEaShY4x8gAfQPvXYHexw/7UixOD/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584412; c=relaxed/simple;
	bh=FOL0w7DOfieRoHaB9Ul78LDBqcess9+ToUcE7ykpAjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbciYunAViouJOcT/BT+tZWlrNNNgVfJ52VT3qt1XoQyh5gfGcGDOmbPF48jYlHPA5c5gyn0XaFzBr2hes1pRuM2GNwSmNfKUMqZLcEh73o+VpQF98FyrTMqZ+1ZxnoBTQZrzQDiqPbWeusb0OkR1olkN240sokwPXNiwwB+mtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0rf1jvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3280CC4CEF6;
	Thu,  7 Aug 2025 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754584411;
	bh=FOL0w7DOfieRoHaB9Ul78LDBqcess9+ToUcE7ykpAjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y0rf1jvEePu0QXxOhXR1SdRP5SKyROhFHVQppBqQt17nwA9+kcZfjObXJU9jVrvYA
	 VKGScnIORIlYBVT5Uv1dx2lPgyUPUlet+YXwUwpx2mnTTOuijETwzdesxpyjOZmX7q
	 59dvl24bSHQyOXRdoUCKpHvsIjPv5MxdYKsxRbRN9S+Rjgmn0kckgCLVoYotlYNnOT
	 61jlcDLB3cE0hdfIbthS4yKZgcJGBi7RxGeVaxUl+Ppv53hLwoSVfJwpHIDZLTihWI
	 okZJNk7Z71Z7hxZgvBhkTUKuLvXNEhs3wbhwy3ntKhWpo0AojampzCcEsIjKw2jJVT
	 ZZyS5ok3TSKzA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 07 Aug 2025 18:33:19 +0200
Subject: [PATCH v4 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp:
 Reference usb-switch.yaml to allow mode-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-topic-4ln_dp_respin-v4-1-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754584403; l=1691;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OavRSmJV+Lo9KCyA/cX+W+bVR/yk4ys3JG3suJf8dkc=;
 b=Iafcr1U2bjgUJpEYLDgsUhD1dl27BHIaVCsIxR10n1ssD+yiCBI5ZwHQaqBesxQ2wtL+48XE7
 NYq52AnNE2lAOhFGc1AD1g4wEQdVZ8hUNZo64GTwc/cLT1I9djRHC3M
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Neil Armstrong <neil.armstrong@linaro.org>

The QMP USB3/DP Combo PHY can work in 3 modes:
- DisplayPort Only
- USB3 Only
- USB3 + DisplayPort Combo mode

In order to switch between those modes, the PHY needs to receive
Type-C events, allow marking to the phy with the mode-switch
property in order to allow the PHY to Type-C events.

Reference usb-switch.yaml as a simpler way to allow the mode-switch
property instead of duplicating the property definition.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 38ce04c35d945d0d8d319191c241920810ee9005..c8bc512df08b5694c8599f475de78679a4438449 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -73,10 +73,8 @@ properties:
     description:
       See include/dt-bindings/phy/phy-qcom-qmp.h
 
-  orientation-switch:
-    description:
-      Flag the PHY as possible handler of USB Type-C orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -106,6 +104,7 @@ required:
   - "#phy-cells"
 
 allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:

-- 
2.50.1


