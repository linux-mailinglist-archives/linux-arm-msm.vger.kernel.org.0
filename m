Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBC55600B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 15:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbiF2NDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 09:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233622AbiF2NDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 09:03:13 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F899FFF
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:11 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id f190so9029679wma.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7evQCuRVfAUpJj8gespECNl/9YnAlPw9MliN5ArdYw=;
        b=D4AcJH1YaF1XN25fIKlh6oFr3TOStp0ziJD3bGoP/iQVtSZZSLehD86Yv0FLUr2yCP
         4Lkt6CMKXUlMHlQ86oUrwbCtLKgSsqqyKwWknXIo3omcq9hyrmgulXPAEQTMPYHH1y0H
         8LBEaz0Im88gsW9y5O81DhXMTrQQM3qLjTHCXtD+xuPyhkK1v6Bj+5009mZ1ndqZZDZc
         1OkIyl+PYJV20liz3rTWLm011ff23OMSjL2UCoaUUlDTDxj/ziG4obexfdutlBUKX0wP
         R4KDBpVl+8CaCo6HKuZbffG6OwPtr382Cl2/9LqrXoeVON67fkquiGzcpQDmNnymiA4u
         C1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7evQCuRVfAUpJj8gespECNl/9YnAlPw9MliN5ArdYw=;
        b=m7xJoFMdguH27bXsYvaZZv1G/6t/QWc6dW7JjjHNeoTrhjN6Hqj6hu9iIvrXebnKGk
         2UCX3D7VSPuY4qaeSPTD5n+gp+2H4SfvuTz1i+Rl1Tk8sKriAAKYQGIS8RvAMao1/KV1
         Tc5WwQ+TOcVlK8VLXf6XfZ5e4pK/qGDXjKUBANxS1IpugBDkMvbzNTQ01WuXQJZqVg/l
         /myvVm+yBSB7d2PrdPimYb19pJiEhgaed4enZHNn0T4fKZ0tSTFMdWnpIOB6WvUCoW2f
         gxmurmw8QXtTrtq+StBSrJRbINskEwu679NuW3QAMCTSDvq9YSdQo8ONz9FiCVxG3qqx
         igWg==
X-Gm-Message-State: AJIora8jIic7w6zwvHQm/1krEfthRPs/lAwLBRIPv540NofBn3tlV3nG
        ZTYBx6yOsh/E1mULbyKPa0KiLQ==
X-Google-Smtp-Source: AGRyM1vRkf+KyymXTwTFXSLALfMb5taMghAcdFew3TdT8nunn0QCLAj+yDlhKi+IvB5/X4axH0cQcg==
X-Received: by 2002:a1c:7c18:0:b0:3a0:39b1:3403 with SMTP id x24-20020a1c7c18000000b003a039b13403mr5862184wmc.84.1656507790241;
        Wed, 29 Jun 2022 06:03:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g1-20020adffc81000000b00213ba3384aesm17056979wrr.35.2022.06.29.06.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 06:03:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RESEND PATCH 4/5] cpufreq: qcom-cpufreq-nvmem: Rename qcs404 data to cpr_genpd
Date:   Wed, 29 Jun 2022 14:03:02 +0100
Message-Id: <20220629130303.3288306-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
References: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
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
index 6dfa86971a757..355c8b99e974a 100644
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
2.36.1

