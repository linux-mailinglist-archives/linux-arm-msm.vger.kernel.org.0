Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E037BE8F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377493AbjJISKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377501AbjJISKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32F394
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50306b2920dso5897237e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875051; x=1697479851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZwa0pFgCMFZxcM0RszFBciS+5iPHBS674kLGB71TRA=;
        b=G0q4QKzNWE/Z9/JyJDVtfo9lrZHhSfg7ceF5fYqgQGfFf2b+RBWYu6VCTTuUKkDgXF
         Ngp8cxl8w0V/RcmKJ5evlYI5dTwRoVl1GgzywyoTbaGTbsyqU9KGfmHm+QbdrXWOlvJH
         kIsW+fR+fy6+TPZm/gC+VkLsWv6y5WqXsxsDt0sdh+EkaBNLvczFkMG0fDzAdWuPZ3yG
         E9eduJGos5Skq1BC/0R63ncMGS34RjCj5b+1RsCBItIQVByp3c3p6S8Ej1jLlPEflrHs
         ks4Pk3haRQwKD7RsNwE9sCBpA+0Vw686NUoQd+oe0f6Ig4nDTeapWCsNkiE7LGcH4iz0
         cYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875051; x=1697479851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZwa0pFgCMFZxcM0RszFBciS+5iPHBS674kLGB71TRA=;
        b=mX9th4MnmndGVCV4ZzLmB1z8wWd/GWCnfx2yHhVnMyMQBjsdzt+j/+Clapn/BTcV5H
         UO5Vt1frgPL/3G6ObZWLLbl6hsnAXfFltNYpgxwZAEWtus7BM33BLWUB7dVisJA0kAli
         65wi9WQ9NGQ73UIUuhFpDtWZ/5FCxxj+zK0Cv6/gum/gZE8+Nvwurv1dI4HamVBiqOBO
         yb0I7Jn1jkedBauU/pCygbgZW4zNurK38T16A8ttEIXbVNF+LCCmFZQ+ino6LDBMOVVn
         nA1optZv4NQN69P77jOoTcNXjHSU39v2N0frBisk2ew1ci7lWSjMEyNurfYNjGk1jwRd
         P9GQ==
X-Gm-Message-State: AOJu0YyadrzN8MyMI3dKtEF5PLmAc6so250WhVu4AErZnWeDp9dcoaA2
        jKlfkywNcUGuQYrfW1+iCsAAth+Qnglj0SaR0dAEXg==
X-Google-Smtp-Source: AGHT+IHB8Mlg9v9SxjoA3EGE5SW6POwWDALdsXrDXYH3reUJFjnex74mPryQPf10KoMTICNodeQdIA==
X-Received: by 2002:ac2:4d8a:0:b0:500:a93d:fc78 with SMTP id g10-20020ac24d8a000000b00500a93dfc78mr10614914lfe.31.1696875051018;
        Mon, 09 Oct 2023 11:10:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 12/13] drm/msm: make fb debugfs file available only in KMS case
Date:   Mon,  9 Oct 2023 21:10:39 +0300
Message-Id: <20231009181040.2743847-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Don't register the 'fb' debugfs file, if there is no KMS (and so no
framebuffers).

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 06fc632fd6f9..04d304eed223 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -266,6 +266,9 @@ static int msm_fb_show(struct seq_file *m, void *arg)
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
+};
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
 		{ "fb", msm_fb_show },
 };
 
@@ -314,9 +317,13 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	if (priv->kms)
+	if (priv->kms) {
+		drm_debugfs_create_files(msm_kms_debugfs_list,
+					 ARRAY_SIZE(msm_kms_debugfs_list),
+					 minor->debugfs_root, minor);
 		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
 				    dev, &msm_kms_fops);
+	}
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

