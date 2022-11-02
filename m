Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D73615EB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 10:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiKBJC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 05:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbiKBJCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 05:02:13 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8292286E8
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 02:01:53 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o4so23513659wrq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+YHM0pGhXAq8BaBOttBEEtqDW7ExLHDNR0HEMCbnXc=;
        b=z35Sr/T7LbEhakVjwgcubvdYh+BgpSUqV6W3puGRRcjPDLeyvrOf2K1/AUX1AfGLUs
         gTucUdlvqDb0VW5rugZZHzH26Fz/W08qN7RWoojeLQg6UldOBIkyaFVH1NNCqFM5YLAq
         j6l6zhKcFAVVtbofvzd9MmrluDydeVfWfFTOtwBTXA98bcyz7JyXQusLkJHAUfLcngR8
         9GKkr4TKUUhvL98YynEM8tjoe+Y6Y/JvJD1ubmZyS2VibvAsdQsg6sGgkeioKa5Ttofm
         olALg3say8A+J8FQ2Xu0lOGvqkAG9zabDNsS5zjoXAUM7angezUUVLgXtWiNOKS9mguB
         AaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+YHM0pGhXAq8BaBOttBEEtqDW7ExLHDNR0HEMCbnXc=;
        b=SmUq0CkuW4FwfpU4PMbiQ9lmR04h+HL1fmzbm+QQFj84eeEXJPzOWS1wtQ+Vu9abne
         LHsd5GMpKgc/l06q4zuOA/G+Qy5TwtqmzjrCBewIbICDjPekmWvLZtbEZmZ2SrBtLLy0
         VgrxDTeCN2mILe0sYc/O6F/E2VBXUL1cBMQeRYRRWiSl68wRzV+hA4MmhnK6ksRR4YoR
         HKXacJadZSL1eZujyiJiFG2z4Wz/+pK/aNnPg6irT1Vg+hCz0oHOSH2KX/KWwBfOigxT
         pmq+Iplm1maGzf4Z4DgQsS0CA9gyY6BupomgoBBjeFQUmKROBb+RLeRYiDqQ964GmXA9
         iVSw==
X-Gm-Message-State: ACrzQf2hcxfmdtErf16+A2l5QSi28NNPfo56rqH7kwTlARodk5SJ1bIA
        oUrxZ9mQ+UH9lB5cUTDKjilNpA==
X-Google-Smtp-Source: AMsMyM4XOfPfjszGjMvrKXFh1ihxoJEML1qHCmRN5ROf2nY4i8a8wpzY+1JUoa8+rVrHNOuk2/wOWA==
X-Received: by 2002:a05:6000:18d:b0:236:8f9d:6d41 with SMTP id p13-20020a056000018d00b002368f9d6d41mr14988747wrx.658.1667379713299;
        Wed, 02 Nov 2022 02:01:53 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id bd26-20020a05600c1f1a00b003cf6c2f9513sm1425322wmb.2.2022.11.02.02.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:01:52 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        dmitry.baryshkov@linaro.org, Jonathan Marek <jonathan@marek.ca>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 5/5] clk: qcom: dispcc-sm8250: Disable link_div_clk_src for sm8150
Date:   Wed,  2 Nov 2022 10:01:40 +0100
Message-Id: <20221102090140.965450-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102090140.965450-1-robert.foss@linaro.org>
References: <20221102090140.965450-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8150 does not have any of the link_div_clk_src clocks, so
let's disable them for this SoC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index d2aaa44ed3d4..382dbd8ba250 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1289,6 +1289,17 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
 		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
 		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+
+		disp_cc_mdss_dp_link_intf_clk.clkr.hw.init->parent_hws[0] =
+			&disp_cc_mdss_dp_link_clk_src.clkr.hw;
+		disp_cc_mdss_dp_link1_intf_clk.clkr.hw.init->parent_hws[0] =
+			&disp_cc_mdss_dp_link1_clk_src.clkr.hw;
+		disp_cc_mdss_edp_link_intf_clk.clkr.hw.init->parent_hws[0] =
+			&disp_cc_mdss_edp_link_clk_src.clkr.hw;
+
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = NULL;
 	} else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
 		static struct clk_rcg2 * const rcgs[] = {
 			&disp_cc_mdss_byte0_clk_src,
-- 
2.34.1

