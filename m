Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6306C2751
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 02:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjCUBUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 21:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbjCUBT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 21:19:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3A4A5D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:19:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x17so17234856lfu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679361504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYN3oYps1kExjbkf+zjFZYaGqiWBM1RDNanr9QzGX+M=;
        b=GrqYqhhsIMn2xfgfbCoGZNP53LWMZSCxJxVxh3b92VCfmVcZyZUhLADpEkxVp97/9c
         coPwD3Po75Uo65GLG/15Gvq6yTvNxeewn7Mrsnh/khiwtGIoB5LkPuns8HyzC7HeReEN
         C2jeqtmb6IyzG3THhmf0DKEAkahOoqU9wEQ4jWyAxBwJhtJyasCNn5+nVVA6EFOepEOS
         5LSfRGmGIra2+5+hsnsm/2nNlUGjd+m0MpLQHBaknMk9o41sddol+pC0pHkiOis7TO74
         bBCbSuqzwcQr7XaHb20OYQU6JHi/tuVxIMij03/ce0bwEMdwqZuMxU8+WoKmMrGhG144
         WWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679361504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYN3oYps1kExjbkf+zjFZYaGqiWBM1RDNanr9QzGX+M=;
        b=ybdlfAECN9WQwcbELwPrNg/9jauWHR2x/zp5UaX3NIpdOuoK+vJvUS+T+GNtsrZKXV
         S4jfTn32hMyXz7bBijEHgZPlLvzHKRbJdZgq9touCoe+B5+Iw8o6YhYg8rsCzJYuyDPn
         n3YQxXsMsBGMHKf0xIRfelpDlb/B/YtXuRjs/0EevYOz324JfWFFyhAK08KMWA2akTOr
         ESK4DqpOQmLF6e/pyHP54HKVDzQohcwPUzqR+gwJ9i0mQDcKOce4nt+fb4udcXOLNlpL
         q1wPFTa4u9SadtK+heSDF8uraJQ4ovQve0N2pKuozWqdghW3zQObWKiip56SStvv8vES
         nGDg==
X-Gm-Message-State: AO0yUKWssj7WSCvL6pBOWTZatd5tzYebBA8SsET19qDjd63bzepwgEQs
        knyULOSCzBZZ/l9nPAUxLO7yGg==
X-Google-Smtp-Source: AK7set//en3R7J7A36LAkaMdnCjbcNGxUJiPViGi+MCKzk39MaPSyhBsndT6fLK50TOdhIsO+FLMfg==
X-Received: by 2002:ac2:5961:0:b0:4dd:a718:31dd with SMTP id h1-20020ac25961000000b004dda71831ddmr265068lfp.12.1679361504107;
        Mon, 20 Mar 2023 18:18:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 18:18:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 02/13] drm/msm/dpu: take plane rotation into account for wide planes
Date:   Tue, 21 Mar 2023 04:18:10 +0300
Message-Id: <20230321011821.635977-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2e63eb0a2f3f..d43e04fc4578 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		/*
 		 * In parallel multirect case only the half of the usual width
@@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe->sspp)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
-- 
2.30.2

