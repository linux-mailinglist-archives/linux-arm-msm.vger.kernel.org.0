Return-Path: <linux-arm-msm+bounces-77270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B8BDC12E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 03:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77153E346B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 01:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F701261588;
	Wed, 15 Oct 2025 01:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlvWRlfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8413A23E35E;
	Wed, 15 Oct 2025 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760493282; cv=none; b=g2tSgjsEW8B+2Hed2he11k8O78rbMmtKA4gmxFKdjuLCW40u7Z0Efst5NpOKBsWJxjcI55AuGWuIKIU3aADTs0CAZhcb6YuYVZlfKvBo7AUq5DhM5GvOMMaX/ywfpTrp014kI2XBwQx8Tf4VbTf8grbBUrYFe90qLmFrGeAXtpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760493282; c=relaxed/simple;
	bh=3vsViLjDOPyapy+WokuHpqSNPBuplnGz6KFteCnagIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRvQtpQsCo3zKunpHIkzcdn9mh3cZ+MgVtb7Zi9FW4MPpZaH0BGV7fcah5zTXnyaPFKwD8Zk27yrt38EHR7/764C7+ZiFdEKn2lcxJbMPr3EgQCsPNTOE5CVlgkHynq1bgHb0cWrj9nQsiO6MvHBi/OJ1EtVrg/awkm9gL7ZRvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlvWRlfH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 044AFC4CEF1;
	Wed, 15 Oct 2025 01:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760493282;
	bh=3vsViLjDOPyapy+WokuHpqSNPBuplnGz6KFteCnagIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UlvWRlfHIH8VrAQYG1gSiixNRXSKpEqMC6FZCU3xTUQ5IOBBLxssY69OOct5zNjgh
	 deTODgRbPgywSfnAmlHbPu8NoEcM0P8wteNy1QRvPh4XTbzvvxT0DlFurjJnRKGU2N
	 IiJgilXR2Dd3Dp0K8zkmzU6NYv1e9iXjyXAG3qcWyEq6+VmlaWzfi2Rq3Ovdc+qKe0
	 LWOt4tq4YwF0X39OGJPzEa9gB1LX+klAqOjCXnM26wAmy+3Co7/Zc0nCrNGbOBZG++
	 srMKT7krMsUNWn4qkAlAZt0BrYoNr2ADqpHhkjx8O5W884UPWGZyDcOyFWyLa6dAXg
	 81H9eJG8mrQig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8773CCD184;
	Wed, 15 Oct 2025 01:54:41 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Wed, 15 Oct 2025 09:53:18 +0800
Subject: [PATCH v4 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-add-displayport-support-to-qcs615-devicetree-v4-1-aa2cb8470e9d@oss.qualcomm.com>
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
In-Reply-To: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760493278; l=1330;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=pd0jI9Dkdm+Hpa42+VfaO85gcD6oUV4iAuhBm2NnzVg=;
 b=V14NR5WlptAvRlz5UWGat8HVsDnkfB1h3yneLFkZbFslW26XJb1M0/VBO8Cl2GQ+517wO+bP0
 nW+tg/UgyOBCpCQ7bYBpQKeQ7+uFmKVI++97Wjlzytk09VjCgrRE8ey
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Describe the DisplayPort controller for Qualcomm SM6150 SoC.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
index 9ac24f99d3ada1c197c9654dc9babebccae972ed..935eca23ce6b30b81b3ad778e5fcacc817a230c3 100644
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
@@ -132,6 +142,7 @@ examples:
                 port@0 {
                   reg = <0>;
                   dpu_intf0_out: endpoint {
+                      remote-endpoint = <&mdss_dp0_in>;
                   };
                 };
 

-- 
2.34.1



