Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FAC279984
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgIZNIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNIe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:08:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DA4C0613CE;
        Sat, 26 Sep 2020 06:08:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q9so1962788wmj.2;
        Sat, 26 Sep 2020 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tzZ2JfpvpBsGOcIuGOlMCZ/EELydDVJ8D62VX9UkrHQ=;
        b=bxQ65KhHTs0fKOrVyOBGTn/1v2WLWkpMpApTeVr9BljXTRe1+DIIiD4HBdTtEZv8uh
         lR7QCMUOGJQPV2FYT9LoVSmzbIrXQ3GUsQHk+1c63mZ4vNpiMaS0F/3ZRpGegsJZkzt9
         VCfrph8uqUG4Ihx1VAi86yv+62v+C9ncqlq+LQhIcTk+jn6rekveRjnKS1Ox7al16eVQ
         TLXYEI3yMhzOrIDP6VBdBg2rtb3MTJdKoPO6bR55rLT981btrk4QHoESFMYjkVT5PmEW
         Xor4y+2mPCtYAn2zu8agXCtsnbGrniVe2dCR9rMH80qqC9PYdOPfsgSULuxhR/J+2LrM
         0zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tzZ2JfpvpBsGOcIuGOlMCZ/EELydDVJ8D62VX9UkrHQ=;
        b=AlZ7AIucyiEovd66vODlaw4EoEP2FBwyUqozFeh2HdkmpG9he7irXUe68lkvOztQV9
         BAWhKpYVLumY2k+fKdtHTXeiLuCUW3Y+RsI3hLELsUt0Eyqj36lADpHsZRdAb34upu1g
         ZiuBKa6PM3Ua23rQdcevAB28vW6EK7vq8Isf6G/T0tATiWTrbbHrgHn2x0Kr+MuuRJV3
         0wXwEUnQl/dW1HwUUZpjzPRYuzkVDYm4boGoIH+RNvb629q8hfbUZN4p5yrXIcloZ962
         2GWMkGjcKtA2dEfI4q7gKQoI81r0033PEKjeldBDSw8GVjO6R/QuPdFulUj3hfJkn8k0
         sZxA==
X-Gm-Message-State: AOAM533RSpt7Egt5wfoPHQ0sqCAKdXyXz3+hCuatE/tHAMQ3La5UpVPC
        XNDkeZdrqP8lays/IDdYRqw=
X-Google-Smtp-Source: ABdhPJxYfvWcdwBph0D/j6Cf8fb4h0xkVO0Y1R5AZuNnRHCe3ja3guo0ULRA6ciufF13I6l3z8AzMA==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr2501259wmj.44.1601125712657;
        Sat, 26 Sep 2020 06:08:32 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id m13sm6681687wrr.74.2020.09.26.06.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:08:32 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: rpmpd: Add SDM660 power-domains
Date:   Sat, 26 Sep 2020 15:08:28 +0200
Message-Id: <20200926130828.14292-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Add the shared cx/mx and sensor sub-system's cx and mx
power-domains found on SDM660.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmpd.c                      | 33 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 12 +++++++
 3 files changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8058955fb3b9..45ec2439ff51 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,msm8996-rpmpd
       - qcom,msm8998-rpmpd
       - qcom,qcs404-rpmpd
+      - qcom,sdm660-rpmpd
       - qcom,sc7180-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sm8150-rpmhpd
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index f2168e4259b2..d54a84dd83a8 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -220,11 +220,44 @@ static const struct rpmpd_desc qcs404_desc = {
 	.max_state = RPM_SMD_LEVEL_BINNING,
 };
 
+/* sdm660 RPM Power domains */
+DEFINE_RPMPD_PAIR(sdm660, vddcx, vddcx_ao, RWCX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sdm660, vddcx_vfl, RWCX, 0);
+
+DEFINE_RPMPD_PAIR(sdm660, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sdm660, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(sdm660, vdd_ssccx, RWSC, 0);
+DEFINE_RPMPD_VFL(sdm660, vdd_ssccx_vfl, RWSC, 0);
+
+DEFINE_RPMPD_LEVEL(sdm660, vdd_sscmx, RWSM, 0);
+DEFINE_RPMPD_VFL(sdm660, vdd_sscmx_vfl, RWSM, 0);
+
+static struct rpmpd *sdm660_rpmpds[] = {
+	[SDM660_VDDCX] =		&sdm660_vddcx,
+	[SDM660_VDDCX_AO] =		&sdm660_vddcx_ao,
+	[SDM660_VDDCX_VFL] =		&sdm660_vddcx_vfl,
+	[SDM660_VDDMX] =		&sdm660_vddmx,
+	[SDM660_VDDMX_AO] =		&sdm660_vddmx_ao,
+	[SDM660_VDDMX_VFL] =		&sdm660_vddmx_vfl,
+	[SDM660_SSCCX] =		&sdm660_vdd_ssccx,
+	[SDM660_SSCCX_VFL] =		&sdm660_vdd_ssccx_vfl,
+	[SDM660_SSCMX] =		&sdm660_vdd_sscmx,
+	[SDM660_SSCMX_VFL] =		&sdm660_vdd_sscmx_vfl,
+};
+
+static const struct rpmpd_desc sdm660_desc = {
+	.rpmpds = sdm660_rpmpds,
+	.num_pds = ARRAY_SIZE(sdm660_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
+	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpmpd_match_table);
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 5e61eaf73bdd..2a39dc40483d 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -102,6 +102,18 @@
 #define QCS404_LPIMX		5
 #define QCS404_LPIMX_VFL	6
 
+/* SDM660 Power Domains */
+#define SDM660_VDDCX		0
+#define SDM660_VDDCX_AO		1
+#define SDM660_VDDCX_VFL	2
+#define SDM660_VDDMX		3
+#define SDM660_VDDMX_AO		4
+#define SDM660_VDDMX_VFL	5
+#define SDM660_SSCCX		6
+#define SDM660_SSCCX_VFL	7
+#define SDM660_SSCMX		8
+#define SDM660_SSCMX_VFL	9
+
 /* RPM SMD Power Domain performance levels */
 #define RPM_SMD_LEVEL_RETENTION       16
 #define RPM_SMD_LEVEL_RETENTION_PLUS  32
-- 
2.28.0

