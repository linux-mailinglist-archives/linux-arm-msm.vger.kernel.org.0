Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601EB257581
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 10:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgHaIfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 04:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbgHaIfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 04:35:11 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28348C061573
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 01:35:11 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id np15so998262pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=X7qkROIAjI484yZIAilOWSabKyrWLqmXZk4PE7ZPdZc=;
        b=MI5bwHnWYjUbWxgYr4TaxkzodxiO/NMZyRTAKkrtf6i6y9K1yoWBc4ZCzCb+TYoW1S
         qSPPBTwn2y7ney5NiOH6mOTP8F02lbSSGmH8hWmFtj5HokJm0kiAtcBTtnfIaqCqTw6V
         ctWv2ZbcsP3dYr0p0fa7wWTcSKcJvdhDtIwWKm2zDEHetXJbZSAAppADL4HgCrHRPYFE
         hA703CIc48ClQ2sY3r6n4m85HJHjvDRYoO4GpOIv+oHfdxfUSpnEnG5qOq1JivI4K9wX
         oiszbvIjF8O0aajvlp4+etWvpysOBjn+ymERNIsUaU2RUJVavX33u6nznBhaP4wPvBRB
         wWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X7qkROIAjI484yZIAilOWSabKyrWLqmXZk4PE7ZPdZc=;
        b=ffBuUU76p0Y2JCNDQI7i8ln32ZDC+aMsEPCZi2ItpfBUUqBHtO0nsa267saFAJO6jU
         LzN7NiyBaOHleVON/JY1jp4ImZc8wgN9TxcPQl1qy9Avbgd2d9MtyQ+TsG2gGiT/CYIG
         V+yUMAnJNKiMMLlkOoULrCiFH0TUm9DV+Pn/VgRvh0zgobVwycFyPyUppxHoT3+FOglp
         J7Uw1p1n6y8tGlzz2DCd5296SMiCHbJxx9vcb70hCh39T81JFnqVL9oBzdny3WlElTcI
         uSyvaXSgtujG+LjynP206yEuec1KE6U2dgMwAM/rvQcmBWAA0sNYLf6e4HIhALjBeyq5
         kvAA==
X-Gm-Message-State: AOAM533da16bdHGhUT6eyPfbStuoR3HQc5TxHdn0z6L7uCsnV01MPTzl
        Nb8oGHpXtDevhMYjjG9H9Mg9uw==
X-Google-Smtp-Source: ABdhPJydrgCXVF8YB0a+/yBBqPN0zTFhc3zwuOsARRMcXy5FDdG8eVpZAq/pEh2KAjrgWCx7tLdiWw==
X-Received: by 2002:a17:902:441:: with SMTP id 59mr303401ple.282.1598862910687;
        Mon, 31 Aug 2020 01:35:10 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id o2sm6628819pjh.4.2020.08.31.01.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 01:35:09 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     shawn.guo@linaro.org, rnayak@codeaurora.org, robh@kernel.org,
        viresh.kumar@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] soc: qcom: rpmpd: Add MSM8939 power-domains
Date:   Mon, 31 Aug 2020 16:34:52 +0800
Message-Id: <20200831083452.32261-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the shared modemcx/cx/mx power-domains found on MSM8939.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmpd.c                      | 27 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 10 +++++++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8058955fb3b9..6051d6d3bf0e 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,msm8996-rpmpd
       - qcom,msm8998-rpmpd
       - qcom,qcs404-rpmpd
+      - qcom,msm8939-rpmpd
       - qcom,sc7180-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sm8150-rpmhpd
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index f2168e4259b2..7ae91df9a5ba 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -220,11 +220,38 @@ static const struct rpmpd_desc qcs404_desc = {
 	.max_state = RPM_SMD_LEVEL_BINNING,
 };
 
+/* msm8939 RPM Power Domains */
+DEFINE_RPMPD_PAIR(msm8939, vddmd, vddmd_ao, SMPA, CORNER, 1);
+DEFINE_RPMPD_VFC(msm8939, vddmd_vfc, SMPA, 1);
+
+DEFINE_RPMPD_PAIR(msm8939, vddcx, vddcx_ao, SMPA, CORNER, 2);
+DEFINE_RPMPD_VFC(msm8939, vddcx_vfc, SMPA, 2);
+
+DEFINE_RPMPD_PAIR(msm8939, vddmx, vddmx_ao, LDOA, CORNER, 3);
+
+static struct rpmpd *msm8939_rpmpds[] = {
+	[MSM8939_VDDMDCX] =	&msm8939_vddmd,
+	[MSM8939_VDDMDCX_AO] =	&msm8939_vddmd_ao,
+	[MSM8939_VDDMDCX_VFC] =	&msm8939_vddmd_vfc,
+	[MSM8939_VDDCX] =	&msm8939_vddcx,
+	[MSM8939_VDDCX_AO] =	&msm8939_vddcx_ao,
+	[MSM8939_VDDCX_VFC] =	&msm8939_vddcx_vfc,
+	[MSM8939_VDDMX] =	&msm8939_vddmx,
+	[MSM8939_VDDMX_AO] =	&msm8939_vddmx_ao,
+};
+
+static const struct rpmpd_desc msm8939_desc = {
+	.rpmpds = msm8939_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8939_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_HIGH,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
+	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpmpd_match_table);
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index dc146e44228b..4eb5d288e641 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -101,6 +101,16 @@
 #define QCS404_LPIMX		5
 #define QCS404_LPIMX_VFL	6
 
+/* MSM8939 Power Domains */
+#define MSM8939_VDDMDCX		0
+#define MSM8939_VDDMDCX_AO	1
+#define MSM8939_VDDMDCX_VFC	2
+#define MSM8939_VDDCX		3
+#define MSM8939_VDDCX_AO	4
+#define MSM8939_VDDCX_VFC	5
+#define MSM8939_VDDMX		6
+#define MSM8939_VDDMX_AO	7
+
 /* RPM SMD Power Domain performance levels */
 #define RPM_SMD_LEVEL_RETENTION       16
 #define RPM_SMD_LEVEL_RETENTION_PLUS  32
-- 
2.17.1

