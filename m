Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA9A7773CFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 18:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjHHQMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 12:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjHHQLF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 12:11:05 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F00F7D8E
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:46:45 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bf9252eddso869965066b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509604; x=1692114404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZQ93ryTVkLJ674HaEi8fy9NL3vC9KyVwveDa7EddrM=;
        b=I2uWT87ZRzxhDiQ80d/sobqyakXeqRWmJdDAT3EHKH4m7bjNCQjuJ3uvpvnLjrqspK
         Dj5h0gAJyWdWwlIuGIY77SoOnZd7JVaTSwWhkjoT1fboLe+0mnwVna7KxZem2gm64a35
         i2y6afCcpGvap2baotJLNzTpXJl9paFbxssa6spIeNR8Y7a/sy6GRVCjGM4HGnBhmQyB
         bjp7Ad6L9GOj1OR+xYkrhUb+2x4LW25wOlWYMFpNKI0Kz0vZhRlPkN9ShXEa7AczR0wn
         /67+luPBGuOeTpGzUW8s8hzAJOITupndZBfMtTURDxdCSCid2BL06ute1O5wCNaaSq1s
         +brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509604; x=1692114404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZQ93ryTVkLJ674HaEi8fy9NL3vC9KyVwveDa7EddrM=;
        b=X6T9Qqvy9bfKxhs3vk0kZ5QEsogJcaNu5U9VX7Bv83u7Yj3OC12IeCcZ705bJ+1nxM
         qPdA/gVuQvomD+kHVU0d1oMTz+ARZy1sBl34MkBJ9GebKwfb7PtOQ/gk8Xv1YOzTCyB9
         n7C/g6K4pj34tMXWHcaK1kxIti7o0vxTuFs20pWzT46eDyn4N7hTElS7UbB3+ZzJmHJ+
         AdafKTKHoq11l+fB8TgV3PFI/F2rj3tfNh3oOkKL5JI85OlBPllIM1F8VxpFqwMmSH5n
         VVtnwx+wDR4aClsg1vSbLDbKoBPTx6vZabcXJF0w8wPoXb2+/Mn6Y4aTkXZKJRoA3wS0
         d+kQ==
X-Gm-Message-State: AOJu0Yy6ltLErSIgWvCCVUrvlsrRUefsuTABPGogjiYjo/I4EjPp51mz
        Kta7xRgPBGcZLWt8kUwRGzd4LBGJH6SiyTj2VGc=
X-Google-Smtp-Source: AGHT+IG9eggqMlJftuNT+UYhqts3d5BpOBl7EQ49aL1HZWMDX+s3HZ44tnUlcpa8asB0W6Zw6ZbjPw==
X-Received: by 2002:a05:6512:10d2:b0:4fd:d538:b97b with SMTP id k18-20020a05651210d200b004fdd538b97bmr9355921lfg.29.1691495026441;
        Tue, 08 Aug 2023 04:43:46 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j20-20020ac253b4000000b004fbdba4b075sm1861679lfh.57.2023.08.08.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 04:43:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 13:43:40 +0200
Subject: [PATCH v3 09/10] interconnect: qcom: msm8996: Set AB/IB
 coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v3-9-dee684d6cdd2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691495013; l=1682;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6Ylk54qLtCUKuTX9FA4QTRZGSUqgBkVW+4oTAnkFbFA=;
 b=G6C3tehG5i+wpYLksQeibNa9TcRRryQx2c1C+PbgLjLNinmWth7Kgiq6h+P+yrqSg+hvkS8hs
 P/WvsN11oQzB97MrKtKeOynWWxsSz6KKpBWsjH96NjyOnz66wttLu7H
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some buses and nodes need additional manual adjustments atop the usual
calculations. Fill in the missing coefficients.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8996.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index 88683dfa468f..b73566c9b21f 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -448,6 +448,7 @@ static struct qcom_icc_node mas_mdp_p0 = {
 	.name = "mas_mdp_p0",
 	.id = MSM8996_MASTER_MDP_PORT0,
 	.buswidth = 32,
+	.ib_coeff = 25,
 	.mas_rpm_id = 8,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -463,6 +464,7 @@ static struct qcom_icc_node mas_mdp_p1 = {
 	.name = "mas_mdp_p1",
 	.id = MSM8996_MASTER_MDP_PORT1,
 	.buswidth = 32,
+	.ib_coeff = 25,
 	.mas_rpm_id = 61,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -1889,7 +1891,8 @@ static const struct qcom_icc_desc msm8996_bimc = {
 	.nodes = bimc_nodes,
 	.num_nodes = ARRAY_SIZE(bimc_nodes),
 	.bus_clk_desc = &bimc_clk,
-	.regmap_cfg = &msm8996_bimc_regmap_config
+	.regmap_cfg = &msm8996_bimc_regmap_config,
+	.ab_coeff = 154,
 };
 
 static struct qcom_icc_node * const cnoc_nodes[] = {
@@ -2004,7 +2007,8 @@ static const struct qcom_icc_desc msm8996_mnoc = {
 	.bus_clk_desc = &mmaxi_0_clk,
 	.intf_clocks = mm_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
-	.regmap_cfg = &msm8996_mnoc_regmap_config
+	.regmap_cfg = &msm8996_mnoc_regmap_config,
+	.ab_coeff = 154,
 };
 
 static struct qcom_icc_node * const pnoc_nodes[] = {

-- 
2.41.0

