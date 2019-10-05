Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C46ECC98B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 13:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfJELIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 07:08:06 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33401 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfJELIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 07:08:06 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so10024514wrs.0;
        Sat, 05 Oct 2019 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LdEZIkfvgiE6hyhM8+v/nzD4FH1/JdATBLKD/f4PmxY=;
        b=ZDJY+eU0QTDJUpF1kQdCOGy225/9ceHpm4HqPkL6Dvpj7wjRb5fZNsGXub9gXBHV8g
         BIgL1LaRpsvdz/sMYMtn8iRIU3Y/WGXfQMMrlaS40wJ8jEIu0z/PMV5iHaISLU81w2EF
         PosJLx+feXev/jm1W5etLxhBZ7NXZtZpDsR9Sb3ZtEOzijNJQugMqlKRG5D9bsWpJppz
         lNPdhwgWjkL7b7gc6fSG8XhwZM0fHQqMGrEqhadPku9qjLDYLPDBa9OPHGXQqfu7zPDf
         xYPh+tUqgHbWt8aVGeCkqrOxdnb2Y0wJ7gqinBzM672rNsz9YS9difKsH28BJdQe3YsC
         X0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LdEZIkfvgiE6hyhM8+v/nzD4FH1/JdATBLKD/f4PmxY=;
        b=K0Br07tXnf29F6Tcfvx9VmPWDLpJDhZRt0MPno6eJPE5LEEen9rkeHstbGgTFW64Mc
         mJkvg/kw19elbZOGxntnhzhKjg2R1exGtJzmawyxIb1UaFmu7qv6SPlLVRntw26kxtWP
         05Eh14vxWX+o6X30QRyLaVCsFH/ATKV6X819ATQ/NmFaxfkKGiwdASAY0860efxdBB2I
         PpDuMItH9RdWguD5lLJXnpwKs6rIh2ozJNRxELeU6FtTLO6re0cXcSYxkIVexU5sLN6O
         7M8ssaGF4/bV2j++F8fxQZltRxad9du0xCgJJ66GNAE+3mllrLY4xzfAzFXPBjNB87eE
         x37w==
X-Gm-Message-State: APjAAAXryauyrQVH21zgEkx9/J6R6mKCxEDfZdf9q2jiSnKzrP0R06TC
        283o6OX4DaoureMyRYVPSsv3Ka0sx6shIw==
X-Google-Smtp-Source: APXvYqyV15Y9cFaTG6FzD+3zkEFQKAOKBb9uLmRFZ5i3q3JBEarIpu7E97cqRq+6SZTYAhMHctWESw==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr15972259wrp.216.1570273683792;
        Sat, 05 Oct 2019 04:08:03 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c6sm9712270wrm.71.2019.10.05.04.08.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 04:08:03 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     marijns95@gmail.com, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        "AngeloGioacchino Del Regno" <kholk11@gmail.com>
Subject: [PATCH] soc: qcom: rpmpd: Add rpm power domains for msm8976
Date:   Sat,  5 Oct 2019 13:07:58 +0200
Message-Id: <20191005110758.31548-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "AngeloGioacchino Del Regno" <kholk11@gmail.com>

The MSM8956/76 SoCs have two main voltage-level power domains, VDD_CX
and VDD_MX, which also have their own voltage-floor-level (VFL)
corner.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
 drivers/soc/qcom/rpmpd.c                      | 23 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
 3 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
index eb35b22f9e23..bc75bf49cdae 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
@@ -5,6 +5,7 @@ which then translates it into a corresponding voltage on a rail
 
 Required Properties:
  - compatible: Should be one of the following
+	* qcom,msm8976-rpmpd: RPM Power domain for the msm8976 family of SoC
 	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
 	* qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family of SoC
 	* qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of SoC
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 3c1a55cf25d6..2b1834c5609a 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -115,6 +115,28 @@ struct rpmpd_desc {
 
 static DEFINE_MUTEX(rpmpd_lock);
 
+/* msm8976 RPM Power Domains */
+DEFINE_RPMPD_PAIR(msm8976, vddcx, vddcx_ao, SMPA, LEVEL, 2);
+DEFINE_RPMPD_PAIR(msm8976, vddmx, vddmx_ao, SMPA, LEVEL, 6);
+
+DEFINE_RPMPD_VFL(msm8976, vddcx_vfl, RWSC, 2);
+DEFINE_RPMPD_VFL(msm8976, vddmx_vfl, RWSM, 6);
+
+static struct rpmpd *msm8976_rpmpds[] = {
+	[MSM8976_VDDCX] =	&msm8976_vddcx,
+	[MSM8976_VDDCX_AO] =	&msm8976_vddcx_ao,
+	[MSM8976_VDDCX_VFL] =	&msm8976_vddcx_vfl,
+	[MSM8976_VDDMX] =	&msm8976_vddmx,
+	[MSM8976_VDDMX_AO] =	&msm8976_vddmx_ao,
+	[MSM8976_VDDMX_VFL] =	&msm8976_vddmx_vfl,
+};
+
+static const struct rpmpd_desc msm8976_desc = {
+	.rpmpds = msm8976_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8976_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO_HIGH,
+};
+
 /* msm8996 RPM Power domains */
 DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
 DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
@@ -198,6 +220,7 @@ static const struct rpmpd_desc qcs404_desc = {
 };
 
 static const struct of_device_id rpmpd_match_table[] = {
+	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 93e36d011527..83f8f5a8773b 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -27,6 +27,14 @@
 #define RPMH_REGULATOR_LEVEL_TURBO	384
 #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
 
+/* MSM8976 Power Domain Indexes */
+#define MSM8976_VDDCX		0
+#define MSM8976_VDDCX_AO	1
+#define MSM8976_VDDCX_VFL	2
+#define MSM8976_VDDMX		3
+#define MSM8976_VDDMX_AO	4
+#define MSM8976_VDDMX_VFL	5
+
 /* MSM8996 Power Domain Indexes */
 #define MSM8996_VDDCX		0
 #define MSM8996_VDDCX_AO	1
-- 
2.21.0

