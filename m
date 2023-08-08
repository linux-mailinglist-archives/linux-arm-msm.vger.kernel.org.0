Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23430774180
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbjHHRWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234254AbjHHRWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:22:22 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1CE7C736
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:09:18 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c10ba30afso1462819766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510919; x=1692115719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc7oZvOcJDkiBa4MtO2BaU3uRCE2+ug+vLU72IFcWhs=;
        b=UWZl/c/riwrlbMSIDiUCJX7TLVkQVDFi7tTU+PTO0NPexbTGJB5JppCmbcxE6sUf+n
         cR7UIWb5+mTPpFkwfGg/ptIBgOV1ILLlZ/UZfcK8UXlKbkn0EkVegYnADpkRYJKmVbvs
         E+LwfxsarEYpSBNb6ZQTAIqGC375LMeYJUlDOtcoyUA4bBh+7XZKuggP0kzSeSMId+cu
         SepX44VT8/X/JUezHjH7QUzpvZ10ztrU1nWIjZa3b9m9eNxDO6aMqdxm3RYdtobUylyq
         6SaTiB6FBgvfa0GtWAWaTnQPysXMh/yOoGZ0TEO8afRERWYB3PKu+JTu0H0hwfHwlka1
         iNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510919; x=1692115719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gc7oZvOcJDkiBa4MtO2BaU3uRCE2+ug+vLU72IFcWhs=;
        b=S/yF1odBNpjiXHIvu6u/O/+AJhPMdnKjM+6V6E7i47lsoXmtlOyQPk4szVWhl1jM4u
         cHHMQlfRdbou82bWETZA9JZg+3QlQXgaqPOH372/R+NWImOiUMVCDy7Ne2zTEKGlxDZY
         YZUcGDH9Ltedw/+AnPEoIFn+MP6O2FgxOPEp8Opii75O36P2/L0ndNY0EXEj0jSJmL9j
         /3IqoBAIdZI0NGgmCCnA63pbl3/TYXneAVZDQPmcqVwoG8aWPR30g375oRmt6gJgErV8
         ytSDutFOqp0ttEl3GH/Y+l37qmzWgQRscnfhWaCVkF6jdP/MqOX8Tkw9bjZUVaBPdu5v
         BxNQ==
X-Gm-Message-State: AOJu0YzOhUjIGQnk+Kk26OCtFfd1KzF19FQp6MWb3hoHzMU9seVNlbK3
        Ik3SXY1uuv9uiSivnvfqoVEJZuwXOyj5tToEnl4=
X-Google-Smtp-Source: AGHT+IGIViV1UeCd6ELmCSkLWBe6UBi27tTfxw7uswsQ8FS8N7MqPD6g+EmoJwhsZKgDL3YjzXYphA==
X-Received: by 2002:a05:6512:159c:b0:4fe:8be:6065 with SMTP id bp28-20020a056512159c00b004fe08be6065mr3416540lfb.5.1691495023110;
        Tue, 08 Aug 2023 04:43:43 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:42 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:37 +0200
Subject: [PATCH v3 06/10] interconnect: qcom: qcm2290: Set AB coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-6-dee684d6cdd2@linaro.org>
References: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v3-0-dee684d6cdd2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=1336;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gKAcxl1xTWi9i07xf8cB7oRhF8MPHDTJc+D4hon02Tw=;
 b=/bhzfzY1MtFGMTp+JULsYOGnTOJIwGJE49F01H2p/MlyJ9JEx0rnCkANXo4at1X8Tkomohnvh
 OqvdFmQjUgZBW8klOIAOfgdxaBhjsxg6abuLyt5iCorjdgBVtxRUJaA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some buses need additional manual adjustments atop the usual
calculations. Fill in the missing coefficients.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index 52a6eb32e832..42fa01c66e73 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -1201,6 +1201,7 @@ static const struct qcom_icc_desc qcm2290_bimc = {
 	.regmap_cfg = &qcm2290_bimc_regmap_config,
 	/* M_REG_BASE() in vendor msm_bus_bimc_adhoc driver */
 	.qos_offset = 0x8000,
+	.ab_coeff = 153,
 };
 
 static struct qcom_icc_node * const qcm2290_cnoc_nodes[] = {
@@ -1327,6 +1328,7 @@ static const struct qcom_icc_desc qcm2290_mmnrt_virt = {
 	.bus_clk_desc = &mmaxi_0_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
+	.ab_coeff = 142,
 };
 
 static struct qcom_icc_node * const qcm2290_mmrt_virt_nodes[] = {
@@ -1342,6 +1344,7 @@ static const struct qcom_icc_desc qcm2290_mmrt_virt = {
 	.bus_clk_desc = &mmaxi_1_clk,
 	.regmap_cfg = &qcm2290_snoc_regmap_config,
 	.qos_offset = 0x15000,
+	.ab_coeff = 139,
 };
 
 static const struct of_device_id qcm2290_noc_of_match[] = {

-- 
2.41.0

