Return-Path: <linux-arm-msm+bounces-46296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F1A200E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A44B18849E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194461DE2C5;
	Mon, 27 Jan 2025 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Wu2aGJQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4F1DCB24;
	Mon, 27 Jan 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018000; cv=none; b=jBfNHjoOpwsxvQEcGekTld12eXcYZ9Ef+8bp2j8iM0UTtuleguKz+dN4ER+c+KB/5c0Jry1yYWuZKJVPJz+jXCXoPc9IIuLpdXRgfkoEYhV6PBDSRVAMn5c4hSaPjlODvH6YvyWjY1BwTGZGHWS5W1aR2WU5QgKKPU5Bxz09bw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018000; c=relaxed/simple;
	bh=CKTBuBHD6xeKe48dpn+0pMpE6FM15R41axuY0NX3+XM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhAwbahrAhwESHTw55pBS5SnJjBWTdpck358IanqtRc5SxeaP6Xdz0tX1aClBp0CepqeUMa0lELNd915vb/GBux/VTNr5MEOCmsM2jFmz+Zaxrt9VHBGINtI2ZaMrjzoKrpl5lXttuwNqbc3BouDGgaZmQ8+NXY/7g+kmpYUuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Wu2aGJQj; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017996; bh=CKTBuBHD6xeKe48dpn+0pMpE6FM15R41axuY0NX3+XM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Wu2aGJQjJ+jXNgr2q4we25kP4KI17TGMVsR5FJ4AH9JLSegoPSNNDmArDdsSUBNdL
	 hruBZadW0C8e1HctdEMid9decIIEfylzS1jW0NkG2tnytf6uX0ImOl8aWMHiDDY5+x
	 ntUJoZ/XJLV/23YVQP8g35oT+RYaCwVPJ3GKBywE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:35 +0100
Subject: [PATCH v3 03/13] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8926
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-msm8226-modem-v3-3-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=CKTBuBHD6xeKe48dpn+0pMpE6FM15R41axuY0NX3+XM=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzA3cqIa5vq60VBxJ37MZVrFnm1yt5j/Vc8q
 +iAlVkHc/WJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMwAAKCRBy2EO4nU3X
 Vo66EADMSfMRf8CJFcr9SW+p//BaGmFbqCjPV5UZComI8N11usMbwc6s3Cr2ga7SApf0IWbvTbO
 FC1Tax5t/skHkG6VtTOdYWu5gQZHxDdSy4a44Jq+ItWLsccYhR/IRkpwceneTIqK3+LvpIrizoE
 36an1lq2iIL4RnQy6TwN72bgB0mvB0T+wDFjzAKnCSIvqPoQiAh+oVrLxVwnKh3+ORS5ZBaWGuY
 bb0Sjbn1LL97ucsC6zvyJ7ER15+yQ7rZRW7qBt3mrr4gfchM/1RGXbf1cOd4/w/XSVx35ys4m7T
 TRE2o0rz5jvUTupne/8DdyCwsB8FQM0UvsTYV7j4losa3K/6ZvzBuVmVREWvTpREwVUdvNEu8Kj
 LlH1UZ0yQ8XRgHqmtTC/x9FU0WS6e1vwsG2wZUU49XxgIrQk2TSXn721JcqHQaG1zaTt1VYotSK
 rW/KZ7e2zrk8QB7wx+lM/7Lul00lRUj+kkVJ2W8JN4enAq1iPyLvD8h/0VSM1R5+vj3GHpCJ7d4
 ShNniR5O8c9J727CrB90kLHAMss3yRoAdnuDVohs6vJl9e2Detr20aJTGno39+nIkxDa5kdf+ii
 WX1uQNXxh15LTTNjkHklzeczlM6OZy8Gf5kGafw9al/Z+QDmBZN71W9QyfmtTMu5HOfJM9gosY8
 GD6vtxYyr2yaEag==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Compared to MSM8226 the LTE-capable MSM8926 requires mss-supply and
doesn't require qcom,ext-bhs-reg.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 0a3e39c55ec3dcfc9a4d4ac28f5debd77dc49b99..c179b560572b2c1aa85521e4bd01d1857530f6c4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,msm8226-mss-pil
           - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
+          - qcom,msm8926-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
@@ -71,7 +72,8 @@ properties:
     items:
       - description: CX proxy power domain (control handed over after startup)
       - description: MX proxy power domain (control handed over after startup)
-                     (not valid for qcom,msm8226-mss-pil or qcom,msm8974-mss-pil)
+                     (not valid for qcom,msm8226-mss-pil, qcom,msm8926-mss-pil
+                     and qcom,msm8974-mss-pil)
       - description: MSS proxy power domain (control handed over after startup)
                      (only valid for qcom,msm8953-mss-pil)
     minItems: 1
@@ -79,7 +81,7 @@ properties:
   power-domain-names:
     items:
       - const: cx
-      - const: mx # not valid for qcom,msm8226-mss-pil or qcom,msm8974-mss-pil
+      - const: mx # not valid for qcom,msm8226-mss-pil, qcom-msm8926-mss-pil and qcom,msm8974-mss-pil
       - const: mss # only valid for qcom,msm8953-mss-pil
     minItems: 1
 
@@ -241,6 +243,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8226-mss-pil
+              - qcom,msm8926-mss-pil
               - qcom,msm8974-mss-pil
     then:
       properties:
@@ -265,7 +268,10 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,msm8974-mss-pil
+          contains:
+            enum:
+              - qcom,msm8926-mss-pil
+              - qcom,msm8974-mss-pil
     then:
       required:
         - mss-supply

-- 
2.48.1


