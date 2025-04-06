Return-Path: <linux-arm-msm+bounces-53326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F789A7D087
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7AF13AEE84
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BA81AAA1C;
	Sun,  6 Apr 2025 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="fmXDOVdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F215B0EC;
	Sun,  6 Apr 2025 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972930; cv=none; b=mCzNON5MM+HSCctRfwTfOZEpI3qGexJqFLLlPRKzwoBng6bhYf8F/qJC3siPxJphkHfR1lK/IRHxEIu2qvgPveH2gRzpbneDY1b/YbY9exFpqhMAXze4hYfZVKTGUHHVm3dM7b1/1TgLCOM6kKiIjwgxg34OpAHsC36yqEMkGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972930; c=relaxed/simple;
	bh=54KKEjad1+ij3E2hBLbA9dHHdBX4M8D7STWk9Y+wemo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7idxs7UKtsvIuqc1EXjCnhlOsLtWxzKFhIYN+7hdS5w8T4iFrswGF2bhRVemk4CMhvaI062K+O41U6qA1CIjIkLgYzSmvkF0qmCmCzHUhnVDH0mY2Id8sKfsvCXTfmsrm2hOQ33aAg174AkXHr+xb2MjBMo6aYd1BioZDVR20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=fmXDOVdU; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743972926; bh=54KKEjad1+ij3E2hBLbA9dHHdBX4M8D7STWk9Y+wemo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fmXDOVdULftlhuXvFyjVOcH93PJLsOdoXWXXqSUrjYfw0jq4btFgG9p+rnqYfSUOL
	 GrJ4oSE0MzJGoiu46dQFsb1ppRRz4a+4iKyeqw2XErQMAJUNCfY2jMBTYPSzPTwlPK
	 lVy2tOXek45Aw8gLOPsbEcrKSjeWIqKFc1fZ0L2A=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 06 Apr 2025 22:55:03 +0200
Subject: [PATCH 1/2] dt-bindings: msm: qcom,mdss: Document interconnect
 paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-msm8953-interconnect-v1-1-a23e22e236e0@lucaweiss.eu>
References: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
In-Reply-To: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=54KKEjad1+ij3E2hBLbA9dHHdBX4M8D7STWk9Y+wemo=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8uo7V02lvvdaDbCDg+UHeKAdIc/9YNmZNePsB
 XhoAvdHPOqJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/LqOwAKCRBy2EO4nU3X
 VmAtD/0S8EspPCGaoYWyHm+lUUgH6JsHtkmKH6Tkl4hRdjdIz4a4cdIpWXohWAlyZLs2Ap7pPRr
 WFHmeu5V8T1HYVf6qqGnRwDSdNRMpEH8LK3edVGMS8e2XB7tEoyWop5xdiAMftJo7njhiZpAA31
 F7uqog68pLdzfuXmkXw1wvkkPnQUe1O9idriGs0HMaGcfaivY2gh1M+KIz/hvwvQZH8H+HRQuYA
 LAkAojOfyFXleVs9OYu85eN8lAU4OUwIo5v+6kbpeOgvA87zi7C2SGZeBBakZm+txi25iylGdmt
 I5dd5zzKE9427bhaZxO7TY5oGuMZe9MPQf8EIBrMP7MiAn7lQGEDAdS/E0U9Co0jH85ORqyM3q8
 +AvOZ1rsegU6zq6YLM46FWnN0Oa+AI8pnmiC8Jux2VFqpskIMwjunC1ehqEjt7Y6oCCvFnDoPTt
 Auszh2sxE+zxKepaGN9xdHHtmEoSRIspCWksIWYPamFLhs/MWa/cOKJs9lbWIAZyhHkK2jgcUci
 ml+f+2afDXQlGNhKOlzqaOtHHT8g0mP6X07MZzV6K802//prn+EvX1J979DF3EIQptsII0EoWZe
 MYrPI0mJnFL6Kzgxj/H08g2EfEUZFqdbEn/MiKZFFo1YaLekOSpeGw7Ew/zEL89eZjBK04wlCvp
 o585n7rnV/pU1nw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Document two interconnect paths found on the MDSS on MSM8953.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
There's also some interconnect paths defined in the mdp5 schema, both
drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
in the mdss schema instead of in the dpu subnode. Since there's no
cpu-cfg defined with mdp5, I've added these paths here.
---
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 7c6462caa4428bc284619275e61ddacc26d0c06e..db9c43b20e2a705bcaae4a9e0e11ce13be853b78 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -84,6 +84,18 @@ properties:
     items:
       - description: MDSS_CORE reset
 
+  interconnects:
+    minItems: 1
+    items:
+      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
 required:
   - compatible
   - reg

-- 
2.49.0


