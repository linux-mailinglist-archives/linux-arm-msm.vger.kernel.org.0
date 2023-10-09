Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13587BE76E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377264AbjJIRLR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376797AbjJIRLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:11:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF15AF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:11:14 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50437c618b4so5934361e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871473; x=1697476273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odaHH8HRWc/OWn81iArLzhiK7HKZi0DYnLBmf+zh6T8=;
        b=BwCmecSkg28m56xPJbNFq3qcR0aSuXHEJWANP8qmag/guSWh9NBjdacF7EcTVHsykJ
         Wk5Q3xb6hil2zQbnU+Vqd8LyC4beCk++zKMWr2mEcJgOagnsewSzl7iW0ozqwsma5JME
         Entuy7ADKLqQ5HL41R9iReyC0MX6duo1vD1QJARFPdqEwfyO6vzbOk4U73FweMnBQ59y
         y2Ln4Zimq2d7PFkwVziK3Cahe2DiNYrNUibt/2OwvsIYSvjHdIeRs7CJdOCKIsH/SdU5
         39ZkZnoUeSnfKbmoLa5u/PEeMxh/IxFoHUEb9O/uZivPffNs/hzNnJ509Wby8oJIi0Ty
         0D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871473; x=1697476273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odaHH8HRWc/OWn81iArLzhiK7HKZi0DYnLBmf+zh6T8=;
        b=b0k8aCvNfxj2Lhx5A88WQDdGNdf3SVi65jDTb19FR7zg/5Yfp/+diTg3XchYn/4w/l
         n1A7Q3QNg97Otulir1N1FRx+PoVGvaZuWaQwvKKKJjrzAYl5WXyHM8EnVWnwPQsKB4Yy
         N9bxluWnq3kT9GZWOIXcTm+jUU1FH6Jnk60UCu4SNNR/NztEqta5xI67XICB/82htJ+K
         n7C2kcvcEnH2IEQmnrdhqtYERYfhFdUUxRUoWdKBGxRhdCuxib1IoicxSiFCHn0f3Wva
         wGHmAFyK9gk9szuinhum2sylbdpv3+xkYoOZpVQCTL8pOrGxDE1sJdpyVi9J3Fj+KGq3
         hEUA==
X-Gm-Message-State: AOJu0Yxvn7ghw7Yog1X0qTSrSLcnJLasRUm37XAu7ocQhE4MOzRzLi02
        hfglJTjNF94GR07giQDRT1/UxQ==
X-Google-Smtp-Source: AGHT+IGeXW8xdsBULCu4mHfATtR355O0BFzXB/YgybW5EN9w2hzH/wQNVH3mdwftqYZcXO6Ib8LHcQ==
X-Received: by 2002:a05:6512:3050:b0:503:653:5711 with SMTP id b16-20020a056512305000b0050306535711mr15653664lfb.9.1696871473112;
        Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:11:12 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/msm/dpu: enable writeback on SM8350
Date:   Mon,  9 Oct 2023 20:11:09 +0300
Message-Id: <20231009171110.2691115-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
References: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8cfb1058e3cb..b2896018e05f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -31,6 +31,7 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x2bc, .bit_off = 16 },
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
 };
@@ -304,6 +305,21 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8350_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats,
+		.num_formats = ARRAY_SIZE(wb2_formats),
+		.clk_ctrl = DPU_CLK_CTRL_WB2,
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
 static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -401,6 +417,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.dsc = sm8350_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
 	.merge_3d = sm8350_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8350_wb),
+	.wb = sm8350_wb,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
 	.intf = sm8350_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

