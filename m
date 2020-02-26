Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8EB116FE72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 12:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgBZL6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 06:58:25 -0500
Received: from mail-pf1-f173.google.com ([209.85.210.173]:35256 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgBZL6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 06:58:25 -0500
Received: by mail-pf1-f173.google.com with SMTP id i19so1361538pfa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 03:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+p6H2ZNLGX3Lb58Cw5KgycQ+ehTxEdhQmQiKBPEVO+U=;
        b=FtHw7wntugTsPmJA8Hv3zkGUse9AWcGVV8zfyXX1B0JrMASYVUKJakSuXEn1KrB/Pt
         QIJPr2O0Db6sMohzyf4Gk4QUWD+CRjxabGbVkiPvunYbGWjEWNad+6L8k3MGD6rPIzeg
         crg5ft/qyvJbZXcpAL8TjXfOurxwlVVEEKwYbD/7h/MDXb14KLx2HFo4j06Y0BUKMg2u
         nbPImhLQkdKGl91GVn+9aTwGlss+u2DuzQeOi/3j+kw32pQmUaJv88hrUaQha80g1+H6
         Ez7IWRDcccSudwp3zpclmLEeKUTmJf0mZrlGSCnykgJl6Lv7vcQNmZKd+Zwx19ATFELr
         WGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+p6H2ZNLGX3Lb58Cw5KgycQ+ehTxEdhQmQiKBPEVO+U=;
        b=D0KCpT/xt6k5NK9jeK/aqjUuMN3spgZgLlaerxMi8awO67OXMaEmW/+jP+rrOHWSOy
         fbDJSuxUnKXG7o1h6PXH/PnK4YbbaohMCBfrYlT5XW5yi1U+oievF8/avpehj2lviiNX
         p8w+Sl10Cr2hxecwvuGtIh0cncdncMdAop0GpqU6W0C+g7rSsLWlP2MmWRr5lcrnuj7V
         xoxirugq34VRjzM1Bd7rNj3FTYmM7hu686wDNWb9ynfYS5RfuSJPxUj6ru/RAvHeGw/W
         4bZhRrP8pqTU08qzkYZ7BvkLAcUCC98RBdXiBrR2XGN5XZvmfoY0JK2OLqRZoiiAcUMy
         HLMQ==
X-Gm-Message-State: APjAAAVJGkChEbp/G9LmLAv8UOtC/9k/dAemh5dZj4zRdpW+meS3hkLt
        DKMT9UOrcQuBOnlqn9prAEMrLg==
X-Google-Smtp-Source: APXvYqywc/mWcONmOZQDx7IkryRxv4cAGf6uuMuuBdzU/6cdnFQDr+fm+1zRmkgIXjTHYcL43CXdfA==
X-Received: by 2002:a63:5423:: with SMTP id i35mr3544009pgb.179.1582718303501;
        Wed, 26 Feb 2020 03:58:23 -0800 (PST)
Received: from localhost ([2401:4900:1b38:7f42:3530:df3:7e53:a029])
        by smtp.gmail.com with ESMTPSA id c188sm2893557pfb.151.2020.02.26.03.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:58:22 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] dt-bindings: thermal: tsens: Add qcom,tsens-v2 to msm8996.dtsi compatible
Date:   Wed, 26 Feb 2020 15:01:13 +0530
Message-Id: <4e337c4a4194bb15f9efec67821f38504de1704c.1582705101.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582705101.git.amit.kucheria@linaro.org>
References: <cover.1582705101.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom-tsens binding requires a SoC-specific and a TSENS
family-specific binding to be specified in the compatible string.

Since them family-specific binding is not listed in the .dtsi file, we
see the following warnings in 'make dtbs_check'. Fix them.

/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is not valid
under any of the given schemas (Possible causes of the failure):
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible: ['qcom,msm8996-tsens'] is too short
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4a9000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']

/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is not valid
under any of the given schemas (Possible causes of the failure):
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible: ['qcom,msm8996-tsens'] is too short
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8916-tsens', 'qcom,msm8974-tsens']
/home/amit/work/builds/build-aarch64/arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml:
thermal-sensor@4ad000: compatible:0: 'qcom,msm8996-tsens' is not one of
['qcom,msm8976-tsens', 'qcom,qcs404-tsens']

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7ae082ea14ea..f157cd4f53b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -446,7 +446,7 @@
 		};
 
 		tsens0: thermal-sensor@4a9000 {
-			compatible = "qcom,msm8996-tsens";
+			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
 			reg = <0x004a9000 0x1000>, /* TM */
 			      <0x004a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
@@ -457,7 +457,7 @@
 		};
 
 		tsens1: thermal-sensor@4ad000 {
-			compatible = "qcom,msm8996-tsens";
+			compatible = "qcom,msm8996-tsens", "qcom,tsens-v2";
 			reg = <0x004ad000 0x1000>, /* TM */
 			      <0x004ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
-- 
2.20.1

