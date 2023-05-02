Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3936F46AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 17:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbjEBPF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 11:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbjEBPFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 11:05:49 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40772D43
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 08:05:39 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f00d3f98deso28891584e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039938; x=1685631938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRTUjNAovFxHHJip4pkjqd6JPwFqTmtn1T/ylsG5TIg=;
        b=RlYgrqHs4Rax2JHON5jgD1G9Fj21fk5dVS9phPCQLoHyTWnLMuDZIGPCSeCQbydP90
         IgqFpeFgtmVNaTbPOlI+BvamEfJRk3ByTGDi5j7zfzu6QEzOscgabUONGvz7mNuIMYm8
         ndtwUUrzmCDWVB8e75xXIPso4T3ElR3GeN333svOnRtgoB2jhqvCmqmpT8XwBscqBjao
         AAcqeG/Xx17M1pZaSnTCtMqt0BVMCww3B6xKZI3vxBP5+5Ti0i2TQ4C7TAaUM9PKiiaS
         8b+KoGTnSsHPMxl/FJRBDzICVfbgSj14PCMWnAT9RCn3Ufh9P+s/EBZdN/74wj3AtG33
         ubIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039938; x=1685631938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRTUjNAovFxHHJip4pkjqd6JPwFqTmtn1T/ylsG5TIg=;
        b=QVllI9HY5jMtKzMwJT57pezgidCv+oNJNoF+o0IuyjTa2StK3Yb7rSbRUXAvwPET7h
         YIHGZJeigRllkqohaxjbYqW0KQb37Ar68IdX4TquxLTVyYKoLKoPzWVjSjJSpyhbALBE
         afYRGv2NJkunWCJVxLhk5gTkQAvpUcAsOXkw3nWEpsh4WjWdu4ZB6LFfVxhEZRJJ4Y5O
         UZNNqHDSW0+nfKTLlqgW30xYFrST1h2s3IsqE6SShqxzFzsyLpuz1q89W+CgmVCNZRaY
         Q2uLzHE3seXASKRpj6ZOgA2vHxQHP2jAGsWIAPdy4KcjxTBY6cx/W+6GSUwNYrWZG0Eh
         W2ew==
X-Gm-Message-State: AC+VfDzdDwIt3bLOviKevnbLzjtZBzpfXJpG5F4KtpdangeH8H22E2vQ
        vLHtfSGWK1vPX20CL7K49G5Bag==
X-Google-Smtp-Source: ACHHUZ4k8lIYRR/JiHiQvC1D/fLoYFOGiV5RHqzIcWIDGuxeiiZ7t92TnX0v8RWoNp3BhdMyu+7d6Q==
X-Received: by 2002:a2e:9d0b:0:b0:2a8:baea:2554 with SMTP id t11-20020a2e9d0b000000b002a8baea2554mr4904498lji.3.1683039938118;
        Tue, 02 May 2023 08:05:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:05:37 -0700 (PDT)
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
Subject: [PATCH v2 4/9] drm/msm/dpu: rearrange QoS setting code
Date:   Tue,  2 May 2023 18:05:28 +0300
Message-Id: <20230502150533.3672840-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

