Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B974F9F74
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 00:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235141AbiDHWF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 18:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238002AbiDHWF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 18:05:26 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887F7B6453
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 15:03:21 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id v75so10228667oie.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qt4fpeQsguypsoyfy3a9PkXQSuRKCXQubOJF0CE6T8I=;
        b=umxXU2MVecH0RMOa+fPnpVirA5rLgsKZR2ALu13dzJoB22JoUEuuXTYpuJPzfy9E7P
         YOXBWCfL/ysIobPcG2/9sgeo9Lx9B8uL+qSgNF8HLHoMb4xRMF9jcfy5+ODDgqK3iEHE
         qbCcExxoQ3xdSwXicL6blpFxZd+FqrrteSZsjDMi1wjmkMzdLJAnwyLYEAqese5trw2C
         Jha3aYNC4j87DdMy1g7r3KZE1LuQHcdIs3P8js5JtDvITHs5Ki/fmc/zlbi3sqBT/bZ0
         W5Wa6AAfRJXSGfdye7M9jZKNqO+F6zaDk4Vdmypa9MNr2djOs8HPsDl6Yh87ZvPtoQZ2
         2dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qt4fpeQsguypsoyfy3a9PkXQSuRKCXQubOJF0CE6T8I=;
        b=enqGtlPuglTK3iAWUeqoqYF4nU/VbOrz3kIsQKN9f9TUBKDo47Fk2oFFDdeyeuqQ12
         xyd45BOpDN9CyEMTyT6cl5EYum59M2ROfYY9m09ZZBjc3vOI5lPsYOMst6s6zEwi0Z7A
         DfHsGRp24IHhHY2+nUqkySKKfP1FCcqVgL0xpV134r3Tq43rxq9xvOQ0vAJ2wLDDlD+L
         qoPn3F20e2hXF4TLaFXYaKHAhSouvOmoyoFcfx175X/bmEyf0Ncd34bAcqlsXFXVofSU
         9yWWZBerMCnJCvJqhvnNbBfCiOdnGQp+rNBujRASWcHVjQBR7J2q2ejKAYlLabuq34No
         TyAQ==
X-Gm-Message-State: AOAM5339et9DA8hbAN3WxwjQhpDErdYO3PXOGlRVahQVdR4At1v6wRLp
        0L3BPqzERgs6v6rhzTnB4gR9ww==
X-Google-Smtp-Source: ABdhPJzeWDadGommlPeQHQ/hA1UFhFZs/VF0TYz2ftH3+9uPFg9AA5nOGdDYDEKKPZP3FNIFyek0Hg==
X-Received: by 2002:a05:6808:142:b0:2ec:aa67:e479 with SMTP id h2-20020a056808014200b002ecaa67e479mr841681oie.282.1649455400954;
        Fri, 08 Apr 2022 15:03:20 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056830138100b005cf2f29d89csm9212635otq.77.2022.04.08.15.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 15:03:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add sc8280xp remoteprocs
Date:   Fri,  8 Apr 2022 15:05:39 -0700
Message-Id: <20220408220539.625301-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408220539.625301-1-bjorn.andersson@linaro.org>
References: <20220408220539.625301-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Among the subsystems in the Qualcomm sc8280xp platform we find an audio
and two compute DSPs. Add support for controlling these using the
peripheral authentication service (PAS) remoteproc driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1ae47cc153e5..06c6dc34f2e0 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -704,6 +704,36 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sc8280xp_nsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"nsp",
+		NULL
+	},
+	.ssr_name = "cdsp0",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
+static const struct adsp_data sc8280xp_nsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 30,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"nsp",
+		NULL
+	},
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+};
+
 static const struct adsp_data sm8350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -861,6 +891,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
+	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource},
+	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
+	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
-- 
2.35.1

