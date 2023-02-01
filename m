Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73C2686CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 18:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjBARXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 12:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjBARXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 12:23:12 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF9865F30
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 09:23:09 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id lu11so16195125ejb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 09:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk3rBfWXYWGglBbtHFn72sDtxH1nQI4oY7t4ppOv/uA=;
        b=cg9tcovsWu5OofGQGy0dnQIzHuGQtUFEnVY4TcYrWfYnFmK8u/isiy8qu4pRDGq/4L
         C5ARkoAoame9xBEWNWhsIkHGns78KH+ctJTlVXfNMhXIAWMSfrqZJNn6Il8vyrRyP3yI
         M7jdQA/YO/IMMz9JvrLDOa9cBO1JMwhderWDSgSFGhB7Bj7eo+Yb63MikHKvIWB4flBH
         qHxOl2kFbmhVTDB2To1o7uJhMLsWQYDb7YwBXEEvp78DpNH5c1bc1iSdJSAtX9DAE2vj
         pZeDfT2DQxvvK6XixBppRWOvZbIS15YSvtiZFNlqPJIAImSEiZKnc/8iJiN7ifEHiSIh
         J0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk3rBfWXYWGglBbtHFn72sDtxH1nQI4oY7t4ppOv/uA=;
        b=QJXLS06V8aCGs+INbBpRIIemLksnZgxH60Pfru55t0aGuOglf9k0dvhr9pHn30Bqls
         GCTzVHJ6Bdx9qcGcVfNJR8Xk55SXD8cd1ePNU2H2/XQqITGX7xBV+XwFzRhKRXmD+JOD
         tlrsbomy/Y+jIyBY0pHIqEy8+pjlPRKq0xUAwU5vwbfr8myimX9u6MyQlgx5SXlqhgeQ
         LWCtD+NJ+ZnpphN9gpDnn02bXT1rp9p9+Y5k/FNajAXiCKGnplcJkHGUl6LoztYMeTqP
         ePaUbXWIaMEiEXP2aTuGYBeDqGhY6y59LaHsu6eZCKQ0jgUPJvFArOg1bm+7FKt9nllX
         nIlw==
X-Gm-Message-State: AO0yUKXPVK2cchgfkMQEgqv1bhPDDJ8zexR4vt2++HgWE2GHXAZzVkyY
        0RTbU+OmsovgaraXWia+C0qOTQ==
X-Google-Smtp-Source: AK7set+rjw+4ID3i6qHlaYQG4SdQ3bhwrqalqusMwnMrmfcFcaSbJuWsEYy+R6siwzOE1Hx6xfNLBA==
X-Received: by 2002:a17:907:7094:b0:88a:72bf:9670 with SMTP id yj20-20020a170907709400b0088a72bf9670mr2936763ejb.50.1675272188560;
        Wed, 01 Feb 2023 09:23:08 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ci20-20020a170906c35400b0088e5f3e1faesm601873ejb.36.2023.02.01.09.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:23:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
Date:   Wed,  1 Feb 2023 19:23:05 +0200
Message-Id: <20230201172305.993146-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
References: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
registering the GDSC (writing the value 0x2 by default). This will
override the setting done in the driver's probe function.

Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
function.

Fixes: 453361cdd757 ("clk: qcom: Add graphics clock controller driver for SDM845")
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Fixed the _val suffix in .clk_dis_wait_val.

---
 drivers/clk/qcom/gpucc-sdm845.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 110b54401bc6..970d7414bdf0 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -22,8 +22,6 @@
 #define CX_GMU_CBCR_SLEEP_SHIFT		4
 #define CX_GMU_CBCR_WAKE_MASK		0xf
 #define CX_GMU_CBCR_WAKE_SHIFT		8
-#define CLK_DIS_WAIT_SHIFT		12
-#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
 
 enum {
 	P_BI_TCXO,
@@ -121,6 +119,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.clk_dis_wait_val = 0x8,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -193,10 +192,6 @@ static int gpu_cc_sdm845_probe(struct platform_device *pdev)
 	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	/* Configure clk_dis_wait for gpu_cx_gdsc */
-	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
-						8 << CLK_DIS_WAIT_SHIFT);
-
 	return qcom_cc_really_probe(pdev, &gpu_cc_sdm845_desc, regmap);
 }
 
-- 
2.39.1

