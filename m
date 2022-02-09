Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019804AF835
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbiBIRZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238193AbiBIRZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:41 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3A3C05CB82
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:43 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id k18so4375465lji.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KlXJh/oij3IFeqlWuJgcoMFVaedivMEjjROIIO+IawE=;
        b=f5ZNLXXB7rVo1loml3byRNJjtT8hKPJWsvT+Dro3yEZwUUfP4XiL4qcyxHy/O0aoT/
         La4BYx9p/yNVnLwO0aA9ZINZ88z+EwHkft493hjP5TrCC5DbxKPYswzsidRR2dScO2s0
         V1DZngz8X4U437JBpBbJHlk9aHt8CWur6ChS56pGlHt5gGPa2ly50h02aq/jityrxto+
         6SxgH51/ekiu2J+o9iMIDGszK3WR0ilLLyJ3xzbIZRGiXI0nsTkzlzh3yxzkarzXuslb
         cR4jKOI6kNvcNDlARF6Fe1rIsLG7k5XH87KQXATOEoEcV3DiQQoqvzLbPWU4JHfnhNec
         2pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KlXJh/oij3IFeqlWuJgcoMFVaedivMEjjROIIO+IawE=;
        b=DkQusv4fcOQlYJ8U08rBFfS7e6o4ovBE+LLgFWN560d9LZmyJdV7kSUjzvS++GiT+e
         sgSkVsd18yV7dbBV9ghWcaNPFxV/REUOYnLjjpx4NYTmiODPaGexA6yFaDyRVMfRwG0v
         tS2Vb+RNeZqCvssEoCUrzA3XHZmBqDYPxRknjFkSf5uZ9RmQu/8epGNX7JUDXCin6GOi
         U1Mddy9ZhMfVsm6lUIOJen5eRwVoczscUK/KaVCaY0Na/0RcSxSl3KdwO9dZSKesHyGd
         rL/+1QVBQSFeNnkGwcxzr2ijMmVTvA1UpcfYSODqzKVBjmr4G0J+KUKoGHYFpA09+RG5
         Mixw==
X-Gm-Message-State: AOAM5303Ne9P9KwDqii9sg51Y4ERzBOFKk3tIIkV3+EwbBd4/9Dbaev3
        MbfAzUxl8UAnZ8PsoEq/Hl3Epg==
X-Google-Smtp-Source: ABdhPJzo0yu91sEy/QMpIAkebs0iSSuz3Ano0pSi5ocsNwAm+3Jyr+JJ5CpIxpOqB9FUgXauELUtmg==
X-Received: by 2002:a05:651c:b0e:: with SMTP id b14mr2270897ljr.345.1644427541887;
        Wed, 09 Feb 2022 09:25:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 19/25] drm/msm/dpu: don't use unsupported blend stages
Date:   Wed,  9 Feb 2022 20:25:14 +0300
Message-Id: <20220209172520.3719906-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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

The atomic_check compares blending stage with DPU_STAGE_MAX (maximum
amount of blending stages supported by the driver), however we should
compare it against .max_mixer_blendstages, the maximum blend stage
supported by the mixer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 637d164667e9..952ff11162c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -927,9 +927,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
 	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
-	if (pstate->stage >= DPU_STAGE_MAX) {
+	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
-				DPU_STAGE_MAX - DPU_STAGE_0);
+				pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
 		return -EINVAL;
 	}
 
-- 
2.34.1

