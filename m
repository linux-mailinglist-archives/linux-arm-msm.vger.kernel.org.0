Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E910B6E7D29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 16:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbjDSOmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 10:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbjDSOmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 10:42:04 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C714046A1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id d8-20020a05600c3ac800b003ee6e324b19so1556595wms.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915318; x=1684507318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvyREH2toDbRX8jPDQqcQOz9n9jRJ61Ib08FCCvn3Ik=;
        b=fiEmjRI5sy66IY14yPYdCnD3Wng5CaWmy8/JWcrmhUpLJm++qPxhqYFuZBBwad2Bk1
         fRC3PzylukzxUDXSaONiWypd1Qdz05sGYKefLuw6OlnX0ItB1uSbRHZ8BB9JEI+2f4tG
         ODTG+NUZEU6Bz49uGDl1rbfofa0a2OQPMnNxd0z56unCc1W9/2JHjUzvzMqYysrAmn2e
         LM8DuZQPfdNstgogGHSUQYrwhPTNUpWSVbCBuwrTjhnRPl/iUG/dltawjO0l42MNo37i
         irA1ZHZz+utK25dZM6ERc+rbyPl/k+FsCapqQdUoNmpPXQDwJMZc43wHrPLb2/Bemt4m
         1iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915318; x=1684507318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvyREH2toDbRX8jPDQqcQOz9n9jRJ61Ib08FCCvn3Ik=;
        b=lr3T89843hqeWdns0v8i//N+duKS30aTv1TiLQiK0avxz5TZf1pFO0b+6z12e3NfJ3
         acdDHE9ZzAJa+YoLamte9UyiEdx3q7X+XwsUtDZCSPEc9lIWSOWuqAsBmzxnC8VJ5Km7
         8o+iI7oTF+h+es5SPOq6DQwy++cu4cAAKZqlKqNodUCsKmWdr5c7To6n2PJXmQvxGhQK
         5n0pECpVKK2K46YnysnRFm9wWeeFiO7yoOJiFTJsAbWlGGettubKXmJ+Ui3ENWr1SD4P
         C08YUZY1xPx2+RqW82FxFrftDRCANE0UDaBK9Y8n51cEBj4mdytGiV3r0F+jrpRmIdQF
         b11w==
X-Gm-Message-State: AAQBX9d2U3UGYU7QyQ3t5fOFOwAn6jv93ZmZ93/fePK4WnN5PN6K82gu
        gVCO9ncKkHtlwoOkocN8Wy3n
X-Google-Smtp-Source: AKy350Y41eDbjV44lpKj/xlTrUrnQ2HFRVzK6oIGLJjemuk1KHFBsUN/7nExtMcIBIBSxZ+5N0s1qw==
X-Received: by 2002:a1c:740d:0:b0:3f0:3d47:2cc5 with SMTP id p13-20020a1c740d000000b003f03d472cc5mr17091590wmc.10.1681915318268;
        Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Wed, 19 Apr 2023 16:41:11 +0200
Subject: [PATCH 04/11] drm/msm/dpu: allow using lm mixer base stage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-4-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Arnaud Vrac <avrac@freebox.fr>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=NbkvlB+Rp9R8nBIqIbNdud3AhKbbO3pB8C+IbGJ1/iw=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2cS8NGHA5wCfb2NpdA7+TL/3Juvg4voqljd
 dCN9998hUiJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9nAAKCRBxA//ZuzQ0
 qzq2EAC8YPFyE4WUiu8BKSb1ZitW40OEsReZvh9sxbDZTP3qWZ+pC1T6aDRLrWtGd01II9zSvnZ
 1e1WtK52yoxgFMMIs9m76wrqd+HyouhNxyA49sA+TJ54CNigIw70r1AjmJlKxS5t4D7JONHX8EN
 8WcDnTOyTyjhOSuR7GMbNNQvMSoyIbLnBwDQi2JgPFIH74gUttelxpiXYp/o3BlfmCvu+jFUJ0m
 6DvZ646BwFhHgi+WdDeR0xa1UHABA2DR5YfRKQEfsd37Utg/ljJuurZ+676ax7Q/f+x5nhrv6tQ
 3MFCvmBJ0WPec4eyrvX/O5sqBeYoGrluaPJwBbwwerXAypw1clzFh5o90KY3sr1APTgKO8fNdWa
 dWf31VLcAWvEOm552brE5gYPZ3nmq151VbNilEz0wGK9BrzP6aiA3PvLX4iJpj9MxEwGlB13zuL
 efJ1ZwqB7FcJZB73j5f4OpckUi5z6ytaxwbNhEs/Ls8H59xlpsey2J2pvhfQIayi+nKxgF2mZLX
 nknVZm6xJQd8qjCKv31ErlindIv/OJMLYWB8CGTjLDSredGRtnPUyTHFPl192rjH4UydVVLvf3N
 BB9TxwJFD+a2TxomXyKgp7DOHsOjeQeReXiNxSuqzfxaFm2ti/HxPir504dyFomWRoUK2BxkKLW
 pB4JplwICLGWejQ==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dpu backend already handles applying alpha to the base stage, so we
can use it to render the bottom plane in all cases. This allows mixing
one additional plane with the hardware mixer.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 14b5cfe306113..148921ed62f85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -881,7 +881,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->sspp = NULL;
 
-	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
+	pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
 	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane stages assigned\n",
 			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);

-- 
2.40.0

