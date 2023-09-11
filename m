Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05ED479C10F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjILAHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 20:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjILAHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 20:07:03 -0400
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535FACBFA2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 16:52:56 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so82069261fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694475950; x=1695080750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhx/zEsdyoBM9jBiOhMicCjevdxtXNPN6wAs5fBT/70=;
        b=p15t2qzF3hE6qZcRUiRFW9AzJ+ORvlUbziGIAWK5/bhKwlcnQH636j1+wBuv4Vm9+2
         fOsR+kkRE31BUU6vMlInVMp5FBMTyYYd3yONq/O+Vl1hvsbCrfcZLlVmE2XH8ID7onPT
         dzLmnB7TY96GZ4Sm6Zh+Wr3590BlCTZvGQ+NO8VPfOZbR0epubjep75oE5KUsqBd1dmR
         YsBwAE3klxxjRftrcH/Gwi/Ng8tUHx0D/XuMWTUZgWEsLgawVwpFzymoeFHhbSCXOYT5
         +tdpY0xEZkoJJuUyybbeDU6UIrEMBH1FEDPeJ3NZ8s7JDhcRTjSoALcio4wDffYe8tMo
         27gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694475950; x=1695080750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhx/zEsdyoBM9jBiOhMicCjevdxtXNPN6wAs5fBT/70=;
        b=mywgKHlTEMW8G+n2/F05h5QX4qJT+QFvo43Rt0ZBA6XU3srLyayxL8Sz8xj+TktdOA
         W0l3iY4m3hUKfXw0VVttBP4EjZpsfj8OTGWGkEld/fdR8nW+6GwGBXKG1UK4CkCM1sGK
         OJr796FpvPgd7HkA00ZQgtkoBsPE7AGNpBwGxsEtcMbPcTf1YpXUop9d5vSOoMaF4uMW
         yh3+WKVM1c0f0c1qNVYTuW/NunBaq80UCThQg7nnDbbbFLYucwDzvaDdcMSCP09A9jvx
         NJzmyDwzEm3h1OR2bux+wVcVZIXSHKoJKW/lcdPCet8nkNuc693nxJZSwQFV1Z/OCxdV
         wgCQ==
X-Gm-Message-State: AOJu0YwiA1nOOycUFbCHnv7Wcp8ECEKiLr3K8A9CBJsnFQzX9uYGG4ae
        hUTG0cXP3SUasjQHs7uPQVaqBU0K5nsxNiFsAvA=
X-Google-Smtp-Source: AGHT+IGIhUPB5OLjdKYahENRlC7pH9VEBVQ9UQZTyZxPlCtlhkHYMOrX4vaP4+H5cQBOeskJNqMCag==
X-Received: by 2002:a19:e057:0:b0:4f8:6d53:a68f with SMTP id g23-20020a19e057000000b004f86d53a68fmr7705579lfj.64.1694468724137;
        Mon, 11 Sep 2023 14:45:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 14:45:23 -0700 (PDT)
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
Subject: [PATCH v4 2/9] drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
Date:   Tue, 12 Sep 2023 00:45:14 +0300
Message-Id: <20230911214521.787453-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Marijn Suijten <marijn.suijten@somainline.org>

This pointer callback is never used and should be removed.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[DB: dropped the helpers completely, which are unused now]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 13 +------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ---
 4 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f2192de93713..7e9c87088e17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -394,15 +394,6 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 			format);
 }
 
-static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
-{
-	if (!ctx)
-		return 0;
-
-	return dpu_hw_get_scaler3_ver(&ctx->hw,
-				      ctx->cap->sblk->scaler_blk.base);
-}
-
 /*
  * dpu_hw_sspp_setup_rects()
  */
@@ -605,10 +596,8 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
 			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
+			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
-		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
-	}
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..ca02f86c94ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -288,12 +288,6 @@ struct dpu_hw_sspp_ops {
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct dpu_format *format);
 
-	/**
-	 * get_scaler_ver - get scaler h/w version
-	 * @ctx: Pointer to pipe context
-	 */
-	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
-
 	/**
 	 * setup_cdp - setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..af4fb54f3c5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -381,12 +381,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	DPU_REG_WRITE(c, QSEED3_OP_MODE + scaler_offset, op_mode);
 }
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-			u32 scaler_offset)
-{
-	return DPU_REG_READ(c, QSEED3_HW_VERSION + scaler_offset);
-}
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..689d06c7d740 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -340,9 +340,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		u32 scaler_offset, u32 scaler_version,
 		const struct dpu_format *format);
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-		u32 scaler_offset);
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
-- 
2.39.2

