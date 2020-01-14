Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED77813A9C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 13:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbgANMyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 07:54:06 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:61740 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbgANMyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 07:54:06 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jan 2020 18:24:00 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Jan 2020 18:23:49 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id B80203588; Tue, 14 Jan 2020 18:23:48 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH V4 3/4] venus: core: add sc7180 DT compatible and resource struct
Date:   Tue, 14 Jan 2020 18:23:35 +0530
Message-Id: <1579006416-11599-4-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This add DT compatible string and resource structure for sc7180.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c7525d9..194b10b9 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -521,11 +521,56 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	.fwname = "qcom/venus-5.2/venus.mdt",
 };
 
+static const struct freq_tbl sc7180_freq_table[] = {
+	{  0, 500000000 },
+	{  0, 434000000 },
+	{  0, 340000000 },
+	{  0, 270000000 },
+	{  0, 150000000 },
+};
+
+static const struct bw_tbl sc7180_bw_table_enc[] = {
+	{  972000,  750000, 0, 0, 0 },	/* 3840x2160@30 */
+	{  489600,  451000, 0, 0, 0 },	/* 1920x1080@60 */
+	{  244800,  234000, 0, 0, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl sc7180_bw_table_dec[] = {
+	{ 1036800, 1386000, 0, 1875000, 0 },	/* 4096x2160@30 */
+	{  489600,  865000, 0, 1146000, 0 },	/* 1920x1080@60 */
+	{  244800,  530000, 0,  583000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct venus_resources sc7180_res = {
+	.freq_tbl = sc7180_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sc7180_freq_table),
+	.bw_tbl_enc = sc7180_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
+	.bw_tbl_dec = sc7180_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
+	.codec_freq_data = sdm845_codec_freq_data,
+	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
+	.clks = {"core", "iface", "bus" },
+	.clks_num = 3,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_4XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-5.4/venus.mdt",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
+	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
1.9.1

