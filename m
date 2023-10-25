Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56867D6A86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 13:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbjJYL43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 07:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233317AbjJYL41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 07:56:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE7F182
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:56:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507cee17b00so8194697e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698234983; x=1698839783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwKoRn1S3grUkj3T+P+0SLhXPECqB0f/S2wVYwKKKrw=;
        b=wywRBGAYCTFOg1YlDFolwLM4oiq53GZoYqfbmC6JTndmc7K36s/sVcAjFgLEhnrmqY
         WAA8Lp0uU86eskDBuFP9XoEsGF6VXLwQyoDioQEnaIlG/PARMV52HDTCEsdJbIrvI5QN
         XNk1fuN597rURYuO3qRYNYs2bxcm5Y37lXnNTkep8/7RjuoSv4ysgccqpf2yVqzLsgTG
         ZAcUnM4WTB43Arndw550xm4GJ8bZxr+VSnhFaaM4114LJCmV4xwDur8f/5CnruTYIuo2
         HYI3pq02Q1ban+qt2wyGV21bRW26gzEOxi04ccPUN2VGYHYkzsxW1+5jF/lgEZTcNg3/
         jqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698234983; x=1698839783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwKoRn1S3grUkj3T+P+0SLhXPECqB0f/S2wVYwKKKrw=;
        b=aR7pBws0fGB7uLkwuUBfPGGlsRRFGwgZKhR2Z9dTzi68lnhMCwB/hGqV1Q6xbyk6Nz
         S0H5phVwhY6Rs877JFWBnX/KCrJeXszv/nUYI/R6Zzbu3b8AhNMnRDkJJMAI63Igb9k+
         W8xlxjRCmRZ16b5KTu/+sBeH07Ju1RO3QdAwVz8nTtLVdZiMaqCtwgSwV8Vf7lx9/sLu
         icBU0vAVkDkn1P42jzBg+9zogGmqj/cfqmk4xpNc2R4LvXBwz/EiWQXw84ORBiEyzu83
         Dyqmu5+5m3jq6dL94C21xKFLitPedTmPici8SyJJ2FVpQT5NOfeOjzAemoEjkpsFhy00
         LScQ==
X-Gm-Message-State: AOJu0Yw40F45LeuDhwfSc8xGtjF3rXKJJ9vM+MHea6/UEAzii/Lm4Bn8
        +23jc87NpBdvoSyC3objxIr+Ng==
X-Google-Smtp-Source: AGHT+IHVl0hvJGVOtsM48MxwtP1bLdahgW8rvBkoJexq6T0r5k2WH0HRFRiy+gmOHZV2HATZeoH86g==
X-Received: by 2002:a05:6512:3d23:b0:508:1227:5a0f with SMTP id d35-20020a0565123d2300b0050812275a0fmr2575756lfv.65.1698234983371;
        Wed, 25 Oct 2023 04:56:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 22-20020ac25f56000000b004fde41a2059sm2511751lfz.305.2023.10.25.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:56:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: pmic_glink: enable UCSI by default
Date:   Wed, 25 Oct 2023 14:49:30 +0300
Message-ID: <20231025115620.905538-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the issue with the UCSI_GET_PDOS is worked around, enable UCSI
support for all PMIC_GLINK platforms except Qualcomm SC8180X. The
mentioned SoC has slightly different UCSI implementation, which I would
like be tested properly before enabling it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 914057331afd..71d8901a9389 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -18,9 +18,6 @@ enum {
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
-#define PMIC_GLINK_CLIENT_DEFAULT	(BIT(PMIC_GLINK_CLIENT_BATT) |	\
-					 BIT(PMIC_GLINK_CLIENT_ALTMODE))
-
 struct pmic_glink {
 	struct device *dev;
 	struct pdr_handle *pdr;
@@ -263,10 +260,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	mutex_init(&pg->state_lock);
 
 	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
-	if (match_data)
-		pg->client_mask = *match_data;
-	else
-		pg->client_mask = PMIC_GLINK_CLIENT_DEFAULT;
+	if (!match_data)
+		return -EINVAL;
+
+	pg->client_mask = *match_data;
 
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
@@ -336,14 +333,16 @@ static void pmic_glink_remove(struct platform_device *pdev)
 	mutex_unlock(&__pmic_glink_lock);
 }
 
+static const unsigned long pmic_glink_sc8180x_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+							    BIT(PMIC_GLINK_CLIENT_ALTMODE);
+
 static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
 							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,sm8450-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
-	{ .compatible = "qcom,sm8550-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
-	{ .compatible = "qcom,pmic-glink" },
+	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
+	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
-- 
2.42.0

