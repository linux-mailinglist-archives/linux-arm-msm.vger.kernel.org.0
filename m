Return-Path: <linux-arm-msm+bounces-54823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE33A94826
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 17:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D09A7A2C91
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 15:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CD720B7E2;
	Sun, 20 Apr 2025 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="1CcsojpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF520AF92;
	Sun, 20 Apr 2025 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745161994; cv=none; b=nwGXLtk8p4/Mnh70BQYy02bNnsBuzQZTnYMvEu7cUes4wA44IqVlHTwdTZ5nVriZziOlho6QUhTkaA55JLpHLyVs60jeZseWTV0/ljrrEtDv8N4YqbET6ZVvtM+p/UDCMox+CLfi7t2fEJCsQ1FJG/PQMN87JYtzGZ1QuWd/Uzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745161994; c=relaxed/simple;
	bh=23Sj0XCljb+mYzAWL8UrijLOqOqRTWPwSRGWnzpzJHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHTVpyMi8+tbddFTThg1VwqkPfgOcG9URMgPaB1QnwCwkzscFP03u2aQS9zkhd9Se0csSwpfVP1XbpSDmfFMsiJAy4Qj5nqdzKJB44R6Y1vSd0chTJO3fGqC4dy4wz7bUW9TxGR9F3PSoJZHDbN8ZdWoTT/M5Lf06KtaqVsXUKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=1CcsojpJ; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745161984; bh=23Sj0XCljb+mYzAWL8UrijLOqOqRTWPwSRGWnzpzJHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=1CcsojpJCDnGJk91DYZvMjaFTTSU95B+WzwEe8jpn0Aaz3uPdMus0z25jL17jVqrK
	 WQ7BnG3eqjsNySp8cI/w68QIAsSKc9f9hft4AdwYq+cHBv5dAnQtC4LUCz6FfljgwT
	 wKN4LagQGFn+9GIPwqn4U2Zpd6b0fVeVzAiG6E28=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 20 Apr 2025 17:12:43 +0200
Subject: [PATCH v2 1/2] dt-bindings: msm: qcom,mdss: Document interconnect
 paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=23Sj0XCljb+mYzAWL8UrijLOqOqRTWPwSRGWnzpzJHw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoBQ775dZDQS0PZkDqWJfdxM26an2mV6e8HmrOa
 p9iY2AJGTyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaAUO+wAKCRBy2EO4nU3X
 VllOD/9m9lPHGpBY+nRbLUtgt+xoLbziHdGM5Wn7itYg/AdMA7FB8nT3arVEwtfYjA89Oj6JkgD
 gUw3p9+dHv5tL7CciUO79i/ngYX0CjwMxUoUSRv4dekodpbTeqY+rLP5BAq6P/gK5Lbm1/ImQo6
 zPa6afvIpCzK42K4aIT+QYI7e4VINPIYWHteLejdHJn98/+bnXMH8OvSP4eM3TRlHG2ZUhhP9nT
 eG2U31WULF3KxRUhtFxh7dHcISdFEGYIHImpe+bX3kKZOjIWmrCvSS3N0HHYN21NTQxyKb0ps3f
 AaAvo61FQ49k8zLRvwdnpV/WRWOgMPYL0c3/DM//YwsuDxGfzVVtty90BtrwpXR0v/ERfWUnJUl
 jwn6Os4d685p/+7WQWIJH28cSI3RHhTplfedhP3F2gX0BvWMxjcKTSVdY2fQq1ryPEzxT0l8ch2
 G9T65fBoZuUeUNvfGYWi3o6p4PgX++Wt6jdiHEOpoprMhZ2wf/aN/nIgdvI/4G3QQv3D1ECt/ER
 qeIwpvPS79/i87++HWQgCD4r/8ERVRb7TWJgo2+ddGY6N96mGlorc/4GngbACFJL3My+mkEryxg
 7hnEjDLNCdk7zDuiIM/IXh5ALHRpkq334VmCT8iZZp+IEaLvvYRVyc1xR15z+yXpquOrVuRfixN
 8M8Vupo12PuxYfg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Document two interconnect paths found on the MDSS on MSM8953.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


