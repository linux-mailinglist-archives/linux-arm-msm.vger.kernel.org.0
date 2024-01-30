Return-Path: <linux-arm-msm+bounces-9090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47500842D26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2223287886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E929E71B2A;
	Tue, 30 Jan 2024 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Drb7Jpoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4C60BA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643779; cv=none; b=HMaxs3jq9+Jn0LOmYFp+wpokWhv0D+Ikg6C+bxdDSmvo9L2VcP0IA1PXQ3esTR+CQSeJ+Gzr0j6/FIldI/DKf+9ys1GanbqrC50gSpx2vP1p4xHsX1whliph8TaP7JyP6J7Ax4ns4oNQ5dSwlDOyP5Ns0aeH6IafGuHyA04BSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643779; c=relaxed/simple;
	bh=jdver5oAqOnuxj7mPP+fvKnzoXlE6pDsskGBX15Cvp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/aaIpoj8jaGNuGO7l7cfC3yeb8X1WhIFKtPB5rnmRQB6soHJuqn570/jJNo6jkFloBnG4ELTxWrPQypSmD0Q3r8jXg8v0ZeC6I8H7DT1adYdWqv+zXlHjTkTxnP+oE/D5M0mjySC6odhst/zpDfECR1JlbCgZtpoZuk62/0Zyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Drb7Jpoh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5110fae7af5so3014233e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643776; x=1707248576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnzW7jCYFMic0oKyj2FN8OUeidyAYPbXeWXjnrigsH8=;
        b=Drb7JpohTwyUMM+oy5085HGEcQZ+EsDw5Y0JcE+EiP5KD3fOftb5G96rvLTTw4fjzB
         a0aU7gDSoq9VgrEg64p3ZbFVVDhkjFj4eX3Ub5vuMWKU9VKV8bDsuWBBT01w10KQyTUa
         Ajw6LKxlf1w/F0c98cUr/xxdODrrLcIP3FM3Z2xSn89FmZmvgtGbcDiJAdtJpjbDoImx
         8axuyJlhPt0El+pN7ZqvzMcV36gB94kXWNzlb2Xs/KJHZ7Im0BdOC1nOL2H2L8C+5Vfb
         owSDXVZpywhiTeHbQGgT3+PMnUHQoqpkNhY3nH9WkinFe0W2pzKeGrdxctMpQWRPoxbS
         dJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643776; x=1707248576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnzW7jCYFMic0oKyj2FN8OUeidyAYPbXeWXjnrigsH8=;
        b=P5UNFQuWcKiKjXz2Z7xChUKcLVHpbUfqF5K2RN4q8Iu3nu3Qe+9iwiy4J7RF8baHlc
         WmUdmDXfRhuhspQ0bgikipPTQjZ2AH9yN1lYg1tOyCEU11PVwnLgPZHLvBxIfIcC7gxL
         V+FFueJhLGqzdXQV9Is63y+AcwDKZV0Tzt/YqKjXlDMqt1q5WpDn2KddZ9JgBXoiTdKr
         C4kEbbfO+sgYPduk5cxS7Rmvzd5iMNH7nZqGNS9gwBlfrd0iFkm01pTaCE53rUx2jS25
         it8CAPNr/4FVKzwSZ4nF6ELkNZHGsR1keIZ3KoH9At0k5DBsCkgJK0mSxcu3g9vaJivL
         F47A==
X-Gm-Message-State: AOJu0Ywl3vVCVtUVwl/46qgwkz7wy/Te/TGzAWnCWmgllq+cBZ6ONBch
	IlzNMBSRT5T5dv/r8rfwgVCA9TutjWbqeQPmCnF56PpD500ZigcDtfPUxqyqb98=
X-Google-Smtp-Source: AGHT+IHmuDv8jF6XDwfZgfdVsMH1TPbtAdhL4IsH+7p0yprZB2J5U4H49OCFMp22xtSHw9/XDt0t5g==
X-Received: by 2002:ac2:44db:0:b0:511:9d7:b5df with SMTP id d27-20020ac244db000000b0051109d7b5dfmr321688lfm.7.1706643776201;
        Tue, 30 Jan 2024 11:42:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWP16Mc3VfAKGFtBhjLYx2tZMyAJ82Kw/wLPRqQAREi9jTtCUf1aSwQJ/wO09mpoUC7mjVapqHFMIblbczyZOGs8slGSBRKzcm+QYcjs2bDCrxamhjtmjgblRLwkJtsyTxA9uw2aQkYtVXXgp9I88LEm+Sx5Tf+Od7Q2IMrQbfsUVgjm53OeFCs8u91pp26f/azSbDd1aJijxGFgYK7PvADEyXOgdh/WklsU8/VZy4z6J7Fw5S68qvW54dUhWw4s2H+eI4BQJDSRfS3nhTLm4D98JXtqfs1zLFGSEXQIntCQ6TKI2NP+3WCU3PBHWa3DmiIwn5xPptCKPk8tQM/VmvhXAlakdnRDxjaXiZC5SMOkXtDdXXsNtydN1VH4AP0nZovFVwfey0yAOmB/gDF1Pca7vauvUrEuc+PPzoq85IqFczBO9z1
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j16-20020ac253b0000000b0051021a9febdsm1552145lfh.153.2024.01.30.11.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:42:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 21:42:53 +0200
Subject: [PATCH 2/4] dt-bindings: usb: qcom,pmic-typec: add support for the
 PM4125 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-pm4125-typec-v1-2-e8d0097e2991@linaro.org>
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
In-Reply-To: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jdver5oAqOnuxj7mPP+fvKnzoXlE6pDsskGBX15Cvp0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluVE94Kk23WFj1cJ0hmTIKX1Hb7DJjYrbQ/wo5
 KAyyHLyFU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZblRPQAKCRCLPIo+Aiko
 1e//CACqGuv2y2MERLW04e8lX2Rxy82BNfCUm1tFS1cE7v1holl7w2R0Hjwq4IzV0YcuP0Eas8T
 JNW2R5jyCNxtY52yRnlWZSn3wPNYMq5HJIRhihDgoUHHKALEAbkQHpwDGVpzZ5wOk4IXq3c6NCV
 iiLkJAAn+5XHOicPYaBkItopTERn8PRvpKiCZbNBpnyv4QDGqakS3JPZHW0tJi+xRZpAUGSO1Pv
 upPFltDqYjyPsUEACVxeTNOPd2wQZjDvgxIV6YtmAhcZQ77D0PNOrSH2hAPhzITMM/FU/hjweAR
 XmhEEvPDj7HHVvpnITpag7xStD2YL4RNUCBR7EPqq+XlhxSl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PM4125 PMIC has the same Type-C register block as the PMI632.
Likewise it doesn't support USB Power Delivery. Define the compatible
for the TypeC block found on PM4125, using PMI632 as a compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6c0c6b337693..9750cbb7558c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -14,9 +14,15 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pmi632-typec
-      - qcom,pm8150b-typec
+    oneOf:
+      - enum:
+          - qcom,pmi632-typec
+          - qcom,pm8150b-typec
+      - items:
+          - enum:
+              - qcom,pm4125-typec
+          - const: qcom,pmi632-typec
+
 
   connector:
     type: object
@@ -93,6 +99,7 @@ allOf:
           contains:
             enum:
               - qcom,pmi632-typec
+              - qcom,pm4125-typec
     then:
       properties:
         reg:

-- 
2.39.2


