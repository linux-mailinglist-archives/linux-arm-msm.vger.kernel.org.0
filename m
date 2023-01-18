Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9695671DF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjARNeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbjARNdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:33:06 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9B458988
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:00:35 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id qx13so24661021ejb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sm3KvwPlX5ZlZpu1sJC95qlBUfmHf+sSOjQts5oP6w4=;
        b=eWiuw1VupXnvMy11nq3QYpNyqkPaLCm88Q2i1HbwVriv1ImNk/4kj6U4e6qZ7zoS2p
         9AtmZnWeFUdqKiHx+jS6uvPPJuQNf8oVFgPcHV5FfzHP8tJHNXrmgxUnaiOLdL5FHwn2
         mqPeJLLH9busDKB9ZXpo07IhFgXJxtX1RZ5DsU69s+LgeC3n7ZT4gNSPNFNCB42JhsgL
         NAl9PMoflw9ahLIGLTmiC92wzl+00CzRsPhbnHGtZk8GaFuz+gl+OYk1DrithQZ7LWi4
         pSAi3wvY5RFuMIqJ7/5ogOorEAU5908HLcuoiZJaEWuP+V3O689D7mTkrhmwtkFKlkTq
         szQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm3KvwPlX5ZlZpu1sJC95qlBUfmHf+sSOjQts5oP6w4=;
        b=H4VgOXhlYRFhQx4aJwGYEs3Lrpr6xRhnakkT8QP8Fs5AfB9zoRgfdDt+necyoo/bSw
         pP6dBnUEBbSCviMQl2WaEi60by0GtxpDl7UOjjOk26gLssenoe6sHtAvc+a8KrQRL8nW
         QT0TFi5qwynawirmBg8ND3A4X1Sjgvu3iUtYgi22ZBikL48rN+Br0YyI0MpHsAWBN/tI
         j5fi9YwTd1jbplm0rWUzeZRNbjPuKYShUt1mHMseYCKS4YfiJkgHwX1mr0CuOFk721rn
         6I0LPU/faM8OwGSjuDCTkcieNJXWjavu5dgf1Bhaqlo/4O9nrriQYRQdL+ToZrXz/VtY
         ir7g==
X-Gm-Message-State: AFqh2koCpH1tsX1KtvjW7HVFnwtU0y3H1Ah75H9thOIVaLVzVcGC/XBm
        OcouJWHBsS0ux28IhtrbWtYu2w==
X-Google-Smtp-Source: AMrXdXsi6XIOo5SjAZhVAQXo6/dHkGjR1TMFLLFrusI0h0DnloR76eYOXbeUYNMgfrDotAc4PX5mRQ==
X-Received: by 2002:a17:906:f299:b0:7c0:fd1a:79ee with SMTP id gu25-20020a170906f29900b007c0fd1a79eemr6707842ejb.63.1674046833497;
        Wed, 18 Jan 2023 05:00:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f17-20020a170906495100b0086dd8f20a6asm5411290ejt.77.2023.01.18.05.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:00:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: simplify pixel clk rate handling
Date:   Wed, 18 Jan 2023 15:00:31 +0200
Message-Id: <20230118130031.2345941-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Move a call to dsi_calc_pclk() out of calc_clk_rate directly towards
msm_dsi_host_get_phy_clk_req(). It is called for both 6g and v2 hosts.

Also, while we are at it, replace another dsi_get_pclk_rate() invocation
with using the stored value at msm_host->pixel_clk_rate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++++++------------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index bd3763a5d723..93ec54478eb6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -129,8 +129,8 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
-int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
-int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
+int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host);
+int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
 void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
 struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 44be4a88aa83..5106e66846c3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -51,7 +51,7 @@ struct msm_dsi_host_cfg_ops {
 	void* (*tx_buf_get)(struct msm_dsi_host *msm_host);
 	void (*tx_buf_put)(struct msm_dsi_host *msm_host);
 	int (*dma_base_get)(struct msm_dsi_host *msm_host, uint64_t *iova);
-	int (*calc_clk_rate)(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
+	int (*calc_clk_rate)(struct msm_dsi_host *msm_host);
 };
 
 struct msm_dsi_cfg_handler {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 18fa30e1e858..7d99a108bff6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -616,28 +616,21 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 }
 
-int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host)
 {
-	if (!msm_host->mode) {
-		pr_err("%s: mode not set\n", __func__);
-		return -EINVAL;
-	}
-
-	dsi_calc_pclk(msm_host, is_bonded_dsi);
 	msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
+
 	return 0;
 }
 
-int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host)
 {
 	u32 bpp = dsi_get_bpp(msm_host->format);
 	u64 pclk_bpp;
 	unsigned int esc_mhz, esc_div;
 	unsigned long byte_mhz;
 
-	dsi_calc_pclk(msm_host, is_bonded_dsi);
-
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
+	pclk_bpp = msm_host->pixel_clk_rate * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 
@@ -2292,7 +2285,14 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	int ret;
 
-	ret = cfg_hnd->ops->calc_clk_rate(msm_host, is_bonded_dsi);
+	if (!msm_host->mode) {
+		pr_err("%s: mode not set\n", __func__);
+		return;
+	}
+
+	dsi_calc_pclk(msm_host, is_bonded_dsi);
+
+	ret = cfg_hnd->ops->calc_clk_rate(msm_host);
 	if (ret) {
 		pr_err("%s: unable to calc clk rate, %d\n", __func__, ret);
 		return;
-- 
2.39.0

