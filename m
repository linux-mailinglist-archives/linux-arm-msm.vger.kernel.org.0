Return-Path: <linux-arm-msm+bounces-61013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4BAAD5C4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 18:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A80FE3A9815
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702392139B0;
	Wed, 11 Jun 2025 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="zNfquBnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D41E0083;
	Wed, 11 Jun 2025 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659643; cv=none; b=g4UincheS+SNdSlYzD8b4FtKwa4cn60fnDCSixhW6UhWKtTJYUeosC4nSTXeOmZuSuVYIo9xBH6mupC7Z8WUeGcFFhS98UIeRzBm8qlzjfh7ksmHBe4P/gLRBACWffeSp5iIHrQ8IeJeLeOy8iyc86xW9u8NKyAfjebZfRO1YNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659643; c=relaxed/simple;
	bh=ORrUF7nYa0/NON+F3kH44eDNfaALmuqR7JZEAZeDHdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1DQ8Pvspg24fQi7p21P3nz24YwwY5VarzyPk9i+Vb+twZ363QzgPVR2yzgsqDyslmBWv2l6ESPiv89a78t+Vfh71d5P4vcqV+/7Dx64g/MeNpFKQ1s32aieKQ61HzI1WgsGgvKviKAgb7U1gyydAyE09jZaaT2HaIAJ8vm54pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=zNfquBnu; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749659638; bh=ORrUF7nYa0/NON+F3kH44eDNfaALmuqR7JZEAZeDHdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=zNfquBnu4au5n6tctaPtenA4Y7+ce7R8H4AdBoIna0w0Kq+kubxj2t0SipBGikx4a
	 Evks1NZnLB0uLPhWYb/YoiBFfkj2iCIl+juD2VAY2gw5njP0JALukcjnuDfuegAJvq
	 8KF1VhtujOFwD3C5zbBGTqXMrx9QwwNSt/0bdEjI=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 11 Jun 2025 18:33:15 +0200
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-fp3-display-v4-1-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
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
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=ORrUF7nYa0/NON+F3kH44eDNfaALmuqR7JZEAZeDHdc=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/x6c3JKVQi2RCu6SDD27dPhsmDUqBNNquQk
 PNRSxppQ+uJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmv8QAKCRBy2EO4nU3X
 VszyD/9y/9KXayucSAYpHY4nG3FNkTfBZ9G/jTxm/lIcP2E0y9E8l582QS4NqowJFunqE7YdYFX
 99ex9K86xNVJt5aGh11prrCSYNGMABGpaJc/U9/A3Xun5lRCR+mmY8BNfBEsauP/zoNJaBaYs53
 hkmon/lpUJsYeP+FUZuqO6v+dBEsgPyCydxFZCfjC9/oWVwKGQ7RPSb+R8pnQni6wEvcswVo0xV
 yrHJVY8Ojso2QaQnwlgUk2JaS1XNsPfb436ghe27idOplvT8MrNk6taPSWay6U/7re5tvUuU0DT
 eXo2pi2qcfcpOMo8AY276DIkinc0ReO5DqrLjmJ980V4ptNhoi8QwcfGmKZta6AUAVyhS45tOTH
 p/3n3y3LMTxdAuMTngc1adlMjFXvJ4vdb/BVMn0aa2b9qk2skrF7TVsZ8kgUuJziDj5jQ7PChea
 ONOrhLrtrDQwe3GVYAgoqdfDUtG6zy7dlJyss1kur8nobcMwp/Vipcus/q+kGvxDlWNqorD+rm1
 OwxaNyhNR8Sbs9QcPH0DL7lF3ShQubjuNK7crUsZgg8P+rEu4Gc48C+GI65wTTAprhwj83bePzE
 lkf1E++9yLDgcq/yKUTkCF2r84oABvQDiEFiHFxKW6lzrUdDAqx+YLIEbnZoDjnfg3omlEikKEQ
 Sq2m53bls+5srWw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the vendor prefix for DJN (http://en.djnlcd.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..76db551ebfa1266d869f40cccbccd1a288c50c02 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -398,6 +398,8 @@ patternProperties:
     description: Diodes, Inc.
   "^dioo,.*":
     description: Dioo Microcircuit Co., Ltd
+  "^djn,.*":
+    description: Shenzhen DJN Optronics Technology Co., Ltd
   "^dlc,.*":
     description: DLC Display Co., Ltd.
   "^dlg,.*":

-- 
2.49.0


