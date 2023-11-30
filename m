Return-Path: <linux-arm-msm+bounces-2766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BEF7FFCAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 21:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D751C2121B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 20:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97FD55771;
	Thu, 30 Nov 2023 20:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="HjoylWL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28151711;
	Thu, 30 Nov 2023 12:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
	t=1701376551; bh=nY/0hZ0vbbp5essvoHc9RPwquuPPV/hhuX4M/ILLoBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HjoylWL56fHHxWhyiE7ZatEflLDYE4QsowWU8OQQByvLS/vnmDZ0VIGOgIsPaGPL0
	 cJEG5wgLZuddVrH1fFnuwGNgjOHJnOhCiMEV4MO5Z5mka3D9r+tr8HxqQPNnAAHtEO
	 KXYc/ByGmHEHY3/FC9x2HWY4HxA9oNqra8gGFijA=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 30 Nov 2023 21:35:18 +0100
Subject: [PATCH 1/3] dt-bindings: display/msm: gpu: Allow multiple digits
 for patchid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-msm8226-gpu-v1-1-6bb2f1b29e49@z3ntu.xyz>
References: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
In-Reply-To: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=nY/0hZ0vbbp5essvoHc9RPwquuPPV/hhuX4M/ILLoBg=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlaPIjw29rzB3cz5ouVOoxkcS+NBvkjHoAp+gt2
 UWmf44YseaJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWjyIwAKCRBy2EO4nU3X
 VpRID/9+c4nm+yEPLys+ExztX9UG058g7gQqCt53lQE5FB/PKvaSLDVkOGSFQ/YEP6ok1b6z4cn
 gWaVQgcYEuHW0tQRsnQt50QtnAZjwrl0jUADvprNfgwYm+IPtBJJ09uD5SZ2jvwdIV2yRnPyH2R
 ixuEe3WettFHn2yC4f6l17IprAkqX/8oKuXPWfP7DbJBHQpgjPZjyN9x45cQdhkxgd0RuW2rXMf
 9hbn4wb1Gx5/4azzPUuY292RseAgLJ8kd4w+AFYMOlRQGLhrLtSQrchzPiObWOtRykWuOSD5ACA
 pSXDusC6eaQGDwUhe6ISkYP0yTvWH5lPVXKYJFnpYZcqSbh2OkGs6OUkU9xZFsmxsuUKlTJNuhD
 V67dBM0bM8oSKXRxxD1OyYjSU2oT3kuWPoTffUBJA8zcghR3hGnmxzpIUcwxz+ktTCABxeIOACI
 W+M5QnzVB5LvGe8HNuCQ4n4Qb6dkM9v7KXdm17EP4rfJ+XmjILliMLWghEGb4sDxTZmvHJpsxRj
 A+37XigPxizhtjjtlTmcDNTZsJPBREmtUXD0cEzASfzUT/NyJA1uPK1KdC7sklaawoCUj6F86Vq
 hjI61KS8/Q6RWBp8ozsnNi9AcwyfFZH0Ex2Dc1C02iuyxI9VhZlrpjBAibX3Zj8vEfkvGMx+pOP
 xkgm7dBT3u91FuA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Some GPUs like the Adreno A305B has a patchid higher than 9, in this
case 18. Make sure the regexes can account for that.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index b019db954793..40b5c6bd11f8 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -23,7 +23,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
         items:
-          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-[3-7][0-9][0-9]\.[0-9]+$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Imageon to
@@ -127,7 +127,7 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]$'
+            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]+$'
 
     then:
       properties:
@@ -203,7 +203,7 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]$'
+              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.43.0


