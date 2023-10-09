Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9957BE78D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377415AbjJIRSI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377412AbjJIRSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:18:07 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7C59E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:18:03 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c3c661f1a8so37540141fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871882; x=1697476682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqf751KKQfxwldVh3O4+QqYv6/dvoeaMh1iiCq2kv80=;
        b=bpwyuEUtwlxIsmn1sogDzsrAcYLDvNXm6ql98YYL0HiJmR3jvCOulef8LfHmy9Oxlq
         YosEPRCRPK9eLH3N2XjZuOSqSg8ODD40lAkkSTkjc0GhYPu9QCArHFYSSoExW95OjpCU
         cTxOwsDU7XscRCL4jmpCH/PtOXyeLdCK5gMQS0L7pE6S2LMejN/jQuXWghiviw7uL0pW
         HmupmjtZGXk8xLIv2UpIqho30n8B+yNmxk0n3l0LWG92rB8K0y/7hETL2X8E48rBz/Ec
         ZyTG3puAzkcYhHenXp8P8BoNwvlBmLozN1EuS+U4VFbG0lkRdtESKzhHW6AWjM4dursq
         HF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871882; x=1697476682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqf751KKQfxwldVh3O4+QqYv6/dvoeaMh1iiCq2kv80=;
        b=rulUhuWb+0cqqisMeM8UcaoMZRLqSVwkazOY3LDazbIe/FGt/feISQZjb8xn/5agKc
         NSLS2XQs4awFDag+ZIgqfPSLF6sZHtdiQ1SPnPsO7BnR7BxM/EUaPPAUyMQoQ2d/cxrd
         OQtL2Yt4wSSq/0YU21cskL18K1OuzeSsvztOn8sMFQTK6WTwzZysf78kKg75FwPFhuJp
         e5v34FFFWUYdkFasqZ7SgWLAmS2udbGXC04VkanU2uRBxnpA1TXkWfD7HuAP8YqB3Z9F
         Kl+4adsFzk2OM0jnRxx25tLPSDwl3jOZUw52X2ZiNVaRRX0AJ8qpwzbl+C5XppdBZ8dz
         uw/A==
X-Gm-Message-State: AOJu0Yw8hy7/EiZuPHb+AUUFzlZrLUZvuHPEtD52pptSFrgDNYeGzVaH
        chnKnJNW55owGDzhKDHl6s4fk7e8L31uTTzKoFWrrg==
X-Google-Smtp-Source: AGHT+IEzTQpRmQ5AlYjb8eVMR+MpL/UW6yD7a6TxSauWCKs8l58SzgMyy/RyM9pU/T8I8AqqipGdOQ==
X-Received: by 2002:a2e:8e98:0:b0:2bf:f32a:1f68 with SMTP id z24-20020a2e8e98000000b002bff32a1f68mr14690515ljk.19.1696871881909;
        Mon, 09 Oct 2023 10:18:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:18:01 -0700 (PDT)
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
Subject: [RFT PATCH 1/4] drm/msm/dpu: enable writeback on SM8150
Date:   Mon,  9 Oct 2023 20:17:57 +0300
Message-Id: <20231009171800.2691247-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
References: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
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

Enable WB2 hardware block, enabling writeback support on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 99acaf917e43..b641e67f6afe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -34,6 +34,7 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
 		[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+		[DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
 	},
 };
 
@@ -297,6 +298,21 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	},
 };
 
+static const struct dpu_wb_cfg sm8150_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
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
 static const struct dpu_intf_cfg sm8150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -393,6 +409,8 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
 	.merge_3d = sm8150_merge_3d,
+	.wb_count = ARRAY_SIZE(sm8150_wb),
+	.wb = sm8150_wb,
 	.intf_count = ARRAY_SIZE(sm8150_intf),
 	.intf = sm8150_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

