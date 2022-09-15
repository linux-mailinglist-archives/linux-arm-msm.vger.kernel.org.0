Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCB25B9AFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 14:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiIOMjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 08:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiIOMjB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 08:39:01 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1B180498
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:38:59 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l8so8425884wmi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kAZv18kXUCWvtykG7jA+P3fmOwgdcns1b4nN2opdgaY=;
        b=YMFknw/gQEtWbcY+cioCGHrSwKgqjFxxHJwyAqoumz4tOkxkqnUddkpsA7CAIzwlrN
         4/awiX3hVFI7KsTyhb1dFB0ePEqgPiE6Z5mavLAfOrnu8QqUkoceZVVOUIyvqplAfkcZ
         Y4DjTbc246HdSWob43dnvAF/83xlSK0/zdlxLRGOb2LE+nbVH95Pj/IILTtsYj2849+N
         eCtmMpSAROPRhmqlfZtcAxFjv2/WstYnhUW6U60ZMKitRT3sAJb7vgPaGv0wF3+kPaV6
         yJp4oAhOwtwvPjypl+OnbRhau0lasiDEReesQTxqufJz0lFYrlZ3MRog/qaswFlzDhpl
         RMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kAZv18kXUCWvtykG7jA+P3fmOwgdcns1b4nN2opdgaY=;
        b=O05ywH98xHKUBkxOErFNe4BPIxQeeS4nyWC7siFZD5l9WB84Z24aP1kgKWEf2AelAR
         oq++bXt1IxmmYqiBwXqlU5cGaIwt//DhdK7aHvwCxiuJTsM82UCKWcjLO1MPzZf8JTxT
         UDUuxM2OCLusook285IUNETemvrVYv9k4vFs5Aox3yfpxO5juGNBmWCrip846dWxZpv/
         rGqABifJgnEfjkzMAUeMc0odh8T3DYrL7vGtztCOg0+YPL/6rVXbNW/IKHBso/4wpqnh
         3anZEXng2Hg/m+08G+fNzpS/zc6kPujtzDxJi/brnacrSmca/kEnMVzfaG0ETWkzv1+b
         lXLw==
X-Gm-Message-State: ACgBeo1ExVs7dtcZjtYVDHzYQiZbNmcQBJM1nk1XuJPfJ7O8Rkqwd6aI
        ND1auG4yQL48rMtmXjnC45we3A==
X-Google-Smtp-Source: AA6agR51zM7l4hwR8w1N1Qc0v/BpSnm9BXj7bIPvQC+ORcdIgdiz0yE/u3RyjnyeQ7ftseSMyCQf1g==
X-Received: by 2002:a1c:f217:0:b0:3a6:61f2:a9c2 with SMTP id s23-20020a1cf217000000b003a661f2a9c2mr6600625wmc.88.1663245538291;
        Thu, 15 Sep 2022 05:38:58 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:38:57 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 7/9] ASoC: qdsp6: audioreach: add support to enable SAL Module
Date:   Thu, 15 Sep 2022 13:38:35 +0100
Message-Id: <20220915123837.11591-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
References: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to Simple Accumulator-Limiter module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 76 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 11 +++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 37f1408f6f6f..168bc3020b74 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -656,6 +656,77 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
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
+	param_data->param_size = sizeof (*limiter_enable);
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
+	param_data->param_size = sizeof (*media_format);
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
@@ -976,6 +1047,11 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_CODEC_DMA_SOURCE:
 		rc = audioreach_codec_dma_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_SAL:
+		audioreach_sal_set_media_format(graph, module, cfg);
+		audioreach_sal_limiter_enable(graph, module, true);
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

