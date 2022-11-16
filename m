Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5B962BBE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239021AbiKPL1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239342AbiKPL1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:27:09 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43A32D1CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:52 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a14so29386052wru.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv65Uj0lvJ7ZIlYIMtfh5eKQNGbhyUH7PS0XoMqmdlg=;
        b=dC8T0lJ8VNoqDp/KEM31NZucVyyaplfQBRTiy2+x1bxi2bSQak4K/bh1RZ2H3MAy/i
         sox0U5wyiwIVfBI/nfXe03k10vwb+UKs/2L0CPzmZ2cQSPLWENHKxntGWgZ4qd5Udrdx
         tzvbbd3Q09qlvLup+uikNp1oK1NR1/J4EgTSmsBSsLSfNZOewYuMhPAj2MRc1fnnJGJ5
         5XY1DQ+CM40+mldq+RR1DyyNH1ZS16kl+BaOZA9UXBuiHYh9IJTVOF7A/zf03l9tvCjX
         ANY9Gbz3vibVWoV6tS1V453ibdiCaZizsK6GBCPxk6+n8yEByrUO54v4wzNHoqV8fEp1
         ADbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xv65Uj0lvJ7ZIlYIMtfh5eKQNGbhyUH7PS0XoMqmdlg=;
        b=bi+Mj/Z0ejsd+UpD+LvYHgdGpwa5GDma1i19YhzeW+iD4zAcciwm+1tEiLIn5eubyt
         E/GLDhKViqOLr4bvwdMcoeOnJmbJ2+TcdQ20ZNH3p9RAqQYCNOCerqx2L1ElUEr1uipm
         kENGFXIri3V887k5BeUSs+HILct0Lvy3TvsGsYwni+ShStlnl4iDEqQpdkm6bQoaD0/1
         h2FNIXVyBbJygfeJcjr7tyl3Ctzt1baJZqBv6MKuZdw/Q2K2xJZ5dKOIdgUhsQJmTKHE
         BWFD2LI5vRfqRbYnBMuQkyhG1dpGthCJCuEpySuRYiET6l1H+tqGmlpmpJE+3WX92yCU
         U/fQ==
X-Gm-Message-State: ANoB5pmwRCUZ3Z5mTcFGVGSsD9BUey0DBGGa6LXEwRXg+VS9lOk/R529
        rIX4C5/9pJyfqyoAk2gZV+xgOw==
X-Google-Smtp-Source: AA0mqf4LgI5U0WpW7diSpCRvNaeoXqO1OTmQkqBgDOFAvexpGou/te6aXT2KUA8xGTq6CCmCfCp+5w==
X-Received: by 2002:adf:a51d:0:b0:236:6302:2237 with SMTP id i29-20020adfa51d000000b0023663022237mr13831237wrb.519.1668597471298;
        Wed, 16 Nov 2022 03:17:51 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm1875870wmq.31.2022.11.16.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:17:50 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: rpmhpd: Add SM8550 power domains
Date:   Wed, 16 Nov 2022 13:17:45 +0200
Message-Id: <20221116111745.2633074-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116111745.2633074-1-abel.vesa@linaro.org>
References: <20221116111745.2633074-1-abel.vesa@linaro.org>
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

Add the power domains exposed by RPMH in the Qualcomm SM8550 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 7af68cd720f5..4c2d2c296790 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -372,6 +372,29 @@ static const struct rpmhpd_desc sm8450_desc = {
 	.num_pds = ARRAY_SIZE(sm8450_rpmhpds),
 };
 
+/* SM8550 RPMH powerdomains */
+static struct rpmhpd *sm8550_rpmhpds[] = {
+	[SM8550_CX] = &cx,
+	[SM8550_CX_AO] = &cx_ao,
+	[SM8550_EBI] = &ebi,
+	[SM8550_GFX] = &gfx,
+	[SM8550_LCX] = &lcx,
+	[SM8550_LMX] = &lmx,
+	[SM8550_MMCX] = &mmcx_w_cx_parent,
+	[SM8550_MMCX_AO] = &mmcx_ao_w_cx_parent,
+	[SM8550_MSS] = &mss,
+	[SM8550_MX] = &mx,
+	[SM8550_MX_AO] = &mx_ao,
+	[SM8550_MXC] = &mxc,
+	[SM8550_MXC_AO] = &mxc_ao,
+	[SM8550_NSP] = &nsp,
+};
+
+static const struct rpmhpd_desc sm8550_desc = {
+	.rpmhpds = sm8550_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm8550_rpmhpds),
+};
+
 /* QDU1000/QRU1000 RPMH powerdomains */
 static struct rpmhpd *qdu1000_rpmhpds[] = {
 	[QDU1000_CX] = &cx,
@@ -477,6 +500,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
 	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
 	{ .compatible = "qcom,sm8450-rpmhpd", .data = &sm8450_desc },
+	{ .compatible = "qcom,sm8550-rpmhpd", .data = &sm8550_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpmhpd_match_table);
-- 
2.34.1

