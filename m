Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150E17B1719
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 11:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbjI1JVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 05:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbjI1JVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 05:21:10 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA17AC
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 02:21:08 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40651a726acso4141145e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 02:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695892867; x=1696497667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMUOZtKJMrzKTINi50r8H43dxWG3CrCNn5eWPcC1U+s=;
        b=V6KJhyv+CI1ywrMLPvGcD5Kg/O+5RBC9BjqQbRquufFGbdKhhYRWWMUFoLPQO5tKKi
         1UjVua8wPZcqUHIvV5X1oOAprepfb9Er5C53j3R8u5mgANladoYEM9+N7b43ES8U7vEw
         Kjq6coVL6ZgScV3/0SetYdM+FtmRezxvMDn+KwlHoaD9nOBiPv256aI9GvZvwWZcPBnU
         Zkg2cNamY25VJJyzzOEv9nP7UPw0cdKEgVUzyIWcLyVOGV+S28RzHK0balzXcsalUDph
         ouq8diM+9uYwQrCCTv16AtJI7OvVDZi1KLUzp0a/k1mmJg1vtc3DaG1tpZdBV4o230Xx
         zy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695892867; x=1696497667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMUOZtKJMrzKTINi50r8H43dxWG3CrCNn5eWPcC1U+s=;
        b=bs0OIGDGpoSBi9eC0UnI08qKINtlmSgBYo0AwSGm7AFj1hlfemlxAfr3uIdOuf9nQV
         Jy+icIHO+Gcs/D0IhaXeolN/NIbJpOJzPRGuZO48SUQQaJJHQGZ8IX1B5rKph/jRA7QL
         mJeprLvM6tmsr8O7MbuhSdoWrE5tei5SWoReqRZyV2/IaHI+aDFTlgYr1ZNHgeCEduci
         0FlTKLDLVSaSO/YI+rD8TGi5Sdi22lkW45VL10ocgQFe6ZMRGPvhu//X+3D0mXYUv+o+
         Hqkm6l6vHu2kf96OyTo3gRQUn4SI7oLOgnf/a414UFlEfxBhxVeWHFd9A3C+HqMT0KnM
         SlOA==
X-Gm-Message-State: AOJu0Ywpb7eu5+8SBrYItPiJAjChltNv3/dQInzsvv+V9GKXJIiCeBqQ
        L90R0RRbANH+Vn3nvxytnThw3Q==
X-Google-Smtp-Source: AGHT+IHNm24nnyzc21GioxW/QCUjRtrrlArL8lDqRdbG7DKp4ukJxT99U9KptV/WZL8/gUs8oQNJww==
X-Received: by 2002:a05:6000:109:b0:317:f70b:3156 with SMTP id o9-20020a056000010900b00317f70b3156mr674945wrx.28.1695892867487;
        Thu, 28 Sep 2023 02:21:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6e4c:e3c1:5cb8:b60e])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe7c9000000b003197efd1e7bsm5009156wrn.114.2023.09.28.02.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 02:21:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 07/11] firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the SCM allocator
Date:   Thu, 28 Sep 2023 11:20:36 +0200
Message-Id: <20230928092040.9420-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928092040.9420-1-brgl@bgdev.pl>
References: <20230928092040.9420-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new SCM memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index c0eb81069847..41095bf1d4d7 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1314,8 +1314,6 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_profile_change);
 int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		       u64 limit_node, u32 node_id, u64 version)
 {
-	dma_addr_t payload_phys;
-	u32 *payload_buf;
 	int ret, payload_size = 5 * sizeof(u32);
 
 	struct qcom_scm_desc desc = {
@@ -1330,7 +1328,8 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	payload_buf = dma_alloc_coherent(__scm->dev, payload_size, &payload_phys, GFP_KERNEL);
+	u32 *payload_buf __free(qcom_scm_mem) =
+				qcom_scm_mem_alloc(payload_size, GFP_KERNEL);
 	if (!payload_buf)
 		return -ENOMEM;
 
@@ -1340,11 +1339,10 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 	payload_buf[3] = 1;
 	payload_buf[4] = payload_val;
 
-	desc.args[0] = payload_phys;
+	desc.args[0] = qcom_scm_mem_to_phys(payload_buf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
-	dma_free_coherent(__scm->dev, payload_size, payload_buf, payload_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
-- 
2.39.2

