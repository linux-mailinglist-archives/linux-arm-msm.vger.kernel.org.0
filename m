Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15E353B9AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 15:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbiFBNas (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 09:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbiFBNaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 09:30:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC383A5C4
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 06:30:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u23so7850610lfc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PG45RJTfQj2XjWSZj2kXhwY9Vhlgkfpe3KSbMYv1SXg=;
        b=ICowdS3NsFGInsuCQY+oSItdIn/00ff3gE4cegsRLE7rWajHpvDNc5czmTRirWJ5EN
         IBUseD0ELOSf8xxifl/wTJXLo6XiK32eNjDNF2Y8ZEGTm+MPg3chHwwuxcqPkoNKlzea
         cCH4hqVU8+NnVlT6xCItAMH12wBEXYFvy/QusR+T5Rm8+97FKk3b86c9d9lwJQjl3SZ6
         UDoAFDCZUPP8jEyRtONIa/JxYCLZwHqfk2yak+O4QsrFBaFXjhB11XoFivb1qWV1sPyc
         mgVSl432g1uvNJX2uL1vV+wSGRAgBddaXoETylbzwHeIdJGu8qfXzNwJloltiZ92bUoc
         n/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PG45RJTfQj2XjWSZj2kXhwY9Vhlgkfpe3KSbMYv1SXg=;
        b=AGOPUVs2uST3Ro6XbuxXG3mjXEb5d+dQ9giCimYbf3zLq4IxAaA4UvsGycihe9vAeX
         RwQi1qqOX2KbV8VE+L8eszkCmyNHtugyUzOLwLnTrPgU+eaTZpXptrUCkfUeYfr3Tc3d
         avcQBjZB/nZ0xA0qiTrfn8lFc/FuEu9gdyNn4iBmxAdAqpxGMfjAS12hm+dH5tWxKvRO
         zaBTo/bpuG5eQqHY2Qe+6sVpmUU/FtXOFXC6qm/EsehqrkOeE0cHAEo/1Hgdak+hei4g
         i4eQHkk/CZTVYH0FQ6GSQF1Sxtbn5sI9UwLFdP0vDxHpV58G1KA0UvJz1kl8NTrpe7VY
         C01A==
X-Gm-Message-State: AOAM5335e3mRy/pf/V5NclSUfNuc/QveujP7UWValETJRv8407pnG+ED
        PNbX7et7xNXyYFQsXJP56afvqQ==
X-Google-Smtp-Source: ABdhPJwsGpLx3ruWHLAbARxmIoFNvLXYLpf3TPFN0B7byKmO560u6ocpc9Z1diwoDBQuD/O31tAPlQ==
X-Received: by 2002:a05:6512:1681:b0:477:a451:131a with SMTP id bu1-20020a056512168100b00477a451131amr3481880lfb.318.1654176643189;
        Thu, 02 Jun 2022 06:30:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:30:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/7] drm/msm/dpu: remove hwversion field from data structures
Date:   Thu,  2 Jun 2022 16:30:35 +0300
Message-Id: <20220602133039.1739490-4-dmitry.baryshkov@linaro.org>
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

The driver should not depend on hw revision for detecting features.
Instead it should use features from the hw catalog. Drop the hwversion
field from struct dpu_mdss_cfg and struct dpu_hw_blk_reg_map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c        | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h       | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 1 -
 15 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cff6fe3a85ac..367279371e8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2002,7 +2002,6 @@ struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
 	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
 		if (cfg_handler[i].hw_rev == hw_rev) {
 			cfg_handler[i].cfg_init(dpu_cfg);
-			dpu_cfg->hwversion = hw_rev;
 			return dpu_cfg;
 		}
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f70de97f492a..4225f58d8f97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -826,8 +826,6 @@ struct dpu_perf_cfg {
  * @mdss_irqs:         Bitmap with the irqs supported by the target
  */
 struct dpu_mdss_cfg {
-	u32 hwversion;
-
 	const struct dpu_caps *caps;
 
 	u32 mdp_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index c33e7ef611a6..7d416bf4ae91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -61,7 +61,6 @@ static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 			b->base_off = addr;
 			b->blk_off = m->ctl[i].base;
 			b->length = m->ctl[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_CTL;
 			return &m->ctl[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 4ad8991fc7d9..6f20d6b6dddd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -169,7 +169,6 @@ static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
 			b->base_off = addr;
 			b->blk_off = m->dsc[i].base;
 			b->length = m->dsc[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_DSC;
 			return &m->dsc[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 355894a3b48c..3e63bf4fa64e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -83,7 +83,6 @@ static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
 			b->base_off = addr;
 			b->blk_off = m->dspp[i].base;
 			b->length = m->dspp[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_DSPP;
 			return &m->dspp[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 61284e6c313d..01bb2d84c3a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -403,7 +403,6 @@ static void __intr_offset(struct dpu_mdss_cfg *m,
 {
 	hw->base_off = addr;
 	hw->blk_off = m->mdp[0].base;
-	hw->hwversion = m->hwversion;
 }
 
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 3f4d2c6e1b45..b2ca8d19fdd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -80,7 +80,6 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 			b->base_off = addr;
 			b->blk_off = m->intf[i].base;
 			b->length = m->intf[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_INTF;
 			return &m->intf[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 25d2eba28e71..b41993269d09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -46,7 +46,6 @@ static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 			b->base_off = addr;
 			b->blk_off = m->mixer[i].base;
 			b->length = m->mixer[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_LM;
 			return &m->mixer[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index c06d595d5df0..b053d68d38da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -26,7 +26,6 @@ static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
 			b->base_off = addr;
 			b->blk_off = m->merge_3d[i].base;
 			b->length = m->merge_3d[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_PINGPONG;
 			return &m->merge_3d[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 47c6ab6caf95..6538e195cfe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -54,7 +54,6 @@ static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
 			b->base_off = addr;
 			b->blk_off = m->pingpong[i].base;
 			b->length = m->pingpong[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_PINGPONG;
 			return &m->pingpong[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 0a0864dff783..ab7f1a4cc578 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -772,7 +772,6 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 				b->base_off = addr;
 				b->blk_off = catalog->sspp[i].base;
 				b->length = catalog->sspp[i].len;
-				b->hwversion = catalog->hwversion;
 				b->log_mask = DPU_DBG_MASK_SSPP;
 				return &catalog->sspp[i];
 			}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index ab3ef162b666..12d3b0067275 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -288,7 +288,6 @@ static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
 			b->base_off = addr;
 			b->blk_off = m->mdp[i].base;
 			b->length = m->mdp[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_TOP;
 			return &m->mdp[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index e4a65eb4f769..550b2e2b3e34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -21,14 +21,12 @@
  * @blk_off:      pipe offset relative to mdss offset
  * @length        length of register block offset
  * @xin_id        xin id
- * @hwversion     mdss hw version number
  */
 struct dpu_hw_blk_reg_map {
 	void __iomem *base_off;
 	u32 blk_off;
 	u32 length;
 	u32 xin_id;
-	u32 hwversion;
 	u32 log_mask;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index 046854c3fbed..789ecc531b43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -223,7 +223,6 @@ static const struct dpu_vbif_cfg *_top_offset(enum dpu_vbif vbif,
 			b->base_off = addr;
 			b->blk_off = m->vbif[i].base;
 			b->length = m->vbif[i].len;
-			b->hwversion = m->hwversion;
 			b->log_mask = DPU_DBG_MASK_VBIF;
 			return &m->vbif[i];
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index bcccce292937..084439fdd3a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -63,7 +63,6 @@ static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
 			b->base_off = addr;
 			b->blk_off = m->wb[i].base;
 			b->length = m->wb[i].len;
-			b->hwversion = m->hwversion;
 			return &m->wb[i];
 		}
 	}
-- 
2.35.1

