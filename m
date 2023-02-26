Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8140F6A2CBF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Feb 2023 01:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjBZAPq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 19:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjBZAPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 19:15:45 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE47D10A89
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:15:44 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id g17so3974783lfv.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k75IX25C6nkOmgqNZDlRVMdo0fsKzdbKdPhKHiU8ok=;
        b=iBo50LtkN7HydvdseF6H3PVoROb4RcO0VAq2MUGq+mgZWdDiUCRwv3/nlub7shmb8Q
         RqWvbwRDI/Y15ifvkglU/5kpw0lpD3LepDMvMwSyO3NztrZy9L/w3pg3bobovswcN3rI
         j99JysZtjy0s6D5mesoyu/NNytaQI4D4eypx9afRNV+Y6Njj7LinudSQrtegeGKAcIv1
         kjbvrM0hhS+Fr5khFRUN+UXAv9Yo9X0p9+XiDS2/OyydWHadLe/0VCGvQuvFnIo4DRN9
         Wesvz//A2iNTsYzNRrd3RrApxkHMFosd1uiJ+NjbzaOSIGx5RWDeQVV1pYTuSMXqwAVA
         QgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k75IX25C6nkOmgqNZDlRVMdo0fsKzdbKdPhKHiU8ok=;
        b=yQsoj+JTxQG697n9RDzLBT8AUTgOlp90xAOBEMWV1fGgBraEX9zyMuh61icFoJD4+S
         /AbT804r47ZK/m3oeAxKFTHQ4z1TPRgnlAcThrHtYp1qXFRwLukZJR/+63BLzukBJUob
         qiIMW1U1vmyzYtVQJoKVJ1FHgZuse2ngNPJTXH1wJcdyTA5IUgN9NihDRQYC8v8lF8kJ
         v0JjNl8ky3gq4VR7lt0krT90HkjTjLyFrBCbqsTKeeBxBJ/HT8btr5ijDdemGS9i5J6h
         6Kkye7wsAZup5exnZIPdKCFp39k6lF4UKLpgLrYthj15t+M8WLyv9Nh/0hE3Go8v4MuS
         QpwQ==
X-Gm-Message-State: AO0yUKXNZ6UzHndu/xL8hClJvOEIBs7VlY92C0ilzZtgGsKBPCfG5+2G
        1JNM/wW+P8xGzoxYQzhxMMy+Ug==
X-Google-Smtp-Source: AK7set8LYLzXNeruJqVdy3OLK25EmJ7vFXpUjajeKsvLMRTRFIsv2/N5Iz1kH4mR7ynwN8xKJjgwrw==
X-Received: by 2002:ac2:43b1:0:b0:4dd:b479:1ca1 with SMTP id t17-20020ac243b1000000b004ddb4791ca1mr1206124lfl.3.1677370543200;
        Sat, 25 Feb 2023 16:15:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac25ff0000000b004cb3e97bff8sm356238lfg.284.2023.02.25.16.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 16:15:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
Date:   Sun, 26 Feb 2023 02:15:40 +0200
Message-Id: <20230226001541.788023-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
References: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
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

The variable ring is not used by msm_parse_deps() and
msm_ioctl_gem_submit() and thus can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ac8ed731f76d..ca4569609397 100644
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
@@ -803,7 +802,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		syncobjs_to_reset = msm_parse_deps(submit, file,
 		                                   args->in_syncobjs,
 		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride, ring);
+		                                   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
-- 
2.39.1

