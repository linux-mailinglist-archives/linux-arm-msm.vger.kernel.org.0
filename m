Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBD03C7EE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 09:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238234AbhGNHEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 03:04:39 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28488 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238210AbhGNHEg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 03:04:36 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Jul 2021 00:01:45 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jul 2021 00:01:43 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Jul 2021 12:31:23 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 22E1521B6B; Wed, 14 Jul 2021 12:31:22 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3 2/7] media: venus: core: Add sc7280 DT compatible and resource data
Date:   Wed, 14 Jul 2021 12:31:03 +0530
Message-Id: <1626246068-21023-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
References: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds a sm7280 compatible binding to the venus core.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 91b1584..68acfc0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -736,6 +736,57 @@ static const struct venus_resources sm8250_res = {
 	.fwname = "qcom/vpu-1.0/venus.mdt",
 };
 
+static const struct freq_tbl sc7280_freq_table[] = {
+	{ 0, 460000000 },
+	{ 0, 424000000 },
+	{ 0, 335000000 },
+	{ 0, 240000000 },
+	{ 0, 133333333 },
+};
+
+static const struct bw_tbl sc7280_bw_table_enc[] = {
+	{ 1944000, 1896000, 0, 3657000, 0 },	/* 3840x2160@60 */
+	{  972000,  968000, 0, 1848000, 0 },	/* 3840x2160@30 */
+	{  489600,  618000, 0,  941000, 0 },	/* 1920x1080@60 */
+	{  244800,  318000, 0,	480000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl sc7280_bw_table_dec[] = {
+	{ 2073600, 2128000, 0, 3831000, 0 },	/* 4096x2160@60 */
+	{ 1036800, 1085000, 0, 1937000, 0 },	/* 4096x2160@30 */
+	{  489600,  779000, 0,  998000, 0 },	/* 1920x1080@60 */
+	{  244800,  400000, 0,  509000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct reg_val sm7280_reg_preset[] = {
+	{ 0xb0088, 0 },
+};
+
+static const struct venus_resources sc7280_res = {
+	.freq_tbl = sc7280_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sc7280_freq_table),
+	.reg_tbl = sm7280_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(sm7280_reg_preset),
+	.bw_tbl_enc = sc7280_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sc7280_bw_table_enc),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.clks = {"core", "bus", "iface"},
+	.clks_num = 3,
+	.vcodec0_clks = {"vcodec_core", "vcodec_bus"},
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx", NULL },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_6XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu-2.0/venus.mdt",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -743,6 +794,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.7.4

