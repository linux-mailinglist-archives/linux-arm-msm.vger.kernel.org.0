Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F161E1BB277
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 02:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgD1ABu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 20:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726360AbgD1ABs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 20:01:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24DBC09B051
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 17:01:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a7so327880pju.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 17:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1s/dsw3iQ5+KLo+HnIszPH3KY3xtYoHt7IVuj3QhLHU=;
        b=XNvI8baeWbFOlqlhE8xT1QWuu1S8IwUV53ybwKKHilfeMad9u86/Uf3LdqVk3ZOryZ
         c6KHmlE+ZFcis9At+kwW5gX7bge93AvjplIQf7HxNFsh9x4qPnGPTl50398M9joshJ+P
         mOYz9wHPLNh3cQzkWnvbtFhAqhD5327iTLGlPglQg9kcRzscpFewWWLCTGeo/Jp5h/O2
         IhCzlCJeyPWcD3ovB/UldAl7i5yDmzvjSAPwmwCQT+lY2iExK1IFlCk1ZEJY0GOtXO+I
         mIOShl7d4YKDbHlxR/3xnnr93oOcQlxIghqMJoTqohMQDdA80dCEOuzqTEhlfLhhTv5e
         WEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1s/dsw3iQ5+KLo+HnIszPH3KY3xtYoHt7IVuj3QhLHU=;
        b=GKPLVBRzas/Zv/+8kft1XNHruCyxOjzP+4faq8xOwGI60dMDIu9chTv0ldGtW5l30e
         3GJ7dXdE4bFxFcc0CeOax4pCb1G+YxPE3+IKd0LAtxGHNm+EOgLd6ADwcXBIaThFANFw
         +hFUf5m5/O9zda3E99aApYwFLo9+2ANqFOY71FHPU8iLiHTTlPCKb0zBR4/uQV0b9asj
         4Iyvx9FpKaF0X890qJWmKoAHHxLgnDUv2SOs2sfjFkMDERmOrcDb+yP5Eqlruu1zDsBD
         cviOwkxNMW8Op/Ky6CALfTgNt/upO8jVwCT+UuK0585RTGRE3a98O19cMhcbWTFCXji4
         DZaQ==
X-Gm-Message-State: AGi0PuZUNc2H+3iuU3sdHlm1pfVLGujacCj1J39CYss02QB2ByuGkxwY
        FLCYEfJkT6azatZVUipW0SfZpA==
X-Google-Smtp-Source: APiQypLTLSeLx4582wk1BaOWz0qb2oLn0Mzn+JdglqHV4PiHoKagI4kSJkJbxuaIo/LC7hsyhR/UJg==
X-Received: by 2002:a17:902:8608:: with SMTP id f8mr25757854plo.110.1588032106375;
        Mon, 27 Apr 2020 17:01:46 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cp22sm363850pjb.28.2020.04.27.17.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 17:01:45 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SM8250 PAS remoteprocs
Date:   Mon, 27 Apr 2020 17:01:10 -0700
Message-Id: <20200428000110.2958704-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
References: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add audio, compute and sensor DSP compatibles to the Qualcomm PAS
binding and driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 62 ++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8ecc157f1ed1..5f2266c74448 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -508,6 +508,26 @@ static const struct adsp_data sm8150_adsp_resource = {
 		.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sm8250_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct adsp_data msm8998_adsp_resource = {
 		.crash_reason_smem = 423,
 		.firmware_name = "adsp.mdt",
@@ -553,6 +573,25 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sm8250_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -604,6 +643,26 @@ static const struct adsp_data sm8150_slpi_resource = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm8250_slpi_resource = {
+	.crash_reason_smem = 424,
+	.firmware_name = "slpi.mdt",
+	.pas_id = 12,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.ssr_name = "dsps",
+	.sysmon_name = "slpi",
+	.ssctl_id = 0x16,
+};
+
 static const struct adsp_data msm8998_slpi_resource = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -644,6 +703,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sm8150_slpi_resource},
+	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
+	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
+	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sm8250_slpi_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
2.24.0

