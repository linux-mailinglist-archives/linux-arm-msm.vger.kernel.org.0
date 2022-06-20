Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E9E55120A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 10:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239727AbiFTIB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 04:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239702AbiFTIBW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 04:01:22 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB111116B
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:01:21 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id j22so4357125ljg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wUIvXR9Mu2pLw1SfGOC2FM4d/2jWMPxr8mZkKP9waiM=;
        b=qQjYJlRFdD687Uf+tt832g2VTANb/8zxoidvyGiwpQ04yXBPiK1rx08+XhNUMsceUz
         1fvVyoEkSaFJcDlvKu76iF5qHiF3hFzp5NaQoV7mUHvdcU+sdXuNfi5aGxwdgs8TERAe
         hmxPel8SXJQU7KfnwoR3QNIMqAHIoUUupjGUblmyLKScGihrYXy9I4L9he6jfF2ghUoa
         4GloSL4p7tDVmMnXPUunGCDRGiqzEU5ZsoM2Cg+B3+4SXq7ksOLdtWhhzttamq8uUR8R
         NYAToDYLueybLCGxFCfLlmo8ae3Tb1y1slLYCPogZWf/wiKTQCdeaQFEtoY/dNTUjpLO
         DMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wUIvXR9Mu2pLw1SfGOC2FM4d/2jWMPxr8mZkKP9waiM=;
        b=wYSfdpsAOJLQJkNphxFfZIXCR6zZLbJxwYwZn3GYIgcXbZrXsVuhOmEAuoCNTXeUv4
         xE0MoeXvEC8ZXV3zR7GmxGuPleX6sqIFKqF7CCuzW6+cqKW/57tn/GTWaLwwEAsGPPq8
         z7pKu5lzLzSH5PrkGGVxVO8aaY06bkUO3P9PmdH8P7h+dLg5ZnU6M5o4NjoAfj8kKzYk
         yQnIQKk0rSlJzROiCDyhgSCQTVeDEie12BBLxP4yNDjx+L1u0GJdU78y1Om1t6XA7Y3Q
         4wFw/JSn4e9ZfMfDmiLwiZrn/CFDetgs3JLvrSiF77HKcTcOym6VwGkqXHjYPW+5B3cb
         JQJw==
X-Gm-Message-State: AJIora8PglojkLdMDj3+GPffvIfdZO50f3crsc19A1yJkOhuSG0fwq7x
        iMSHwbHtecUdTXDlNMfhmh/aHg==
X-Google-Smtp-Source: AGRyM1uZA+3ncytO2eIJHcwDX/qsGA3mZKhMouzbCWKg9dQiH99RzrxHnVU8hgp8GEJ694E9CZ794Q==
X-Received: by 2002:a2e:96d6:0:b0:25a:6f63:ae7e with SMTP id d22-20020a2e96d6000000b0025a6f63ae7emr1782381ljj.73.1655712079705;
        Mon, 20 Jun 2022 01:01:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w17-20020a2e9591000000b0025a6d0509d7sm461857ljh.78.2022.06.20.01.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 01:01:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: common: use parent_hws in _qcom_cc_register_board_clk()
Date:   Mon, 20 Jun 2022 11:01:17 +0300
Message-Id: <20220620080117.1571807-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Switch _qcom_cc_register_board_clk() to use parent_hws.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..2014484fc66d 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -169,7 +169,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 		factor->hw.init = &init_data;
 
 		init_data.name = name;
-		init_data.parent_names = &path;
+		init_data.parent_hws = (const struct clk_hw*[]){ &fixed->hw };
 		init_data.num_parents = 1;
 		init_data.flags = 0;
 		init_data.ops = &clk_fixed_factor_ops;
-- 
2.35.1

