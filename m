Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED6D53B9AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 15:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbiFBNaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 09:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbiFBNaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 09:30:46 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F271B3A180
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 06:30:43 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m25so1942113lji.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a5BKrsCH5wRSDRaKNzDTHEmayJvo4QTIDxMaqEjeRG8=;
        b=nVd+4ZAPRm0cVUjYXBnqsjZ1JhLniHfEi/dZXxv9LKQict8KPx3cy8tlVm85l6OXuL
         DO7abeA+wU+zniTW4u3xG7rWfT/YHzRTHt7MzoWYKthAG77NWfBCtXhT+Kf9/QzXTDK7
         yvj3HAhHvMz68u8Tv9g/5b3lpxTGqZsz5AvUNQJU+i5DzRLyXQjLQ+GnBG5KLjWJ+/3u
         zwq+mkhXmLgy32Q+iF7c8ndYNRTkMpembdfiVV4YCiW/OpXNYOxo3cos+xf/KzDDHkMA
         5ln3yHMoL2ZCgp4fFPv4SmMlciRp1oCxBTsP6vuE0Ht6ViZ7IrObFd18FfEfsIrLVt7g
         u9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5BKrsCH5wRSDRaKNzDTHEmayJvo4QTIDxMaqEjeRG8=;
        b=cicwuq7TrFnjS88RQcJg8e9Qqqfyw8jYYdgRQyF2pm4GGY8hLtnDeDUpx7yA/XZjp0
         bBRhAvqLgk6ftFSasCeP8P2afvZ9xfXfiKVRv4k9exWEf0Jsm7pvkdd6Gi49yc6O1VnF
         VQbfWtLYumus9jmrXuOaNHYhMD4ZAOOGdOBn/6ESK8SR1DnnFzw7YarHv+l4qwCEvwaH
         z4uIz24YqB3Szqaul0oLd0X+DKOuQNN8BFTqwuPYhJ4MMAGyjw9DliZvk3JREDhBWIUr
         Ahw3mppY59mbiT+fbqqI+zZ7wmhUVglZRkt9zgRX2VhhJxNOt45cJeVQfJZHLgSQYn9b
         9Ydg==
X-Gm-Message-State: AOAM530laYbEXynq6jjJXOvJPLNRO9Zq0b3CvTJytVkX9nPBXUYmwBb+
        BbHkxoBWGq8e3sgd9jWnh3HY1g==
X-Google-Smtp-Source: ABdhPJxqPDkm6P8TZf43RR96EN+QnP9kfu7BnOBiainUq696bFR7bSNF+F9uU7fJd4dBnDna90OLpA==
X-Received: by 2002:a2e:9ec4:0:b0:253:9bc1:c709 with SMTP id h4-20020a2e9ec4000000b002539bc1c709mr41682720ljk.272.1654176642270;
        Thu, 02 Jun 2022 06:30:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:30:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
Date:   Thu,  2 Jun 2022 16:30:34 +0300
Message-Id: <20220602133039.1739490-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
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

