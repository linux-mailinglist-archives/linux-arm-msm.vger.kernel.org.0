Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBC14382C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Oct 2021 11:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhJWJ5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Oct 2021 05:57:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:18172 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhJWJ5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Oct 2021 05:57:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634982885; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=AAqSm6gva84wvqaQsX/aY+FAtaAPxcqA8cpqvHr1JHg=; b=R3iiZDJifUZhmrsqEG8yBbXUu+DKLbQqh4t+9ifYBi4+0Cw0w86K0apu3k4TE3QY8HUh1G5f
 qKUgnF93lzbV2GJFT+zT90XysESXC4awFLrD76r7BFisDbH1Ol1r5H4esKYe7VqqF67iFHKp
 cyhzdIxeRsw0bzgWurnuGQ4Qe/I=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6173dbd7fd91319f0f4cfd54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 Oct 2021 09:54:31
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 51C84C43637; Sat, 23 Oct 2021 09:54:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21D23C43617;
        Sat, 23 Oct 2021 09:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 21D23C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH v3 02/10] ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
Date:   Sat, 23 Oct 2021 15:23:54 +0530
Message-Id: <1634982842-7477-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
References: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add lpass interface memebers to support audio path over codec dma.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/lpass.h | 151 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 63aaa6f..33e4ee5 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -19,6 +19,28 @@
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
+#define LPASS_MAX_CDC_DMA_CHANNELS		(8)
+#define LPASS_MAX_VA_CDC_DMA_CHANNELS		(8)
+#define LPASS_CDC_DMA_INTF_ONE_CHANNEL		(0x01)
+#define LPASS_CDC_DMA_INTF_TWO_CHANNEL		(0x03)
+#define LPASS_CDC_DMA_INTF_FOUR_CHANNEL		(0x0F)
+#define LPASS_CDC_DMA_INTF_SIX_CHANNEL		(0x3F)
+#define LPASS_CDC_DMA_INTF_EIGHT_CHANNEL	(0xFF)
+#define LPASS_CDC_DMA_RX0_INTERFACE		(0x1)
+#define LPASS_CDC_DMA_TX0_INTERFACE		(0x1)
+#define LPASS_CDC_DMA_TX1_INTERFACE		(0x2)
+#define LPASS_CDC_DMA_TX2_INTERFACE		(0x3)
+#define LPASS_CDC_DMA_TX3_INTERFACE		(0x4)
+#define LPASS_CDC_DMA_VA0_INTERFACE		(0x1)
+
+#define LPASS_CDC_DMA_INTERFACE(dai_id)	\
+	((dai_id == LPASS_CDC_DMA_TX3) ? \
+	LPASS_CDC_DMA_TX3_INTERFACE : \
+	LPASS_CDC_DMA_VA0_INTERFACE)
+
+#define LPASS_MAX_CDC_CLKS			(9)
+#define LPASS_ACTIVE_PDS			(4)
+#define LPASS_PROXY_PDS			(8)
 
 #define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
 	do { \
@@ -50,6 +72,12 @@ struct lpaif_dmactl {
 	struct regmap_field *burst8;
 	struct regmap_field *burst16;
 	struct regmap_field *dynburst;
+	struct regmap_field *codec_enable;
+	struct regmap_field *codec_pack;
+	struct regmap_field *codec_intf;
+	struct regmap_field *codec_fs_sel;
+	struct regmap_field *codec_channel;
+	struct regmap_field *codec_fs_delay;
 };
 
 /* Both the CPU DAI and platform drivers will access this data */
@@ -64,6 +92,25 @@ struct lpass_data {
 	/* MI2S bit clock (derived from system clock by a divider */
 	struct clk *mi2s_bit_clk[LPASS_MAX_MI2S_PORTS];
 
+	struct clk *cdc_dma_clks[LPASS_MAX_CDC_CLKS];
+
+	struct clk *xo;
+	struct clk *gcc_cfg_noc_lpass;
+	struct clk *core_cc_core;
+	struct clk *aon_cc_audio_hm_h;
+	struct clk *core_cc_sysnoc_mport_core;
+	struct clk *audio_cc_ext_mclk0;
+	struct clk *audio_cc_ext_mclk1;
+	struct clk *core_cc_lpm_core;
+	struct clk *core_cc_lpm_mem0_core;
+	struct clk *audio_cc_codec_mem;
+	struct clk *audio_cc_codec_mem0;
+	struct clk *audio_cc_codec_mem1;
+	struct clk *audio_cc_codec_mem2;
+	struct clk *audio_cc_rx_mclk_2x;
+	struct clk *audio_cc_rx_mclk;
+	struct clk *aon_cc_va_mem0;
+
 	/* MI2S SD lines to use for playback/capture */
 	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
@@ -72,38 +119,61 @@ struct lpass_data {
 	bool mi2s_was_prepared[LPASS_MAX_MI2S_PORTS];
 
 	int hdmi_port_enable;
+	int codec_dma_enable;
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *lpaif;
 	void __iomem *hdmiif;
+	void __iomem *rxtx_lpaif;
+	void __iomem *va_lpaif;
+
+	u32 rxtx_cdc_dma_lpm_buf;
+	u32 va_cdc_dma_lpm_buf;
 
 	/* regmap backed by the low-power audio interface (LPAIF) registers */
 	struct regmap *lpaif_map;
 	struct regmap *hdmiif_map;
+	struct regmap *rxtx_lpaif_map;
+	struct regmap *va_lpaif_map;
 
 	/* interrupts from the low-power audio interface (LPAIF) */
 	int lpaif_irq;
 	int hdmiif_irq;
+	int rxtxif_irq;
+	int vaif_irq;
+
 	/* SOC specific variations in the LPASS IP integration */
 	struct lpass_variant *variant;
 
 	/* bit map to keep track of static channel allocations */
 	unsigned long dma_ch_bit_map;
 	unsigned long hdmi_dma_ch_bit_map;
+	unsigned long rxtx_dma_ch_bit_map;
+	unsigned long va_dma_ch_bit_map;
 
 	/* used it for handling interrupt per dma channel */
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 	struct snd_pcm_substream *hdmi_substream[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct snd_pcm_substream *rxtx_substream[LPASS_MAX_CDC_DMA_CHANNELS];
+	struct snd_pcm_substream *va_substream[LPASS_MAX_CDC_DMA_CHANNELS];
 
 	/* SOC specific clock list */
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct clk_bulk_data *cdc_clks;
+	int cdc_num_clks;
 
 	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
 	struct lpaif_i2sctl *i2sctl;
 	struct lpaif_dmactl *rd_dmactl;
 	struct lpaif_dmactl *wr_dmactl;
 	struct lpaif_dmactl *hdmi_rd_dmactl;
+
+	/* Regmap fields of CODEC DMA CTRL registers*/
+	struct lpaif_dmactl *rxtx_rd_dmactl;
+	struct lpaif_dmactl *rxtx_wr_dmactl;
+	struct lpaif_dmactl *va_wr_dmactl;
+
 	/* Regmap fields of HDMI_CTRL registers*/
 	struct regmap_field *hdmitx_legacy_en;
 	struct regmap_field *hdmitx_parity_calc_en;
@@ -130,6 +200,24 @@ struct lpass_variant {
 	u32	wrdma_reg_base;
 	u32	wrdma_reg_stride;
 	u32	wrdma_channels;
+	u32	rxtx_irq_reg_base;
+	u32	rxtx_irq_reg_stride;
+	u32	rxtx_irq_ports;
+	u32	rxtx_rdma_reg_base;
+	u32	rxtx_rdma_reg_stride;
+	u32	rxtx_rdma_channels;
+	u32	rxtx_wrdma_reg_base;
+	u32	rxtx_wrdma_reg_stride;
+	u32	rxtx_wrdma_channels;
+	u32	va_irq_reg_base;
+	u32	va_irq_reg_stride;
+	u32	va_irq_ports;
+	u32	va_rdma_reg_base;
+	u32	va_rdma_reg_stride;
+	u32	va_rdma_channels;
+	u32	va_wrdma_reg_base;
+	u32	va_wrdma_reg_stride;
+	u32	va_wrdma_channels;
 	u32	i2sctrl_reg_base;
 	u32	i2sctrl_reg_stride;
 	u32	i2s_ports;
@@ -233,12 +321,66 @@ struct lpass_variant {
 	struct reg_field wrdma_enable;
 	struct reg_field wrdma_dyncclk;
 
+	/*CDC RXTX RD_DMA */
+	struct reg_field rxtx_rdma_intf;
+	struct reg_field rxtx_rdma_bursten;
+	struct reg_field rxtx_rdma_wpscnt;
+	struct reg_field rxtx_rdma_fifowm;
+	struct reg_field rxtx_rdma_enable;
+	struct reg_field rxtx_rdma_dyncclk;
+	struct reg_field rxtx_rdma_burst8;
+	struct reg_field rxtx_rdma_burst16;
+	struct reg_field rxtx_rdma_dynburst;
+	struct reg_field rxtx_rdma_codec_enable;
+	struct reg_field rxtx_rdma_codec_pack;
+	struct reg_field rxtx_rdma_codec_intf;
+	struct reg_field rxtx_rdma_codec_fs_sel;
+	struct reg_field rxtx_rdma_codec_ch;
+	struct reg_field rxtx_rdma_codec_fs_delay;
+
+	/*CDC RXTX WR_DMA */
+	struct reg_field rxtx_wrdma_intf;
+	struct reg_field rxtx_wrdma_bursten;
+	struct reg_field rxtx_wrdma_wpscnt;
+	struct reg_field rxtx_wrdma_fifowm;
+	struct reg_field rxtx_wrdma_enable;
+	struct reg_field rxtx_wrdma_dyncclk;
+	struct reg_field rxtx_wrdma_burst8;
+	struct reg_field rxtx_wrdma_burst16;
+	struct reg_field rxtx_wrdma_dynburst;
+	struct reg_field rxtx_wrdma_codec_enable;
+	struct reg_field rxtx_wrdma_codec_pack;
+	struct reg_field rxtx_wrdma_codec_intf;
+	struct reg_field rxtx_wrdma_codec_fs_sel;
+	struct reg_field rxtx_wrdma_codec_ch;
+	struct reg_field rxtx_wrdma_codec_fs_delay;
+
+	/*CDC VA WR_DMA */
+	struct reg_field va_wrdma_intf;
+	struct reg_field va_wrdma_bursten;
+	struct reg_field va_wrdma_wpscnt;
+	struct reg_field va_wrdma_fifowm;
+	struct reg_field va_wrdma_enable;
+	struct reg_field va_wrdma_dyncclk;
+	struct reg_field va_wrdma_burst8;
+	struct reg_field va_wrdma_burst16;
+	struct reg_field va_wrdma_dynburst;
+	struct reg_field va_wrdma_codec_enable;
+	struct reg_field va_wrdma_codec_pack;
+	struct reg_field va_wrdma_codec_intf;
+	struct reg_field va_wrdma_codec_fs_sel;
+	struct reg_field va_wrdma_codec_ch;
+	struct reg_field va_wrdma_codec_fs_delay;
+
 	/**
 	 * on SOCs like APQ8016 the channel control bits start
 	 * at different offset to ipq806x
 	 **/
 	u32	dmactl_audif_start;
 	u32	wrdma_channel_start;
+	u32	rxtx_wrdma_channel_start;
+	u32	va_wrdma_channel_start;
+
 	/* SOC specific initialization like clocks */
 	int (*init)(struct platform_device *pdev);
 	int (*exit)(struct platform_device *pdev);
@@ -250,10 +392,19 @@ struct lpass_variant {
 	int num_dai;
 	const char * const *dai_osr_clk_names;
 	const char * const *dai_bit_clk_names;
+	const char * const *cdc_dma_clk_names;
+
+	const char * const *active_pd_names;
+	const char * const *proxy_pd_names;
+	struct device *active_pds[LPASS_ACTIVE_PDS];
+	struct device *proxy_pds[LPASS_ACTIVE_PDS];
+	int active_pd_count;
+	int proxy_pd_count;
 
 	/* SOC specific clocks configuration */
 	const char **clk_name;
 	int num_clks;
+	int cdc_dma_num_clks;
 };
 
 struct lpass_pcm_data {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

