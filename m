Return-Path: <linux-arm-msm+bounces-84645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E2BCACC5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 10:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F84030B9BEE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 09:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21866312838;
	Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htffKr/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD4A2F618B;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186946; cv=none; b=pNyBYEyaX95yRwlAFfg9EFFONBTv/uw0jyuivEk7OJwhLb/WYt+57aMvjSi+WcOXxf8WJKp/nWl7r2TxL4FphpEPkaAejWHloG4qz0CAjVpDhdeiMTA72pOa63/kXzcKZ5erBLt9xVtez4jPKEWW6XBZSCvUaDYLHB2kdWlmyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186946; c=relaxed/simple;
	bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtylJx4AO1lcwjCeWN3rxq4L8U7cTgBxPCzcmCMEXxE4g9zbSMrTRynv7pecDXrTOwDOxeMLYqmwv0/6vGIexs2Td3i9Xhp3G2rYal889aVkbW9HBNSgVLg0Ouf94yZuE+Tke2nETapgBOmxebjIQ2GxPnGufokt7AY/qCslfP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htffKr/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9641CC19425;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765186945;
	bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=htffKr/2NVkiOraAB8Rq5VEkq+vJRTy/d9sQburuzP1NlgB18dZe1mhoV2hIlF+Pz
	 LPPSnZiswyIsny6Qcs6YJfPbfiWX+YOE+DdB79Hr6IK9FoPt1pQMrl5LydmWIv3PCi
	 IH264nUiH9HJPlZFBiMpAgNtuS5ZWrzBRhReAFri2urCpGpiBN5J0pcPaIy1VrTmZN
	 hzRYae6kNC3wxrvMi7Vv/iiWFVtkrctOTECufXJaUBeJ1cPbm6iPEWc1YnhU53Vw3H
	 HKc8usHcxpj7iifs7yMSFU7/3oiu3/8Ll0BZkJH/FKXMr/v6DbpxJSxjeYKV/kfNjB
	 1FafIlzmDDQqw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840FDD3B7EA;
	Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:41:55 +0100
Subject: [PATCH v6 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-2-e9e559d6f412@ixit.cz>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
In-Reply-To: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YFbMU07Wu5FnvTw9LCEYZ4TnpCBRf84TLv0leteBovM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/2va/mVnfDJFtJnUzeoVBNshAhSm3Ggl2r
 5QA/uM5P6qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 chtGD/9BRz2pbgCA5jVXvzIkQFz5VPZK6MADTaowDuIVc05EFfw847eVJ5l7MmBDfALQXt3fY30
 IAHs8oeh/Q8omQjqwVB80tn631ArucHySGNes6wHnn4aky3/eJi4unvT/Hhzx6xJS4Bfd+dNdaD
 JvRBf03pfWnqLLsPFtnc7MmR4MKVizOS/+cHvsStCfd2THFCosCOVDryvzUlY4/njLkbtGfDDjT
 ozsLb5x192nR0ggJyAUaF4/qBnth52cFcCSibYWTyxVGx8iOjSl+UY+hBLlhCIfxUYyolJ4J2+u
 Vm24ODGYN9gk6blxMnjGkd9D/jTr1rNi3tMCUYInLVUAeKUHTm0K7ga01eHhluxR6T66v/SqIl3
 NNkDLeMdhkQHCW6l09HohEDXUSoDYjAWBxDkD7HeNrgOl+LxJBZWQ3c649297Gblzlm/C3pP4NS
 Wo4fwvs7P1l6bQiC1Nv+etV4MfCBOQRFVx6CkOHJrVaBTBbx5WsXKNhns756W+HdXYCqdvDRv1Y
 YUb/6LcZZjN7JuXdSpkgRoUzxf8oRMxg9xzsZNtO5Crazo4pGjNPzxPMEWNEzmSN6UX9E6iAuzb
 zj5yMgnssRXlNor1dn/IRZGPaDgrzqDBXm2ZrhSAD5QpOA3GxhHPYMbsyJKjAsie4Mu77DXgJ7p
 YWgsJB70FH5m5EA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Add compatible for used LG panel.
SW43408 is not panel, but DDIC. The panel itself is the
LG LH546WF1-ED01, so introduce combined compatible for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/panel/lg,sw43408.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
index 2219d3d4ac43b..f641efaeb8b36 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LG SW43408 1080x2160 DSI panel
+title: LG SW43408 AMOLED DDIC
 
 maintainers:
   - Casey Connolly <casey.connolly@linaro.org>
 
 description:
-  This panel is used on the Pixel 3, it is a 60hz OLED panel which
-  required DSC (Display Stream Compression) and has rounded corners.
+  The SW43408 is display driver IC with connected panel.
+
+  LG LH546WF1-ED01 panel is used on the Pixel 3, it is a 60hz OLED panel
+  which required DSC (Display Stream Compression) and has rounded corners.
 
 allOf:
   - $ref: panel-common.yaml#
@@ -19,6 +21,9 @@ allOf:
 properties:
   compatible:
     items:
+      - enum:
+            # LG 5.46 inch, 1080x2160 pixels, 18:9 ratio
+          - lg,sw43408-lh546wf1-ed01
       - const: lg,sw43408
 
   reg:
@@ -46,7 +51,7 @@ examples:
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "lg,sw43408";
+            compatible = "lg,sw43408-lh546wf1-ed01", "lg,sw43408";
             reg = <0>;
 
             vddi-supply = <&vreg_l14a_1p88>;

-- 
2.51.0



