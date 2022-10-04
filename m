Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D775F4BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 00:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbiJDWMM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 18:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbiJDWLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 18:11:46 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14D76C11A;
        Tue,  4 Oct 2022 15:11:39 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id y189so9757158iof.5;
        Tue, 04 Oct 2022 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SLVJWF/SFU6Jeg5dmHMSsd0bq9GxMVu9YOSAYsOVoMM=;
        b=NV3Rjp4/6NPSQqASzvbYFnsJIzBQ0ReVaJ0L3eHFhFakzf2OgOoAvYIcdZCgmUTfPZ
         g7cdgdSyDEKFADAl/Y2yJnlq1mIpuG6bf9FWyimfOSM3S3WbtUdKcbUs9vaJIe84S6GU
         Y7qqyW88AxKbNETdKDkmT3eJoKMIZPl8SmEnJM6gYpWx/Ew+XGUjfV9X1C9tEAY/rT5m
         ZVK32FNK5o6qDysdsO0y2ab95rT8sR018MNRHqH3UbqJ7D1DbBKfc/cr1iO9lb/Rs2TC
         KOj5ZMEi+UyC4IYcZ6sWbEUgB/oktUZrGZkuLAaM2/H4WuS6MA2Fi4wlOB//+41u9/ON
         NgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SLVJWF/SFU6Jeg5dmHMSsd0bq9GxMVu9YOSAYsOVoMM=;
        b=8EBNlKmTEp7QDChr44qA2wqn0cW3MrXBzrGO+ONCwa7NZ6Lsv9HLPRzt0ev/hS7SxP
         Matx6n3u+4cmCB88pNnZyR/R/bZbMEUCUDHSnTwsijFkMK8BcBDk9P6qR3IadfadUE2F
         HCdcAkHgZWwR0xa9Rhtr8ab94Iu8SD3q20Q5eC/QP1GcldeqpeymV5JFzNGGWfJcpyla
         2Tx8YuzYTqeSF+PsBZR9wffyQQkx1mibQ+DAJhJFWjR4u4pjNuTS+A517dkiWhoy/fsY
         VwxzF152c9JaCO4Hxjng3uMAaCXDmBb2JuRAqS+fdtumFaHBa+/LY1Lk65qChdaJ/dpl
         9Qaw==
X-Gm-Message-State: ACrzQf0mjfg7Qbmd5RywTLWSLChxuXrl2P8avpvAOmH1gnrnKaoJ79ek
        n9Rm6J+SpcPg2fyd0dU4yoBEoNG8dk9JPA==
X-Google-Smtp-Source: AMsMyM7BKIlN5WndQVQte0MHLWElsOCo02CJSGr7RkbMp1ALnPtcalWcG/x/taPuH1+Ahg4X1Gry3g==
X-Received: by 2002:a05:6602:13c8:b0:669:c3de:776f with SMTP id o8-20020a05660213c800b00669c3de776fmr11158533iov.124.1664921499177;
        Tue, 04 Oct 2022 15:11:39 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::1eda])
        by smtp.gmail.com with UTF8SMTPSA id k3-20020a023343000000b0035b2e0864ebsm5742581jak.160.2022.10.04.15.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 15:11:38 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: rpmhpd: add sdm670 power domains
Date:   Tue,  4 Oct 2022 18:11:30 -0400
Message-Id: <20221004221130.14076-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221004221130.14076-1-mailingradian@gmail.com>
References: <20221004221130.14076-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 has similar power domains to SDM845 but no EBI power
domain. Add a new array for them to avoid requesting a power domain which
is unsupported by the hardware.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 092f6ab09acf..319a2cf7e694 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -210,6 +210,23 @@ static const struct rpmhpd_desc sa8540p_desc = {
 	.num_pds = ARRAY_SIZE(sa8540p_rpmhpds),
 };
 
+/* SDM670 RPMH powerdomains */
+static struct rpmhpd *sdm670_rpmhpds[] = {
+	[SDM670_CX] = &cx_w_mx_parent,
+	[SDM670_CX_AO] = &cx_ao_w_mx_parent,
+	[SDM670_GFX] = &gfx,
+	[SDM670_LCX] = &lcx,
+	[SDM670_LMX] = &lmx,
+	[SDM670_MSS] = &mss,
+	[SDM670_MX] = &mx,
+	[SDM670_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sdm670_desc = {
+	.rpmhpds = sdm670_rpmhpds,
+	.num_pds = ARRAY_SIZE(sdm670_rpmhpds),
+};
+
 /* SDM845 RPMH powerdomains */
 static struct rpmhpd *sdm845_rpmhpds[] = {
 	[SDM845_CX] = &cx_w_mx_parent,
@@ -435,6 +452,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sc7280-rpmhpd", .data = &sc7280_desc },
 	{ .compatible = "qcom,sc8180x-rpmhpd", .data = &sc8180x_desc },
 	{ .compatible = "qcom,sc8280xp-rpmhpd", .data = &sc8280xp_desc },
+	{ .compatible = "qcom,sdm670-rpmhpd", .data = &sdm670_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
 	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
 	{ .compatible = "qcom,sdx65-rpmhpd", .data = &sdx65_desc},
-- 
2.38.0

