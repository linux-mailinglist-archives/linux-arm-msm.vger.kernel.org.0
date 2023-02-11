Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4166934BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjBKXNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjBKXNV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:21 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F37126F7
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:20 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id m2so23926981ejb.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRjAS7uG6iyNjrkb6EV+82R6Jl5vRfKYziBeu/oJxa0=;
        b=InbCzxV3SrdhkSsdupDlOPWJpqfEWgaaWr7NHY8H3bPrppinWq5gDRblU3UN8O2CuF
         A7ffxARXnN1jNYx52ANKNfDnts6AG2CcPqUdgOE6Wfp7gs7IfARh2P4595L7sljsG6B8
         oxI8DlpBMHvgK5JKGSA2+qAEqdzGSp74mJqmrtgCgmpizt6mnPIoNTdglMT+1z9+sQdM
         /c6tVLEhPnopjsaf4Rb2EWbWsHxTozadMrpBhV2O5kgeAtH0fOSWpjfa2duVL1bgjw49
         mxMD3E2Rut8RAQv0diC80AXiiwfqOGzTz3VhSFK1SJWoxOJtln9YBOmItE43WfS0awAY
         AqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRjAS7uG6iyNjrkb6EV+82R6Jl5vRfKYziBeu/oJxa0=;
        b=ZiS/ceA4P/eXYoliTnQA8N4LZZg2xZyCjC4K8ojmJaC2WfrJshlWL9CRGf6/0agZ8j
         AUj4dxRCGasIVhq/8G90/ylQ4TLHuSC049R2q81k7ZaCGabd+cxsryNbkFpivdPzRMoN
         SiIFA1inbzD3/7tipN/oAFoTceAXdrGpoS6w87tUCWrzWWEZ2o3rU78x/nOEyFoxFnrJ
         +INbOsStBiDHEjN3EbXZgPD8vrx6qIPftopDdBNoHpjPZnAV8mrQK+IwYFjbW59nPDnw
         oWZjk5M/SoML/75SNaioiudXqrNleILclq7HtAZNQgvlOdc+13z1GQGlt3KMAaqj4KtQ
         NCIA==
X-Gm-Message-State: AO0yUKWLyVZj8Xl7uvRVu9z37rvuhqxJu0M+3/WK6XC/iHRkCDm6s/ac
        OF2MfMq0PSrO9K0rjvxeNobLFA==
X-Google-Smtp-Source: AK7set+GRwDKZo0fAe+hcYegszyAqzDwQitmeimNahycQetJmbH4M8VznFVgog5WbAmK2jh5buXpuA==
X-Received: by 2002:a17:907:a420:b0:8b0:f58d:2da9 with SMTP id sg32-20020a170907a42000b008b0f58d2da9mr829210ejc.64.1676157199734;
        Sat, 11 Feb 2023 15:13:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 15/50] drm/msm/dpu: constify DSC data structures
Date:   Sun, 12 Feb 2023 01:12:24 +0200
Message-Id: <20230211231259.1308718-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSC hw catalog data is not supposed to be changed, so mark it as const
data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2d53ed92de85..54d706dfdbec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1829,14 +1829,14 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 	.features = _features, \
 	}
 
-static struct dpu_dsc_cfg sdm845_dsc[] = {
+static const struct dpu_dsc_cfg sdm845_dsc[] = {
 	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
 	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
 	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
 	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
 };
 
-static struct dpu_dsc_cfg sm8150_dsc[] = {
+static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
 	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
 	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e6590302b3bf..a56581b34ddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -867,7 +867,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_merge_3d_cfg *merge_3d;
 
 	u32 dsc_count;
-	struct dpu_dsc_cfg *dsc;
+	const struct dpu_dsc_cfg *dsc;
 
 	u32 intf_count;
 	const struct dpu_intf_cfg *intf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 619926da1441..4e1396575e6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -175,7 +175,7 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
+static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
 				       const struct dpu_mdss_cfg *m,
 				       void __iomem *addr,
 				       struct dpu_hw_blk_reg_map *b)
@@ -207,7 +207,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
 				   const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_dsc *c;
-	struct dpu_dsc_cfg *cfg;
+	const struct dpu_dsc_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
-- 
2.39.1

