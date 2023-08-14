Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3273877BB19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 16:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjHNOKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 10:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjHNOKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 10:10:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB15510C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 07:10:15 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so40106095e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692022214; x=1692627014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KplshhytImmpQyw5mB6IesvqS1E/jQySdpPPKRVH1y8=;
        b=Db+iqL+dRScBRz1r9rVCg4ofrZc4ryAP/ahe9FHqMFw3kO9yo/0+wfYXjuCerkSDYY
         WvG7cvLKDOhQEIsNNctQyMMIkwjsY7Ga7WpTa1ynXtwda8EVLlbUShL+yvmpjpTFECRY
         21XLDr5UHxjETH+8YYa1EWtfm3ulzWTXvosOMi7HtIFCzzp+XR3Q/4F4MnLcW7jT3yf7
         LZLXQgpxWCMAcPPySKswlGVgng9Nw9uTnJFtyDkeByP5fBHWZIGQUACN7HkSxrq1RXlf
         gy70dgwiczGZp3v5kRkdDJUhXkuz8NYuoAzkpZhUxAtnZDgox/HEmgwfxDHuDH8hJnhO
         ynIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692022214; x=1692627014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KplshhytImmpQyw5mB6IesvqS1E/jQySdpPPKRVH1y8=;
        b=S/Etmo7+t+VC9GQpqGq6M7s7nbIGxIAKw6z52l5p4WhIc01ReDt1Z79E72mNTE7BmJ
         djU5rlM7u0SXVAQiKBfkAm6+6H/cCgsHq0AGIc06OWnTM2vG7xcgU9lwMBodruuZ7Hpn
         T7rO+Pb5S3L+OoolZDpJnifxlef4xVHmFmw92NMVAZPOz+pmfsWNXvPQk44z345TTL7N
         ud8woOictuMhJ/eslN2mXjzn+9mMfomk+IaC17g7hsYsYEU0H6No/umYyXM12kJveBuo
         82R+xJufVUypaS6EG3oENQMQq/1+wGNThTGOjTgdT/Uo/wcNoglz3qVxfeuLUsjVJKfb
         7JEw==
X-Gm-Message-State: AOJu0YyiGZga66eow+219W2up2t76xrbQyHKn7PG9qUxzIyh8rlrWe7j
        8CQlw2rP7yzvJX8gFc88oV7+RQ==
X-Google-Smtp-Source: AGHT+IHxm937qCZuo6lx93Q3By9S5CE8P0jInv7lY2CWLpd0BWKRbjFB5ujIx/zuSaQIsj+KJEbxrQ==
X-Received: by 2002:a7b:cd97:0:b0:3fe:4900:db95 with SMTP id y23-20020a7bcd97000000b003fe4900db95mr7975677wmj.37.1692022214320;
        Mon, 14 Aug 2023 07:10:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b003fe1630a8f0sm17232749wmc.24.2023.08.14.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:10:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v0 2/9] media: qcom: camss: Fix V4L2 async notifier error path
Date:   Mon, 14 Aug 2023 15:10:00 +0100
Message-ID: <20230814141007.3721197-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
References: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
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

Previously the jump label err_cleanup was used higher in the probe()
function to release the async notifier however the async notifier
registration was moved later in the code rendering the previous four jumps
redundant.

Rename the label from err_cleanup to err_v4l2_device_register to capture
what the jump does.

Fixes: 51397a4ec75d ("media: qcom: Initialise V4L2 async notifier later")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 75991d849b571..f4948bdf3f8f9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1617,21 +1617,21 @@ static int camss_probe(struct platform_device *pdev)
 
 	ret = camss_icc_get(camss);
 	if (ret < 0)
-		goto err_cleanup;
+		return ret;
 
 	ret = camss_configure_pd(camss);
 	if (ret < 0) {
 		dev_err(dev, "Failed to configure power domains: %d\n", ret);
-		goto err_cleanup;
+		return ret;
 	}
 
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
-		goto err_cleanup;
+		return ret;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
 	if (ret)
-		goto err_cleanup;
+		return ret;
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -1643,7 +1643,7 @@ static int camss_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(camss->dev, &camss->v4l2_dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
-		goto err_cleanup;
+		return ret;
 	}
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
@@ -1651,12 +1651,12 @@ static int camss_probe(struct platform_device *pdev)
 	num_subdevs = camss_of_parse_ports(camss);
 	if (num_subdevs < 0) {
 		ret = num_subdevs;
-		goto err_cleanup;
+		goto err_v4l2_device_register;
 	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-		goto err_cleanup;
+		goto err_v4l2_device_register;
 
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
@@ -1690,7 +1690,7 @@ static int camss_probe(struct platform_device *pdev)
 
 err_register_subdevs:
 	camss_unregister_entities(camss);
-err_cleanup:
+err_v4l2_device_register:
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 
-- 
2.41.0

