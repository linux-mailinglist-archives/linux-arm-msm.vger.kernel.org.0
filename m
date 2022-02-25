Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66DA4C3DFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 06:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237607AbiBYFmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 00:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237605AbiBYFmV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 00:42:21 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD3930F7A
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 21:41:48 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id q5so6291061oij.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 21:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U4r1xpGpcEW5aqEcjdiRX7MWjToKanTSLY+a7BjOYQE=;
        b=a5wKsdc+0BgDLsPcUcnjEh6GDmf//Br+CbPGT9FWbULtu5ZiUd9GUJNMeBny9J2tW3
         kpw8cCMi8KdTPIlem9TppVy/iiGChQyV/dtYAFwI3mUYCtYAFWXCEnk7Fu2ibG83WfX3
         M1bGyKzUgxOUdGqkwBUeKs3p1Y1SqvQuF0jNDqkmusoyNIjLrGf+2D5Eb4CkY3PD01DW
         2FDaLHwNP8eRv6XEvRiVV/ABiQpXdjDGuKFsa3hDjQC3VfPTyrl+Z2MNZg4oVF25EJ0r
         PO+cZ+JQDaSpP+JpZtJxUSSjch4vHp5RfAESEpYMIZvFCsKVA8eW9mozZ7KO0pqcgPAP
         xvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4r1xpGpcEW5aqEcjdiRX7MWjToKanTSLY+a7BjOYQE=;
        b=TmzZqIZbks088u/BIsmtaVUc/Z3HgTcCirdmrwJ+mVFFBrVXHukdnUHnfeEnMjJ6IJ
         GN2M1cuFQxrty/sgiYwsPjFP1EIbw9YEkE6/DGvL2Uzou9az2sAYLkW/7Kg0KtiVVUp/
         CwAPrPq18Tu8ERYiPNb5wG9Ho0jXCFkzRxoexT8ogj39AGaJ2ERuH02hY5yu+sW/+yAr
         k61b++LEFz+B/gbNRz0wWYG+fdqfcI05gvzsv67IEbPmNCFQf4c8kOo6QA0GPSWczyvz
         PBYr6jjj0XCUJR4kt20lXI3ZIh2IFlpma4lP8CfMW6kxK2RZVSBckhy4KW3ZSKZhYBl+
         cysQ==
X-Gm-Message-State: AOAM531TF/JwwRYKZcJmUIRMIGIPMPcnC7K1HWNYMyexFVbbO2GHpv9l
        nwDvcnnuVUj5pj/F4DeN8dTroA==
X-Google-Smtp-Source: ABdhPJwkQbMMCQqC8NG8eWBYr4df3Didrs47x3vRIEk+hCzs/JLlGTKIPh8tbTo1473zemwNA2FkoQ==
X-Received: by 2002:a05:6808:118d:b0:2cc:ef90:3812 with SMTP id j13-20020a056808118d00b002ccef903812mr782943oil.48.1645767707961;
        Thu, 24 Feb 2022 21:41:47 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bd32-20020a056870d7a000b000d43d4d2de1sm863567oab.5.2022.02.24.21.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:41:47 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND 2/2] soc: qcom: rpmhpd: add sc8280xp rpmh power-domains
Date:   Thu, 24 Feb 2022 21:43:45 -0800
Message-Id: <20220225054345.2479565-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220225054345.2479565-1-bjorn.andersson@linaro.org>
References: <20220225054345.2479565-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm sc8280xp platform has 8 power-domains. Add these, and their
relevant active-only variants, to the RPMh power-domain driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 58f1dc9b9cb7..71602eb824f7 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -180,6 +180,11 @@ static struct rpmhpd mxc_ao = {
 	.res_name = "mxc.lvl",
 };
 
+static struct rpmhpd nsp = {
+	.pd = { .name = "nsp", },
+	.res_name = "nsp.lvl",
+};
+
 /* SDM845 RPMH powerdomains */
 static struct rpmhpd *sdm845_rpmhpds[] = {
 	[SDM845_CX] = &cx_w_mx_parent,
@@ -363,10 +368,31 @@ static const struct rpmhpd_desc sc8180x_desc = {
 	.num_pds = ARRAY_SIZE(sc8180x_rpmhpds),
 };
 
+/* SC8280xp RPMH powerdomains */
+static struct rpmhpd *sc8280xp_rpmhpds[] = {
+	[SC8280XP_CX] = &cx,
+	[SC8280XP_CX_AO] = &cx_ao,
+	[SC8280XP_MX] = &mx,
+	[SC8280XP_MX_AO] = &mx_ao,
+	[SC8280XP_EBI] = &ebi,
+	[SC8280XP_LCX] = &lcx,
+	[SC8280XP_LMX] = &lmx,
+	[SC8280XP_GFX] = &gfx,
+	[SC8280XP_MMCX] = &mmcx,
+	[SC8280XP_MMCX_AO] = &mmcx_ao,
+	[SC8280XP_NSP] = &nsp,
+};
+
+static const struct rpmhpd_desc sc8280xp_desc = {
+	.rpmhpds = sc8280xp_rpmhpds,
+	.num_pds = ARRAY_SIZE(sc8280xp_rpmhpds),
+};
+
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
 	{ .compatible = "qcom,sc7280-rpmhpd", .data = &sc7280_desc },
 	{ .compatible = "qcom,sc8180x-rpmhpd", .data = &sc8180x_desc },
+	{ .compatible = "qcom,sc8280xp-rpmhpd", .data = &sc8280xp_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
 	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
 	{ .compatible = "qcom,sm6350-rpmhpd", .data = &sm6350_desc },
-- 
2.33.1

