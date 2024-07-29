Return-Path: <linux-arm-msm+bounces-27243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5137493F38F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BF55282322
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3251145B0F;
	Mon, 29 Jul 2024 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Drthm67q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2A145343
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251096; cv=none; b=Q1p57TmVLa2uUtzZwkSlsLTop7IH/eKbsuaAEDHMKfFcin+fqrGAPC2IEdDRe9LwqvFuqUZYtRAni6PPjspHNuitsTekpUcSTOKP3/mDHS0besXUXaFom390qM++TwWystrY2JGpTwz7OWJdTq7NuGSS6Ff4WCwXvj0jsOQua2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251096; c=relaxed/simple;
	bh=7hXerL1IiWVUTXqdgSPGGoH3EsZvPPHNEeO6LvFBZgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mo2NIix/L+p7ejH3a18tZskyK2zu+L2eNRf2otrX+WTDFifplLPZYwbxlt4ro/7U3bIpMOJ34wsrpW5EJjFGXf0zhLC7+oTZTv2hgvV261WBFuWeEznI2BlXFv3eUTxf4msGzMJeAPyB1Ehm5GboPbS929BP+FhXb8jSmKYbgQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Drthm67q; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so5053363e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 04:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722251092; x=1722855892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyKToe6TxBmz/YWrLy6w0oK844kg41jA+g/8mxCxauk=;
        b=Drthm67q+bhS9qeWeiqN9qc6sdXCA4nVaUgVn0ynHFOXE5Ac0wV9GkqHVEQP66zhul
         R9uF+UJbUFS9c8dET/KTNbSBwGeEltbkiROxNbWDjXyMygr6eDnzLkaArHEV91CFl6DE
         FIKLkbSQ8W0lcExERbKfibHFr4HIWRzIjM+XT3b7aLTXgVgmMQh48c65TDtPZnk9+mJg
         ephaTKhTLi5C+OaBYQBfq+czKp7l0jasU3FuwVTsT6BsZkLzx3Yf8TlECq+xAXBtzGkY
         GJLOmJ653zc1KdKqF3sCV56mODytX+9QFYghkHzAvJyxMxazkAdXtWUm9QTRrLs86cuU
         mBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251092; x=1722855892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyKToe6TxBmz/YWrLy6w0oK844kg41jA+g/8mxCxauk=;
        b=I+T5bJBLwvgTMlMGOyiPEdICxdxPTExgmXmM/hOFnxjjMpTLOE1D7W9q0UpjE/gNOg
         x6BUW28cIX6Md3k5isL1/nmlYXjJGhGW6UYnVa8QbB58D3XvPsOzuqGmJof2j+YFli/A
         s6gbLPNB/MP+kc9dtdEZJKRKJ4o3fKshxoE/wIM0mhCjUlZaEbOCv9Uxdf8VmKlv5nHW
         27Fl/fTNWfQBBF97qZBZkvdo1gKj7Sql/u7UIC7LmjD+Va9rt5E1G3/jy95rPyxSgWd1
         e6JVH2Vpb9C3spIas7vMfkR2GmmLLEGuM91kNeiI1HukqsrZxPcRWOmZtQuNfuWYjyPJ
         tw8Q==
X-Gm-Message-State: AOJu0YyqvGxEZe/m2Z5il8dAsZuTCtrbBTs3drPHWhi4HMYVYZ69hwnT
	VcKkV90WQO2zyP5biFAhR6lW6bpV+q7A1tYC6I4lby41iy6Ug/HIRqv15Ug7vXKanEPHZrSsuVR
	y
X-Google-Smtp-Source: AGHT+IFxG6yGKfSxUTwgDL1UDjMZblrWSXE6WEn9r2KI7bws9zhWzus1HrT8Zfm/hZFVU3+n7458bw==
X-Received: by 2002:a05:6512:39c4:b0:52f:159:2dc5 with SMTP id 2adb3069b0e04-5309b2ca468mr5408080e87.42.1722251092487;
        Mon, 29 Jul 2024 04:04:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c09093sm1457806e87.172.2024.07.29.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:04:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 14:04:45 +0300
Subject: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: add generic
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v1-1-99a96133cc65@linaro.org>
References: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7hXerL1IiWVUTXqdgSPGGoH3EsZvPPHNEeO6LvFBZgk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp3dSYL8kTG2g9+EtZGuToEqNO72f2kK5FXZwp
 UJvY2D5DxiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqd3UgAKCRCLPIo+Aiko
 1eo1B/0bdIKiemgxtZMeDN5jdNF22rIXgGyV5wPRkYqEgDmwcL35weJXBcg/bNcUSRt5CK/uxuH
 QHuhwa8i+iX5PNnTrWkIRGhh9fqtPAewiq4STO+T0pmyRfeYZ3RC1zNCsclQsQOhRMGmJJmFFhd
 j/lXVX0GQAkJADBPjmIOqsDcMpTnrpszucvrSwy7ppDsixYbQrzGjdRCnJQ4Zgyt7oFPkljo6UZ
 CLnzuH5qnRUyWcvwTFpYc7F02vx84cal8sSAnwrb66gKU4Rydm8kcd1IkfC4sBt++Hz4tCDJno4
 i/+2IXjaTSMLFSxiBNJrCCwPMQStN7y3J9S4szPga4CVMQbR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add generic compatible to all smd-rpm devices, they follow the same
RPMSG protocol.

Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 52 +++++++++++-----------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 2fa725b8af5d..6f70683f84d9 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -30,31 +30,33 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,rpm-apq8084
-      - qcom,rpm-ipq6018
-      - qcom,rpm-ipq9574
-      - qcom,rpm-mdm9607
-      - qcom,rpm-msm8226
-      - qcom,rpm-msm8610
-      - qcom,rpm-msm8909
-      - qcom,rpm-msm8916
-      - qcom,rpm-msm8917
-      - qcom,rpm-msm8936
-      - qcom,rpm-msm8937
-      - qcom,rpm-msm8952
-      - qcom,rpm-msm8953
-      - qcom,rpm-msm8974
-      - qcom,rpm-msm8976
-      - qcom,rpm-msm8994
-      - qcom,rpm-msm8996
-      - qcom,rpm-msm8998
-      - qcom,rpm-qcm2290
-      - qcom,rpm-qcs404
-      - qcom,rpm-sdm660
-      - qcom,rpm-sm6115
-      - qcom,rpm-sm6125
-      - qcom,rpm-sm6375
+    items:
+      - enum:
+          - qcom,rpm-apq8084
+          - qcom,rpm-ipq6018
+          - qcom,rpm-ipq9574
+          - qcom,rpm-mdm9607
+          - qcom,rpm-msm8226
+          - qcom,rpm-msm8610
+          - qcom,rpm-msm8909
+          - qcom,rpm-msm8916
+          - qcom,rpm-msm8917
+          - qcom,rpm-msm8936
+          - qcom,rpm-msm8937
+          - qcom,rpm-msm8952
+          - qcom,rpm-msm8953
+          - qcom,rpm-msm8974
+          - qcom,rpm-msm8976
+          - qcom,rpm-msm8994
+          - qcom,rpm-msm8996
+          - qcom,rpm-msm8998
+          - qcom,rpm-qcm2290
+          - qcom,rpm-qcs404
+          - qcom,rpm-sdm660
+          - qcom,rpm-sm6115
+          - qcom,rpm-sm6125
+          - qcom,rpm-sm6375
+      - const: qcom,smd-rpm
 
   clock-controller:
     $ref: /schemas/clock/qcom,rpmcc.yaml#

-- 
2.39.2


