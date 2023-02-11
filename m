Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50436934AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjBKXNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjBKXNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:12 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41D0126F7
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:11 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id dr8so23872785ejc.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl0aiWsQSI/9XYleu12nXn3J/+ngujBsZWghZ4PcuRs=;
        b=D+huJ1H76IzB6OjVpwQ1e1RzgbU3fZXAggDWBMZMo+X1qVbx2i3rxXlJj7tDam2wcS
         OySi6qD0tZcmPzo0I9VaYKvW6ARd07a9zR0E4B06pnlILFx73pQDf8o8t6gr786wP+au
         phWNATOXGnIq62VpryCR5fEWMeTz1XKSrVkJw2BPQudSa9H1zAKVX7+MakS+oJ8M3Ejh
         Mh0eUDjiId+YGs7Oy0E1cbghc41/AszsP4GbEHc3had1DJRIguQit54TWkXaopoAXMIW
         OsjApI+10UNT64a36Ro22GG95JHG0yzBiamp0HCPlQVukq+orNOnEscZPr/42qkkkWO+
         075w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl0aiWsQSI/9XYleu12nXn3J/+ngujBsZWghZ4PcuRs=;
        b=oNawGmqx5YUglBmqw3X7xzqzwWQ/9AMEwyW+yRBkwmkWl/xptI8TdhtJJyy1+XUzn5
         q3CCa6oMJ3mzNQp+5wphv381PsxJQ+aZIGPqj7QDDwLprs8z5RPmpYaU4zVVrJq7noHA
         /oYfzEPicf6iMEx01oL+Z7olbIHqeQ8MR9Clq2qBlKBfhP8YRSG2iwf+a7RXPL2FBiWv
         uFOl4O2SQ8M2B8eXF8pGqyjMwZnu2PN5hm2BbEaWofg4GKn2GxO9bWBgv6zH6Jk1MlkV
         FjTvl9WYIQltQyKF5giK7FNWdXLnDxtCN6uQWODVeR3dPeSSrfULOPJ5oodTSopuOfKA
         5Dcg==
X-Gm-Message-State: AO0yUKVnRzLWH5tQxXASmUSSdbWnnSalj2nOo7QSeN0zYyT2cwwg5K/O
        DOHYyf/8s4NYy2pc+elHpON1sA==
X-Google-Smtp-Source: AK7set+SXa1h1i6GHYPG+9zX1m4DuqQ5+cgFObFmpCdmjGqF3w/mPQtNyHkKpHGdzhGyVw/BQdHqUg==
X-Received: by 2002:a17:906:da19:b0:884:9f42:1ec8 with SMTP id fi25-20020a170906da1900b008849f421ec8mr17699572ejb.70.1676157191513;
        Sat, 11 Feb 2023 15:13:11 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 08/50] drm/msm/dpu: correct sm8450 scaler
Date:   Sun, 12 Feb 2023 01:12:17 +0200
Message-Id: <20230211231259.1308718-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8450. Fix the used feature masks.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 83836cac69e6..4f6555c04256 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1273,13 +1273,13 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
-- 
2.39.1

