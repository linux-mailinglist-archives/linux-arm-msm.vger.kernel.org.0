Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4765B9AFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 14:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiIOMjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 08:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbiIOMjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 08:39:06 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F1E85FA3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:39:01 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id az24-20020a05600c601800b003a842e4983cso13746648wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IeAgNZtS8X1tLcgH+uLrT6e6JPredzlWXqw/7cX/H9c=;
        b=NpEnD4+5UvjApkez7BQRb2H/jI+T6RSMCDPJAnkFcvgXSPoETTKktjQDdmNcFHKOu7
         4wZwR0mf9x+JYp5535hBJcYkUgxbr1Fjqll2o8Iz3WrqhfAGa3H1i+HYFrOw/kkKKAtg
         K1TvILDY1H6J7y8oJG+7RNhKJHm5ueTYTl+RW3+OtXg9lRXESR7fj2V2FskBqsppVz/F
         LOXuolIGk5olSXyopf2OwoJt1uzFmu6ywiWuU0RQTsmBhQwpZ3oxDk/yPgyAl5ZCvUHd
         Evf2/6ARERpQn+ZYEbPh7zoMRUQ8pBD/hGEchnASctsbydhzlkJZWORHqCJHjbXE9asX
         roKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IeAgNZtS8X1tLcgH+uLrT6e6JPredzlWXqw/7cX/H9c=;
        b=yvcyBg1sNgfCe/4kwdeoZjeGTTimdd5aClY2U1mM7vpo5SKqusI3tTKLPp9dH0j2nx
         xLqzXAV0wD5ori8tECS5P5DKbQ/5Rz8LzJ+y1onE8/efiZNAgxGYMoatiNnWD4KFXF2d
         PpwI0jvn+Ry1nhOltQ1YKUqiTpwDIfJ+TYsJqY2YRnOeRQH7SavlHglhkXvy57tbCKoW
         +581loLemn0tjdd0XUvT9x5Cci9okYBG2RkX8FX+w6yTVvZmYqMBurPWDhjxfehAMiae
         WlDcawPTG1UgIjeiC58r2D4xftv/4cYG60gc51HvSqqWgBTlUhJ8ACnfNC/cSmtxK1lf
         f2dg==
X-Gm-Message-State: ACgBeo2zPtCnPTQ0XOeR3Mn2WanuORnrfjFESVi9dion2ruvhNowxFO2
        qaF+NpInNQs0ejKjNiHQbuF4dQ==
X-Google-Smtp-Source: AA6agR64FpbnVidcThBa1wrEKVXvNGP2DM9m3fJynJiGl7+Y0Kee97YdzuC6a+BOEeZEPauV0G4Nbw==
X-Received: by 2002:a05:600c:4f53:b0:3b4:9aad:7845 with SMTP id m19-20020a05600c4f5300b003b49aad7845mr6561451wmq.159.1663245540816;
        Thu, 15 Sep 2022 05:39:00 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:39:00 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 9/9] ASoC: qdsp6: audioreach: add support to enable module command
Date:   Thu, 15 Sep 2022 13:38:37 +0100
Message-Id: <20220915123837.11591-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
References: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to enable Module command which is required for logging
module to be able to debug.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 37 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  5 +++++
 2 files changed, 42 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 05b58239cab6..e88ace794d4f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -729,6 +729,42 @@ static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+static int audioreach_module_enable(struct q6apm_graph *graph,
+				    struct audioreach_module *module,
+				    bool enable)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_module_enable *param;
+	int payload_size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	payload_size = sizeof(*param) + APM_MODULE_PARAM_DATA_SIZE;
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
+	param_data->param_id = PARAM_ID_MODULE_ENABLE;
+	param_data->param_size = sizeof (*param);
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	param = p;
+
+	param->enable = enable;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1075,6 +1111,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
+		audioreach_module_enable(graph, module, true);
 		rc = audioreach_logging_set_media_format(graph, module);
 		break;
 	case MODULE_ID_PCM_DEC:
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 707dfbdbc156..1d1d47d47d40 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -537,6 +537,11 @@ struct payload_media_fmt_pcm {
 	uint8_t channel_mapping[];
 } __packed;
 
+#define PARAM_ID_MODULE_ENABLE			0x08001026
+struct param_id_module_enable {
+	uint32_t enable;
+} __packed;
+
 #define PARAM_ID_CODEC_DMA_INTF_CFG		0x08001063
 
 struct param_id_codec_dma_intf_cfg {
-- 
2.21.0

