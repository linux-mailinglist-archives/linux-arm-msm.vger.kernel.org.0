Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03708706E4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 18:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjEQQiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 12:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjEQQiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 12:38:02 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227187A95
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 09:37:54 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510d6e1f1b2so1435211a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 09:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684341472; x=1686933472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQiqGo5OUgc8PM0tlImiY0vOLzMFeyySbnhueagWXW0=;
        b=NXGPRAWs7s+I++k10tlcbvOI3I26C+3zPmAV8+Ii6IBAIZGrOqSEHs9TpiATmbJVQY
         wNIyuJT5G9+qjb0uK6o8T9yStT9hnn6GqXmbk3dtCSlLa1MSqMdGdmbMB+rXMLjwsWUi
         N4+dB/aMHw41SUns7RwI8JV9/UM04Ngc2wMinIfkBALWhMd3RN0Tz2kxJKvUzT2MfHWI
         V9VY5IEE52Yx7L3y1NSZeW0Iwo2dpfK1hqAcdCRdt1PTg8FaaLu5s/LFopYobeAvHRN2
         8PpB1ehRVTtak9Nk6zR6w4idv3tNj4Rs2AdWZLZ7lbAVhasdkQ+149i5pXA1g8TL6HWW
         2IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341472; x=1686933472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQiqGo5OUgc8PM0tlImiY0vOLzMFeyySbnhueagWXW0=;
        b=kDKUm5QWp5P7Akj6iGaAIUtFSqFn2BHNw0cAeS/oFWnH2cGk9vZ1j7DTnMAwpqQHTj
         xrpQ1sbr6FOa+WoiYBfpRokO5M+qHv0IMOsvCd7O88kRJkGlez1u15iwxOXnUuC5wiAa
         UVZgDNLfP4lpBqoESjZn01pWMbOBqK0hNfZI51Tu9yEr7Fi3wPXpaDpf7OlaPzJDuw99
         CVi7nFYHisNI68lX8nEBJk8xl6BPBkObdQeFJsvCzN4SwqIxd1KLfZpO183XB+UuVZv5
         0T5RSCJsvFm1CfzpE/l/TnK+OPShw0b+siIKztoeKfJM/uepraMfV9r/rmOnHCI4vjgB
         RZ/A==
X-Gm-Message-State: AC+VfDzwS6S8lWd2It6WHiV1DoU7L8DfevHsaiPy89Lc35oqpfmRJnT3
        EHDemLjQp5x3mc8XL6u223PBWg==
X-Google-Smtp-Source: ACHHUZ7TeznMBsED643PVkhPKMMGoVADv50a5B4xzD8GPaFmb2nuvThzh6qhr7nSyeCgJ2/pnlVyPA==
X-Received: by 2002:aa7:c0c3:0:b0:50b:cff8:ff1f with SMTP id j3-20020aa7c0c3000000b0050bcff8ff1fmr2388143edp.42.1684341472511;
        Wed, 17 May 2023 09:37:52 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id t21-20020aa7d715000000b0050bc041d2a8sm9284827edq.15.2023.05.17.09.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:37:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] soundwire: qcom: fix unbalanced pm_runtime_put()
Date:   Wed, 17 May 2023 18:37:49 +0200
Message-Id: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 57ed510b0547 ("soundwire: qcom: use
pm_runtime_resume_and_get()") which introduced unbalanced
pm_runtime_put(), when device did not have runtime PM enabled.

If pm_runtime_resume_and_get() failed with -EACCES, the driver continued
execution and finally called pm_runtime_put_autosuspend().  Since
pm_runtime_resume_and_get() drops the usage counter on every error, this
lead to double decrement of that counter visible in certain debugfs
actions on unattached devices (still in reset state):

  $ cat /sys/kernel/debug/soundwire/master-0-0/sdw:0:0217:f001:00:0/registers
  qcom-soundwire 3210000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow
  soundwire sdw-master-0: trf on Slave 1 failed:-5 read addr e36 count 1
  soundwire sdw:0:0217:f001:00:0: Runtime PM usage count underflow!

Fixes: 57ed510b0547 ("soundwire: qcom: use pm_runtime_resume_and_get()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aad5942e5980..f442280af9d3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -614,11 +614,12 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 	struct qcom_swrm_ctrl *ctrl = dev_id;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(ctrl->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(ctrl->dev);
 		return ret;
 	}
 
@@ -1197,11 +1198,12 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(ctrl->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(ctrl->dev);
 		return ret;
 	}
 
@@ -1402,11 +1404,12 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 	struct qcom_swrm_ctrl *ctrl = s_file->private;
 	int reg, reg_val, ret;
 
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err_ratelimited(ctrl->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
 				    __func__, ret);
+		pm_runtime_put_noidle(ctrl->dev);
 		return ret;
 	}
 
-- 
2.34.1

