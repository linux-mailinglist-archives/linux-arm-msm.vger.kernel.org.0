Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C3E53BFA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 22:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237152AbiFBUWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 16:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238756AbiFBUWP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 16:22:15 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D0E2628
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 13:22:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a23so6406019ljd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 13:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s7eYavTJ2IyfY9jHDXu2jRuPLiG7aDtXQT+NSfu50tk=;
        b=yR0aoDnqE76J39THxc5tWWVKoYfcVpqBPsinZ+jS4QgmrI0l5C3h2sFlVbXzPIWHZ3
         3pdiH75a0ctDJvbOR4ItRTj0gyj/p7OgSP5f1OWzrbnv7TWGhuh302xBokOk+NheFYbt
         mWv2Mzj63VaRwFP1JQCAVp2IanYHyR9a10240QeaEwDk2sNqLjZjT+iE6xS5ZOsEv/S+
         Fqza8j/wPBETQV6n7ZjzdIUwLQS5cgGvYjMjVJ66RCD6JQfLnAxn6xCO2Rb3Flut0Q/q
         hjDQG5/F3S2XXeTKakcnO8CJF66ZwwUbnmyGbfFBFJwtOouJpJ35yPfkaG2Jv3iYUJTj
         O1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s7eYavTJ2IyfY9jHDXu2jRuPLiG7aDtXQT+NSfu50tk=;
        b=5rksUpPNrKFmVPiQ5hKvXnelSI06Tp9v4zvNOkbcXwbrsz57kyHN+YsluLydJUzjiZ
         KzsvK4kVy9SVKdOTzLHZic2FAOE3fmSsqndhgrWW/q/PX49USK+iWSMKfAoycqnxGfwr
         KUxb2KCbRtFzwCvQ2iFIKEd9yGkxXTemMd5vvejcjFp2drD9wHkiACcGsJmh6QAVxVcl
         zELNlUH5lLm2yNJTA+Yg5GCzHJaMlY17OuKg1E4dsaQtFltUVyCD6GOq7wwIJ/GCYJ5a
         krYF9PMfWIR8sEBfIvFLTK1uMju7JiBc+vVVPU9vEbMG+y5cmnKdVkmPsT50aisDoVib
         cKow==
X-Gm-Message-State: AOAM5337ga4ZGTZQcTSamLBzi5+ey7Cq/rcvuecGSw85XgmqxhU4NDgN
        rq4FJnhS8zlHOb7OMD+ZV60JDQ==
X-Google-Smtp-Source: ABdhPJzA5y5WSZ/dTFlmKU8pwm+/oNhTAhk8C9hBhtMWxx4aU0yi+41UqVtSdthzn1UJeNPyg6MeqQ==
X-Received: by 2002:a2e:93c8:0:b0:24e:eabd:bf6e with SMTP id p8-20020a2e93c8000000b0024eeabdbf6emr41152420ljh.347.1654201332483;
        Thu, 02 Jun 2022 13:22:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.139])
        by smtp.gmail.com with ESMTPSA id p12-20020a2e740c000000b0024f3d1daef5sm992451ljc.125.2022.06.02.13.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 13:22:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
Date:   Thu,  2 Jun 2022 23:22:02 +0300
Message-Id: <20220602202207.1754351-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
References: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than detecting VBIF_XINL_QOS_LVL_REMAP_000 based on the
hwversion, push the offset to the hw_catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c    | 4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c3759fc4b154..101d9abe652b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1339,6 +1339,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	.default_ot_wr_limit = 32,
 	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
 	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x20,
 	.dynamic_ot_rd_tbl = {
 		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
 		.cfg = msm8998_ot_rdwr_cfg,
@@ -1366,6 +1367,7 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x40,
 	.qos_rt_tbl = {
 		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
 		.priority_lvl = sdm845_rt_pri_lvl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 80bc09b1f1b3..f70de97f492a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -709,6 +709,7 @@ struct dpu_vbif_qos_tbl {
  * @ot_rd_limit        default OT read limit
  * @ot_wr_limit        default OT write limit
  * @xin_halt_timeout   maximum time (in usec) for xin to halt
+ * @qos_rp_remap_size  size of VBIF_XINL_QOS_RP_REMAP register space
  * @dynamic_ot_rd_tbl  dynamic OT read configuration table
  * @dynamic_ot_wr_tbl  dynamic OT write configuration table
  * @qos_rt_tbl         real-time QoS priority table
@@ -721,6 +722,7 @@ struct dpu_vbif_cfg {
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
 	u32 xin_halt_timeout;
+	u32 qos_rp_remap_size;
 	struct dpu_vbif_dynamic_ot_tbl dynamic_ot_rd_tbl;
 	struct dpu_vbif_dynamic_ot_tbl dynamic_ot_wr_tbl;
 	struct dpu_vbif_qos_tbl qos_rt_tbl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index b757054e1c23..046854c3fbed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -30,7 +30,7 @@
 #define VBIF_XIN_HALT_CTRL0		0x0200
 #define VBIF_XIN_HALT_CTRL1		0x0204
 #define VBIF_XINL_QOS_RP_REMAP_000	0x0550
-#define VBIF_XINL_QOS_LVL_REMAP_000(v)	(v < DPU_HW_VER_400 ? 0x570 : 0x0590)
+#define VBIF_XINL_QOS_LVL_REMAP_000(vbif)	(VBIF_XINL_QOS_RP_REMAP_000 + (vbif)->cap->qos_rp_remap_size)
 
 static void dpu_hw_clear_errors(struct dpu_hw_vbif *vbif,
 		u32 *pnd_errors, u32 *src_errors)
@@ -163,7 +163,7 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
 
 	c = &vbif->hw;
 
-	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(c->hwversion);
+	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(vbif);
 	reg_high = ((xin_id & 0x8) >> 3) * 4 + (level * 8);
 	reg_shift = (xin_id & 0x7) * 4;
 
-- 
2.35.1

