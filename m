Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1509660F770
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 14:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235718AbiJ0MfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 08:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235696AbiJ0MfH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 08:35:07 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DE2317E1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:35:04 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id n12so4058362eja.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIJ03Xw0TJ9vybpwIm3D1pwjE8baT2lTF928XHppw+c=;
        b=UDJHQX5F1+HJfrDukPs3mJ/PyfNV71XB5EAcXSt6rRnM68geyipM6er0gGDj8PJtTY
         PR9jabiZ01oV1zU2O6bN4md/MhXCoSbu4PXkcaxaC/t3dJg29yWc3hn90f4GFURT9kmO
         qlHkV4ifi5DiMosbPzDpO990BI6sk7z2831VvQLYWEwAvIzQ19jHpcVeiW3R5EhK+zVi
         vvLd9uWkwNlGvDQbx4S8lMLymIwZWGRGta3GW9SRvuTwx6PelnyHSKI+X5bZY9hkOhkR
         FjtKWurGLzuLAcS5TJGATLBIaUTtDJe//VY5vWDbbrQmOVfC1TpUedZQW7obm2TcmXAB
         fbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIJ03Xw0TJ9vybpwIm3D1pwjE8baT2lTF928XHppw+c=;
        b=00oJ9EZeYgZq5jL6dsfLXK6liAPYNycz6inDuNsvKqeqPiKalMIQVvDCUJ7AC5Y7mg
         Ed11ShxX+gWmm3I0E8sT7aG28GcK2auxGCDikxqXyJaNfY1fB6YOAxFZJ8luJT7ljD3x
         EIEGmV0I2dkCF8J99eUgchlcdv14mCa56eZhYWJ8avMzhS8WTrDQ0SQ+ayQs0z3pbpH1
         d6Icur9jZ5S6oD0r6KcotU6ZMDZ4a8VsXtViziUamBW8aD+vLoME8XiKcH8lMdCaDQKq
         E88Co1WGd9UJXnMFcgK40p8+yEgMcEMq6XZhXmLkrLUvI0sejiO2+9VYSyvZepMkVM9k
         uVfw==
X-Gm-Message-State: ACrzQf2K5443vUjHxcUbslO5mhqGn46XWcOVUyg+1Gqc8q37KhbKGmAv
        2QnEnhTmMtvMFCCdSYL0V0S54A==
X-Google-Smtp-Source: AMsMyM5v+wIehh3xMHkm3Xq4njARTH8MwPQOyhlQaPRd0/CiAivhPlxuCeckHTp1JM6stAj4gVnA6Q==
X-Received: by 2002:a17:906:9750:b0:798:9ccc:845d with SMTP id o16-20020a170906975000b007989ccc845dmr32913588ejy.760.1666874104546;
        Thu, 27 Oct 2022 05:35:04 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id p22-20020aa7d316000000b00461c1804cdasm942868edq.3.2022.10.27.05.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:35:01 -0700 (PDT)
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
Subject: [PATCH v1 4/5] clk: qcom: dispcc-sm8250: Add missing EDP clocks for sm8350
Date:   Thu, 27 Oct 2022 14:34:31 +0200
Message-Id: <20221027123432.1818530-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027123432.1818530-1-robert.foss@linaro.org>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
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

SM8350 supports embedded displayport, but the clocks for this
were previously not enabled.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index a7606580cf22..d2aaa44ed3d4 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -462,6 +462,20 @@ static struct clk_branch disp_cc_mdss_edp_link_clk = {
 	},
 };
 
+static struct clk_regmap_div disp_cc_mdss_edp_link_div_clk_src = {
+	.reg = 0x2288,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_edp_link_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&disp_cc_mdss_edp_link_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
 static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
 	.halt_reg = 0x2074,
 	.halt_check = BRANCH_HALT,
@@ -471,7 +485,7 @@ static struct clk_branch disp_cc_mdss_edp_link_intf_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_edp_link_intf_clk",
 			.parent_hws = (const struct clk_hw*[]){
-				&disp_cc_mdss_edp_link_clk_src.clkr.hw,
+				&disp_cc_mdss_edp_link_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_GET_RATE_NOCACHE,
@@ -1175,6 +1189,7 @@ static struct clk_regmap *disp_cc_sm8250_clocks[] = {
 	[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = &disp_cc_mdss_edp_gtc_clk_src.clkr,
 	[DISP_CC_MDSS_EDP_LINK_CLK] = &disp_cc_mdss_edp_link_clk.clkr,
 	[DISP_CC_MDSS_EDP_LINK_CLK_SRC] = &disp_cc_mdss_edp_link_clk_src.clkr,
+	[DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = &disp_cc_mdss_edp_link_div_clk_src.clkr,
 	[DISP_CC_MDSS_EDP_LINK_INTF_CLK] = &disp_cc_mdss_edp_link_intf_clk.clkr,
 	[DISP_CC_MDSS_EDP_PIXEL_CLK] = &disp_cc_mdss_edp_pixel_clk.clkr,
 	[DISP_CC_MDSS_EDP_PIXEL_CLK_SRC] = &disp_cc_mdss_edp_pixel_clk_src.clkr,
@@ -1285,7 +1300,11 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 			&disp_cc_mdss_dp_pixel1_clk_src,
 			&disp_cc_mdss_dp_pixel2_clk_src,
 			&disp_cc_mdss_dp_pixel_clk_src,
+			&disp_cc_mdss_edp_aux_clk_src,
+			&disp_cc_mdss_edp_link_clk_src,
+			&disp_cc_mdss_edp_pixel_clk_src,
 			&disp_cc_mdss_esc0_clk_src,
+			&disp_cc_mdss_esc1_clk_src,
 			&disp_cc_mdss_mdp_clk_src,
 			&disp_cc_mdss_pclk0_clk_src,
 			&disp_cc_mdss_pclk1_clk_src,
@@ -1297,6 +1316,7 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 			&disp_cc_mdss_byte1_div_clk_src,
 			&disp_cc_mdss_dp_link1_div_clk_src,
 			&disp_cc_mdss_dp_link_div_clk_src,
+			&disp_cc_mdss_edp_link_div_clk_src,
 		};
 		unsigned int i;
 		static bool offset_applied;
-- 
2.34.1

