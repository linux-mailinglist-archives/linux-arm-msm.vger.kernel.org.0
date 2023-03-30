Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A506D114A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjC3VyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjC3VyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8289710A90
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x17so26405781lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmC08N5yvRdOHzS3L+tUwwrY0awuChJl1CeUcO1/M4k=;
        b=KcfA++lxeKMXh2ebZhicutvre/IKWzJnH9f/zJ8sUwvTJYOaX81MjAZd/l2+XG7RYk
         09y8rdWJ7JpZGKhJWi+IpAxHWiswEz3rGfDntZVmvTb8X/P+wTn5vZKWTuJQj1O3Ej/e
         r5Ro5n4Ys8wneRWuR1u3krWM1hBvAORTocpNl8T4Ekb2nWeNiTZNe7DajRTkDtLMHx2d
         jLoLBS3EkP8qH6EzHq7lDbSj6ugbmywZ/PIIq++ow7S1QIX0EQLbYRLH2tMPVbJ62X4k
         G8oz4UOqCtH74a910SdlwtM/skKyYSmsEfi6d0LMUv8f33HpCrw3JhEFuB6Zgp7nSjf7
         IjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmC08N5yvRdOHzS3L+tUwwrY0awuChJl1CeUcO1/M4k=;
        b=8BkQ8AtzD9ZuCLqzALoR0oophLdwKg9FBPxiTEo1EIlBYCKXEOgIzFQjBiM/xNmw+0
         n7aI7Fi7lVB+XX14d6AabIvJZcsPaErifYjjFVgTMpn225fXJvXin4eDM0o9jKl6Sebi
         dxiAsB5IftTeLPBGGybPmGYBXpEBulMtxyvJUICyam8aokaMpjNOlO37+XF/EigzBblj
         5SSws1x83A3XNvMR2g39UmWR5a0N75z4EuxwVh1kR5CkAC2bbyvFfndHcaT/3O6Uxw0T
         A5avltPTS3dlVtnPtNc0CGrx59BLLG7qV2sr0wdCl3U4nv3axxStLrNwkM8wFyGl7idJ
         5AjQ==
X-Gm-Message-State: AAQBX9dHLYuic8UYiThSxgWuF66TswNVrwmlMSS+tuSPdngHwKf4TPY/
        WnGbz5GzTEPQVCFwNow8ZBiG7g==
X-Google-Smtp-Source: AKy350bbWr8I4PMVi6+51rPrt+8Egg3vX9hEEIrw1Gb1nQXzegDzVgNt8ktSj1n2r06l1SdR/SBYDg==
X-Received: by 2002:a05:6512:249:b0:4db:38aa:a2f4 with SMTP id b9-20020a056512024900b004db38aaa2f4mr7260944lfo.14.1680213254092;
        Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 25/38] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Date:   Fri, 31 Mar 2023 00:53:11 +0300
Message-Id: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 01ef4115ee4d..33f2d53df13b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.2

