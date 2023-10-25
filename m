Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929A57D700A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 16:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344392AbjJYOq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 10:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343719AbjJYOq0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 10:46:26 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9A01AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 07:46:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-508126afb9bso1818536e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698245168; x=1698849968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fCndReggPj8sG1syb2HDBs4AgKt0DkohlqpGAodX1o=;
        b=FKuEN7LlUjU3EuB1MvIf+R5ndIIbioVnEoXnbS24KtQZm0kOKTcxDKN8Dg3mq95fhg
         7Ob66Y95QWJXVrV3TzmAGOuG/80QP5Hn04qS/W9KTdZxfRVfW9KSE7w/ehX/c0EBiOnJ
         hjdJtQZvYKpmulRi7UoRCD3rMk3SmdHWc9gSUkZa8JDmaUB3dvArV8cSKHNBNHuvLd0L
         lFLFjgrm6i0BAIqI6gRIQHkLvOK5WsIMePMKNjeBBf3ToEjWHO4cV2YkekPF/5IYkGXD
         mLj+AaN2DR5OgsVVOyw2ENyafV8cb4Aw8FU2LRIH2O8vN7hh00lKY/vBaTUHVKxKLZ/a
         8sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245168; x=1698849968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fCndReggPj8sG1syb2HDBs4AgKt0DkohlqpGAodX1o=;
        b=jYlpt0NB567+GFrxA2jVAtZtCPkZID1ZlXg1ZYawa9VgN0r3hN5ce1hwkA3vQkjoq2
         34IblUGm6NDUjaTEL+H/se2FfUpR7OPgKDbUO4N4lL2yoS+vKwHl5ulPE9t8V5FcO8ih
         qJUKsF0NM4vlEtYWVU6CO71jHwi7x2ak25LFs3jorc0OdDBEYnGR2V+MoAI7OjLVLiKm
         uGSUu+I0OkOei8uBbv8CvnTeA0ztERDwxJEafIHGwNyq41TVzl1QpWOBjQOg0l1lA5NN
         09IvVbdvt8f+fMFetsZ9sgqCLFSrdDsgrWbwNYycinBvpU8KdFTn2+muaIwq2O0LUUZ5
         yGmQ==
X-Gm-Message-State: AOJu0YyDdXQK4l7FSLL2R69VXMAPpsbmgA3VFxOrHmZ/ALlYy8/bAmpn
        403bl/1pxx67tvOKhL9JHE7kfg==
X-Google-Smtp-Source: AGHT+IFNwe40aLcfWcgRqBNwoh4xuwRuxRmryBZCAYASICKbNwYeSIEIxBm3Mc2QFFfX2zJNfG3p9w==
X-Received: by 2002:a19:7419:0:b0:4fd:c715:5667 with SMTP id v25-20020a197419000000b004fdc7155667mr10143878lfe.20.1698245168251;
        Wed, 25 Oct 2023 07:46:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600011c100b0032dcb08bf94sm12267138wrx.60.2023.10.25.07.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:46:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] soundwire: qcom: drop unneeded DAI .set_stream callback
Date:   Wed, 25 Oct 2023 16:45:59 +0200
Message-Id: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm Soundwire controller drivers do not support multi-link setups,
so DAI .set_stream() callback will not be used.  What's more, if called
it will overwrite the sdw_stream_runtime runtime set in DAI .startup
(qcom_swrm_startup()) causing issues (unsupported multi-link error) when
two Soundwire controllers are passed as codec DAIs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f1b8d6ac5140..fe65c26c5281 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1267,16 +1267,6 @@ static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int qcom_swrm_set_sdw_stream(struct snd_soc_dai *dai,
-				    void *stream, int direction)
-{
-	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
-
-	ctrl->sruntime[dai->id] = stream;
-
-	return 0;
-}
-
 static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
@@ -1349,7 +1339,6 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.hw_free = qcom_swrm_hw_free,
 	.startup = qcom_swrm_startup,
 	.shutdown = qcom_swrm_shutdown,
-	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
 };
 
-- 
2.34.1

