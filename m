Return-Path: <linux-arm-msm+bounces-84577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E465CAA6E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 14:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1D3D308D588
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 13:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90642F3611;
	Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWI11iTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5572F0C79;
	Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028083; cv=none; b=CXf5GB9S3ZEIw8g9hUhTyXPMbcUnrYV41Ju/FQQDanTw8hKtjvl+aeGRK6Dv4eAZpWYtDzAT1Q0gmylQiKPr7ZMmkQ1/k7OfmwdePztLFvliNTznrBCbluJX4YLN3LmZ1dKnMyo4dkwz3FRvC8VK0h53y8t3lzKM+v+PVpjk2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028083; c=relaxed/simple;
	bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aY5rEVcpMSjtI60WpitcutLYFLDtxuIfuF3+kXdyJD9SwlLlu4KsShNZQn3vsG/xYUOVsoGs/O0E3yxKQzpxu09Qp4RmjXBEIyFp++7FgBdfrd98CQvIDhd81D7+IuprlgNrwoXt50/SCLB6wfQga+hDShdoJATpRjPL2T38XsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWI11iTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A7ADC113D0;
	Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765028083;
	bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YWI11iTk1662lrlgI3+m/oF0fJJGm8s8rl1TK+lLiSUA8HxTLGsvLOgtngpaDnNEz
	 8BGor78liJI80GP9zx8tuzFot2/SQmPiH/EP9s7ChElKxlybWNmAHwElsRg/txtR13
	 XUiEZ8RT+CfULc2yDWeab3F9vUKkpFEwznNqbUrcGq6lfgMx0PbbGaBsKbcQylSGi3
	 EmxISxYQCsBP3qe9PRPeAf8nSfRugux8vWXN5Jc0S0cvu0kkJ+JIrwZ1vAAWL18eT3
	 ljV9I2/3QSnuI8Y6eNw94xyIhF7Hv4/9xXaOOqDftALOWuekjHaPfIaNzKsY2vxymh
	 iiD1QfLsvE+EQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9D9D3B7D7;
	Sat,  6 Dec 2025 13:34:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:19 +0100
Subject: [PATCH v5 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-2-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwvDaR+m+QhyrgquOXDdM2avUtPyLdimLfW
 Ah8GO3lqxCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 cvbID/0dhkZmu6IKOX/8vMpiK4EW/pxZfDdWH6Xl3GHgtOUlwVA7n7KVp8NCBvrKFzLw5DXb+eQ
 UgtZRmkMFLANxh8lT+JesNImudWnbE2YD+ugaz/qAnwnO1AfYdZNR+PZAzGnJlo+a24aJqj8e+x
 oczJr6qNI/BgtPEGfPXjWBDkyTZ2gMHeA7hdtbcDmBFMPs/krIj2OHesE2kMHsI1SXWinwJQDZx
 56YciqFiUea7HhcSJebXfpmk895bkbd+H7paXSb4y5J+VW+Z/d1/u4SR//StqHxqmdSJ7aUmApT
 49tnRHtHVoL1b32uBEDHXrm7MwJqH1pzrbU8TmDR3cFkW8fSyMTasyZ9DCkZModoSljgohFtB1K
 KMiUR+XgDMRPdBUEoZT+XvZXgfp1XuJODqo1Gr0iDoU5pj81iey5zs8k4DCKB/yDHJrfIsiY0y7
 oqNX7E4tiPocA953o6HsZEQ0VgPM4F8Jxg6rLqasniXnAouFHJOVlR6HPn6ItHkJo1wSM/giV96
 O805CINM5pmjJYB7Otrnri6tZ6AOXnt34l3x0t2f/x7CW7LeLnpSNz6zwhVDsi5qR7IA/9LaOhj
 qdNwyeqdg00IYowOEfdnyHBauwNalC49327BTqNLZxzMY0IRIbwMQTV/wo69RPC9pz8/+z48nsz
 nhema7e/ODkJ8eg==
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



