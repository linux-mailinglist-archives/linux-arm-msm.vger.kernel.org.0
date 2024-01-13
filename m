Return-Path: <linux-arm-msm+bounces-7166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91582C997
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7C51C22799
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E5512E52;
	Sat, 13 Jan 2024 05:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfdJfoz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C11134DD
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd81b09e83so34381841fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124564; x=1705729364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1plu6Fal9qcn1Wtuu6vQETPtirp4Q/rK0fLCOiwCIQY=;
        b=hfdJfoz7oCk/cT+HhO9R0mWi6EHg6w6/bneEfBTVEsw4J/TIy6AKutcfhBJ8Wyywgj
         NcqX3Uy9AX8lvBLaqPVqlsfGRQu3gs6N/RdK4Fj026uen7OZhTzZMLKsV/FKR9VEYnBL
         n03zdubCxxsOkv4sCzpRp97HyZONo3hEdL+pRHhScYfunE36x9Kp5R2iLuUVQ5zA5w0q
         WU2oX280RGFrZNeZDlBuZJbruRMejKJygkCYr9vE2cp8Qj7toD54SEtMc6VWCVBXXtZ0
         35zOmrWNi3ObYJo+Vo1WG/34fPXooVmp2gqvshutb5PJa8smHI2Nc4cvNkSLfNKIl8UO
         ZWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124564; x=1705729364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1plu6Fal9qcn1Wtuu6vQETPtirp4Q/rK0fLCOiwCIQY=;
        b=l9eNC3+CIkch8tztbDy4x1Dsb9FsJVg0K/bSHQ79G3LjsUdr3Vv+fs9c6tqiGLhnwy
         KQD3toHuiLIzsnChWWuTgGuOE/bEjQa8nelzxRHnv/bdJOzUA68hxthMt67ua+KDimTs
         3RUO7CUyzivla5QQi4iduOBxbfaNT/MLVBM7qStYjvyrKn3iZcpsjpFMsZCsHgsW6JX7
         /8dOhU9rvbs965RzAgsyHTSHe6KolhTCIZT5ny4uchwVOuq3FD4uXSC2cVM7QJTGRXCh
         JNXMPG8cQvCWZFq7EfvNA4K8ZVGSIigIjzvBk6yA9aQAtugHh7XhSz90+mMF20jIOfMC
         iY/Q==
X-Gm-Message-State: AOJu0YwrIuRJd9+fclCPATez7CCwY/yqiJNybP8tvlyAbZ7JcxNuh8fh
	uXC2yqUYMRUfMFcgBpzQ771+APL4efBPJg==
X-Google-Smtp-Source: AGHT+IFd1jPpJPDKDRrkgYEFhTbv5z5l7BYXN+JECjDlZMmNU14o63+C2Gmf4IDFn8+YmejCRRIslQ==
X-Received: by 2002:a2e:9614:0:b0:2cc:c895:7140 with SMTP id v20-20020a2e9614000000b002ccc8957140mr637588ljh.73.1705124563714;
        Fri, 12 Jan 2024 21:42:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:38 +0200
Subject: [PATCH 01/13] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 support for PMI632
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-1-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VO6sCRtukMYbFqUkroEE9VOEtJ3mqzFoVaUfeIJHtBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLQLfTXIowNMw1HcfpGXvc8pKu+5bdoQQ0PL
 deZL6vAXBeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0AAKCRCLPIo+Aiko
 1c1BB/9X3V4VUltARNirVryclPWLymp+ODlBtn2/MwSLhsc4VHMGsr3DnsRZmZUwzjgFw4SXtwB
 3N6Lx9lYkcDDwmjixCxUaC+84PZkqj0TgX3diLz3ioz4U+F3OUGLVMaoE6MJloAe9ISaJJLFI2r
 ipbJEbX7X5qK8g8HkJa4ngBTh49qG6HgPUsIftLwCAR/sNPcrI7NbxE4Jbpi81N65HFmmTcAMCE
 LNK6xeCXRkHGQF/IY3sofOkqqiq+7emxD+EIyUtPK5PkaAIoaIDTIeXHj2j+GOmZfMb9iPiHd22
 3hk6RdL6gqy9ykUlI+/VhhkF7qLXmScxPILjdChVlxregXY1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The VBUS register block on the PMI632 PMIC shares the design with the
PM8150B one. Define corresponding compatible string, having the
qcom,pm8150b-vbus-reg as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 534f87e98716..66dcd5ce03e6 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -19,8 +19,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8150b-vbus-reg
+    oneOf:
+      - enum:
+          - qcom,pm8150b-vbus-reg
+      - items:
+          - enum:
+              - qcom,pmi632-vbus-reg
+          - const: qcom,pm8150b-vbus-reg
 
   reg:
     maxItems: 1

-- 
2.39.2


