Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2DA7CBF2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 11:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343504AbjJQJ2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 05:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343505AbjJQJ17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 05:27:59 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8FB10B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:52 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c51388ccebso36385821fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697534870; x=1698139670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXDfrkRFjIjR94nZZSpkfzNz1jI2kgyWWuq0UTG9XIg=;
        b=fFeawgat0Sczyut0tag09U/ltOegrDq/rUNI8GJxaTXRBCsRbIKawP2Lt3tUk0mKo9
         aZdpnWHg9IFVlsPPN4ZFpeRXjjEmCGlWMzYKJTy/j2LxzAptTd5Y5wHVvkAzUEOP6qZA
         b0WEQb8MDWgOxS83SzOERQJk8abBIH3pUzoLxLRyFiYw2MlrSJFhRRjaZHd4gtg8KOrp
         1I+xOYrSzEagHZrCu/nsibbl/jX++BFG6j9EEhoGhBcwhY7cMF07TgSFt8lqOPoOxxYT
         1zmcgS0GnyKnWO0nrSeqmNEePHVQin4kpdT87+kFjZWzi+FxIyT2gX90a6ExM8Frd+z3
         UK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534870; x=1698139670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXDfrkRFjIjR94nZZSpkfzNz1jI2kgyWWuq0UTG9XIg=;
        b=FrfsbXMry29VLqSdfxK0ZfUOIMEF2t/S3LJVmAR4D9C0swS2WXWFpAR8vjGduCQe/o
         QURUyEpFBAdh4RLHv4b20XfACYLBW/LD8d92XTGHxTiZtUzEECY7CuROSjYgHhxFfigZ
         Hu1sczD5XY7TRo0zn7xxiTdmIKrGOcU6fCDgJBysKiiHR+P+OpLQM25+G/avKwqds/Zh
         mSIThnqYr6DENTWLm7i26ZAfZqDHg15j7A5A3qdInyAqZUcZDHk2pVKFiM0Nbyh4Q13t
         06ZXpN1nbb8KWlyfkQyEyoR2de1zapm1nqwJqIocDugDZ4OZ0Ffb5yO7w+zE1zBLp+GG
         RIMw==
X-Gm-Message-State: AOJu0Yz5AyQBGxu60anUKEPTNT01o1QRSK9XBTEtb/pULSW02G3WbCQj
        rjjWf3eWqHFMmAEkXjRGbc9YMg==
X-Google-Smtp-Source: AGHT+IGLmNP5+XZewXTAdQODfI913sRUMiSt/+BJzdFG2wKbktbbnDW3qD15k7xWtoEZ82RCoT1mXg==
X-Received: by 2002:a2e:2e19:0:b0:2c5:4a0:f3cb with SMTP id u25-20020a2e2e19000000b002c504a0f3cbmr1254873lju.11.1697534870285;
        Tue, 17 Oct 2023 02:27:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003fe1c332810sm9460787wms.33.2023.10.17.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:27:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 10/15] firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ allocator
Date:   Tue, 17 Oct 2023 11:27:27 +0200
Message-Id: <20231017092732.19983-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017092732.19983-1-brgl@bgdev.pl>
References: <20231017092732.19983-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of manually kmalloc()ing it and then mapping to physical space.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Maximilian Luz <luzmaximilian@gmail.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
---
 drivers/firmware/qcom/qcom_scm.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 11638daa2fe5..3a6cefb4eb2e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1525,37 +1525,27 @@ int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id)
 	unsigned long app_name_len = strlen(app_name);
 	struct qcom_scm_desc desc = {};
 	struct qcom_scm_qseecom_resp res = {};
-	dma_addr_t name_buf_phys;
-	char *name_buf;
 	int status;
 
 	if (app_name_len >= name_buf_size)
 		return -EINVAL;
 
-	name_buf = kzalloc(name_buf_size, GFP_KERNEL);
+	char *name_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							     name_buf_size,
+							     GFP_KERNEL);
 	if (!name_buf)
 		return -ENOMEM;
 
 	memcpy(name_buf, app_name, app_name_len);
 
-	name_buf_phys = dma_map_single(__scm->dev, name_buf, name_buf_size, DMA_TO_DEVICE);
-	status = dma_mapping_error(__scm->dev, name_buf_phys);
-	if (status) {
-		kfree(name_buf);
-		dev_err(__scm->dev, "qseecom: failed to map dma address\n");
-		return status;
-	}
-
 	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
 	desc.svc = QSEECOM_TZ_SVC_APP_MGR;
 	desc.cmd = QSEECOM_TZ_CMD_APP_LOOKUP;
 	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL);
-	desc.args[0] = name_buf_phys;
+	desc.args[0] = qcom_tzmem_to_phys(name_buf);
 	desc.args[1] = app_name_len;
 
 	status = qcom_scm_qseecom_call(&desc, &res);
-	dma_unmap_single(__scm->dev, name_buf_phys, name_buf_size, DMA_TO_DEVICE);
-	kfree(name_buf);
 
 	if (status)
 		return status;
-- 
2.39.2

