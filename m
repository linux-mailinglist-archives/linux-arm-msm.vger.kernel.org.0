Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE9BB9D34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 11:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404309AbfIUJvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 05:51:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43842 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391840AbfIUJvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 05:51:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id q17so9081327wrx.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TTWhGlfQoIcDWIQ6V6w3XJDTatobCF4pJ0zw9P4Oqcc=;
        b=FCSPBVZpLXy8SjtQexkvU5fv0PHXbse0xmO/ztLV4mT6cEOVpRNTKrpxGf+yV8qfUb
         N5BFvJU7V7nTH+oudsWkbRVRM+WEuNdka4tESVWhJibtq/7UgH3PaYeeqFS14oqs9svQ
         RHGaVLqS/q9ihtBlzbAVru8cBGVG2aacl6VbgcrhD999Y9WO1JFwaG+6orOtsOplqYW0
         OgUjwdynZx545XgXMyo+jX7JERYI8750srZ/gF8UdeDDC3A+Smo/LfbPED/4cH4Rag7v
         d5LtV1rSOWH7GHRn/YC3jPN2VIsADeZidy5sJ6zFKKDv2528jKBksg6jLsl4HMWeogMW
         tGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TTWhGlfQoIcDWIQ6V6w3XJDTatobCF4pJ0zw9P4Oqcc=;
        b=NwOFLEosfnr8RykYdSnmpb0Cu0KyytjAOi72VGjTTy9AhbEgikcfY3MuHxcnomyueu
         7dokMgR2RG/q8c+XXXl/5EwFsE+4osEltLViu60+rck5UPq3URPVwX2jiR1gXBWMa6WI
         dh8/Jal+qDKGFRJBFFf1n9Y8mc9ahe8PlYb4lhIEDehivoXd4U6rbHMR8pJtSQujlaCY
         H2qDpLhgymtRist5HtQMH38D6V7aB/uTIQy7/cHBG+W6IYujib8BDqqLuayfwu0C8d8Z
         4182IQLum99xx/FasPLl7zBn25imLkkELdEvk3f4YmwqnqQRZNkH+RaUVk+jYw7a2/Ah
         QfmQ==
X-Gm-Message-State: APjAAAXxj2St/oomCN7FI5axS/tPmZXMZ3EA6Qcsb628OyZwyxAP/VQx
        bbffcXkLpp5v5eIdS0yM2kjfyDw+CHg=
X-Google-Smtp-Source: APXvYqx0yJj+109W5ssYuusAnYqbfiIGKd7D32xTIOg71MDeCKQ8kHc3WA4rMsJpv6WN06tL0d6GJw==
X-Received: by 2002:a5d:4d8c:: with SMTP id b12mr14496557wru.198.1569059481643;
        Sat, 21 Sep 2019 02:51:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c8sm4947094wrr.49.2019.09.21.02.51.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 02:51:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org,
        lee.jones@linaro.org, agross@kernel.org
Subject: [PATCH 1/5] qcom: spmi-regulator: Add support for ULT LV_P50 and ULT P300
Date:   Sat, 21 Sep 2019 11:50:39 +0200
Message-Id: <20190921095043.62593-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921095043.62593-1-kholk11@gmail.com>
References: <20190921095043.62593-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

The ULT LV_P50 shares the same configuration as the other ULT LV_Pxxx
and the ULT P300 shares the same as the other ULT Pxxx.

These two regulator types are found on PM8950 and its variants.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 7f51c5fc8194..5a269ec46963 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1466,10 +1466,12 @@ static const struct spmi_regulator_mapping supported_regulators[] = {
 	SPMI_VREG(ULT_LDO, N600_ST, 0, INF, ULT_LDO, ult_ldo, ult_nldo, 10000),
 	SPMI_VREG(ULT_LDO, N900_ST, 0, INF, ULT_LDO, ult_ldo, ult_nldo, 10000),
 	SPMI_VREG(ULT_LDO, N1200_ST, 0, INF, ULT_LDO, ult_ldo, ult_nldo, 10000),
+	SPMI_VREG(ULT_LDO, LV_P50,   0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, LV_P150,  0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, LV_P300,  0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, LV_P450,  0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P600,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
+	SPMI_VREG(ULT_LDO, P300,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P150,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 10000),
 	SPMI_VREG(ULT_LDO, P50,     0, INF, ULT_LDO, ult_ldo, ult_pldo, 5000),
 };
-- 
2.21.0

