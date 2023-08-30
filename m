Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87EB678D8BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbjH3SbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245442AbjH3PQ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 11:16:26 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FBE1AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 08:16:23 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401b0d97850so55949075e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 08:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693408581; x=1694013381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rrt4a699i+AvDDfDTXr/DAFWWKZxU5rCQSifRowm6A=;
        b=MiU9PuHoC41K2mRXN8hvvomlXuhate2gxkFIWa0rjmbfbBoBRc5+Xk4hiKDLz6x5TE
         DQwO/doqKKQ0/4u6OIsAUzVwqVV74lVtT7LIAjz5TvCRldXxgxhJhDpaCfiOLMxhQKMe
         Z5mabpGxO2bJVEoQNV0TPV5KpzIlVSN7ZuZgYNbIDjoIWnJhXAhA/HRApCANLDbZuFI+
         vgBQrUUR50TS50dsu8lkZqdEuGvMsHQIKKJ6zKOklXarf0GAcDB7TjNhUrsrVrgDRbif
         exocSLMMJFFXmz7NuhwKXuGmT+GUGoxrulDovXu4kAclehze1UeBOLME7+NYuOxKZWYI
         61lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408581; x=1694013381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rrt4a699i+AvDDfDTXr/DAFWWKZxU5rCQSifRowm6A=;
        b=AiIcWcocNzprngFeIv6wuf68b7T8veXZdwwNMSUnbZwESXa17U+iv3uXKCtOOOrkXX
         H+z7kwRtLUk0iYLIvWEU53Kbn+RpGEwQcep82sJeV6s8YN+yYlQBKplbUWLdTm4DM4kH
         2i9ubemkxpZtNYHhP6qnMum6rt37NgVm5yIVO/oiyOyS6J2TIPmz/Vl0GJRhKug5PCH/
         eiqrFZgH+sedf7acslHumEzgTPbogioQPJjvOLrxmNjtg6TSlzidcw/Kt/Ijyl4968sh
         tFt6hm3pyXT7JDsOU3gqNuQK/BiDYz7VUcPb5nCU32treb3+wIkVVojEkQxUKEoalF19
         JGJg==
X-Gm-Message-State: AOJu0YyXE7T8pv4x2lKt3mPWJDCHDBFv/1UNkVf5Z44+mSFAl78zkUGS
        ZUf3zyKP6WVqfGsgUrvwhCpEPg==
X-Google-Smtp-Source: AGHT+IFnjoXKkeWNfEEbs7aWoUiJxuX3OYd4ptVg9EBd8GX7/EKqFsAH/EkyMd9uRUbyj4VqXmVdQA==
X-Received: by 2002:adf:e54f:0:b0:31c:6591:d40d with SMTP id z15-20020adfe54f000000b0031c6591d40dmr1959708wrm.29.1693408581696;
        Wed, 30 Aug 2023 08:16:21 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0030fd03e3d25sm16989961wru.75.2023.08.30.08.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:16:21 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 03/10] media: qcom: camss: Fix genpd cleanup
Date:   Wed, 30 Aug 2023 16:16:08 +0100
Message-ID: <20230830151615.3012325-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
References: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Right now we never release the power-domains properly on the error path.
Add a routine to be reused for this purpose and appropriate jumps in
probe() to run that routine where necessary.

Fixes: 2f6f8af67203 ("media: camss: Refactor VFE power domain toggling")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 35 ++++++++++++++---------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a925b2bfd8989..c6df862c79e39 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1538,6 +1538,20 @@ static int camss_icc_get(struct camss *camss)
 	return 0;
 }
 
+static void camss_genpd_cleanup(struct camss *camss)
+{
+	int i;
+
+	if (camss->genpd_num == 1)
+		return;
+
+	if (camss->genpd_num > camss->vfe_num)
+		device_link_del(camss->genpd_link[camss->genpd_num - 1]);
+
+	for (i = 0; i < camss->genpd_num; i++)
+		dev_pm_domain_detach(camss->genpd[i], true);
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -1627,11 +1641,11 @@ static int camss_probe(struct platform_device *pdev)
 
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
-		return ret;
+		goto err_genpd_cleanup;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
 	if (ret)
-		return ret;
+		goto err_genpd_cleanup;
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -1643,7 +1657,7 @@ static int camss_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(camss->dev, &camss->v4l2_dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
-		return ret;
+		goto err_genpd_cleanup;
 	}
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
@@ -1693,28 +1707,19 @@ static int camss_probe(struct platform_device *pdev)
 err_v4l2_device_unregister:
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
+err_genpd_cleanup:
+	camss_genpd_cleanup(camss);
 
 	return ret;
 }
 
 void camss_delete(struct camss *camss)
 {
-	int i;
-
 	v4l2_device_unregister(&camss->v4l2_dev);
 	media_device_unregister(&camss->media_dev);
 	media_device_cleanup(&camss->media_dev);
 
 	pm_runtime_disable(camss->dev);
-
-	if (camss->genpd_num == 1)
-		return;
-
-	if (camss->genpd_num > camss->vfe_num)
-		device_link_del(camss->genpd_link[camss->genpd_num - 1]);
-
-	for (i = 0; i < camss->genpd_num; i++)
-		dev_pm_domain_detach(camss->genpd[i], true);
 }
 
 /*
@@ -1733,6 +1738,8 @@ static void camss_remove(struct platform_device *pdev)
 
 	if (atomic_read(&camss->ref_count) == 0)
 		camss_delete(camss);
+
+	camss_genpd_cleanup(camss);
 }
 
 static const struct of_device_id camss_dt_match[] = {
-- 
2.41.0

