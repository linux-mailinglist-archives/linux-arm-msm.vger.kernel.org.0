Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 770076D1148
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjC3VyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjC3VyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7AE10A85
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id br6so26347916lfb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THA5DUvHPQ+QBL52nYEV9tpu0q9xe8F7GdtDC6yUElY=;
        b=L1l5VCjjOrGugOkWjAYfesM48HOoXaUvGkQBeWHDUod2JhXJJM1tJxGU1q8mACQcOW
         jJUMh19gAAmC+w7yn9h4NethUgJq6a7RKyXtBqzVlqC1v8TrzvZ4QlOV7VUnRzBTOxVo
         u9tOKxawcRlK/DIlExi4AcNRcIjOVVKyh+S86mbop2hzRZ84bZ8gmXiHNPRzA8lGSvw7
         SX0n7AUh0MVQdNJwGHWzDg2Tzf3fv6u7qQvRZEzXgjVyf/j3Nmb30ct7SBJjNzsP/FXy
         IrAvVhK8cQLRp42mN6g49h4c0HEL7WRWnhLwz6Ml8yXV1FzgJvpa/vhSe2kg+ZbdkcX7
         dh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THA5DUvHPQ+QBL52nYEV9tpu0q9xe8F7GdtDC6yUElY=;
        b=XTakDbJz/sC5JsPdFuWE/9Qc8Kc1h7HvJEOSprEy2DLMJrUogMv7+yUGHWXVi+GDpe
         x/QGmVqB1digibDUMynPjWYWeD5mkes64+MDR6j6SR5v0FfRMNjWmyReIBIMKXS614YN
         2QzGZJJog8NTBMBPp55OzXfdMUMBMrQUmYoNKouZgsDVkq+Xbv79WjvKCuJC5R4LGlnQ
         wBomAP8CTlURmEektjhQwjARtzeIxX6xJZLPPb4wqZ+EM307fn1N1ME3Fmzq2dkxoQtU
         LyzYhTDf0MbutC/uHJnu/VS7cutjVeyoae8/6i59g7+LqyWY4e0B3gkGHdtxX5A1KpyY
         RdGg==
X-Gm-Message-State: AAQBX9cg0UUpWRlNUoJjmp30zDTv4ZTeoFEjy16dUfRLP2Mc70ESP0n/
        Hk9e5vCX9EVVDuGtyP8bFjTMBw==
X-Google-Smtp-Source: AKy350aMiFLWOXGj92k+fnGY7+ygGYr47Uqs3EWoqoncyX9U8TD45i1h09RqZ6yA1i8grHAS2Lnz7w==
X-Received: by 2002:ac2:5337:0:b0:4d7:59e6:388e with SMTP id f23-20020ac25337000000b004d759e6388emr6619193lfh.46.1680213253510;
        Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 24/38] drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
Date:   Fri, 31 Mar 2023 00:53:10 +0300
Message-Id: <20230330215324.1853304-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For sm8150+ the DPU_CTL_SPLIT_DISPLAY should be replaced with
DPU_CTL_ACTIVE_CFG support (which supports having a single CTL for both
interfaces in a split). Add comments where this conversion is required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e6280b0cb207..6c6f8b4a4be8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8150_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index f19d1c2ba845..cfaa68a25427 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 9afcb6cc50a5..84396240f0d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -41,6 +41,7 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index af80e1ced3ce..49dd4a908413 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 5c437c7682ea..c9d1892ec8f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
-- 
2.39.2

