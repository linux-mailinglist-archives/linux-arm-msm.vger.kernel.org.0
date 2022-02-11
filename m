Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8524B2F3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 22:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353542AbiBKVUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 16:20:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347305AbiBKVUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 16:20:22 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A519C58
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:20 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q7so17162334wrc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ydVzqquU4q/bWYrhn+94me4Lj3peddSiUdmbeVAiITc=;
        b=eSsxeZ4orkbspSt5KyAoqc7J1G/ZVd50cU0CRQdOoyaUDUM2GyOsV5HrStc2X/sJiR
         reAHMUR+YEcXzGhuvA+YZtNBiI81wN7pJclpVCoZP+yB/13or87sp6PsYyAcFW8bEo5D
         ajsz5GOvDmg5hcIjS6cV3YqMaVrACl/tyCibGHXUTxBFWYUjXcRFmGRwpUMMJ7sMRf6J
         p4YsJ/3wbDI7VEdSQF1lPVVWbQKo7kv5gZyNku/H4yJGgWrkzIzhYJ7fjcPGbCkhk9lV
         5arye/KpxpBVL5j339xJyzXFKBtc4D7IGqnNaqRLzXdkDmfznNFPEng0uT/5SGiDC0ZB
         Ut/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ydVzqquU4q/bWYrhn+94me4Lj3peddSiUdmbeVAiITc=;
        b=VdI0l1dhYm8Ers3/99F6qs3ZzhJWiX/lx8ZWd/xmrGG7nI2LfTx33zIEK7DN4RD6HU
         or3zwKQC9whSOgrXtVB6pGBkh+pSqx6EEIjC7Qaw1chRRaYCN3Fi0FImPRvPNuXUuxvM
         SgTYE6DuEbamjLLN4BxkwQw0BFM4X+eWfYm4GvbZ/BgvF7Z1ZQ4hM74RAHiPO7US6ol3
         Kwy120O+oowbOAVOOVv832k25/KRYjzQhoaVHpvKE07pk0ImqbSHmbrIyZnPHgrq0MPC
         Cltn6CL6bEjrDuxhMXH3mkhVaXIroPVoX5UAGUuqY109r9ChPnED4X4by+Cdm9FMfv21
         Qa+g==
X-Gm-Message-State: AOAM532BXVAd7uWua3wEBHJhAOMps4VWqjdeZh+Pr+GJxr2vqtzLtaCq
        O08oONUjipMlgEDbyqgDKN4z+g==
X-Google-Smtp-Source: ABdhPJzhZEYpbYwKubpWDwBWiROzAN94i5PS0Q4CpmndFnMgR0mcybs5TbwKfi0KKdJUUO/HtNQVZw==
X-Received: by 2002:a05:6000:1861:: with SMTP id d1mr2775461wri.92.1644614418738;
        Fri, 11 Feb 2022 13:20:18 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id x5sm14276017wrv.63.2022.02.11.13.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 13:20:18 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v4 2/8] mfd: qcom-spmi-pmic: read fab id on supported PMICs
Date:   Fri, 11 Feb 2022 21:19:53 +0000
Message-Id: <20220211211959.502514-3-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211211959.502514-1-caleb.connolly@linaro.org>
References: <20220211211959.502514-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMI8998 and PM660 expose the fab_id, this is needed by drivers like
the RRADC to calibrate ADC values.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/mfd/qcom-spmi-pmic.c      | 7 +++++++
 include/soc/qcom/qcom-spmi-pmic.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index 4af88b8bb7d0..c77b4c82559e 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -19,6 +19,7 @@
 #define PMIC_REV4		0x103
 #define PMIC_TYPE		0x104
 #define PMIC_SUBTYPE		0x105
+#define PMIC_FAB_ID		0x1f2
 #define PMIC_TYPE_VALUE		0x51
 
 static const struct of_device_id pmic_spmi_id_table[] = {
@@ -145,6 +146,12 @@ static int pmic_spmi_load_revid(struct regmap *map, struct device *dev,
 	if (ret < 0)
 		return ret;
 
+	if (pmic->subtype == PMI8998_SUBTYPE || pmic->subtype == PM660_SUBTYPE) {
+		ret = regmap_read(map, PMIC_FAB_ID, &pmic->fab_id);
+		if (ret < 0)
+			return ret;
+	}
+
 	/*
 	 * In early versions of PM8941 and PM8226, the major revision number
 	 * started incrementing from 0 (eg 0 = v1.0, 1 = v2.0).
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index a8a77be22cfc..c821f6c6c8a8 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -50,6 +50,7 @@ struct qcom_spmi_pmic {
 	unsigned int major;
 	unsigned int minor;
 	unsigned int rev2;
+	unsigned int fab_id;
 	const char *name;
 };
 
-- 
2.35.1

