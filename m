Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC996F2AC5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjD3U5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbjD3U5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:57:19 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2B412D
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:16 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso2260711e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682888235; x=1685480235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxMIlhE+xo1ndRNL8TNhFy+W+mxe0zzz0yJ/CAW62w4=;
        b=VO/JrwDg94kbsUdw9EK5ccKxqJlrawqyw5q0ef5tpIPXaSNp03qXp3v7A1pxt9guPO
         vdg2hjQg5eTgKlvO6H8fviQRKIEdH47T6HUuje3MTVwcGMG141LyHmz1sJvWs31FNGQu
         vd4x4QeJKkiyYBAakjcorNnvPVhWfmeWxxW8UTH7V3CTtTeeiD+/VXdwQ2wOBa6Ay6Py
         ZYWmam5Zjrr0nIaaTkd4EyeRG6ltmA++AEMEXIIoDY7T1ZcPZgGVSW9rrlMP6e+ds8S9
         2YJZ77tnboxxTXCl/cIzlFSj8R+mExhpVwv8KdZBa7xOfzHU6vkRryyXxRzBSaiqSVUX
         dxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682888235; x=1685480235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxMIlhE+xo1ndRNL8TNhFy+W+mxe0zzz0yJ/CAW62w4=;
        b=MISnKREBvE+63xK3+Xvq1Ck864rYB4LPGj9ZUrQVKvyhgSKa0LwaHpf8bRMrHGzIQ3
         vZQU5ViMI1XSEIajrrv/4Gfm9oIzly8YirJnOhkWZBFatLDG2uqpJ4V2bosebXuc44qo
         UPtDU+nGu6eYIHvo3e0r54sLD7YLucvB7gk8ii9n5fUWsassLz59ojn33s8Qm1ZEU6Rd
         6JozKSA2If6b81f7ZC8wKv47apw+Bw1dpgsKR/s+Olt+o6nuCgBoPiuRd+hL6mpIp+em
         ivHpwXpKWPR+8LjdwjoOBCfjx/6BSdXr16W3bakmFOzsudrBN+nUbY/OWMrVUnPdkEg/
         K3MA==
X-Gm-Message-State: AC+VfDz5kKWfT6DaM/M/65clI4KxM8P+fHE5quiNvQgJDqoqSWcPmgcL
        xEduRZxYWrq0RvRjfkM7rWaBog==
X-Google-Smtp-Source: ACHHUZ75oe2mpelzwjC1zNnI6eL3nDKdEoAQfJ145W+UsY93FRLEu3NU1KQH8EG2DWSdeE9Szy27OA==
X-Received: by 2002:ac2:414c:0:b0:4eb:2e5c:e0a with SMTP id c12-20020ac2414c000000b004eb2e5c0e0amr3503756lfi.41.1682888234872;
        Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
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
Subject: [PATCH 4/9] drm/msm/dpu: rearrange QoS setting code
Date:   Sun, 30 Apr 2023 23:57:05 +0300
Message-Id: <20230430205710.3188230-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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
index 36f6eb71fef8..4a5a58152fa8 100644
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
@@ -1123,12 +1123,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
+	_dpu_plane_set_qos_ctrl(plane, pipe,
+				pipe->sspp->idx != SSPP_CURSOR0 &&
+				pipe->sspp->idx != SSPP_CURSOR1,
+				DPU_PLANE_QOS_PANIC_CTRL);
 
 	if (pipe->sspp->idx == SSPP_CURSOR0 ||
-	    pipe->sspp->idx == SSPP_CURSOR1) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
+	    pipe->sspp->idx == SSPP_CURSOR1)
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
-	}
 
 	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-- 
2.39.2

