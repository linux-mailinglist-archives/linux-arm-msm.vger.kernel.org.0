Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE53453A9C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 17:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355044AbiFAPQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 11:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355046AbiFAPQT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 11:16:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242F491552
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 08:16:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id be31so3273779lfb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a5BKrsCH5wRSDRaKNzDTHEmayJvo4QTIDxMaqEjeRG8=;
        b=iIhW/TUyY7BXnG4qn4U7YiRUiB550Ng0zhVRH+UWE7jVnxJZnJk4Y7DjIP4mOnXLPU
         4i6kZ+0jE7hnpZz/BFQwIeEP40kIZLzy6AlAKFvLvyb5/URmYiWNBd7iOomcu5Vz18RF
         neHzN5gS7VlapcOrxOe0QzgOf7jEaK//q4Qs1gy3cmlUxLQylaX+vZgE0Lf9f7EEAyd8
         ygTvTrUvw8AGWwyT00ka1j+Gfgte0Ym61jLfbbcMDtvFMIw1Ue/etQRcbewWihIP0zOf
         bQv2omeNRe4RiGNjYM/RIlk+QgSNwUEIIV+nZCUX/WUmwSlaT8MqybjEmVT6afYgc8CP
         mdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5BKrsCH5wRSDRaKNzDTHEmayJvo4QTIDxMaqEjeRG8=;
        b=yuSOZFfMWHtzT61ddxrf2ZEyzDE1BDBBFO3x4QVoBHBa54OpTEEyyDNffT7mksVOaj
         4FA+MxXTP+GlZDxsftqoTNMhUJt2m8dHOLur2EIMIE+96vHrxhEf4HCarzADQR60rzQD
         1HEQsI9ndHGCSZf2IUZAkKy7CO61pGFeIlaAe/3bclc71vYBEYv6G4YihU45lNIxZ8eQ
         03ZFIb34FzbVZ/Kdfk7MArNNxuj43f2voO+QDDa0a10gIzKhmS6DOdnAj5/UjM3uFZIX
         HmVDJAoyF9WflDVTKSmsJiWbE10qzCYf/RDIBMMjwauGQon5AfSSSk6E3XX9IdYsijci
         rj8g==
X-Gm-Message-State: AOAM5315CP/j8P5Y7zuAwvgvtsAIAAcuiV/wvyMwPjeV/6XZFx6nBGq3
        D5AygRMjtmscs2FTGBGtxRoaag==
X-Google-Smtp-Source: ABdhPJwwYNiog1QZJLXHNZEXO+COUEqowr6IIqpKUqSJU3ImFPDuU7AGVkz2Vii44fKbcibkp3fdwQ==
X-Received: by 2002:a05:6512:118b:b0:46b:a9ae:3a3b with SMTP id g11-20020a056512118b00b0046ba9ae3a3bmr157591lfr.188.1654096576500;
        Wed, 01 Jun 2022 08:16:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp17-20020a056512159100b0047255d21186sm415294lfb.181.2022.06.01.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:16:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 2/5] drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
Date:   Wed,  1 Jun 2022 18:16:10 +0300
Message-Id: <20220601151613.1513554-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
References: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
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
index 78c7d987c2ca..cff6fe3a85ac 100644
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

