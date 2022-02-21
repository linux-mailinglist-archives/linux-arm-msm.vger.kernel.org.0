Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7929E4BECF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 23:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbiBUWI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 17:08:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbiBUWIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 17:08:25 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975AD22BED
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 14:08:01 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u1so29336249wrg.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 14:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bwN53YHoJ1opVHwpPbkOWG0HPkiJRyBRi2Alm7N6S5M=;
        b=K6PLqWNi78md6WDHB3AVIRNDPTjYFcoljhSFKi/ZiPJWVGQOvd1jxPg/RF2t3UROFp
         Vm4MVTD1irJ6SGuusqlbgyIR7C9W6u4P5sgM40gamct5IyfeTFDNcw8iH5815pbDrh6U
         Jdj4CjLgjSy3lq8Rn+xlR9/TfnXwBg1bSfqBAxoT/lnlXqycGEApVOWbDKjcEtwINT7Q
         VKiPohZVXjWojIZfdaKGGQiFWCUveGEKDHhzUyaald31WDQdGgTEW7jUk/Ltj2nfIS5n
         mAqNN0GoblGxU4dPHPkISL3PgEzgd9ubk/I6kLNB120mqn2jbhCZLsJdRCZIzEeVHVIq
         zJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bwN53YHoJ1opVHwpPbkOWG0HPkiJRyBRi2Alm7N6S5M=;
        b=5cLvip27EHqg6Hzmxh1sk0iZr3i5d8yVzeO1D6L/hN3JZYCUFt7AhsjAM1vQtVZBDS
         OGI2A6ElXlN0v7B/QGJqpIcjVboR0aFTlmW4H3zYkm2MMJoEE8mwBpwu1Pw8LUM5hO6T
         UFfr1EGcZFsnxvAAjJ7e7hRgk7XsHJO49xE6QdCrhelvVG1xj/Ykc3Kvb5frTfmg4QnQ
         C0STe3Iz0W6aSg7Nlj+Ad5zqXFiSUlIuEHiiL5P1LCejM7/pxEnkEHD7OwUV+WTBca8y
         YIobxCjLrw+IcuZR9uO1orTtUJ1x3hp1SC/Pzzo7sll8Q+RP0sO1LyulJ7YfHX984KGK
         L58w==
X-Gm-Message-State: AOAM532CyaAUTWAg2Lmi+bTMUFDrUo5hhgePHFBl4DUmZL/kEZIWoXeV
        gc6yIfYiBe80uxre0R4Ys6RuVQ==
X-Google-Smtp-Source: ABdhPJxm3WKYqTKnR9kmdvBJmF0hspSjIA2J3Yj0N/VQGscdgV51DReP+vs8JzdEskHv2e+8Ag5g/A==
X-Received: by 2002:a05:6000:188b:b0:1e3:1cfa:5851 with SMTP id a11-20020a056000188b00b001e31cfa5851mr17952965wri.510.1645481280244;
        Mon, 21 Feb 2022 14:08:00 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id w8sm51626093wre.83.2022.02.21.14.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 14:07:59 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v8 3/9] mfd: qcom-spmi-pmic: read fab id on supported PMICs
Date:   Mon, 21 Feb 2022 22:07:37 +0000
Message-Id: <20220221220743.541704-4-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221220743.541704-1-caleb.connolly@linaro.org>
References: <20220221220743.541704-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
index 1ef426a1513b..89e10b32fccb 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -19,6 +19,7 @@
 #define PMIC_REV4		0x103
 #define PMIC_TYPE		0x104
 #define PMIC_SUBTYPE		0x105
+#define PMIC_FAB_ID		0x1f2
 
 #define PMIC_TYPE_VALUE		0x51
 
@@ -168,6 +169,12 @@ static int pmic_spmi_load_revid(struct regmap *map, struct device *dev,
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

