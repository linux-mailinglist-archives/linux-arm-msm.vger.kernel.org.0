Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F004D279936
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgIZM4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729332AbgIZM4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:11 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA779C0613CE;
        Sat, 26 Sep 2020 05:56:10 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c18so6830250wrm.9;
        Sat, 26 Sep 2020 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8uSfqxa/BOSJ683q8K6M24iSA6dxQW4lKoYvb7lVTZM=;
        b=iMYbrgxLI2MrOK2pyZREh6RdWcqtL3eZaiExNtVRmMz/2bAN+WUS7IRpwNitcOqoru
         blfa0ZEM8ILvSsZ56JhoIBi4u0TUIGkJBt3jVfxsCpOlwqq1V3lvAvYN2o99/WlaLfKP
         Mnqme+d1ue62pfo7Jhj8mLiRRWY7r6/R67t/ahl09+vWPb1Qixx9O8QyNTEFbIr6P34v
         VzezQrsq+T0k0aDVCGgfstYbLSWosy4+oOk5KyGuXPU5J0tF4RWLZpn+c6MSCs8Gkeog
         nOFOML4ztzNGkszkmSvVyJFdkc3I7uQ8r6IgIwi6YU3032eg2wHcE6K4/tjy0Wj2QgEt
         rw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8uSfqxa/BOSJ683q8K6M24iSA6dxQW4lKoYvb7lVTZM=;
        b=djd5wXCgKZICf65ywzO+WOK+N7MqOUwqs0O0475I+vy/tzaZjCHFBTMD767o5aRUeB
         W27/v/029TxZJWExcl84tWyDmjqqhnzVMe+at1vZa1KAnu6xDH1SD9PKZVU+Vp+l0zVx
         ed1SB0xtGMhJU/I3C6cCMbmSNpP1ixjGIuTAXpAaFCBpcrPT9PGGVL+reYerIPht0Ojr
         YkKH9ZnfiXIbQTUV2F0FmvDsDf1IT5GP7gQy5G8fIL1EZIC3h5Cl7r3H8fiSIItXgT+Y
         bUVN181sAxa8NxMteriQXuQkh1G0JGEDVINY/ntkGV6372Xvw/mpQj3fF+lOoeEu6Gdq
         deog==
X-Gm-Message-State: AOAM533W3IFvqRmiZFuIBTQkRMn8nxEtfebwgbNwOXl8nnaNBT4rUdab
        +xcRq/7TvxvJ0DVqbhFDECg=
X-Google-Smtp-Source: ABdhPJwDp9eXBRmt6PfaE4aWU65vPotGj3HWlCgJB/arSQr1OvCnFpSgV04HOnI3aXwa2GfnZetP9A==
X-Received: by 2002:a5d:6a47:: with SMTP id t7mr9214090wrw.75.1601124969266;
        Sat, 26 Sep 2020 05:56:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:08 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] regulator: qcom_spmi: Add support for new regulator types
Date:   Sat, 26 Sep 2020 14:55:44 +0200
Message-Id: <20200926125549.13191-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This commit adds the support for some regulator types that are
missing in this driver, such as the ht nmos-ldo, ht-lv nmos-ldo
and new gen n/pmos-ldo, all belonging to the FTSMPS426 register
layout.
This is done in preparation for adding support for the PM660 and
PM660L PMICs.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 05080483fe1b..0a507c7f4ae1 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -135,6 +135,18 @@ enum spmi_regulator_subtype {
 	SPMI_REGULATOR_SUBTYPE_LV_P600		= 0x2b,
 	SPMI_REGULATOR_SUBTYPE_LV_P1200		= 0x2c,
 	SPMI_REGULATOR_SUBTYPE_LV_P450		= 0x2d,
+	SPMI_REGULATOR_SUBTYPE_HT_N300_ST	= 0x30,
+	SPMI_REGULATOR_SUBTYPE_HT_N600_ST	= 0x31,
+	SPMI_REGULATOR_SUBTYPE_HT_N1200_ST	= 0x32,
+	SPMI_REGULATOR_SUBTYPE_HT_LVP150	= 0x3b,
+	SPMI_REGULATOR_SUBTYPE_HT_LVP300	= 0x3c,
+	SPMI_REGULATOR_SUBTYPE_L660_N300_ST	= 0x42,
+	SPMI_REGULATOR_SUBTYPE_L660_N600_ST	= 0x43,
+	SPMI_REGULATOR_SUBTYPE_L660_P50		= 0x46,
+	SPMI_REGULATOR_SUBTYPE_L660_P150	= 0x47,
+	SPMI_REGULATOR_SUBTYPE_L660_P600	= 0x49,
+	SPMI_REGULATOR_SUBTYPE_L660_LVP150	= 0x4d,
+	SPMI_REGULATOR_SUBTYPE_L660_LVP600	= 0x4f,
 	SPMI_REGULATOR_SUBTYPE_LV100		= 0x01,
 	SPMI_REGULATOR_SUBTYPE_LV300		= 0x02,
 	SPMI_REGULATOR_SUBTYPE_MV300		= 0x08,
@@ -511,6 +523,22 @@ static struct spmi_voltage_range ult_pldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1750000, 1750000, 3337500, 3337500, 12500),
 };
 
+static struct spmi_voltage_range pldo660_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0, 1504000, 1504000, 3544000, 3544000, 8000),
+};
+
+static struct spmi_voltage_range nldo660_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0,  320000,  320000, 1304000, 1304000, 8000),
+};
+
+static struct spmi_voltage_range ht_lvpldo_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0, 1504000, 1504000, 2000000, 2000000, 8000),
+};
+
+static struct spmi_voltage_range ht_nldo_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0,  312000,  312000, 1304000, 1304000, 8000),
+};
+
 static struct spmi_voltage_range hfs430_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 2040000, 2040000, 8000),
 };
@@ -530,6 +558,10 @@ static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
 static DEFINE_SPMI_SET_POINTS(ult_ho_smps);
 static DEFINE_SPMI_SET_POINTS(ult_nldo);
 static DEFINE_SPMI_SET_POINTS(ult_pldo);
+static DEFINE_SPMI_SET_POINTS(pldo660);
+static DEFINE_SPMI_SET_POINTS(nldo660);
+static DEFINE_SPMI_SET_POINTS(ht_lvpldo);
+static DEFINE_SPMI_SET_POINTS(ht_nldo);
 static DEFINE_SPMI_SET_POINTS(hfs430);
 
 static inline int spmi_vreg_read(struct spmi_regulator *vreg, u16 addr, u8 *buf,
@@ -1443,6 +1475,30 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
 	SPMI_VREG(LDO,   LV_P300,  0, INF, LDO,    ldo,    pldo,    10000),
 	SPMI_VREG(LDO,   LV_P600,  0, INF, LDO,    ldo,    pldo,    10000),
 	SPMI_VREG(LDO,   LV_P1200, 0, INF, LDO,    ldo,    pldo,    10000),
+	SPMI_VREG(LDO, HT_N300_ST,   0, INF, FTSMPS426, ftsmps426,
+							ht_nldo,   30000),
+	SPMI_VREG(LDO, HT_N600_ST,   0, INF, FTSMPS426, ftsmps426,
+							ht_nldo,   30000),
+	SPMI_VREG(LDO, HT_N1200_ST,  0, INF, FTSMPS426, ftsmps426,
+							ht_nldo,   30000),
+	SPMI_VREG(LDO, HT_LVP150,    0, INF, FTSMPS426, ftsmps426,
+							ht_lvpldo, 10000),
+	SPMI_VREG(LDO, HT_LVP300,    0, INF, FTSMPS426, ftsmps426,
+							ht_lvpldo, 10000),
+	SPMI_VREG(LDO, L660_N300_ST, 0, INF, FTSMPS426, ftsmps426,
+							nldo660,   10000),
+	SPMI_VREG(LDO, L660_N600_ST, 0, INF, FTSMPS426, ftsmps426,
+							nldo660,   10000),
+	SPMI_VREG(LDO, L660_P50,     0, INF, FTSMPS426, ftsmps426,
+							pldo660,   10000),
+	SPMI_VREG(LDO, L660_P150,    0, INF, FTSMPS426, ftsmps426,
+							pldo660,   10000),
+	SPMI_VREG(LDO, L660_P600,    0, INF, FTSMPS426, ftsmps426,
+							pldo660,   10000),
+	SPMI_VREG(LDO, L660_LVP150,  0, INF, FTSMPS426, ftsmps426,
+							ht_lvpldo, 10000),
+	SPMI_VREG(LDO, L660_LVP600,  0, INF, FTSMPS426, ftsmps426,
+							ht_lvpldo, 10000),
 	SPMI_VREG_VS(LV100,        0, INF),
 	SPMI_VREG_VS(LV300,        0, INF),
 	SPMI_VREG_VS(MV300,        0, INF),
-- 
2.28.0

