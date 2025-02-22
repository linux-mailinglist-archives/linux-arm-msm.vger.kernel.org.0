Return-Path: <linux-arm-msm+bounces-49043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBE8A40ADC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 18:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C849189527A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 17:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FEE20B80B;
	Sat, 22 Feb 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="rPANDz/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C4201113;
	Sat, 22 Feb 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740247098; cv=none; b=uA4n/vgrPU0y3H/KUcIzk2yBrhk6Dma6S58y3SzXS0XqQ4E8EDRMLgrlo2moR3AAYKfwQL8PHL/6ovXHeCEP41FACgpEP2VnIynMEmabbQPrli3t7fj2Swob1fK51h1DTYeobonVE97BbkhgQ5HyZrK9FNy7KS9LTH6qPDrbJP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740247098; c=relaxed/simple;
	bh=9sTFrUSIaXiC/a6HGkCf0NeCEy/CQy9eg6+/LWUf/z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNShmTNF/CL+h5QV5DPs23CYb/dbT68AGXmgDD9NCUHo9a3SHaSH9OIPZouC+UdWAvcelv+wL8N/Gk58IJGJrfTumhUf3Ibhh4NuNn/EZ1Ljg9Az2IxQDBYRs+Ya7oHudua1nx1p2N+QUL+2eUK2x3XHJrnmri73aFezX6/7G84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=rPANDz/Z; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740247093; bh=9sTFrUSIaXiC/a6HGkCf0NeCEy/CQy9eg6+/LWUf/z8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=rPANDz/Zm8jng4H/W+oPivhEMXhURPJFwhlrEj8nsH7ytl/ujiS9g1OJ/rpNBs+3P
	 6VcXuRq9dO9qn0FmiAlKFgZfHd1/dBVvTIyrRcwlOvPIN1+8W6z5Yf1w2pNDQusjaf
	 NaIy4cxBYYXeXHX+XVrCrnexUOPMuYTi11R4j4y4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 18:58:04 +0100
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-display-v1-1-ccd812e16952@lucaweiss.eu>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
In-Reply-To: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=9sTFrUSIaXiC/a6HGkCf0NeCEy/CQy9eg6+/LWUf/z8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnuhAxesS9PiufpYIyX/I5BSN7vk1/Peq4qz5G/
 ABsZE+5SXKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7oQMQAKCRBy2EO4nU3X
 Vp88D/993hkFvRFps1P7B05YZ/phVscPfzFqCsKij6rNOTddUvz2pIXPoEB/iAyU5usR71Kemlq
 aBC9yES5supye5j+I8mn6TRqu1gJl0Y4pNEtaWosK8xa3LH3JP4FwYzfOvjhZ6Q9xqdv6QCGTNL
 EOp46kViSbkNJBSOiZfZlv/I1OkHA0JzncLMKzFgTkHBk0DAKWzE8Ku6WMtZJUzXi2AYatkgB/o
 zx7/fpyXTNSrAMH6QDIUSepckZtNRAEyetYG0zukFLZBzCjewbOIEtVqa0UeluFJMnwi+l2maSB
 wCwYlPiYJTZkPNmN/mcrtxEqEIomabJtz86WfLt+KazfSIXUrwCSq5vBxNIr6qgnD7bU0kWBM2n
 A+Bl3n09Ac29hR3M+sOcRoXxJvX0a+gTl4Nn/gr6Q10fizhcYJx4EKFjR9jTo7czgLGV+H0aKvN
 fKCyDxdfzkouC1ytogG3t69V8aqAFpO2097tPXkH4b/uPbX/pCL8/bL3e0+gQ6VyLrj6ckVyDAZ
 5R89Z4a4LeYFRwUqAuPkaXAqV2SmCKGDcLi51+h4raz1w60Xxu0NxodV61Yo8ywZ12nIgDWE2tN
 ysfd2SFJUqKPiblV5WznqaTxTU2J/R0/FgObCQ4+i2ceswF6dfLr4c/3C5t1to0esXoinfjTfz1
 4HulOWWqhrRlmbg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the vendor prefix for DJN (http://en.djnlcd.com/).

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..ee2dca4f372263c7a79ea17f4a9411939bd0531a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -390,6 +390,8 @@ patternProperties:
     description: Diodes, Inc.
   "^dioo,.*":
     description: Dioo Microcircuit Co., Ltd
+  "^djn,.*":
+    description: Shenzhen DJN Optronics Technology Co., Ltd
   "^dlc,.*":
     description: DLC Display Co., Ltd.
   "^dlg,.*":

-- 
2.48.1


