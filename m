Return-Path: <linux-arm-msm+bounces-78081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036D0BF47AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 05:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B189C480056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 03:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A52223DCE;
	Tue, 21 Oct 2025 03:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8BRnaHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86661F16B;
	Tue, 21 Oct 2025 03:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761016708; cv=none; b=sTA7iceg1DlnPZ6ihBlGnrIue/CFqPeqPDdy9tOiSBWv3jcbqAZghqy/V40vJBjqXOLEioRS2dwjX09m1hNg/BF2I6F3aNUJH8bRrmHoElZhgDVq7e/gQ7antLQQzyKyWKpRgTHPwcpm+AP3+MvKpXjKcBb+CKLu7HdNLkMcxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761016708; c=relaxed/simple;
	bh=AyEoq06UmSlAoFte/+Fwyk+I/YJMnS1FByQY6PQGBqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V455wGTQdr3RjRc2A+QAGW1s4wXNJO9U+ayPofycRSjvxf4TTMBRsXtMs73To1lYZbr+zAxMbfWbWdiHzdMc0O5x0G/GV4tBB1iD+/Ybchz7ppJGwcrnmCb3m4o1J1YW86481W/b3gUk6Vt/d8aD0fFl0umx4NI9K+pPSgd/MVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8BRnaHa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38962C116C6;
	Tue, 21 Oct 2025 03:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761016708;
	bh=AyEoq06UmSlAoFte/+Fwyk+I/YJMnS1FByQY6PQGBqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D8BRnaHaH+/q/pVRlRN7V97YFBuefPqbn7INDy2cL14G44VWDhQ+YApWSxyEnRT4T
	 HWlMoEcr7B8LktOk6/Xyz7AHdglt66m9twZy9/8GfbkqtTvN6YJdH2+tTnPCQicYmO
	 X9r+5oPGxnHnJ/r/Psq8zmY+yx7wijP+md+yHi3HhZEvXYLcVIzHqBtWpOk8JE7Jox
	 xp5X7WsetecCWG5o3G3fXBJJRpBUarLpzHfxumrssLf173vsWnZSfopwhe2GrgeV9B
	 ujNMq5Ol0yTCQI0RMRUst5AGsI57ulcAtg7NrGKXUoiexxjFmjtA8Lpc5pjxdARGem
	 1hXgXIQTFFd6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2004CCCD19F;
	Tue, 21 Oct 2025 03:18:28 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 21 Oct 2025 11:18:07 +0800
Subject: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761016706; l=1749;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=5q4VY4AxMxoxRYlMMxkanyBrW8rzVGP+XpBRBHIdMhQ=;
 b=4CsjSrgWE1wTojAbdjr4MvVEb6BBxDpTLB8JsHssBzFCZJqkKMD6a06nWD70SO7oydhKtQ5Cn
 506q5Cpx7EfB6G5HFfDpaR1nE5svQZUY7kPX5dS+uZIQAtzxkrrZ3N7
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

SM6150 uses the same DisplayPort controller as SM8150, which is already
compatible with SM8350. Add the SM6150-specific compatible string and
update the binding example accordingly.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -51,6 +51,16 @@ patternProperties:
       compatible:
         const: qcom,sm6150-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm6150-dp
+          - const: qcom,sm8150-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true
@@ -132,13 +142,14 @@ examples:
                 port@0 {
                   reg = <0>;
                   dpu_intf0_out: endpoint {
+                    remote-endpoint = <&mdss_dp0_in>;
                   };
                 };
 
                 port@1 {
                   reg = <1>;
                   dpu_intf1_out: endpoint {
-                      remote-endpoint = <&mdss_dsi0_in>;
+                    remote-endpoint = <&mdss_dsi0_in>;
                   };
                 };
             };

-- 
2.34.1



