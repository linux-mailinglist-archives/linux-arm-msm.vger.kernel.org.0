Return-Path: <linux-arm-msm+bounces-4266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3980DAE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 20:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E3D1F216DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 19:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DEB52F86;
	Mon, 11 Dec 2023 19:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="SG7jPbL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CDFCD;
	Mon, 11 Dec 2023 11:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1702322893; bh=IcWnbFKmnLs2Lnf6xi3WdqGT+icJHz0yV8hz/Qw3KxY=;
	h=From:Date:Subject:To:Cc;
	b=SG7jPbL2RPp32mXDGlC/HP+ZsnROkYZretAssZsS7le/YRguVLsfXpYrCdKQ1zGGU
	 ohQE2SiLE/4q8NQHLyv91wlBlVHLZvyJkW14OCg/1YD3BM2H1kzeXYoTY4c7Js5o0N
	 2YVSn6OvuxgsvG2/G9xJ/qoyz69sPea2WKfSg7C4=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 11 Dec 2023 20:28:07 +0100
Subject: [PATCH] dt-bindings: arm: qcom: Fix up htc-memul compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231211-htc-memul-fixup-v1-1-c0aeab5aaf44@z3ntu.xyz>
X-B4-Tracking: v=1; b=H4sIAMZid2UC/x2MSwqAMBDFriKzdsBWUPEq4qLWpx3wR6siFO9uc
 RlCEinACwK1WSSPW4LsWwKVZ2Sd2WawjIlJF7pUWil2p+UV67XwJM91MGyFwZoGU20oVYdHEv+
 x69/3A6C1G+VhAAAA
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=IcWnbFKmnLs2Lnf6xi3WdqGT+icJHz0yV8hz/Qw3KxY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBld2LM07F2YQDhLu6I331Mp0c+Qn4XSpfYUmPXT
 xrDRm/ypLmJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZXdizAAKCRBy2EO4nU3X
 VgLeEADZBoBBGg2S3DuDVqPm47Bc+C+1a+jY8EGM+nK5swiTFTqu7xH//AuPNfmvhbkFCqXut9n
 ei6oe/uvmLkpqHcsxDIRYAn1lBouER7pjnWkm0DJkjQcO6y6DS3ZSKcyMstOanLnQjfeEFwypoB
 HvOEwmgJxgPAfRvEFxhAJYZVYqHihVv4VnkV1E/Agan9nF+DBCVtIb5oqHwGDwdoitaB5/D5Awc
 N3lkOZMSq1mBMG0wUwcNJQ9krQZrXa0DQ213jvGJECV0NrDKXuy/Ra/7X+gTsomcNUosjEOG9/r
 LA2+1KR6n8w0+BaGCzIvi23A9oVQ2FGO81QNOF5oB9FEZ5Fcmi7iwNU8YiV7yV8LZ53km9ETgzC
 LKPA9gF4MnAmjC51sJ02lrHvS61i0wa+s8zc0ueG83FiSfe+nUOZlG997dWhjXntLywxG2+Fgv/
 AQpH5tFMmDwvt2eRRSZMbjgLYVWtxrfkNAXT7WCibbA3v/TRNVoOfLFmDz1I9qMPY5Ty8Acuf7J
 zd0lwABBP8pt2EVzcTmC6qjoXIqdnvEw0HVATG74dDiriaUoReb8xHnqMIt0YUsWcREBPWgRWnR
 dO7mDmkNa9TOI9M6SBE3jrKW6CeVDkS3GFpzDCWxVE6KvuLcjjBoAwRNCBcktk921yzyCPBri0Y
 zvlBSG4ate6W1kQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

While applying the original patch, some things got messed up and it
didn't apply to the correct section. Move the compatible to the correct
location to fix that.

Fixes: bfccc195192e ("dt-bindings: arm: qcom: Add HTC One Mini 2")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c968412d86b8..96eba7454c82 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -183,6 +183,7 @@ properties:
 
       - items:
           - enum:
+              - htc,memul
               - microsoft,superman-lte
               - microsoft,tesla
           - const: qcom,msm8926
@@ -259,11 +260,6 @@ properties:
           - const: qcom,msm8916-v1-qrd/9-v1
           - const: qcom,msm8916
 
-      - items:
-          - enum:
-              - htc,memul
-          - const: qcom,msm8926
-
       - items:
           - enum:
               - motorola,potter

---
base-commit: fc538f5c65c2c1ac9a1fbea90393bf8e145676f2
change-id: 20231211-htc-memul-fixup-ec6ebca8ef7a

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


