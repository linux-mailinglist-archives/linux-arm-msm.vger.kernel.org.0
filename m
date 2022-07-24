Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBCD57F4F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 14:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiGXMZS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 08:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbiGXMY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 08:24:59 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F0818344
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 05:24:55 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id k16so8126783pls.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=139SGHEUeM2aejnfQkWBOsWtu/AlzldGV/6Rxr/OVqQ=;
        b=Rck6hZeQJcCVdN98Q/BXR/RPDTY17uN8lQXphU17j7nsJX4HEQUw6qRHCDNu2nE8cy
         0c4i94UTYgtOaZCJNYvETWSIEI9aTAWgoxNX9nPwwjlk67BXJVXyDUteDhSzc53ufoES
         5HIdV3OHGNEEMPjB+vCCAbKrabrCTmjYoB7se8OfOaMBV7rZQCwZ8Fly15ZMRew/P2vl
         M5N5zkX6Gw/nx+yNsf6enQFr3F97YYKftOQC9EQMPmZFfA0wpMSETMrjxcgWFG+jEysV
         srUzQqq67HzdIvd9aPP9ZmV9PEitb+5kBBqMMJW4sao6Yf5J/KSowlVfdHXv2vEy1L+O
         Zd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=139SGHEUeM2aejnfQkWBOsWtu/AlzldGV/6Rxr/OVqQ=;
        b=F6CF/OwMZtBbLRv2iRBIByB/wq/sQq2agHKoRrnliMtkUQDm8hxqfBW/X1onYA4xSw
         INkXSE/zP1ipqc7FHIhvJE2Hdf5dDiau5qrznmw09DHOn02v9tvKiUp07SISIOCyYYC5
         f2wY0vk572xNCloY4720F7sYqf/jdLN1yvsQWlkIe10zzvPt5AgvY9lRWxdHTG1xaSSF
         pzWrSz9Gx4/IwYq0o3TqKKzpCv9fy7i0To3E7HXuruCCW5oIU4ha78hZdx9xYgwcZcLS
         VcOYsX1TEdWboier6vK/2cnHhCHnQg5N0oUyG2Swq1h6hvmQXhPSg4D2PUmgSLfGs+Lw
         h0gA==
X-Gm-Message-State: AJIora9E5cXPpxb33EVKAOWicNiAhO/ANZshJ/xrhvvQjDH/lqWX+PPG
        SI475CjCvrUGeaJK1E/5RVE9cNzPz3lUBA==
X-Google-Smtp-Source: AGRyM1vLVdU42vU5ntfcZhh5BW+Q6etxX3Wuk7EEylfDOeb4Vng+8HSL26YkBARIQUfBxg2d9rnpsA==
X-Received: by 2002:a17:902:da92:b0:16c:4f7b:8703 with SMTP id j18-20020a170902da9200b0016c4f7b8703mr7946675plx.75.1658665495077;
        Sun, 24 Jul 2022 05:24:55 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:5a45:a9cd:d7dd:fd01:73c0])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709027ed700b0016c0474fbd0sm7048133plb.34.2022.07.24.05.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 05:24:54 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org, rafael@kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH v2 5/5] thermal: qcom: tsens: Add reinit quirk support for sm6375 controller
Date:   Sun, 24 Jul 2022 17:54:24 +0530
Message-Id: <20220724122424.2509021-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220724122424.2509021-1-bhupesh.sharma@linaro.org>
References: <20220724122424.2509021-1-bhupesh.sharma@linaro.org>
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

tsens controller(s) on Qualcomm sm6375 SoC might start in
an unknown state or start with TSENS_EN indicating
a 'disabled' state when they enter linux world.

In such cases, it is useful to try and reinit them via
trustzone [via scm call(s)], at the very start.

Add hooks for the same in the qcom tsens driver.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 928b6a44fda8..0141ea43c290 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1083,6 +1083,16 @@ int __init init_common(struct tsens_priv *priv)
 	if (tsens_version(priv) >= VER_0_1)
 		tsens_enable_irq(priv);
 
+	/*
+	 * For some tsens controllers, which start in
+	 * an unknown state or start with TSENS_EN indicating
+	 * a 'disabled' state, its useful to try and reinit
+	 * them via trustzone, at the very start.
+	 */
+	if (priv->needs_reinit_wa &&
+	    (of_device_is_compatible(dev->of_node, "qcom,sm6375-tsens")))
+		__tsens_reinit_worker(priv);
+
 	tsens_debug_init(op);
 
 err_put_device:
@@ -1145,6 +1155,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,msm8996-tsens",
 		.data = &data_8996,
+	}, {
+		.compatible = "qcom,sm6375-tsens",
+		.data = &data_tsens_v2_reinit,
 	}, {
 		.compatible = "qcom,sm8150-tsens",
 		.data = &data_tsens_v2_reinit,
-- 
2.35.3

