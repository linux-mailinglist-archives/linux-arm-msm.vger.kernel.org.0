Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A162431277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 10:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhJRIw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 04:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhJRIw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 04:52:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A87BC061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 01:50:45 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id y1so10719138plk.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 01:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GHXbJOIzZz0uyntt3d4Ji3zC10J5q8hg7NVP4sxB/3A=;
        b=MVqbCJ+qrW56KrmzD8R3M8i0+7L6/2N9HTKwD91HZxA5ZhmPrhDQ4ai96QeQ+IRW32
         o+oqncKGrt5MLW1D3wj4DKWYhG4sUmHQvCGBxzXnFByLzcS3GgFNV/BiZ3wQ4oPmrbx+
         PsRParRjkty7v5/PtF2kORz2cTC0R9Ihq2yx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GHXbJOIzZz0uyntt3d4Ji3zC10J5q8hg7NVP4sxB/3A=;
        b=Hi2YRtDNpL3xbvY9xlB1cRwGk+ESOHFlNMxUL/gKGp5ZZ6AQanM7olK/pLpvTWUZOU
         00Z166wJATMxOsArFefhh3i994LoB0aUbXPGguCQfzB8Y5FZwz8kppcKQWb8bY8o1wbp
         q0mpkZGA726LslMlcKbKBCJBG9ap+ISu8rn3nvAEy+tn+bW47e09FYkKPFY/1JcUXz6J
         4JA8j7jMt3TTASSvCQi9mwtSbgiTwQo8WWpT0YNt1ziZcdCzlqnQ6iu5lavQTDYV9Ku6
         USOf0NP4i7uNi+HYt1dvAdNnNcxdzwz8o99ccOiwKIScCUZn8iqLOAOToOE3O3Pk9rl5
         linw==
X-Gm-Message-State: AOAM530qd1FpxwrszEBSjcvu5oa4lxV4l9/B+hrdaVlcCN3TWymbhFdz
        gazxD254ern8UEdQyxa1icTlCK1SUc067w==
X-Google-Smtp-Source: ABdhPJyEJNhOxcKqPfI321wH7F65Tf3VHQiW8+t4OacOLT+eCreb7CFUmmOFH0bBeykWbB5vh/pH/w==
X-Received: by 2002:a17:90a:1950:: with SMTP id 16mr31113039pjh.126.1634547045267;
        Mon, 18 Oct 2021 01:50:45 -0700 (PDT)
Received: from localhost ([213.249.125.26])
        by smtp.gmail.com with UTF8SMTPSA id r8sm12278901pgp.30.2021.10.18.01.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 01:50:44 -0700 (PDT)
From:   Ola Jeppsson <ola@snap.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ola Jeppsson <ola@snap.com>, Heinrich Fink <hfink@snap.com>,
        Olivier Schonken <oschonken@snapchat.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350: Add fastrpc nodes
Date:   Mon, 18 Oct 2021 10:50:17 +0200
Message-Id: <20211018085017.1549494-1-ola@snap.com>
X-Mailer: git-send-email 2.32.0.380.geb27b338a3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add fastrpc nodes for sDSP, cDSP, and aDSP.

Signed-off-by: Ola Jeppsson <ola@snap.com>
Acked-by: Heinrich Fink <hfink@snap.com>
Acked-by: Olivier Schonken <oschonken@snapchat.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 118 +++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e91cd8a5e535..84660a945be7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1129,6 +1129,32 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "slpi";
 				qcom,remote-pid = <3>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "sdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0541 0x0>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0542 0x0>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0543 0x0>;
+						/* note: shared-cb = <4> in downstream */
+					};
+				};
 			};
 		};
 
@@ -1170,6 +1196,72 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x2161 0x0400>,
+							 <&apps_smmu 0x1181 0x0420>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x2162 0x0400>,
+							 <&apps_smmu 0x1182 0x0420>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x2163 0x0400>,
+							 <&apps_smmu 0x1183 0x0420>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x2164 0x0400>,
+							 <&apps_smmu 0x1184 0x0420>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x2165 0x0400>,
+							 <&apps_smmu 0x1185 0x0420>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x2166 0x0400>,
+							 <&apps_smmu 0x1186 0x0420>;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x2167 0x0400>,
+							 <&apps_smmu 0x1187 0x0420>;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x2168 0x0400>,
+							 <&apps_smmu 0x1188 0x0420>;
+					};
+
+					/* note: secure cb9 in downstream */
+				};
 			};
 		};
 
@@ -1402,6 +1494,32 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1803 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1804 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1805 0x0>;
+					};
+				};
 			};
 		};
 	};
-- 
2.32.0.380.geb27b338a3

