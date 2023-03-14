Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEB26B99CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjCNPhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCNPhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:19 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CE1B3289
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b13so16450052ljf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8AY2x4RlliuFkg2Z8nj7IhCEeLlc7LNImyvgGViYUQ=;
        b=NAwJRccVG8PhOICMTTBlwaMgBHAML3Sr6mgGnOX7C0iWCU6Nn3eHZ2EZZSWtBrq4Cr
         K9HY0eUZevEgvyLAx/rKaZP6kbHL7o0zGfT8l3qirIgEYPAFfNC1yswZjS2LEaCqUPtz
         7zCtEnB52iBBgSB7aDCahvPyM3KRQtFr68fKre8Cnbv0+DtfO+hvdQAPqJ+3/SPdzE8S
         XJdTg/OFy7AYDOn1edJJ4Gfkiuc6NmbyvV950470oIztA3VSkJQXkKcLOdWIcNUuyWit
         sDvAaT0jKq02eA/KmzVR0/TSlZd33F2p7xvQVY2WNphLkBVycLyPYc1ooJu9nZlp9MI6
         vINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8AY2x4RlliuFkg2Z8nj7IhCEeLlc7LNImyvgGViYUQ=;
        b=SV1cX7E4dYyZFOjnpm9i70A+k1Degi0OaZZn53W3g0K2CTM55mXPkuSrKmB6K8Co42
         Zfwf8Qz2Olnko3M2wR9YqDtA/P0gi71xV2NZJE2wywP61cznZ585+HcVhluNKWk3O9iL
         WWjXqRy4ONuJHgQ9VIySqiZvVFtq6XsLPF7lgKSgVDDJ0RVvaU028I7s9AqWp24pWFPP
         LXLt/9bktV0ZQMetKvR/KKGokDuFlEBa1Hj7TmmyyWd++3rhyneI9dwkFkcK9BYNbyyD
         38/ev2YjalWR4pSv3Oa7ArPTUR3MxT484iJIShDe5TAOJgn7oBOHSuL5ISwsPL5p4lXY
         fr+w==
X-Gm-Message-State: AO0yUKVZOhBM2dz50yDYVdORvvfSnGdLQPvsy5z2RJFXFUrYndTQArQU
        48c3IfpURVceC/L1GW36iiVRLQ==
X-Google-Smtp-Source: AK7set8drnYJdNNAOTEFe8xSf353UXYmHIurctxJXtUdLMlnNv6nbwCZggbnrfx0Lz7da4bgRMPVyQ==
X-Received: by 2002:a2e:9217:0:b0:298:9d0c:ad65 with SMTP id k23-20020a2e9217000000b002989d0cad65mr1024286ljg.4.1678808153515;
        Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 10/32] drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fill
Date:   Tue, 14 Mar 2023 18:35:23 +0300
Message-Id: <20230314153545.3442879-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.30.2

