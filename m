Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3AC708B6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjERWWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjERWWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:45 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C24E56
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:44 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af12685274so20650411fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448562; x=1687040562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCDBbfuVfyjLnfdqtNrtN3KwOosZ5Z2MXstejskIVng=;
        b=EXWmr7jLSo0sV6iqQv0/C9RUF5QntbsyQUkAvyMQ6n5Ki6k1HYgNGskcWRW5SjRmHI
         hE7KCEc7BLP2gCAKhmloBsI4pLPKefbNYzF4yLTJXGvRzc8tO43ckcaRyZGeoda5pPXa
         iXdeBZ61D2Q//fZ2bDwrF8TT040bvzRy0Amc03/kLRXnLz7FnOziCSo7IAg4Y+VAwnMi
         TDykxSjXwAHR1RtQNTgXbQd7XsurSgC/OUQNYnSjpFG35nkMQ3HRxdomOhBh2bOx2OFw
         m2F23OgE2LKt/hD4M/kwxYLlyE1XQSAVpj3eUtbQ8wtHUyGpP8LZOJIKZyMRMu+9u1Si
         fJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448562; x=1687040562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCDBbfuVfyjLnfdqtNrtN3KwOosZ5Z2MXstejskIVng=;
        b=Ql/QdV8uKjM5mM23P0OE4CD+hO+wdgJITo7JzpA01KSwQPTUzRsMmnmCZtRfq19bab
         N33rSYamWofdl1krqOJvEVwp4m9rLWZmx8iWwyqbCzBlrggDMg5XYyk6ntoVvQaH4wMr
         hNKoZaqNqlwggMzmdp6ID9uM/bfg3vuLTSA/5sA+t0ckgQ6032HIMtK159/IS8xLdjwb
         Gsqzd5P1jybveHynvreqzCX7K9nJY/WC8WQGu16B4CZoqg8kT3LEgT1cRMLvEeJMPIkp
         jp9LAtSd2XGoC5fkgdzeAWwCIxc25L48YHr8CPWkIull62OOZTIWg0L/FuSfRtBr9seT
         OU1Q==
X-Gm-Message-State: AC+VfDwbSLqAArk0bL8enuuwDobQH79FZb2X+hJgKPMDuTJ0/ICtgHwg
        ikuXsGRPdHvhMvHBux/rhKcqrg==
X-Google-Smtp-Source: ACHHUZ6Es/yTu4PhbWR8drVKV/Oxhw7otV/VCtEmyoNd+P+6td+zlL5DJnL6LrMR2a5G2+b9D9PiZA==
X-Received: by 2002:ac2:5636:0:b0:4eb:1527:e29d with SMTP id b22-20020ac25636000000b004eb1527e29dmr144181lff.52.1684448562242;
        Thu, 18 May 2023 15:22:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: [PATCH v3 3/9] drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
Date:   Fri, 19 May 2023 01:22:32 +0300
Message-Id: <20230518222238.3815293-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
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

The function dpu_plane_sspp_update_pipe() contains code to skip enabling
the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
repurpose DMA SSPP for the cursor planes because they lack the real
CURSOR SSPP. Fix the condition to actually check that the plane is
CURSOR or not.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3b210320ea62..b8ed7247a6af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1126,7 +1126,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
-	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+	if (pipe->sspp->idx != SSPP_CURSOR0 &&
+	    pipe->sspp->idx != SSPP_CURSOR1) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
-- 
2.39.2

