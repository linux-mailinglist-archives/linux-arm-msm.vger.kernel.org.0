Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFBC4CE215
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Mar 2022 03:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbiCECNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 21:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbiCECNw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 21:13:52 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4281C666B
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Mar 2022 18:13:03 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l1-20020a05600c4f0100b00389645443d2so3226376wmq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Mar 2022 18:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=78gNKgWiy0CQ87WA98rgoolaf4MxcOEltw1vanlXH7U=;
        b=BA/q/6fys7EToWgwF/bpkTpH2lrtlXFfPCra54IlyzgnOr0VuoIQMUvCwfofUE7Vrp
         PbT+oz782RICq6oN6d37nr3ybc0TTBPDKun3P4yAwXOj+HPRH3EUYqe7J/Ghl9lk4bgH
         wXFH+5fUBYZ9HaBR7jgBaTiIJ3goM7uZjX5G6XIZUonvOsCyBnpDmx23kWPOz3HVcKIw
         0Fi4TgO8iMhDqQJqGwXLmEdByuzX9yXNu6rDYxlKEMFC4TBha1x835Bmq7JEgSl3g/O2
         u+eb6ERDGOHv/QjZTPjdtUQqZyLL/KeB/D1sygbBGIeNIR5L0qyjNlJ9ZBIXA5ZP7uNS
         Dw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=78gNKgWiy0CQ87WA98rgoolaf4MxcOEltw1vanlXH7U=;
        b=2DrO+IyAjAtVc0iwoDF5EIqZWRowlH9oS3Kay/eiAEx3NRGOBRQCR/v5UoLVwFlL1c
         fBulFtPlH0ZmZ4MlAvVUiROrXLMbFP1pO4VAEkJ+7legWZOY25nwaWlrfGP/GMkTJQPh
         niUQEO/B6qUggDg8ijEpAgnPcFi2O4MOoOk7xNqLpzMa8Ehc10xuKqt6MEHTShbjLZI1
         TlYkc1eGST/LKWN6GIxPzk2szq4jZX1IuFUw96EO5SuP8ZqfNuV2+AGcpZCna170fKOX
         cNnLFyRKAeVEybZOl+UTNd79TW3K738QXwMoazARIpXfCfOWxqmOok8ozDafuiJR/uLQ
         WZJA==
X-Gm-Message-State: AOAM530Z0evTagOiB+BMoBC7szE/RoL55BqJGiAvEUXxAP1vip/XI5f+
        O19VtaMqol8Gpue5ymKmL9izrw==
X-Google-Smtp-Source: ABdhPJy8r7VUi/Xtr4LXeqaeRl6QgsyIV84roxu1OPO7b+ZUmR4ZnYuEszPF5TkxAyfJXc824lA7IQ==
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id n22-20020a7bc5d6000000b00381412784d3mr9935874wmk.24.1646446382419;
        Fri, 04 Mar 2022 18:13:02 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id k10-20020adfe3ca000000b001f0329ba94csm7932589wrm.18.2022.03.04.18.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 18:13:02 -0800 (PST)
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
Subject: [PATCH v10 3/9] mfd: qcom-spmi-pmic: read fab id on supported PMICs
Date:   Sat,  5 Mar 2022 02:12:41 +0000
Message-Id: <20220305021247.1020122-4-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220305021247.1020122-1-caleb.connolly@linaro.org>
References: <20220305021247.1020122-1-caleb.connolly@linaro.org>
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
index bfe1304aee1b..b12a07da6183 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -19,6 +19,7 @@
 #define PMIC_REV4		0x103
 #define PMIC_TYPE		0x104
 #define PMIC_SUBTYPE		0x105
+#define PMIC_FAB_ID		0x1f2
 
 #define PMIC_TYPE_VALUE		0x51
 
@@ -175,6 +176,12 @@ static int pmic_spmi_load_revid(struct regmap *map, struct device *dev,
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
index 5400e6509fe8..ff839b230e62 100644
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

