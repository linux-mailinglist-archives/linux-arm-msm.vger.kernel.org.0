Return-Path: <linux-arm-msm+bounces-36057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D979B1B9E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50682B210C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C162A26AEC;
	Sun, 27 Oct 2024 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9AfGAqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B818C31
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992256; cv=none; b=KuuiWhI/u+SiSUY5ohTbS711jlBLFk+++6SkQ3Rar+6G3rR0KkO5gvcSXaEqRHTh0Fx0xm68kkmW8UycebVs6DXN7zgi/v9MKf2bMSYb2czdeR0IMWGKhX8zQmGV/iaabjNnDeIeBiwLZ8R0RILnM7QpMQgCZwAmwxQSesFgT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992256; c=relaxed/simple;
	bh=duYFt8Q0C4vKJ4Lf3qNH8Wm3mLtYsrGkrMgLYNj4tBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxPZxbc9lWEnTbpm0sEWH4ai5fSUZlE6ix2d6EoToFjFt6gsxpsnyDI93FHbQsjWE0LJb6V9B1f2hXIXd/CdOzRjBlRmrELEZP8s9KbRbV+4bmwoLsBynwimi7X0QfcffystkHBqgh2m1t98FBd0irJKK7rdqBM13dGRQUydC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9AfGAqN; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso29266271fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992253; x=1730597053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpAziabp30p+RBNnX93wZXhdNGxeor2ysyS9kXYTFiI=;
        b=L9AfGAqNa8GYqI3MMsvXRKZ9Lxc47VeuWKxu0B8AV6AvJRHB0YMEW3dcLnS+0ECEcw
         6PasGoccoQtX+DrtsjDOsJQuPzA7WUFMPlSk5MKwkVmaG9BgFuI3ZRAd1WJJwidxjwyJ
         Cw0lDtVPMTAq2liKnv2LLNxGWHAFaeFxGcuW5pZuWynTg65jou9GlnpvqyE7Kw/n7+HF
         /UHvotTYjwf3sEN11dHZJ+ohgurYaDFk857cr9g1q7H2GQnLXMZ5buFj9wDJRUrzbpEX
         aZTwktjHjIQNILpaUPozBmxc2lTN8ZLuEouUF9srQ7yXivqy6BdVRdWPQBWxlUj6qxrQ
         X6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992253; x=1730597053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpAziabp30p+RBNnX93wZXhdNGxeor2ysyS9kXYTFiI=;
        b=UqBgSk734/SIuKB/IfCcKSNZl/DdpLsAPM5hU3fGiv/F57Tdp7pL4LTxZM7Ey0k/jF
         3ozjOhUZnw7gcXLKy3GAI+y/FkUkZwmAQ27LBCNM+WQA4Ub5dCCp9+DLFg5lECqPTSR2
         ynud877nCcCl8huBPWSYQhG4Nxm6rP9CCcDYliu7Xtj6i+JZiicE8KIaYO6XVm6XIvjq
         RfdBNZ2OiizxzejmKIegF0YzsycssgNJYSw1qXr5BFp6imZ/eSJ7jo8dmOWIISGnuvuf
         TpFnisGbn9WJyRGStSXhHmDxPvg9i7DEDe5scG4GWGwQGgsyoHmpYEXP7r+2URn6IzmD
         aixA==
X-Gm-Message-State: AOJu0YwNdhGnmXUlu1Mo5O636CysEcfJ4MC/xSXR52q6mcsr5wcj3CKO
	JYFrS387hBWbDBnIWdhKRC83W00wSzVnwkOI8HTa71FhyI51+T9OAH0i/0XccGY=
X-Google-Smtp-Source: AGHT+IElO4NBRqnxDfwAvGTjiXh3ATt43P9/UCU7BqptT0e0T4C5CDXhZqJyLwz31teIU7ZItaYkLg==
X-Received: by 2002:a05:651c:2111:b0:2fb:5d8a:4cd3 with SMTP id 38308e7fff4ca-2fcbddead1emr15862261fa.0.1729992252280;
        Sat, 26 Oct 2024 18:24:12 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4519b3esm6913881fa.44.2024.10.26.18.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:04 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom: add QAR2130P board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-dt-v1-2-739d36d31c33@linaro.org>
References: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
In-Reply-To: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=duYFt8Q0C4vKJ4Lf3qNH8Wm3mLtYsrGkrMgLYNj4tBg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZY0JEV8nCTfwKCaOj6GMiYRiB9HoA2t0VhUz
 nu5rnJeEBSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WNAAKCRAU23LtvoBl
 uAqrEADBn8S1IwwQ17pE0r77Ka5iR1s0xyaxUblrIlDjmOvCW30L5Ea3Q9lUd4eLs+sIKGn3L60
 Ko5R+j3fzsQeDKz6NF3LPXfS8XoC9ky9Zx1RTTbLWIDgJLpEsMD1Wde6ihuHThUPiGRXUHXu2FA
 XfMZbPcJNtnUtXDCLIZVNeXsCOtXyVI/Yr8p8VANFVVaux/dTu/HyyCPLTjrodnx5uXzcK76zCy
 OVzXRReqw9Z0GbX3RP9GfZmS+zxA4ox3p38xcD7P1+otyafNVGV7HcIjqTJ0HFE/t5gAIt/Vq5q
 CK9hCk0d/iWMP4jD17MbNT/VsauAxRYD+ZDLkvaseFr7ZlGsh5PlJqeDH20VpjMZP8g868KCBCQ
 O5h7UNtkCM89w3nCvLwzI0sJcdcrHME1I+9+rOXj88aEmi3a1ySqLx4VPwYaOOv38bYTDP5iHjv
 2yfU3wqAqhJSTCdRIY+WxR6UsH88JWiUKc4WCcnamTTH4z6COqyMdtrfIbc45cI5vviiMzmHUTq
 XX/0Fr/p155ftM16RcgY4bnVayAV13x3ObtZzVXRKQm+e7dsjbEqJYd6aaeMJqgdP4MTjNBPgmt
 SHRSQV7E2A/iD71t0wQ5DWrzKpgps6Cw1ZrpK6fDRAHSo6OnQsSw3WdFWrjj+feXLjBbSI+wAXa
 IcqIi5C5yku0iuQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the Qualcomm QAR2130P development board using the Qualcomm AR2 Gen1
aka SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774aec48967eddbef4b4480dbc8edbe..02b2379ccf7741a0fba345d83d0ce7db731a3772 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -52,6 +52,7 @@ description: |
         sa8155p
         sa8540p
         sa8775p
+        sar2130p
         sc7180
         sc7280
         sc8180x
@@ -407,6 +408,12 @@ properties:
               - qcom,qru1000-idp
           - const: qcom,qru1000
 
+      - description: Qualcomm AR2 Gen1 platform
+        items:
+          - enum:
+              - qcom,qar2130p
+          - const: qcom,sar2130p
+
       - items:
           - enum:
               - acer,aspire1

-- 
2.39.5


