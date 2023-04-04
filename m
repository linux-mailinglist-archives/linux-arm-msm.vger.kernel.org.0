Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0BD36D621F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbjDDNJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234985AbjDDNJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCF010F2
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o20so30834342ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uOl0j0yVJTK0EO6FSNMdqRAG1vOcMrWWtGv1m7YFSI=;
        b=vIDo6hrp0SsxqRH6Uv1juxRiWj9HpUqcTxUDOuZifv5/4IuOJzd3ENqjaArKL/b6C7
         9SV+9TY9xlFkMLqS+vyL6xbDHrsN0/cqm600ZCDEC25soKgBD0XJxLnjUH6ARspLBh32
         AbY5r/C2RqpAc8/xekQNTrQnh61NQi3MH9M40wCd0C3DSMkTlu1yXjZ3Y4UywEu/7Gza
         ry30Y+uzL1TylrxsJI6ndpYRDnaH/rtmJI3LT/Otbi0D3wYZjo6bdjnHnV3hi+X424fu
         uRZJExIiZk6qxBZBmJxwFlxKAzqbWhyG+DVxMS84Is5KuJ6VL7sk0DvZqKkaUsEWVswY
         lpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uOl0j0yVJTK0EO6FSNMdqRAG1vOcMrWWtGv1m7YFSI=;
        b=FaUgWFBxNoy48N/IuIH6wNwYPTP67SNqOYOs8b51Qn3F12h6Zn/MoADBp743EqAqeD
         GzF3Irhftn5dCaAHAZ+cDZBLkoeW+MlFg2fE7sIH5+WRE27elpQBs03C4XVBXaYAf7qG
         YxBocON7I1TxyPGnqgPgry2/KrOJjwWaKA/Tmx7EwsKhhNNGfLjyNiHbh7LpLhUY3HnU
         aqOoJttqkXNg+vEpt1BBUPA59uAfkMmpmTPuDFLjAJh1AZ3Y5NI+60tS20Y3R2ayYF+F
         P259arm+sbzeayt2kutIrkqRb73MLCFnjHc7hQxout5SAD/AlCZLhY0eFG05IKwHnan6
         oGug==
X-Gm-Message-State: AAQBX9eZ76+HOHCVqEKmUeeUnbIIKXV5so4jI1zNj9tXOKUmPnWzDrda
        0LJ/6RdY0rWcfaQwr2xye1fLig==
X-Google-Smtp-Source: AKy350aVLgQ/q/7zADbN+1dfDFphXTrml+T8MOtnOJWXESjkSrcHni1WiHw6M+WSOSCBnP2SsjkKGg==
X-Received: by 2002:a2e:9251:0:b0:299:a7c7:d4ce with SMTP id v17-20020a2e9251000000b00299a7c7d4cemr526455ljg.21.1680613762977;
        Tue, 04 Apr 2023 06:09:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 28/42] drm/msm/dpu: expand sm8550 catalog
Date:   Tue,  4 Apr 2023 16:06:08 +0300
Message-Id: <20230404130622.509628-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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

Duplicate sm8450 catalog entries to sm8550 to remove dependencies
between DPU instances.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 95bb8dbdecc3..c7247a5739f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -172,6 +172,36 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
+static const struct dpu_perf_cfg sm8550_perf_data = {
+	.max_bw_low = 13600000,
+	.max_bw_high = 18200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	/* FIXME: lut tables */
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
 static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.caps = &sm8550_dpu_caps,
 	.ubwc = &sm8550_ubwc_cfg,
@@ -195,7 +225,7 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8450_regdma,
-	.perf = &sm8450_perf_data,
+	.perf = &sm8550_perf_data,
 	.mdss_irqs = IRQ_SM8450_MASK,
 };
 
-- 
2.39.2

