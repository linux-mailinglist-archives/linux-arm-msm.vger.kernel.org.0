Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49CBC765A62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 19:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbjG0Rde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 13:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjG0Rdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 13:33:33 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15A22D71
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:33:31 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so31810951fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690479210; x=1691084010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icO3d3uWVI1Ske0MIHcKUIP285+5TQhyvGKynKcarCg=;
        b=UghMswEkqCLq7uFW0vg1z0BCw4oUeIeSnbl7RRVXmD+R4LSrBowDwJ2xk4rBk/1c3N
         YVcSqboHoiKkB54P3hXlJZfbr6wTvzZBtZvjMump/NpjjuE2Cvb/3G2+r+2Zdib0o/O2
         EIkq5mkmozwuiBAJ7bztpa+UXln0i8suBJKJbi2VvNwlPJFYhvk+NLNPf2ecwds/QnbA
         PNSLX8ihTygl7/ACrKad7aIoL2qPhLCgtBCW2jFPYiQ91FH22K7bvs4hpkidx/mNykqf
         aJCm/sBp5AyvV+ME9S2eODDb+PPR6ID4Vn9FX54ONbs3VXRmWLe1RVDAYAYDvgpjozb4
         s2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479210; x=1691084010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icO3d3uWVI1Ske0MIHcKUIP285+5TQhyvGKynKcarCg=;
        b=L4/2RyImL37yDhW/cGfUVOKBU4eWvxUJV+uaNbMmbexBeMfXqbQzLmXDqZLyR3IYVA
         KMsnHobFBLwVYVwWW9bb5kR1YkVmya8t7IWzJUF2yIwewv6gke8Bg3qehU5AqvfGKBTQ
         gP3YlMTCnnm08ndkdMOOJUmLWGIJ5I7ii0XDMMdvcv9L8Q1IEnP3koa3uaQeybz3170m
         0RbJlLAEdUfatG/UzZF/UM7aO9+vyfNrnjuDJpZ8hxuT176Nq+JKgy870ewj5CrAdMqj
         c2T5nEoAxX6FsG8p7xJGgEjPf4UR4pRYSCN7r/iowWQ2PUNywQMT71Lt4ULS0bf61VKm
         1MAQ==
X-Gm-Message-State: ABy/qLbxpTQ5MDBwOPdao2e+by3xjEH+1eNk+oB9Q9nrLq+EPwqYPzC5
        YN75j22TkFlYwvq+tK7z7D7zXA==
X-Google-Smtp-Source: APBJJlENla/qWI/wubCIydlyspuaQuIsyTFQVi7DDpSPzq+fSIyNg8Oh8dUZnwie0i6o4USOpEQXOA==
X-Received: by 2002:ac2:57c8:0:b0:4fd:f6db:a7d9 with SMTP id k8-20020ac257c8000000b004fdf6dba7d9mr2060lfo.32.1690479210117;
        Thu, 27 Jul 2023 10:33:30 -0700 (PDT)
Received: from [192.168.1.101] (abxi99.neoplus.adsl.tpnet.pl. [83.9.2.99])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ac04000000b004fe07f06337sm412089lfc.53.2023.07.27.10.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:33:28 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 27 Jul 2023 19:33:23 +0200
Subject: [PATCH v5 3/3] remoteproc: qcom: pas: Add SM6375 MPSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230725-topic-6375_rproc-v5-3-a8e9cde56a20@linaro.org>
References: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
In-Reply-To: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690479202; l=1570;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sj7Uy3Esp9/kv46p/vCH0qMBjFc8YM0n5pfjJE2JRcc=;
 b=pwCv/rsLcc3qhJEeFtI+WrIDbwPG+xDQNkdjonSUEWRcDMWOxqw6LamKTxlr5pRFwGeBJZl6C
 28XhYu1QvlKCk6fdUsPaJ9if6YEffEAsLoY5D3x1lj3hPWevlUYXCJ2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a config for the MPSS present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0d58b5be9a77..1c87ae9cec9e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -813,6 +813,21 @@ static const struct adsp_data sm6350_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sm6375_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct adsp_data sm8150_adsp_resource = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
@@ -1182,6 +1197,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
+	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},

-- 
2.41.0

