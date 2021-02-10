Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5863E316438
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 11:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhBJKse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 05:48:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:50750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231511AbhBJKqb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 05:46:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A770D64E3E;
        Wed, 10 Feb 2021 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612953950;
        bh=ZGh3JblgSl3CcCDV0RuW+f5+tr+S9AWWy0tc8okYK9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qbAgZzmgZEnssJHK26tQVQVyoywt7CCRAwbc/c5nb4gpPTyXGv6LvlUz+pxqQH2oy
         aI7hi+Y1YFcfl8t/aaFrjvcvWdePTTVJo4l8OFNo4AlYfK7JukI38f5CY+swWU3zub
         AxI2+yRrgBi10d8skAbhiZ40LkuWbI22BD9oe+FD4rtuHh2Uyvi0yef1RXqCFgyTC1
         s9gA0IoeUF7Q2a0j9w6kgKIgsnG9YguVBl8UemmONCozdKXwPKBvnCzwsf0IVtXUyc
         U8VJj9p/23PgZukytnvqy31tIOQn/T7BVY4+KNo99+6GYFbtZOBIYsrHxHu307n83P
         dfyWmyRmihrbA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SM8350 PAS remoteprocs
Date:   Wed, 10 Feb 2021 16:15:39 +0530
Message-Id: <20210210104539.340349-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210104539.340349-1-vkoul@kernel.org>
References: <20210210104539.340349-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add audio, compute, modem and sensor DSP resources to the Qualcomm PAS
driver.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 63 ++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ee586226e438..e635454d6170 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -565,6 +565,26 @@ static const struct adsp_data sm8250_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
+static const struct adsp_data sm8350_adsp_resource = {
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
+		"lcx",
+		"lmx",
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
@@ -629,6 +649,25 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.ssctl_id = 0x17,
 };
 
+static const struct adsp_data sm8350_cdsp_resource = {
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
@@ -701,6 +740,26 @@ static const struct adsp_data sm8250_slpi_resource = {
 	.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm8350_slpi_resource = {
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
@@ -745,6 +804,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
 	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sm8250_slpi_resource},
+	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource},
+	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
+	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sm8350_slpi_resource},
+	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
2.26.2

