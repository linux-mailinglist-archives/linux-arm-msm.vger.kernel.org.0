Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD707B171A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 11:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbjI1JVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 05:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjI1JVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 05:21:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB2A91
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 02:21:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3215f19a13aso12511419f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 02:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695892866; x=1696497666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxuIylgD4O5skgVzMv0zVAkT/q/ETWmaZKIykuazMpk=;
        b=QsZQMhMR3GBlsKJ7Hh7RI2aRGHO/11F+Zwd3LGwooLhEF9xpYgSdM3YZKHCuA3LTH0
         pY3AuWOHLJmI3j/pyBmu5avFSn9jqc6wUDK5UmCDZ3vE6OeoC51UGWYj4lz8HHH7zqhv
         1Y3FnQImB+qkBxQNrbPKvsRchdc9j+z43X9h/yVD++PpY9SX3O/f6u1OPiYpU5jnX7Jm
         lw74P8IZDMlNPlk73nRG896X8r4SuyqB8s1bRccr6oINpNlge11A4BVeoMfhqGBWAH+6
         Kgqz1kN8uU3gDZxTA7M91vFsL15dZMKb07d1SqRCAAMyFXKoJDiDcw+PeJAeMy4Y9zAe
         oJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695892866; x=1696497666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxuIylgD4O5skgVzMv0zVAkT/q/ETWmaZKIykuazMpk=;
        b=kMncGoD7/4aLUKp6os0Way30E1ha9Bvgfm9iMNdGSWhTHFWyW0YJaSFXp6RHPM7mH8
         qeH0/sDnxIR2k8inbsw28v2FAqTMjoLJ+O9Ctmi+N5v+DXp3ERuTX5+UAQBlZXqsziVm
         46IU2fd+0RU5nKZiILml3Bd04YYUXOaOmcJdbqp24XH6iCrB1JbcvOMKuaW35gh5oAJj
         C/hCdZ4ULk1y8Xl0nesWcgl3UjiA8MTRdiGnfOQTQeSXsPVqv8OaFtsV2HtJl3h9/ttY
         OGJnwlQai5Z+/8HPNWpfwt6w/TUPvgxIZMX/lCty776MlSfhdZFbXvXxKv34eVYa6Drq
         ZHaA==
X-Gm-Message-State: AOJu0YwuSrDEWlmL4ztbyU4+XBp6NDSFAC01PvN2QNrbzA1gRJjny+TV
        36NQkrn3XvLSlTTk3LvorQKevA==
X-Google-Smtp-Source: AGHT+IFVdk+4oowEHrdz9K3WGGEAaEyXcokWoURuedmb7qV3jLDHDso0F0EVxA9ZdUmIT+q0OGu50Q==
X-Received: by 2002:a05:6000:11c7:b0:321:6005:8979 with SMTP id i7-20020a05600011c700b0032160058979mr787869wrx.17.1695892866569;
        Thu, 28 Sep 2023 02:21:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6e4c:e3c1:5cb8:b60e])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe7c9000000b003197efd1e7bsm5009156wrn.114.2023.09.28.02.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 02:21:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 06/11] firmware: qcom: scm: make qcom_scm_pas_init_image() use the SCM allocator
Date:   Thu, 28 Sep 2023 11:20:35 +0200
Message-Id: <20230928092040.9420-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928092040.9420-1-brgl@bgdev.pl>
References: <20230928092040.9420-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/firmware/qcom/qcom_scm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 02a773ba1383..c0eb81069847 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -532,7 +532,7 @@ static void qcom_scm_set_download_mode(bool enable)
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
-	dma_addr_t mdata_phys;
+	phys_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -544,13 +544,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	};
 	struct qcom_scm_res res;
 
-	/*
-	 * During the scm call memory protection will be enabled for the meta
-	 * data blob, so make sure it's physically contiguous, 4K aligned and
-	 * non-cachable to avoid XPU violations.
-	 */
-	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
-				       GFP_KERNEL);
+	mdata_buf = qcom_scm_mem_alloc(size, GFP_KERNEL);
 	if (!mdata_buf) {
 		dev_err(__scm->dev, "Allocation of metadata buffer failed.\n");
 		return -ENOMEM;
@@ -574,10 +568,10 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 
 out:
 	if (ret < 0 || !ctx) {
-		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
+		qcom_scm_mem_free(mdata_buf);
 	} else if (ctx) {
 		ctx->ptr = mdata_buf;
-		ctx->phys = mdata_phys;
+		ctx->phys = qcom_scm_mem_to_phys(mdata_buf);
 		ctx->size = size;
 	}
 
@@ -594,7 +588,7 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	if (!ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	qcom_scm_mem_free(ctx->ptr);
 
 	ctx->ptr = NULL;
 	ctx->phys = 0;
-- 
2.39.2

