Return-Path: <linux-arm-msm+bounces-85171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2EACBBBD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 15:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE831300A9F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 14:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9097327BF7D;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2SSz347"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7242222A9;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765723885; cv=none; b=KmIXLTzxtdISljnLxVyzFoYnKd0tgxe+qsEdZyLu6SDGydX6Ie5WflowxBwst6doak/wKXCVWdFmzrwpp4MDzssegf0pjWfZKcbF7wBT5O6fb6qK5GyqIMnR6UC+XVG9xW0OFd6YbyqTPFzBpvjcyKh1gOuQ0tgTJ+NLo4eNuQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765723885; c=relaxed/simple;
	bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbJyI8Jvr9VfzbxXUAGFftfeJCnBSdlhSD6v3kCRdGlGKOIj5UEgP91Y5WCyGyFQIJelhYv/jJJEviVz+ZpPl5zBAfk582kkfxF3mnT8eGnmt7aTU5/BYs/TQ2s//zYvMd2rTkA0/C0QUiGpCG12pv+ncIdLl0H74dM+42otFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2SSz347; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA4F1C4AF0F;
	Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765723885;
	bh=P6JIG7+hx3GfFzXJ3PaLVXgbb5QcMZmiNNwqLuWL2lE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R2SSz347OxKTzAPx8zyj0MJF7Yw5gBKJnmGcmEFVinAbkIO82uGMqcNOBcF3XWuyb
	 7rzTGr6T2lnrtAQQXmbKnw9NnWGr8X0Q237O1jVR0js7vizxjhheYjYII5l9bRCmWr
	 grO2cWC8EpLin6OVnGcuFmayoMA+XGp+TaArr3jk/tnboILzl36TOS6VlzVrzZzZAn
	 irDWz2egUZvGTpGO/61tIATiFwGAGR/YcBF822/PnkthBPjuk0NT0wzN3lWQdDnVAd
	 AxZRL1cRkIsFh0PUOqM9YbJJB//zHskhBx9xIcPyUMS10iDzbBoa108PreLSxAadr8
	 XV481Fw6+WYQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F7AD59D99;
	Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 14 Dec 2025 15:51:18 +0100
Subject: [PATCH v7 2/8] dt-bindings: panel: sw43408: adjust to reflect the
 DDIC and panel used
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-pixel-3-v7-2-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7pHn9J6iCqBCdtD8yewwLBpfudJ4RJP++xB
 59hQduA39+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6QAKCRBgAj/E00kg
 cpZKD/9PH8dDTDkpIg9K/Ku80OQ7/JGvd1yAdL5NrW/VSu14lqUowYNik7JbHpgMx+uiRZZ1Y+e
 N+tTwgRxJxGM9p6AnScv7K+p4SHh+YJJ2BHjJJCCi0HCFLXItb9J1MPmwSz1LgYC7xd6v70HPZ1
 adtBFognWX6FiP1Cp2xUpga6yT/ufLzNAiv601rPL2ykPuQsJobI2vPiEnxRzYVohVuJ9OB4lJ/
 Wi9hcyxXKejNhRS6C5YaX8U1upG2YV8m3PPbtaD4aR1Rj5sQL7FFVnAjBqxCqsECPD6QrSZFt18
 Ij8rilGiXR0FjyGAW+s9jnXJoC6D5UtkkkJ90vXGd9VH+MEzUu7UvFT5KhADt5LUdKUu4Z1T8SI
 Tarz4xtvsBen2X40SotwdygUaOAUqpMID58qFAGJP8WOzBBvXYd9cgpqdcxL1e1lGTCqQw3tAE4
 MYEEjUr/ZJo16wvuTHrXB5Jxhre9Z0C8J/q7Agw2VcoHNfVpKF3mMjtMzb3hQa3LHHFvR5fnQU8
 DDcliAJ6dZ5msma+z/G8nibryNVpz+yd0sxYXBU2Qvg9z6bQ5M48lOOBfv4OzMh9yFPdWJfeVJG
 QCpu3aD4Y2tlyaV8Rw6EEaZNF7qe7+MV13TEcb3TXJjINUCDGJmA58Pw/gFYPTLafHejpeNUJ3B
 gUBckHN587ZOliQ==
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



