Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187D3574B00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238018AbiGNKnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238439AbiGNKn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:43:26 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6855454CBE
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:43:24 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id mf4so2679753ejc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7G95qX/Z/g6nBYu3wmSbe9p8uUBDG/7xmjXeY4B1fjI=;
        b=FyKC5m52ouhDcSu/wW7qAcWViWBlkrreswXCt22es8z62p20b9Z83CB6CVhBgLrlMK
         TqDuDMfCun+FJ65Zp+XGU5zCuFROAGDU+1PdW2gA7J0o6q33w2smvMbaJh/btBrQ4Y2E
         90YxAy3LCDn0Ghj7+u/Ps+SVx5Bxi04VTdL7BqllapCQR/sdUIoerBygh9tD4LtxMlsk
         Kf+yaS53LBoIG/ZpqiwoYWja9K09HWpNdtesPR3FcqBqH9k3gdQ31eTIU94TSEw0VWyV
         QjFq7gQlo5Szs63P4ImJWaT5JGJSk5zLy/6+clRO5ui6BP9lJyoVmpWzesbCLWKQJXFI
         E5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7G95qX/Z/g6nBYu3wmSbe9p8uUBDG/7xmjXeY4B1fjI=;
        b=bcWtK+BW+EctUpQ6pjny/BG0W4afSIQIFyK8qxaLwMkfaoFX6rLVGn1uqcysm/1sGv
         h2aO937FrJcedecEmWYC4TZDExaQ5UKrBa+QXG/KKvVVtVyPSfpBR8xQYPYWlQY/bDiM
         PIHiZ42JUzfo0Fsv/afBAFdkykegRvPeoUmW0oWNC8u+OBUF56uJsBb5XeQQF0EP/9gC
         sHfruMGXXyX8/0xAaFyRAbpEN51X0U8vawco0TE8mlDGyZsy8uyZwMzimS3S7PDin/nM
         yKyPgjshDPel7GVJ94Bb0mJAoRhXJbkXRYcV4X0oD8qBn/MIKucbVN+hydJAzMSuP0AF
         TmMQ==
X-Gm-Message-State: AJIora8RJFaMMBRdeV5peiBQbuWI9hA/oaKlQxPS5yhG3KMdpr3ngsuV
        fAkMcl2yUvnJPXbMhC4x35BXGw==
X-Google-Smtp-Source: AGRyM1sRs65JSlDrQgcA+auOchgRzFK4pfgE0Bx1If3yHAifWYE4Hn5mfud4Ns7/L+SgzVLpMU10iw==
X-Received: by 2002:a17:907:9612:b0:72e:56bd:2b9a with SMTP id gb18-20020a170907961200b0072e56bd2b9amr5365640ejc.526.1657795402871;
        Thu, 14 Jul 2022 03:43:22 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m21-20020aa7d355000000b0043a7de4e526sm822889edr.44.2022.07.14.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:43:22 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH] remoteproc: qcom: q6v5: Use _clk_get_optional for aggre2_clk
Date:   Thu, 14 Jul 2022 13:43:09 +0300
Message-Id: <20220714104309.4111334-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
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

There is devm_clk_get_optional now, so lets drop the has_aggre2_clk
from adsp_data.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++-------------------------
 1 file changed, 7 insertions(+), 34 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 6ae39c5653b1..beef7a09c380 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -34,7 +34,6 @@ struct adsp_data {
 	const char *firmware_name;
 	int pas_id;
 	unsigned int minidump_id;
-	bool has_aggre2_clk;
 	bool auto_boot;
 
 	char **proxy_pd_names;
@@ -64,7 +63,6 @@ struct qcom_adsp {
 	int pas_id;
 	unsigned int minidump_id;
 	int crash_reason_smem;
-	bool has_aggre2_clk;
 	const char *info_name;
 
 	struct completion start_done;
@@ -310,15 +308,13 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
 		return ret;
 	}
 
-	if (adsp->has_aggre2_clk) {
-		adsp->aggre2_clk = devm_clk_get(adsp->dev, "aggre2");
-		if (IS_ERR(adsp->aggre2_clk)) {
-			ret = PTR_ERR(adsp->aggre2_clk);
-			if (ret != -EPROBE_DEFER)
-				dev_err(adsp->dev,
-					"failed to get aggre2 clock");
-			return ret;
-		}
+	adsp->aggre2_clk = devm_clk_get_optional(adsp->dev, "aggre2");
+	if (IS_ERR(adsp->aggre2_clk)) {
+		ret = PTR_ERR(adsp->aggre2_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(adsp->dev,
+				"failed to get aggre2 clock");
+		return ret;
 	}
 
 	return 0;
@@ -457,7 +453,6 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->rproc = rproc;
 	adsp->minidump_id = desc->minidump_id;
 	adsp->pas_id = desc->pas_id;
-	adsp->has_aggre2_clk = desc->has_aggre2_clk;
 	adsp->info_name = desc->sysmon_name;
 	platform_set_drvdata(pdev, adsp);
 
@@ -531,7 +526,6 @@ static const struct adsp_data adsp_resource_init = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
-		.has_aggre2_clk = false,
 		.auto_boot = true,
 		.ssr_name = "lpass",
 		.sysmon_name = "adsp",
@@ -542,7 +536,6 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
-		.has_aggre2_clk = false,
 		.auto_boot = true,
 		.load_state = "adsp",
 		.ssr_name = "lpass",
@@ -554,7 +547,6 @@ static const struct adsp_data sm6350_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"lcx",
@@ -571,7 +563,6 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
-		.has_aggre2_clk = false,
 		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"cx",
@@ -587,7 +578,6 @@ static const struct adsp_data sm8250_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"lcx",
@@ -604,7 +594,6 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"lcx",
@@ -621,7 +610,6 @@ static const struct adsp_data msm8996_adsp_resource = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
 		.pas_id = 1,
-		.has_aggre2_clk = false,
 		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"cx",
@@ -636,7 +624,6 @@ static const struct adsp_data cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
@@ -647,7 +634,6 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.load_state = "cdsp",
 	.ssr_name = "cdsp",
@@ -659,7 +645,6 @@ static const struct adsp_data sm6350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
@@ -676,7 +661,6 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
@@ -692,7 +676,6 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
@@ -708,7 +691,6 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"nsp",
@@ -723,7 +705,6 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
 	.crash_reason_smem = 633,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 30,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"nsp",
@@ -738,7 +719,6 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
@@ -756,7 +736,6 @@ static const struct adsp_data mpss_resource_init = {
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
 	.minidump_id = 3,
-	.has_aggre2_clk = false,
 	.auto_boot = false,
 	.proxy_pd_names = (char*[]){
 		"cx",
@@ -773,7 +752,6 @@ static const struct adsp_data sc8180x_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
-	.has_aggre2_clk = false,
 	.auto_boot = false,
 	.proxy_pd_names = (char*[]){
 		"cx",
@@ -789,7 +767,6 @@ static const struct adsp_data slpi_resource_init = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
-		.has_aggre2_clk = true,
 		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"ssc_cx",
@@ -804,7 +781,6 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
 		.pas_id = 12,
-		.has_aggre2_clk = false,
 		.auto_boot = true,
 		.proxy_pd_names = (char*[]){
 			"lcx",
@@ -821,7 +797,6 @@ static const struct adsp_data sm8250_slpi_resource = {
 	.crash_reason_smem = 424,
 	.firmware_name = "slpi.mdt",
 	.pas_id = 12,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"lcx",
@@ -838,7 +813,6 @@ static const struct adsp_data sm8350_slpi_resource = {
 	.crash_reason_smem = 424,
 	.firmware_name = "slpi.mdt",
 	.pas_id = 12,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"lcx",
@@ -865,7 +839,6 @@ static const struct adsp_data sdx55_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
-	.has_aggre2_clk = false,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
-- 
2.34.3

