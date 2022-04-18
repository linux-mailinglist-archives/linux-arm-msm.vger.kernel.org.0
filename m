Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E76505C65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 18:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346134AbiDRQZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 12:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346117AbiDRQZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 12:25:14 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EDE2ED59
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:34 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id y21so7528638wmi.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lYBPOVL6x66k/bxtNREKz2fmvlBcDB8DuOF98iZHrOc=;
        b=H/W+EYl/rlZyMOmpiuMDmJbF1jp9G199cObhKekWffXi6E6owPKKP+eao41BeSLvj7
         6XNOMHD94aXZLDp+2qoHdg0Ud5SqPfNlhHp8hDu/5A18MwJNy88Q/UiyCRLqozWOsS0i
         KIaigX3RsVp47pJi3e5dN019ORhl9O3xl0WsdBHN3xFq67iaZxIGS5rZ7zclAZHdEpoD
         hLZtP1vjDoX+P9uuPwAs491z6gDFjFjsFU09YdS72lQychJrCKgSBEAAuBiaRvt7IgTe
         WPCfnPLB6KPSR8KsJJ0bIjEAbBqF9s5E6wSOFu7zOu/vRw1paWKJjfb1sgBBlNBKT/WS
         U+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lYBPOVL6x66k/bxtNREKz2fmvlBcDB8DuOF98iZHrOc=;
        b=L7rPziFg9f6FFdE/iaauA9GtEkRCWXHJ9o6mtdbTxdwH83t+NSihv0YeKXa6WVCx2x
         PJAfToxc+vb/mZKOuQB/S/BC3mm8Itsww14uTysl4/nuyMj6aAP4jIJ1Zjs3Js2wVHnF
         fjzL8KRyduFauZGe4CqGeoQ0OXfUXxJ6k85UijW/rdWMnx0fwCV5QGl2FhNAl8svX7cZ
         GOsjsJx4EMw5dgyaHwg/4aNOsi26mC8rkHGHPnwyNLBQl+SE+GiNKQh1EaHmOVetqRbD
         yOK3xnCnQws8Q7aH5IXBYqxYi0YRiex+cVJwQh2DCQCFM6KOpqxlvSiCoIMcMcgVPojx
         trxw==
X-Gm-Message-State: AOAM532N5c2eQOK6tEqUy5IQpyDmSN4wYdZPds/zl7yaTjz+RW7iOQs+
        rs566LVsQAiE+RXhb7qyz8KI0A==
X-Google-Smtp-Source: ABdhPJyOVrbket2OpEj+2flQCtnAETQV07N44amoywIWEePShii7RC9VNKWoENhiNSOenoFiwxkMjg==
X-Received: by 2002:a05:600c:1e89:b0:390:ba57:81c6 with SMTP id be9-20020a05600c1e8900b00390ba5781c6mr12153957wmb.29.1650298952648;
        Mon, 18 Apr 2022 09:22:32 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 205-20020a1c02d6000000b003928c42d02asm8460853wmc.23.2022.04.18.09.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:22:32 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ilia.lin@kernel.org,
        rafael@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 4/5] cpufreq: qcom-cpufreq-nvmem: Rename qcs404 data to cpr_genpd
Date:   Mon, 18 Apr 2022 17:22:25 +0100
Message-Id: <20220418162226.2983117-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418162226.2983117-1-bryan.odonoghue@linaro.org>
References: <20220418162226.2983117-1-bryan.odonoghue@linaro.org>
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

At the moment the CPR genpd based code is named after the qcs404 however
msm8936, msm8939 and other antecedent processors of the qcs404 can also
make use of this data.

Rename it to reflect a more generic use.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 6dfa86971a75..355c8b99e974 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -252,10 +252,10 @@ static const struct qcom_cpufreq_match_data match_data_krait = {
 	.get_version = qcom_cpufreq_krait_name_version,
 };
 
-static const char *qcs404_genpd_names[] = { "cpr", NULL };
+static const char *cpr_genpd_names[] = { "cpr", NULL };
 
-static const struct qcom_cpufreq_match_data match_data_qcs404 = {
-	.genpd_names = qcs404_genpd_names,
+static const struct qcom_cpufreq_match_data match_data_cpr_genpd = {
+	.genpd_names = cpr_genpd_names,
 };
 
 static int qcom_cpufreq_probe(struct platform_device *pdev)
@@ -454,7 +454,7 @@ static struct platform_driver qcom_cpufreq_driver = {
 static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
 	{ .compatible = "qcom,apq8096", .data = &match_data_kryo },
 	{ .compatible = "qcom,msm8996", .data = &match_data_kryo },
-	{ .compatible = "qcom,qcs404", .data = &match_data_qcs404 },
+	{ .compatible = "qcom,qcs404", .data = &match_data_cpr_genpd },
 	{ .compatible = "qcom,ipq8064", .data = &match_data_krait },
 	{ .compatible = "qcom,apq8064", .data = &match_data_krait },
 	{ .compatible = "qcom,msm8974", .data = &match_data_krait },
-- 
2.35.1

