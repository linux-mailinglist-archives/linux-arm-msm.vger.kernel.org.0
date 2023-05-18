Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA656708B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjERWWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjERWWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:46 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C639FE57
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:44 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3a611b3ddso232860e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448563; x=1687040563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aATqP5Uzt0bmWsfDgHCPPM/tRvezESjMLLAKziKzACI=;
        b=zKdRLeNhqlnvjtAIJD6T5mE5dUDsmNL6CwtjDVYgVVfy3LKewaiCKSekWNGyI/BUHF
         LRGn9HSxTdioMFxj5S3gVDG1cFzWIhMoQXWYY2PX8TE0cMqG1/dRzW9xAwjQ3eQlzsx1
         hs+gfiIB3sH0h9kftypcgVFd5nj/a4csL9N5e4qOkcwXxYqF5g13x5I7VY7Le54bweaR
         JSqf3xznnXfUW9H4nDgAVsybKAZ6mGgh1KCN6Uj1RFA9y7oxZvvT7+TuPdSxLpp7Ny87
         hud1vPsV1QqRkimJPBnv+3+VPsISNF/3eMbXAputPVcMwpCSrvVZIuyEaO9PPCNPy0ik
         ErkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448563; x=1687040563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aATqP5Uzt0bmWsfDgHCPPM/tRvezESjMLLAKziKzACI=;
        b=dmarErbhObFGotIgecKwMQ77ivR0x3WpnlUSkkeLnUj5IPFGSvCbvMAt3btBIaZ3YG
         jjzU6Kzo8oCO/rBW5T4nXEFrHyUd4VosqPpFV2pJW7Mqr8j7Lr1cSWkk1LMRVCKrcGrv
         2EtjLZ90zo+unXEjNp7J465WJDXAW8GVqWESCazHelWEzsQqrEN9p6HCKnWS2RDya1Z6
         ivaoaHoxpsIBsAvzASXRhzVJ5VJDQiFLcxysafdfPRFq3MvWTIE+AYWGTFRJwIakwGU5
         X606lCHexHr3CCS6lXK57DD1YfHZPRUkRqfLD3r9gmczRIG1uCZPWunAcPHrjQtXrEnG
         eNWw==
X-Gm-Message-State: AC+VfDy9BmyCVBiOJne1R0+kHcnJrJm2AiGUVxbG/ZAfvAV8fBayK/YJ
        oIdW94y5CN/AG83GcUk1BmqsDg==
X-Google-Smtp-Source: ACHHUZ7Tfvd/E2lKM83cy3VfJEV1qnnADfiKv6fCrcL2rFEZebaTh70TXb2eFnWxuX9TzpWrrnh1Rg==
X-Received: by 2002:a05:6512:489:b0:4ee:fdd8:a536 with SMTP id v9-20020a056512048900b004eefdd8a536mr173237lfq.8.1684448563033;
        Thu, 18 May 2023 15:22:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:42 -0700 (PDT)
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
Subject: [PATCH v3 4/9] drm/msm/dpu: rearrange QoS setting code
Date:   Fri, 19 May 2023 01:22:33 +0300
Message-Id: <20230518222238.3815293-5-dmitry.baryshkov@linaro.org>
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

Slightly rearrainge code in dpu_plane_sspp_update_pipe() to group
QoS/LUT related functions.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b8ed7247a6af..586f089756fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1079,10 +1079,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
 	}
 
-	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		/* skip remaining processing on color fill */
 		return;
 	}
@@ -1125,12 +1125,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
+	_dpu_plane_set_qos_ctrl(plane, pipe,
+				pipe->sspp->idx != SSPP_CURSOR0 &&
+				pipe->sspp->idx != SSPP_CURSOR1,
+				DPU_PLANE_QOS_PANIC_CTRL);
 
 	if (pipe->sspp->idx != SSPP_CURSOR0 &&
-	    pipe->sspp->idx != SSPP_CURSOR1) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
+	    pipe->sspp->idx != SSPP_CURSOR1)
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
-	}
 
 	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-- 
2.39.2

