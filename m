Return-Path: <linux-arm-msm+bounces-51321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342CA60386
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 22:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E00E7A695D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 21:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C511F583E;
	Thu, 13 Mar 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2OAtKlh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C01F4CA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902201; cv=none; b=drm1nTdHPSWHRbY+QEj/04/0xJzPdekvDUBH56+hM/rG+6ZVDiof3hTuUcMtZQccA+tEky12zPdIejgNqtqd9mHIQ0SL6ijrMXjwUV/JrozeVzyoI54YDNhxYEbm6wnwvaRvcfu6UWxCZ8b/bEPzcebLpCHAb/xLHXh4lXmfPDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902201; c=relaxed/simple;
	bh=NaZu91DC4T8heFZFo5XZ2syZfWhTaJWbyUNy8uixAT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWvRZyKkA/dG/P1zKwPvGBvKUmGIXy6JQbAE/AKCwLoowC9sUOuA4IvW0fxUJn8OvMUDdeB1Ubzt15Hx59+laZFRNtECiY/MPxsznXFxnFEdjmi2rJWs4p4408sTtkffopqJWaWq6l3akyUevIUjI+oaCeCX1Qq51y/EaZZjM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2OAtKlh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2c663a3daso293155666b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 14:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902197; x=1742506997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+Au6V+nm5YKxU288WKh4NUBJU2SyJevP5UMvrIA5i8=;
        b=b2OAtKlhBW9xtV+GU2vRGF+mKQ5FDsaluza2OobOIxUn8H7em+qDlQiFNjU+ownvG7
         ysrZUuJANLkUTWX8MWj8EWGM6y6LH4IT+q/OdVwhaiHv/gQWyABwymqLUwpCFx+RtjOd
         FpnlSiarc7d0JKBkvDSsOLk9dJZyXZPbs9hdC4p5YbptwgkdlNcYcEPwIw0zocNrw8LW
         1C2vghifvLfBPRz7a9QWbDjx1PUsQmCjtPlgozIAbuBLeAns3ciSobTK7ibQ7qOnmpFp
         IC8uG2JDyNZfRyYLBJ6XZwxs2Ut/Fil1ZlNrsTAz9ltuoTK1OlaJXGJllZ+PX2Xs1Th9
         RSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902197; x=1742506997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+Au6V+nm5YKxU288WKh4NUBJU2SyJevP5UMvrIA5i8=;
        b=R4ynPTj5WSHSm71s81pEQthME9FBg0Gh4ZVah0HVL/SJw5/5F0jkxscSegKj2S+APF
         0ea5jP2tfhDU+MfxruU5xiUDMMdBAm2MEQxwWrvxFB8C0UhWHf8Zemwa9oL/Y2NAZ3m7
         V3s9jkHIBN97RQXNT5kuW+kcp/QLx80BZLg9Edhm89ZTTXURoYIyXh5M/tqmBULWHudc
         sOWpHsQp9VxVntmlOOPWiqH8YNCBRLenoNT4Qer4YcfqtPG6hO4KVP2GvQe/2ew48ZH2
         DRK/xKaoI3f1UJ6ythinG9oeARLr+KpG5tFnd8JRdoB1qZSjruVbsWrWAJ7dYeaiUmS5
         GgZA==
X-Forwarded-Encrypted: i=1; AJvYcCWf4WP4RjWKSFogk20I2MtHliBO3vjoAeJfAZkTJJjwBTNMuruj1CN2HKeYyQKJJPTZ9m6/HNP5FTc8787L@vger.kernel.org
X-Gm-Message-State: AOJu0YzEIwK9lX+/7QQRkMh81gVw39CKpapVluFoU6ocgtXhZxxwkmBx
	oXSA1XJdraQwRmBQ/B+nVVPV6pAxJzB3EueUxNJ/hFCwv/mkQQNZG5xea+Yeu3A=
X-Gm-Gg: ASbGncvp4hbv1qba30J7r5Jgi2W6TXDkGPHXlln9zn+RLiqYOEPbgPLt75a4DGpIwN9
	3dX21brhPM50MsyRI7iVaJ7v8eeAeIrRplAcCfxfwrC0kpjbJdGKLakm4Gb20ZB1rRu46V6qBzx
	94DMdqrCXBVkJpQx1vRRBfEEo6TwzB4p301VErO8RxdA4MTscJbHPUbFeHIfOrE3kkVdzUFuOfu
	k0zQzW79xTGIC3ItAA3RSSMEK0NxIpy21m0O8gdEW6/tiIVRVBSdyRocKKuMGRwoJYtfL1URFH9
	VB2fPcief4kJjbpZu6ImE3lMoOk42TmeDC25kpBmmXMKud5ntTYSFSHpFDbkz6VLUXwfD9Un1La
	sAykSEnwQBb6P/Ygv1eo7cmKW3d/dZfsP3jtMR5QQqnSm885dSEY8qhallciaFcYRKC0m07yOXm
	ioC8s=
X-Google-Smtp-Source: AGHT+IHvGRlUnca+L9ajzxTMQ3ZVV9sUWOvELGKMoU5iE6uqCQcPOCFhwS9U5tYCom0ODtsxVB3EIw==
X-Received: by 2002:a17:907:6ea9:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac330181a8amr10857666b.14.1741902196696;
        Thu, 13 Mar 2025 14:43:16 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 13 Mar 2025 21:43:13 +0000
Subject: [PATCH v5 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
In-Reply-To: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The switch to multiple power domains implies that the required-opps
property shall be updated accordingly, a record in one property
corresponds to a record in another one.

Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 5bbbaa15a26090186e4ee4397ecba2f3c2541672..938a2f1ff3fca899b5708101df7f8aa07e943336 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -40,9 +40,9 @@ properties:
       - description: A phandle to the MMCX power-domain
 
   required-opps:
-    maxItems: 1
-    description:
-      A phandle to an OPP node describing MMCX performance points.
+    items:
+      - description: A phandle to an OPP node describing MXC performance points
+      - description: A phandle to an OPP node describing MMCX performance points
 
 required:
   - compatible
@@ -66,7 +66,8 @@ examples:
                <&sleep_clk>;
       power-domains = <&rpmhpd RPMHPD_MXC>,
                       <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1


