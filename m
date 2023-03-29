Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E65A6CCF1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 02:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjC2Azg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 20:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjC2Azf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 20:55:35 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9501BFD
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:55:34 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 20so14472174lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680051332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3QWtwCpJWCtNwbopMCBhlb/eX5Lt6OWuzbQyL+529U=;
        b=vi6NQbtWRKOHnONykj6hYunJ45FGrQc/U+pXgje1r8U/v24mBupjNskP85Nbn9Hir2
         B9ZhhHMSTZCuV2X3UzNQJKQMLShuKLAVcCvW6Ro3oUgjqYjEn2i2vjMVjII6BXPG1RtV
         ZBmH+YdZ1jTJ3cU0pMOkwEFjB3ReUiKvEWGB2RTCPPynKIZcf+vyYIFBsjK5zQMp+xpt
         b8Zd5QAd1LTib2xpuCkcg+daSSqhkVBgMMvzlhshBMmcNSYZ0TDQap7uHvZitiWANwT5
         zMQFvvJb/c+zjaMZis0L4yOxbf3fI8nFFhNM09p9xMF3isY0xPqGgvTaJHS7LfPUkqdG
         /4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680051332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3QWtwCpJWCtNwbopMCBhlb/eX5Lt6OWuzbQyL+529U=;
        b=x6CniNRLSYJWbimyLS8l8dmtMnqDjYhbZtyys2BU0EePOHp5UP+9ItLkpNmY0J7H3q
         +mAofGnHV9ayr5YlliKYIIz9ccwhACUKda90kJTnNJMPGTDclp8k7124CtBQ5q84PUvi
         CPEvySK7TrawJjrTM9EsWmaGij3lKAsBv0a0P6ufrKObrr0H1C18gpQnM1dsan1E0VGa
         9romoHXHEJD8JTFS/J8oo67j6Obulmo7ghL1SOfF0T5RDO8ZNr5ZvZhi8Gy+bk131Pxg
         ZibJx4fBi/Kfe8nP/FLeQe1KimqXI7uxw3IuzTWAwsthLVeeMS6gNX7Dd6OupGh4kcOp
         hKxA==
X-Gm-Message-State: AAQBX9exoIo18On6JAYBT1KAKi+aFss1YQY8noyV4y0rYVCIs83jCyV9
        /eDlN0qf7qIQcMCmduCbDnkgnA==
X-Google-Smtp-Source: AKy350boACpnTgN9FtbnZSYhmXfWiLUrmwJjIKp0oD59NFvzwtfWOEcN8QobmftFmb5nwehjacLh6w==
X-Received: by 2002:a2e:9193:0:b0:293:34f1:73f9 with SMTP id f19-20020a2e9193000000b0029334f173f9mr5683044ljg.13.1680051332456;
        Tue, 28 Mar 2023 17:55:32 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a4-20020a2e9804000000b002a03f9ffecesm3007181ljj.89.2023.03.28.17.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:55:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
Date:   Wed, 29 Mar 2023 03:55:29 +0300
Message-Id: <20230329005530.1077468-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
References: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
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

The variable ring is not used by msm_parse_deps() and
msm_ioctl_gem_submit() and thus can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 514ff5245c8a..f2a6775a10eb 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -550,8 +550,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            struct drm_file *file,
                                            uint64_t in_syncobjs_addr,
                                            uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride,
-                                           struct msm_ringbuffer *ring)
+                                           size_t syncobj_stride)
 {
 	struct drm_syncobj **syncobjs = NULL;
 	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
@@ -798,7 +797,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		syncobjs_to_reset = msm_parse_deps(submit, file,
 		                                   args->in_syncobjs,
 		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride, ring);
+		                                   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
-- 
2.39.2

