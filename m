Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC82A474E73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 00:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238143AbhLNXOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 18:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbhLNXOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 18:14:53 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC349C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 15:14:52 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id k2so30621798lji.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 15:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSLNaMiL8Kp8E/OPxoNdygef9mDx6HoxP3E+zndWpfE=;
        b=OMhcfIVm/Nz8lBg+C7kjmvPer4roVyPS68XqozyUYTxeQHdwQLpEy2umYYhmktyiYV
         JlkX+zI6Xlrd4F6UuCeFm0ZJdOvCV7oB+h0qAWrsR+/TOFJZhuXpZqWHaI6eNe+FgpvS
         o5UrT7abwPGkHn3voRMqooKeWCE50QVAsb7JmrlhhzJcxWIBeywnhQAqGaRz0NjSQct4
         pIiietrptmdnGKxFihdXjD6Gfg3Wn8B0VJzkgTrNUYcvZqQ6PgfB1O3QryGbCJ+Ptd4/
         JwCwWLKLk8YUN0LAYj0jmoWZbPF0pUH+7vIvzdfjY5v9P0N8R+92aFI5Ml2AsC/T9g2v
         /Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pSLNaMiL8Kp8E/OPxoNdygef9mDx6HoxP3E+zndWpfE=;
        b=3MZqxBxxti4AM3ynVGckWmDs0iDw4Lvqw+qEY24VusuE9v8AOZtqpNtUPzIWPKxx5b
         2QMdGpePfpHznIyz1IO8nYAyQcpbngYATBiIo/EegekMi1Bwskcd/g1UEwsP0plhINlE
         mScTEcY58IRk64DJTeNbZd1JXnKj2MaapXcx3E/l1Kz6TfU/2OCBUv6GllWdk5vS/BDp
         BQZdu6OzN/2Q1z0bjGPtZz56Ck/0wFyl/o6qvvtVcY5BOpdYNMm3HTARG6EZAEas3LRa
         5UYTClUp+c2NpPnQjVM9uqC5WUyiEkVuP5KwSPQdm3JIU+yAFbWCcV1hVi9Xwj9UPuRn
         0MeQ==
X-Gm-Message-State: AOAM533Aw2+xhw/pUp2tAWFFzX+wYDHN4OMFfJsfQV+iLJm6lhXVHlGo
        udIxH9F+NlAnAyOOi5nyol1VCw==
X-Google-Smtp-Source: ABdhPJwM/+7PK9XBJAsD2O80773BS4yFAlQ7d5CsjwIlzym4+nbTq1bwGLrkYSeXHvGt90zAwujBaQ==
X-Received: by 2002:a2e:7c07:: with SMTP id x7mr7659513ljc.433.1639523691094;
        Tue, 14 Dec 2021 15:14:51 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id u3sm19566lfs.256.2021.12.14.15.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 15:14:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH] arm64: dts: qcom: sm8250: fix PCIe bindings to follow schema
Date:   Wed, 15 Dec 2021 02:14:48 +0300
Message-Id: <20211214231448.2044987-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace (unused) enable-gpio binding with schema-defined wake-gpios. The
GPIO line is still unused, but at least we'd follow the defined schema.

While we are at it, change perst-gpio property to follow the preferred
naming schema (perst-gpios).

Fixes: 13e948a36db7 ("arm64: dts: qcom: sm8250: Commonize PCIe pins")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 27ed152b1ba9..4cc1808963dd 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1434,8 +1434,8 @@ pcie0: pci@1c00000 {
 			phys = <&pcie0_lane>;
 			phy-names = "pciephy";
 
-			perst-gpio = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			enable-gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -1538,8 +1538,8 @@ pcie1: pci@1c08000 {
 			phys = <&pcie1_lane>;
 			phy-names = "pciephy";
 
-			perst-gpio = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			enable-gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -1644,8 +1644,8 @@ pcie2: pci@1c10000 {
 			phys = <&pcie2_lane>;
 			phy-names = "pciephy";
 
-			perst-gpio = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			enable-gpio = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;
-- 
2.33.0

