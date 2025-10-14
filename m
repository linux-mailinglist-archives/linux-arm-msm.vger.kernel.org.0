Return-Path: <linux-arm-msm+bounces-77179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB48BD9239
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 13:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81223A696C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8253101BC;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMBSgPXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98F30F932;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442912; cv=none; b=BMON3Jbu9fkZrNzJKjk04rGi0MJ+SM9k3qhgZgHwewStk1zi8WGEgoz9i80sQMkI1bnVSFB/TloIUFhjWwiFnfb6cOgfYSwFahAKYbI2H6l3WyR5a+Q0YsfHlut3faR1lYpokB94mssg5RPHRm66WV6YZ90B98la1SOltMi2adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442912; c=relaxed/simple;
	bh=3vsViLjDOPyapy+WokuHpqSNPBuplnGz6KFteCnagIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPzbiRF7TnOU9Xa2Sb6ULSB6kDTWI7VUb85ZVuIhv+I/9g7H2gFvjuGqIqpUTqQ0pTe9gP56/3Ud2hi3bf9OVOYNRUUoh5hH2agzJNB9jem+zNuWb+et2cRUa8nMcuoF2u+bPWfuQBSwWUo4I9UqyKVrZQNei29Rp4yOtsgy704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMBSgPXz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 170A6C113D0;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760442912;
	bh=3vsViLjDOPyapy+WokuHpqSNPBuplnGz6KFteCnagIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tMBSgPXzqEbVeWkphNMjC3Io9D3XdjFLuM9zUzX0s0NF5xUZfqzJzBKFQRlYQODir
	 3Vri1j4D0c8v3Ecgrl8iiJO7OuLfQmO5AEkutcoj1ZbTPexC426zq++HAJwJin9zvO
	 SkZhmnE5oenkun/tSD9eDlidOtLoIcx/UGJu9fzv5uyKAVeRio8xzhFYZz4YZrmzWA
	 UtgCizzmMOznL0p+C7EiMNIoyjqIVofgcGL/SjwgdzxCa0eko6vR0gYAFUEQHV9fa7
	 zg1z+YoQRuVTgHiGM6EZ3tzguB8nM0cLygIkj/2UC0PphYYu54mI2DCM/eP/GbD3iY
	 +vfLpnwB6I25A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04263CCD184;
	Tue, 14 Oct 2025 11:55:12 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Oct 2025 19:54:54 +0800
Subject: [PATCH v3 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-displayport-support-to-qcs615-devicetree-v3-1-74ec96ba8144@oss.qualcomm.com>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760442910; l=1330;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=pd0jI9Dkdm+Hpa42+VfaO85gcD6oUV4iAuhBm2NnzVg=;
 b=T9Ay2vQJQys+PiS/auEth/rqCvivTMPMBuFJy8LLDfdNfmbktbb4a2xxerw+ePdCmFqM7dfI2
 9rsJBoOEjhoDFx91FJtM7fuVFMfLuSyJZk1nx/goZ+Olhec9YusWUSM
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



