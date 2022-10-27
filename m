Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846D560F767
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 14:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbiJ0MfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 08:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbiJ0Me6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 08:34:58 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C61A2A403
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:34:54 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id 13so4146658ejn.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58sYynw6bix2RKRPDkbfBnZH4v9198VFqnJiB91dB9c=;
        b=Ty/6hZUJ1X2VyFW1MicXfNUTdObwmpOpub6MQ0LNu19jr0Pl7weLAje8hoT6dKs7MO
         KoWcjlezPL6ZtxyRTBLZim76qPe5c3rLUit4cK5KirwQILB7LZmS8YhvHw28JZS1VkUj
         hTfQPT8pk+xxJtVdoDnuRR5G6cMzv3yoHmDnOD6iQmKq1MLH0JL4bdtKE5DdQuH1Qxsq
         GSkUIQd1Lcst0ybP/vStyBxNsUGyOpQtiaqYPP2ujSA0yMq1ZIWrp/Q/CHxZEwMuVkDf
         aJcK6ynpkDmcFserIj+jiGZ0F12GgxrIblrlD42sA7p+bKQCvyRzubJBzrTza5C4P/8m
         0QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58sYynw6bix2RKRPDkbfBnZH4v9198VFqnJiB91dB9c=;
        b=FpBKKp+6MPgy/j311eyXOOjqEga88Rj2J4vibP5E3thrim3RECDau3dk5NZ9uRFRNr
         T5XUuHDorzK8Eso1zFK7wG/DaREY0q3puQR4zsbVu7x6U6ULhB+YMhphB+Ui3pEaTc5b
         0cLY5y5Ro+3BRJ8ck2OQc8UaPU6BgWSnUbZB7ohPJDRAtF7Pj8cEz0hMPrvEIJnZ56v1
         uFe0TAoNCPbyWLUwNUsCNVgrgQFIRc6JYYoOoLjTFfUU+1lEWLqykhkKPxsoppdF9+E/
         5ERsyFYKJMACij/+1HrYkXUbI5R1nB6GalWjknSs6HA8DIzIJLwop9UD2POHR9zrsOZ6
         v8KQ==
X-Gm-Message-State: ACrzQf0/GcOhh7Ntl9YpKXJ0ZJGkj0s7GIKLlx5RHqYW3ifCnLIimeg3
        fRShYKdWZGyMU8cr2IlG0jauWg==
X-Google-Smtp-Source: AMsMyM7DoKhqR3Dhq01/mKNdjxj0bW8sExFf7e0S3rGOE4W93t2zItOnY1cIYAieejN2cuxGvjSbrA==
X-Received: by 2002:a17:907:7ea6:b0:791:81f4:b0e3 with SMTP id qb38-20020a1709077ea600b0079181f4b0e3mr42578813ejc.164.1666874092720;
        Thu, 27 Oct 2022 05:34:52 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id p22-20020aa7d316000000b00461c1804cdasm942868edq.3.2022.10.27.05.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:34:49 -0700 (PDT)
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
Subject: [PATCH v1 1/5] clk: qcom: dispcc-sm8250: Disable EDP_GTC for sm8350
Date:   Thu, 27 Oct 2022 14:34:28 +0200
Message-Id: <20221027123432.1818530-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
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

SM8350 does not have the EDP_GTC clock, so let's disable it
for this SoC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 709076f0f9d7..180ac2726f7e 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1330,6 +1330,9 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 		disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
 		disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
 		disp_cc_pll1.vco_table = lucid_5lpe_vco;
+
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK] = NULL;
+		disp_cc_sm8250_clocks[DISP_CC_MDSS_EDP_GTC_CLK_SRC] = NULL;
 	}
 
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-- 
2.34.1

