Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7D7430A67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 18:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242274AbhJQQMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 12:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242311AbhJQQMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 12:12:44 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3EAC061765
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 09:10:34 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id w9-20020a4adec9000000b002b696945457so4782716oou.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JMyWX0FY/MOdMazh7g2+XT2HmUN0GY0VM/f4y3N1QsQ=;
        b=KoneSuYh0Oxd97pI5biVoza+oU1ASdg5duUN/blrzPpixhZ2r7oouvu6sM8jPJRD/K
         i5CcyODPp1+Y3+A3IuyOfgbyCfczBXZ4hJn+LiCTO0ffn/+aNDtco3fZc8unVs7A6U7c
         7CANAI2vwfoyV5lz07zjv3lQYMtvPzYx/WjCvZASHQkem352m9k3Jad3Ned0iQwmG7xy
         U0cEoPSQk4qDa6UGpoB1wWrewxTT2+TJFAbFOTltyuHNc0iV91uORwU/V1k9zn7fcBh/
         Wxxc/QyRf6NXSeLNvTnbK3x+42SQ0i30yWy83KLPptbT2up0vjn9+r/I6FSJ2kp5k4cG
         1Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JMyWX0FY/MOdMazh7g2+XT2HmUN0GY0VM/f4y3N1QsQ=;
        b=chesstA6YRKrmnP6a6mlExflZfpvHRQJpZAvLbCCfZW1s5uygzIVJF0Um+utQACXkf
         bxTkiFcp1PVzImp502Bn8f3IZUwLgGoLty8Q98bPB+8hocEwXdgOjOsFU+zIZFecBgU4
         s4Ugm4CxRNdRoVZlep9rtzyD3fX/vpp53+BVdYD1WILJ438EJkM//0MOp0fjLhBAtISy
         bgAM7drfIFTyibf3oNuVDEbwMG/yBOcxsUx+XHsOiJO3NHeMaOvqdlkhAXJggPm4QqK1
         S4YqpNAZR0JDUy1ISCga0ShI4cPpB1PbGbrC5eC8JG+Sw6Tc4Lnl51u4KBGLYhMf6GI6
         36/w==
X-Gm-Message-State: AOAM532uDxDiG54yIhYJZWsiPocPfAW25+Dlv68s+91yLXquz3fmb3sD
        5dsWvAhCy9t5DHe8uCky/ZNvDw==
X-Google-Smtp-Source: ABdhPJw6Q7ehbxXGbI+cIWrSApbLR/o0E6g0Vc7GHlPepAuqwrNEV/D26O0CHAPucJ5V1MWEi8RAWw==
X-Received: by 2002:a4a:4006:: with SMTP id n6mr17689612ooa.73.1634487033728;
        Sun, 17 Oct 2021 09:10:33 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id ay42sm2514892oib.22.2021.10.17.09.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:10:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] mfd: qcom-spmi-pmic: Add missing PMICs supported by socinfo
Date:   Sun, 17 Oct 2021 09:12:18 -0700
Message-Id: <20211017161218.2378176-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211017161218.2378176-1-bjorn.andersson@linaro.org>
References: <20211017161218.2378176-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm socinfo driver has eight more PMICs described, add these to
the SPMI PMIC driver as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rebased on top of sorting of entries

 drivers/mfd/qcom-spmi-pmic.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index 8be07102a468..1cacc00aa6c9 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -31,6 +31,8 @@
 #define PM8916_SUBTYPE		0x0b
 #define PM8004_SUBTYPE		0x0c
 #define PM8909_SUBTYPE		0x0d
+#define PM8028_SUBTYPE		0x0e
+#define PM8901_SUBTYPE		0x0f
 #define PM8950_SUBTYPE		0x10
 #define PMI8950_SUBTYPE		0x11
 #define PM8998_SUBTYPE		0x14
@@ -38,6 +40,13 @@
 #define PM8005_SUBTYPE		0x18
 #define PM660L_SUBTYPE		0x1A
 #define PM660_SUBTYPE		0x1B
+#define PM8150_SUBTYPE		0x1E
+#define PM8150L_SUBTYPE		0x1f
+#define PM8150B_SUBTYPE		0x20
+#define PMK8002_SUBTYPE		0x21
+#define PM8009_SUBTYPE		0x24
+#define PM8150C_SUBTYPE		0x26
+#define SMB2351_SUBTYPE		0x29
 
 static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pm660",     .data = (void *)PM660_SUBTYPE },
@@ -45,9 +54,15 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pm8004",    .data = (void *)PM8004_SUBTYPE },
 	{ .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
 	{ .compatible = "qcom,pm8019",    .data = (void *)PM8019_SUBTYPE },
+	{ .compatible = "qcom,pm8028",    .data = (void *)PM8028_SUBTYPE },
 	{ .compatible = "qcom,pm8110",    .data = (void *)PM8110_SUBTYPE },
+	{ .compatible = "qcom,pm8150",    .data = (void *)PM8150_SUBTYPE },
+	{ .compatible = "qcom,pm8150b",   .data = (void *)PM8150B_SUBTYPE },
+	{ .compatible = "qcom,pm8150c",   .data = (void *)PM8150C_SUBTYPE },
+	{ .compatible = "qcom,pm8150l",   .data = (void *)PM8150L_SUBTYPE },
 	{ .compatible = "qcom,pm8226",    .data = (void *)PM8226_SUBTYPE },
 	{ .compatible = "qcom,pm8841",    .data = (void *)PM8841_SUBTYPE },
+	{ .compatible = "qcom,pm8901",    .data = (void *)PM8901_SUBTYPE },
 	{ .compatible = "qcom,pm8909",    .data = (void *)PM8909_SUBTYPE },
 	{ .compatible = "qcom,pm8916",    .data = (void *)PM8916_SUBTYPE },
 	{ .compatible = "qcom,pm8941",    .data = (void *)PM8941_SUBTYPE },
@@ -60,6 +75,8 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pmi8962",   .data = (void *)PMI8962_SUBTYPE },
 	{ .compatible = "qcom,pmi8994",   .data = (void *)PMI8994_SUBTYPE },
 	{ .compatible = "qcom,pmi8998",   .data = (void *)PMI8998_SUBTYPE },
+	{ .compatible = "qcom,pmk8002",   .data = (void *)PMK8002_SUBTYPE },
+	{ .compatible = "qcom,smb2351",   .data = (void *)SMB2351_SUBTYPE },
 	{ .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
 	{ }
 };
-- 
2.29.2

