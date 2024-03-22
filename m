Return-Path: <linux-arm-msm+bounces-14822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A724D886B96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B426285424
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6740BFD;
	Fri, 22 Mar 2024 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+2f2l4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7354A3FB1E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108355; cv=none; b=BZVoLUZ56wnbhEsOeRVLRE1L78GASptuvda4REpPBYtq51Ab2sHxJo7Fxx6rxE2rqPbb8uCDU1NihC8mu+n9dV61/Ih3XmDwMp6nLxxn1FiNd7OfB4feBWEag/oOqZMA0P8NRY+OnY+rzmrrpGM+/uJQWCvmBZr4JQggD/6A07U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108355; c=relaxed/simple;
	bh=sNL+P1h7bA7A/w8ikEYKlALN61mPmedZHQKBVN02bv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRePV+cLBdhVcm01WnLGffR55z1daVnoNVNpdG7wcknGUanypD5AagkS78QdIJVeVx8YNh0ElO3V+X63h4hnRW6uEOKy02Yp2xe2v1Fo8nBbLuefxgwqZIFhWckcK31KlS7xvWzgu4p/vkNvJFyzw936Mo9iPm4W8VfTjPll01Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+2f2l4/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d49f7e5d65so24475081fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711108351; x=1711713151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ+GFLZIXNkg5v+GlXl4TnEHJE7knc6+m/ZcyQWbv4w=;
        b=T+2f2l4/E+UZqiJP/2bDLZJKszTxG8NJ/9VxrbYBuC+56d732wqKSJPFTTUXkUm0Gt
         gmpisWYuOwLQiULOHCt9DakG6wOgh6825/LC22D0WhtampIB4nXaAlYKYsxCjlAiWKzT
         YmFyviwc8vpeu6sQdC4Foil3uuBtZG5E7iL1vfaWBn79FuIp0twC/N516mC6023AYEo2
         3JTG+ooHnzworhlXYFLrLCQrIF6rFqWUAAC4+JFuR0jyIbT2XcGydcaeo67l21L2Akf7
         QThBz9SCP8QPm4DNJYCucXZzOsv3+eVlEdkbIYMn0foCidmV2j+LBQs8J6Ca0KbEBsZk
         4jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711108351; x=1711713151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJ+GFLZIXNkg5v+GlXl4TnEHJE7knc6+m/ZcyQWbv4w=;
        b=NKzHxHNQKOm/OeRbA9pcuRg/j6eB3Wd1/7CXE0xXSVGGUrg/xoXzLUggSpPWBMp/of
         TLin0W/3GzhEFs7zhW6St8HIus9HkXVIFUo+5M/DhMlZuH//HNvQTbjLmlW6Ya+RD6Ns
         TN1vRlTv2ZiXFJu5F3MB/pELl1562qW4yr+7W+bL7TKEt+LgxmIsiGjvCFcOKqdyDBDa
         leXTajgE0JKHIZhOjbo551SW96MiPk6gfSR/LNgMc31xBk1gvRsZXZ3ouUlWLMcjJpAW
         vbwbZdK0+OYVMlQpnW5t888zTReoG6a4+H/OENzO9DT2gh/2+HBbAHM9fIcR20QxiIpW
         IARQ==
X-Gm-Message-State: AOJu0YzlZwtyJz6REtd/4tJ4I9efYsk0TfEcIPt6t1StxcWDSmsymSXP
	zwyyTWGaZkom9em5OtqSN6cEqv/Ge1gQqzWpvTPoTaUGA6Hr46X+ad+L8hqbC3eeaiZMMgJ6GBm
	G
X-Google-Smtp-Source: AGHT+IHOrQzzpTNeMHB5pyVYf6AvHcpttAJajZrK/jIORc2gpzME5sDrHJsvjeLGUZT8gTbSc53y+A==
X-Received: by 2002:a05:6512:558:b0:513:76ec:2d21 with SMTP id h24-20020a056512055800b0051376ec2d21mr1539868lfl.10.1711108351065;
        Fri, 22 Mar 2024 04:52:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y18-20020a056512045200b00514b644bfebsm320136lfk.299.2024.03.22.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:52:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 13:52:22 +0200
Subject: [PATCH 2/2] dt-bindings: usb: qcom,pmic-typec: update example to
 follow connector schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-typec-fix-example-v1-2-6b01c347419e@linaro.org>
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
In-Reply-To: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sNL+P1h7bA7A/w8ikEYKlALN61mPmedZHQKBVN02bv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/XD8eVS0HaN3UvT0a0rdJ3gp1+uqRKHzDDbaP
 OEyDy2vAYCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf1w/AAKCRCLPIo+Aiko
 1f7/CACV8GFASdzCAHKIGIiR13c2TTORHa+O+xBHdGr2I3E3hqY4SWWGvLfMmoqQKIMEuOjp6/5
 y5UDtuSPpcnD8qHtA1y9CDC8xeT91G7qnk+IZVrWt7Y3jULTC0FntriWYlTMroSOpQqEUm04aXH
 rmX6Ml5ZC1YbP6tU+M6Ez4SZwApiYKIcJnRzOSKYen8v6+TZbEx2RtxxSstVCuJ0FXeQtnUSMgj
 pFFA1YMC/dJSRM1jolpaPaXMC30ObZOpyODx9CJJzN0iwU5GOxTl9d9kCCL3ouRvdTtNNV7ywS8
 FlRW0cyk9/1ZWGC9CVUsgr565CbqF6aZmOazrTnl7F4A7aMB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Update Qualcomm PMIC Type-C examples to follow the USB-C connector
schema. The USB-C connector should have three ports (USB HS @0,
SSTX/RX @1 and SBU @2 lanes). Reorder ports accordingly and add SBU port
connected to the SBU mux (e.g. FSA4480).

Fixes: 00bb478b829e ("dt-bindings: usb: Add Qualcomm PMIC Type-C")
Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 34 +++++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 63020a88a355..beecbda40e3c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -187,15 +187,22 @@ examples:
 
                     port@0 {
                         reg = <0>;
-                        pmic_typec_mux_out: endpoint {
-                            remote-endpoint = <&usb_phy_typec_mux_in>;
+                        pmic_typec_hs_in: endpoint {
+                            remote-endpoint = <&usb_hs_out>;
                         };
                     };
 
                     port@1 {
                         reg = <1>;
-                        pmic_typec_role_switch_out: endpoint {
-                            remote-endpoint = <&usb_role_switch_in>;
+                        pmic_typec_ss_in: endpoint {
+                            remote-endpoint = <&usb_phy_typec_ss_out>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        pmic_typec_sbu: endpoint {
+                            remote-endpoint = <&usb_mux_sbu>;
                         };
                     };
                 };
@@ -207,8 +214,8 @@ examples:
         dr_mode = "otg";
         usb-role-switch;
         port {
-            usb_role_switch_in: endpoint {
-                remote-endpoint = <&pmic_typec_role_switch_out>;
+            usb_hs_out: endpoint {
+                remote-endpoint = <&pmic_typec_hs_in>;
             };
         };
     };
@@ -216,8 +223,19 @@ examples:
     usb-phy {
         orientation-switch;
         port {
-            usb_phy_typec_mux_in: endpoint {
-                remote-endpoint = <&pmic_typec_mux_out>;
+            usb_phy_typec_ss_out: endpoint {
+                remote-endpoint = <&pmic_typec_ss_in>;
+            };
+        };
+    };
+
+    usb-mux {
+        orientation-switch;
+        mode-switch;
+
+        port {
+            usb_mux_sbu: endpoint {
+                remote-endpoint = <&pmic_typec_sbu>;
             };
         };
     };

-- 
2.39.2


