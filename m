Return-Path: <linux-arm-msm+bounces-72020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645AB438AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6741C23E78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D272F83C5;
	Thu,  4 Sep 2025 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1Dj6fPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88A62EB854
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756981568; cv=none; b=uoaXd+jRiJNiWNsQK7XkMk6lkPqsa+UfTiW6kSVHP3jJ/+MNN4lj+N+WiC+E/icn/OQQyYBsPK3im3H5evLlZfdY49+lcFYlXH5XUcwN9BK34JBEFvMr1nLKDF3iwf+ReojVd2OPx9OOUJI3E+fHOyV1iMcMVFpNHLy+daGiWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756981568; c=relaxed/simple;
	bh=l9J2Y9GpKLwrRdU9wenRiFKqKWiew3Y04G0qCOr/oI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrTZNAzI6k9ah3JCYjR+FqSh4NDHTSMTI9eHx6ltGBMSkyoFslOY5UHIjbWS+COgOcPoZMjPfivodqfzEs9lcDzjiwsvdZycYwf10+suheovoB2DJ0pFjHGFbI/xA92g0up25i07e9dQYbsPp6tzhr9hMLdYhy6RgISwL4pMo14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1Dj6fPy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61ec2b5cb49so140206a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756981565; x=1757586365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roQCLGhiuskOQD+2xmHpY0PjCIA3HKeawtbBCLIt+vs=;
        b=e1Dj6fPy/J6d7dq1j+Q2XvcpUutphFZEQ46f+aFidlJ9IH8FviYvm53tabJVBVd4Fy
         hAEHhO7KJSr3il5uhm7jDGO3GQ/me53qvC4GslhWyAsvgKCkRs7ev8SCTvqNdH83Hs8R
         4OrfuByl2KoDkCDqb/ACqekhcxVmuWlGyzGIGCXEq+c+gbOwWNodqBwalljXCdaf8PGg
         5MtaAgh3Y5APkQ3InwR5/mlKtCry48dKKust37moV5EBtuo5lMayExcGWFRcsPY3m1O7
         pcwS98xWRpbnCb743SoGqi2uKMbYwieRwjDa1ZVlwrDQFZTiXnUp42pusTuECw8qb5ba
         InHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981565; x=1757586365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roQCLGhiuskOQD+2xmHpY0PjCIA3HKeawtbBCLIt+vs=;
        b=jTusMDJFpJeYGWe8NPsFx8nP0a697mVdP/1ygWlDCd6SoYtsNyo0XwEEym60ZQeeIi
         CIuwly4QUvqC0usBBHdJQ5wdyd/eP7HYDbv7wVHEMDUnQZkncGn1lx5QkMEaApTSE/mE
         sNfpiiop61AdIZDuzVUy8MMLKENDVb8opyFLTxlCVLGm1V0F+BQNpm3AWu5Bd0m3FySC
         e/UEY7qX8pTNSki1NQgZ6foMsoQHBqlvlp6+1nDYR45l00BLGXVJhy13e7q3Ly55gF0r
         /7er4q8VrmI6agHL7EPzGDa7DxK7Z3UjZHvIa2Q8fErvhb9pokGBqSmMafHMmG6urb0e
         ARYw==
X-Forwarded-Encrypted: i=1; AJvYcCWveM7bf6Jv584Xu9gXZpX6HefYwb20AvQdTm8dFa4Rj1PvZ+3K8UA5J/Spboqco0+dHHh0KH+jRJprKra2@vger.kernel.org
X-Gm-Message-State: AOJu0YwDx9Mb7+lkgqy/0gA3GvKFiwue4nliURlCoM0W/VwsEschHNWU
	AtwkPm+nTk89IGhNUAkj8xV0ojmGsP9mbBPClrKcDyaI7L9nlgp7IYWTIwcmSgoIPY0=
X-Gm-Gg: ASbGnctYJGp9cFrqXRRvFaifDPfRvD9SMDIeI/ddKdCPVp6j4z2BiuuDyfWYIhPcjaB
	qkdLcdoq3xbUop579i1AJ0JpYAsBWwEo5qruKDKvHcPIZmJr7bxKNAZRPD5jxxuoQOVO9hHiO2q
	fgQl+usmOEZ9bfCeGVa1m4X1ZeWNUthw4/RRwmkIdXNKhulDV+WZ5j8A9ErCjiuWOz2tVciT7c5
	0rPMKInwxxmS30IepmDWgxrHexCePUaFWsWvL3gVME/SUOnIk8UceC6mVj/xvRu+i8pmyKaZwR7
	DC6fURYr3VDNdHZr3jHQDQIjA7kwZrluFNkPDK58pYzWf4B0TTRs0nnuGarB1rfA3HWXgJZdW3q
	Ua0pcvm8LIAKgeSq7zukyWZXOuVaxMcMqO8/17O5Or/mA
X-Google-Smtp-Source: AGHT+IFMcY4NNygYdryRH3vv7REs5OjZETxmxPeh7SzLDvISkTJRooOcN1ItpxWlE+izGlMtyGbQKA==
X-Received: by 2002:a05:6402:13d0:b0:61c:cfb2:b2ce with SMTP id 4fb4d7f45d1cf-61d0d5f339cmr10009875a12.7.1756981564942;
        Thu, 04 Sep 2025 03:26:04 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc5306e6sm13887446a12.47.2025.09.04.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:26:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] ASoC: qcom: audioreach: Add support for VI Sense module
Date: Thu,  4 Sep 2025 12:26:00 +0200
Message-ID: <20250904102558.143745-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
References: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6940; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=l9J2Y9GpKLwrRdU9wenRiFKqKWiew3Y04G0qCOr/oI8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouWk3PXrD70gNfzF7M7XRC6448VWZUkwRVT0Y6
 cMVkwdF27qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLlpNwAKCRDBN2bmhouD
 1ycdD/9rCKePxVitTgq6M/pa/Aaxq4iRBewOmkLiFBKotxE2DNHsgBp/fCIcdntNiH0r6A9qVYt
 EF4OQQ88Lt3/MhEelrFBZlF/DjbeOUpsKoyVy1JMyfBQsQhIq3VCqvvNY3s7dHRewL4EkXWdIf2
 GPAjTrgHjEqF+wqUgoI3yEUjaqbyQZxiz4tDjuio141kPVQUNowUIyzS8K/8dRvl2kfe8qcMgwW
 fbqpmW4W0p8NC7fzXn192C3+UE8Z6eCe2PltLKErQYHbngqVO2YsmbjnvVSqrY/UKl+fCypKscg
 WscU2zIK4Ei8pGGHqMmGEwFeempCU1n0ky03jVNzHbsnfiBQMbz9CC5rzT8wEGmKdoUAoKgTR1D
 qKfSDQpnnXpd296IC7ysNX2idIMOgMWvXLBVLJArRa6HNeeRLBLsNnciCV6oW6Yzw5WoNoZHsz3
 z+EjXqhQx4BgVKzPzlttmfJgF24ZlZDG3QXXtqfJRPDM90x6QPXygWNW8czwUM/xDsJ9WsBaHjI
 JuZEusdZqlAwJg4q4iyeWp1NhwAwj/2a4QHdBf1DW34WQLFxYsR0q3jDX/LCZyJ90kZd6YwIXif
 aBdkiv9s6DsjSEu9A4LTOX3KvagXaZeFQlvGLiJZYSz07hKy4VxzpKcjRrXUXHv8aXmc/Q++xFm ajqPjv+R0Y7ozFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

VI Sense module in ADSP is responsible for feedback loop for measuring
current and voltage of amplifiers, necessary for proper calibration of
Speaker Protection algorightms.  Implement parsing
MODULE_ID_SPEAKER_PROTECTION_VI from Audioreach topology and sending it
as command to the ADSP.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Use PARAM_ID_SP_VI_OP_MODE_NORMAL
2. Make num_channels u32
3. I did not change uint32_t type in the header for consistency
---
 sound/soc/qcom/qdsp6/audioreach.c | 112 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  27 +++++++
 2 files changed, 139 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3b7dffd696e7..f344ce80676f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -202,6 +202,31 @@ struct apm_display_port_module_intf_cfg {
 } __packed;
 #define APM_DP_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_display_port_module_intf_cfg), 8)
 
+struct apm_module_sp_vi_op_mode_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_vi_op_mode_cfg cfg;
+} __packed;
+
+#define APM_SP_VI_OP_MODE_CFG_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_module_sp_vi_op_mode_cfg) + \
+				(ch) * sizeof(uint32_t), 8)
+
+struct apm_module_sp_vi_ex_mode_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_vi_ex_mode_cfg cfg;
+} __packed;
+
+#define APM_SP_VI_EX_MODE_CFG_PSIZE ALIGN(sizeof(struct apm_module_sp_vi_ex_mode_cfg), 8)
+
+struct apm_module_sp_vi_channel_map_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_sp_vi_channel_map_cfg cfg;
+} __packed;
+
+#define APM_SP_VI_CH_MAP_CFG_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_module_sp_vi_channel_map_cfg) + \
+				(ch) * sizeof(uint32_t), 8)
+
 static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
 				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
 {
@@ -1258,6 +1283,89 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 operation_mode);
 }
 
+static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
+					    struct audioreach_module *module,
+					    struct audioreach_module_config *mcfg)
+{
+	u32 num_channels = mcfg->num_channels;
+	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
+	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
+	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
+	int op_sz, cm_sz, ex_sz;
+	struct apm_module_param_data *param_data;
+	int rc, i, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	if (num_channels > 2) {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+		return -EINVAL;
+	}
+
+	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
+	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
+	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_channels * 2);
+	ex_sz = APM_SP_VI_EX_MODE_CFG_PSIZE;
+
+	payload_size = op_sz + cm_sz + ex_sz;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	op_cfg = p;
+	param_data = &op_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
+	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	op_cfg->cfg.num_channels = num_channels;
+	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
+	op_cfg->cfg.quick_calibration = 1;
+	/*
+	 * op_cfg->cfg.r0_t0_selection should be set only for normal mode, keep
+	 * as 0 for calibration
+	 */
+	p += op_sz;
+
+	cm_cfg = p;
+	param_data = &cm_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SP_VI_CHANNEL_MAP_CFG;
+	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	cm_cfg->cfg.num_channels = num_channels * 2;
+	for (i = 0; i < num_channels; i++) {
+		/*
+		 * Map speakers into Vsense and then Isense of each channel.
+		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
+		 * [ 1, 2, 3, 4]
+		 */
+		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
+		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
+	}
+
+	p += cm_sz;
+
+	ex_cfg = p;
+	param_data = &ex_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SP_VI_EX_MODE_CFG;
+	param_data->param_size = ex_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	ex_cfg->cfg.factory_mode = 0;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
 
 int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
 				struct audioreach_module_config *cfg)
@@ -1312,6 +1420,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 		rc = audioreach_speaker_protection(graph, module,
 						   PARAM_ID_SP_OP_MODE_NORMAL);
 		break;
+	case MODULE_ID_SPEAKER_PROTECTION_VI:
+		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		break;
+
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 9f6ddcf081ee..a03949b790bd 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -32,6 +32,7 @@ struct q6apm_graph;
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
 #define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
+#define MODULE_ID_SPEAKER_PROTECTION_VI	0x070010E3
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -554,6 +555,32 @@ struct param_id_sp_op_mode {
 	uint32_t operation_mode;
 } __packed;
 
+/* Speaker Protection VI */
+
+#define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
+#define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
+#define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
+#define PARAM_ID_SP_VI_OP_MODE_FACTORY_TEST	2
+#define PARAM_ID_SP_VI_OP_MODE_VALIDATION	3
+struct param_id_sp_vi_op_mode_cfg {
+	uint32_t num_channels;
+	uint32_t operation_mode;
+	uint32_t quick_calibration;
+	uint32_t r0_t0_selection[];
+} __packed;
+
+#define PARAM_ID_SP_VI_EX_MODE_CFG		0x080011ff
+struct param_id_sp_vi_ex_mode_cfg {
+	uint32_t factory_mode;
+} __packed;
+
+#define PARAM_ID_SP_VI_CHANNEL_MAP_CFG		0x08001203
+struct param_id_sp_vi_channel_map_cfg {
+	uint32_t num_channels;
+	/* [ Vsense of ch 1, Isense of ch 1, Vsense of ch 2, Isense of ch 2, ... ] */
+	uint32_t channel_mapping[];
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
-- 
2.48.1


