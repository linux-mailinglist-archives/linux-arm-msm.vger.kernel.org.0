Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88DF1607CD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiJUQxi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbiJUQxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:53:24 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D4728B1AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:53:16 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bp11so5527798wrb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OQ1Vt/2QFgasQ2MWgN87SiOCnuqeXhPBQT7NHiM0Fk=;
        b=rOBozg/nN2RN5je3p1RPl2XMpNpj4WdvTEXpCZC39tWajzVNcG57vXDDtC/MoQHnDq
         iFoHhelA5qAfzuHtriP5L0hDlSiJcWgfGp5Yigq7/6UaPfn2NAsNv6wZThLHWzJTp1ns
         AT3moeIhKX97fwlQHM7n7BQl2allYwL5qAoOogJNOPBqitKiJZ4XXoquFQ4Oc9yIRSvw
         lOLEjjfPBIaM5uuIHpX2T7x0Lyp2v+li7wNgcGJihxz0fNkjwcWbnIziYMzZhM9A8nBn
         u6dX1acsvWY51aed0ODYrMRxVHIirGvwyzEclbHoUmOF5PXo/z9Jrx6Gn5mauAohlNwo
         tLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OQ1Vt/2QFgasQ2MWgN87SiOCnuqeXhPBQT7NHiM0Fk=;
        b=1t7n5+EnNbr12JcJrIxpjjXwULPUV3vtniEqNhcpuUvDF7ema7AR+0VRGwmikqi/v6
         3419yTAnm5abzJp4U8oXgEaeeI0X9qMbBXxYb4m9CNE2tsX8TAEXHIGjr6U89ksUUJPC
         LFXJ+5Xckn42g6i07WmXZ8ibh+BwPkSkAJPvZ7+neffipUE5LD79cLX92BG5IKGGOh9m
         +IwqQcwoleeM8i+zzODK36uTfYWMzeSgc1ZmAQVa2Kf/HScQUjjI7Dn4xivd25dgsfRx
         TFkiUkPqmDMN66yz2g72Bfb35Lf66pR4A7Uc0i8ui07Trq44exE3Ycl0Xp67fU6xlzU1
         sTtg==
X-Gm-Message-State: ACrzQf3yscMtuLdnllnCTQ4CMxEqQfJER/StSGT4wJxe+wcGm/I+B1ie
        K3KVlajqbqF3i/GCzvzpL2FUcA==
X-Google-Smtp-Source: AMsMyM4cGDyO0hJjHABKAuO/68s01dMDB9b10k8bO/7x7PTx760dRVJMpnmJhnBY8AIMQ53rlFpI1g==
X-Received: by 2002:a05:6000:15c5:b0:22e:44c5:4973 with SMTP id y5-20020a05600015c500b0022e44c54973mr13466496wry.513.1666371194035;
        Fri, 21 Oct 2022 09:53:14 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:53:12 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 7/9] ASoC: qdsp6: audioreach: add support to enable SAL Module
Date:   Fri, 21 Oct 2022 17:52:05 +0100
Message-Id: <20221021165207.13220-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to Simple Accumulator-Limiter module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 77 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 11 +++++
 2 files changed, 88 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 99cade6d8a48..be7068742fe4 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -658,6 +658,77 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+static int audioreach_sal_limiter_enable(struct q6apm_graph *graph,
+					 struct audioreach_module *module, bool enable)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_sal_limiter_enable *limiter_enable;
+	int payload_size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	payload_size = sizeof(*limiter_enable) + APM_MODULE_PARAM_DATA_SIZE;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SAL_LIMITER_ENABLE;
+	param_data->param_size = sizeof(*limiter_enable);
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	limiter_enable = p;
+
+	limiter_enable->enable_lim = enable;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
+					   struct audioreach_module *module,
+					   struct audioreach_module_config *cfg)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_sal_output_config *media_format;
+	int payload_size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	payload_size = sizeof(*media_format) + APM_MODULE_PARAM_DATA_SIZE;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SAL_OUTPUT_CFG;
+	param_data->param_size = sizeof(*media_format);
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	media_format = p;
+
+	media_format->bits_per_sample = cfg->bit_width;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -978,6 +1049,12 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_CODEC_DMA_SOURCE:
 		rc = audioreach_codec_dma_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_SAL:
+		rc = audioreach_sal_set_media_format(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_sal_limiter_enable(graph, module, true);
+		break;
+
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index df5026b646c1..f2b51d8fc718 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -15,6 +15,7 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_CNV		0x07001003
 #define MODULE_ID_PCM_ENC		0x07001004
 #define MODULE_ID_PCM_DEC		0x07001005
+#define MODULE_ID_SAL			0x07001010
 #define MODULE_ID_CODEC_DMA_SINK	0x07001023
 #define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_I2S_SINK		0x0700100A
@@ -499,6 +500,16 @@ struct data_logging_config {
 	uint32_t mode;
 } __packed;
 
+#define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
+struct param_id_sal_output_config {
+	uint32_t bits_per_sample;
+} __packed;
+
+#define PARAM_ID_SAL_LIMITER_ENABLE		0x0800101E
+struct param_id_sal_limiter_enable {
+	uint32_t enable_lim;
+} __packed;
+
 #define PARAM_ID_MFC_OUTPUT_MEDIA_FORMAT	0x08001024
 
 struct param_id_mfc_media_format {
-- 
2.21.0

