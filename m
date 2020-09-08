Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4630B2617ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732039AbgIHRpa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:45:30 -0400
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:49896
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731667AbgIHRox (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599587092;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=GwlrLGiTjEkmVdhowLWQgBVSehfdYkNzrSeuywvPmKY=;
        b=VgUI6s8TLIzr/7H8L9DDyND8c7y338Et7AGDuVr5wTLYtJAIvgtCcU6K2lGn9ti6
        XsYjzm4do8R/GdplUGkfvR7ZT90uczlIBCcddHosRKw02RXrdkOe79epiS7PgolNNo9
        pHvdt5ZptNiBopu1Z6GO5+oWzj64/mKOCvMuqjLY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599587092;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=GwlrLGiTjEkmVdhowLWQgBVSehfdYkNzrSeuywvPmKY=;
        b=g2FSX7DXLyNPNMwyxLUGObH/TPSu9OlNZmRnIVZDUSDbGUZdFgruLrYik7MY7Aa2
        nX0nZQDiPrzgfThduA21Ta0vb9QPa8jcVtoa5RUYqPGAu7G2nkMJ4tG18C5cjN5glkp
        9uHKa4GRYLRg6TcHA3uExNWRX3en8nH9HxX2UtgI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C96AC433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>
Subject: [PATCH v4 4/5] ASoC: qcom: Add support for audio over DP
Date:   Tue, 8 Sep 2020 17:44:52 +0000
Message-ID: <010101746ed208d8-8f29e883-d00b-45eb-9710-0c4341140f9b-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
References: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
X-SES-Outgoing: 2020.09.08-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Add support for audio playback over DP in lpass sc7180 platform driver.
Add lpass_variant structure for hdmi data configuaration.

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-sc7180.c | 119 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 167bf2c..34db061 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -62,6 +62,24 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 	},
 };
 
+static struct snd_soc_dai_driver sc7180_lpass_cpu_hdmi_dai_driver[] = {
+	[0] = {
+		.id = HDMI,
+		.name = "Hdmi",
+		.playback = {
+			.stream_name = "Hdmi Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S24_3LE |
+							SNDRV_PCM_FMTBIT_S24_LE,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops    = &asoc_qcom_lpass_hdmi_dai_ops,
+	},
+};
+
 static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 					   int direction)
 {
@@ -88,13 +106,37 @@ static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 
 	return chan;
 }
+static int sc7180_lpass_alloc_hdmi_dma_channel(struct lpass_data *drvdata,
+					   int direction)
+{
+	struct lpass_variant *v = drvdata->variant;
+	int chan = 0;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+					v->rdma_channels);
+
+		if (chan >= v->rdma_channels)
+			return -EBUSY;
+	}
+	set_bit(chan, &drvdata->dma_ch_bit_map);
+
+	return chan;
 
+}
 static int sc7180_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
 {
 	clear_bit(chan, &drvdata->dma_ch_bit_map);
 
 	return 0;
 }
+static int sc7180_lpass_free_hdmi_dma_channel(struct lpass_data *drvdata, int chan)
+{
+	clear_bit(chan, &drvdata->dma_ch_bit_map);
+
+	return 0;
+}
+
 
 static int sc7180_lpass_init(struct platform_device *pdev)
 {
@@ -196,8 +238,85 @@ static struct lpass_variant sc7180_data = {
 	.free_dma_channel	= sc7180_lpass_free_dma_channel,
 };
 
+static const struct lpass_variant sc7180_hdmi_data = {
+	.hdmi_tx_ctl_addr	= 0x1000,
+	.hdmi_legacy_addr	= 0x1008,
+	.hdmi_vbit_addr		= 0x610c0,
+	.hdmi_ch_lsb_addr	= 0x61048,
+	.hdmi_ch_msb_addr	= 0x6104c,
+	.ch_stride		= 0x8,
+	.hdmi_parity_addr	= 0x61034,
+	.hdmi_dmactl_addr	= 0x61038,
+	.hdmi_dma_stride	= 0x4,
+	.hdmi_DP_addr		= 0x610c8,
+	.hdmi_sstream_addr	= 0x6101c,
+	.irq_reg_base		= 0x63000,
+	.irq_ports		= 1,
+	.rdma_reg_base		= 0x64000,
+	.rdma_reg_stride	= 0x1000,
+	.rdma_channels		= 4,
+
+	.rdma_dyncclk		= REG_FIELD_ID(0x64000, 14, 14, 4, 0x1000),
+	.rdma_bursten		= REG_FIELD_ID(0x64000, 13, 13, 4, 0x1000),
+	.rdma_burst8		= REG_FIELD_ID(0x64000, 15, 15, 4, 0x1000),
+	.rdma_burst16		= REG_FIELD_ID(0x64000, 16, 16, 4, 0x1000),
+	.rdma_dynburst		= REG_FIELD_ID(0x64000, 18, 18, 4, 0x1000),
+	.rdma_wpscnt		= REG_FIELD_ID(0x64000, 10, 12, 4, 0x1000),
+	.rdma_fifowm		= REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000),
+	.rdma_enable		= REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000),
+
+	.sstream_en		= REG_FIELD(0x6101c, 0, 0),
+	.dma_sel			= REG_FIELD(0x6101c, 1, 2),
+	.auto_bbit_en	= REG_FIELD(0x6101c, 3, 3),
+	.layout			= REG_FIELD(0x6101c, 4, 4),
+	.layout_sp		= REG_FIELD(0x6101c, 5, 8),
+	.set_sp_on_en	= REG_FIELD(0x6101c, 10, 10),
+	.dp_audio		= REG_FIELD(0x6101c, 11, 11),
+	.dp_staffing_en	= REG_FIELD(0x6101c, 12, 12),
+	.dp_sp_b_hw_en	= REG_FIELD(0x6101c, 13, 13),
+
+	.mute			= REG_FIELD(0x610c8, 0, 0),
+	.as_sdp_cc		= REG_FIELD(0x610c8, 1, 3),
+	.as_sdp_ct		= REG_FIELD(0x610c8, 4, 7),
+	.aif_db4			= REG_FIELD(0x610c8, 8, 15),
+	.frequency		= REG_FIELD(0x610c8, 16, 21),
+	.mst_index		= REG_FIELD(0x610c8, 28, 29),
+	.dptx_index		= REG_FIELD(0x610c8, 30, 31),
+
+	.soft_reset		= REG_FIELD(0x1000, 31, 31),
+	.force_reset	= REG_FIELD(0x1000, 30, 30),
+
+	.use_hw_chs		= REG_FIELD(0x61038, 0, 0),
+	.use_hw_usr		= REG_FIELD(0x61038, 1, 1),
+	.hw_chs_sel		= REG_FIELD(0x61038, 2, 4),
+	.hw_usr_sel		= REG_FIELD(0x61038, 5, 6),
+
+	.replace_vbit	= REG_FIELD(0x610c0, 0, 0),
+	.vbit_stream	= REG_FIELD(0x610c0, 1, 1),
+
+	.legacy_en		=  REG_FIELD(0x1008, 0, 0),
+	.calc_en		=  REG_FIELD(0x61034, 0, 0),
+	.lsb_bits		=  REG_FIELD(0x61048, 0, 31),
+	.msb_bits		=  REG_FIELD(0x6104c, 0, 31),
+
+	.clk_name		= (const char*[]) {
+					"pcnoc-sway-clk",
+					"audio-core",
+					"pcnoc-mport-clk",
+				},
+	.num_clks		= 3,
+	.dai_driver		= sc7180_lpass_cpu_hdmi_dai_driver,
+	.num_dai		= ARRAY_SIZE(sc7180_lpass_cpu_hdmi_dai_driver),
+	.init			= sc7180_lpass_init,
+	.exit			= sc7180_lpass_exit,
+	.alloc_dma_channel = sc7180_lpass_alloc_hdmi_dma_channel,
+	.free_dma_channel = sc7180_lpass_free_hdmi_dma_channel,
+
+};
+
 static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
 	{.compatible = "qcom,sc7180-lpass-cpu", .data = &sc7180_data},
+	{.compatible = "qcom,sc7180-lpass-hdmi", .data = &sc7180_hdmi_data},
 	{}
 };
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

