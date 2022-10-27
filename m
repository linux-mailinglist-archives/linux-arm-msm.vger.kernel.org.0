Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A309D60F777
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 14:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235723AbiJ0Mf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 08:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235724AbiJ0MfW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 08:35:22 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1AE3C8C2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:35:11 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 21so2471079edv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixsyTYSU3qrk9nu6zgLYYDmntPbxw0EqXI+jxfXWgbg=;
        b=eGI+nghoKIXTvxIUbAMX/UGn0FUTy6saar5V+Xm0lbVg8DFfBppUhTHZTI4cZfKwsi
         udcabToxL2QqymNMtZ84C8e+33nabNHXvzXGDoHEwDUP8fzIu7MGXCbCXZAzV7lRE5Rq
         6Bhedbx3qkoMuG54hlwnamXHE+9eQpsUL6MUiBSwidzUYO9IauyfuZdWBzezNr+VvPMl
         2mbko/nxXeXBW+TCxK7o1w5e6UaiDymbLV9lzzCbLzZyPkDo50HDGLsm7lpyuuxp6IPs
         wlGTQj636LIZV/bJE9Tnf3dpch3CCGBeQ+7fJ8A36s+fRTozI/oNKcjxbreKCzsOZbzW
         TxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixsyTYSU3qrk9nu6zgLYYDmntPbxw0EqXI+jxfXWgbg=;
        b=4Yv0aLQJsbtKotglr2I4MSQAlR9aSb8Puezjx81BJxE9vHd/vs01Lh7MizBWJTvbuy
         eV/r7I2VGAsdKmyLaoU57pIl3W5ULQrfJFyypiOurPqtBTEd0Cpfmqs+61WAMD8CVn5b
         6tgSM99vWNrXR0EvqYAfEDL7Kdho42bZv6yVolHYvS+R1umHX7V/rhV6zWkpE6iE20Ho
         /nFeJczG470WgKLslCSEueQK/Wwg5YgSwSncxC7qH59Xruv9NRUhT72iqpVHrYZWHv6g
         UgvSvW7qFpkM5ahD3FOeRX1J34f7oRe6cWjJjR6L63azA6mxS/TmjE3FxYTxPMPAcDWf
         cf7g==
X-Gm-Message-State: ACrzQf0Jc5X0oEqWW1V6tpqtsr3MT4c5nC4LZA5b6iaN4O6sj95EOtb6
        CENxDaGRxAaLtR0V/pQRUswj6cWplBS5ow==
X-Google-Smtp-Source: AMsMyM7NCdoe+eiHzPhUQn0V4ikeEhZgjzF/EuqAC/E5mPZSh7/Os1mIKFocWtifRDJqFs/BoOcjDA==
X-Received: by 2002:aa7:ce09:0:b0:461:5406:20e4 with SMTP id d9-20020aa7ce09000000b00461540620e4mr29636811edv.5.1666874109556;
        Thu, 27 Oct 2022 05:35:09 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id p22-20020aa7d316000000b00461c1804cdasm942868edq.3.2022.10.27.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:35:07 -0700 (PDT)
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
Subject: [PATCH v1 5/5] clk: qcom: dispcc-sm8250: Disable link_div_clk_src for sm8150
Date:   Thu, 27 Oct 2022 14:34:32 +0200
Message-Id: <20221027123432.1818530-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027123432.1818530-1-robert.foss@linaro.org>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8150 does not have any of the link_div_clk_src clocks, so
let's disable them for this SoC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index d2aaa44ed3d4..f6f719616f63 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1289,6 +1289,10 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
 		disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
 		disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
+
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC] = NULL;
 	} else if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
 		static struct clk_rcg2 * const rcgs[] = {
 			&disp_cc_mdss_byte0_clk_src,
-- 
2.34.1

