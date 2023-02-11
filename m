Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B40A692CFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjBKCLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjBKCLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:35 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAD57404F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:34 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id hx15so20148880ejc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7+OBePNDUGUfFbzMmCaqIm54qtUKHti3rpDis3Z4KQ=;
        b=xKvM0IhBqtWQlIab9fNIyX631OXpmF0cuemx3Q2IGGx68hZQd9mwTgInT6g+N45/Yw
         rE5IiD3/lsDW96k76A62dZwQ6bK+jKQI6nTpVLcXK77Zim30D6WQkMNgEEErJwxHIITF
         b5JbpjaGQD9EIcHdtYY2teeM07bwqAGzH/Au2Rq6eOnK8OI0dY56mopR21eA3oURobaY
         Oh9WdFZWCSMaYo5/Fsr9coPMGVWNnZAgO/eKCTHXM9TZw4av2jMJycC1N/dAYCUNWfgB
         yQ/qdosdoVT1iMm5PcAf1nutQlziv2v0EY4EopJmGm8WSsRCIDEsRuwqg/VX5CQDmn/c
         htjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7+OBePNDUGUfFbzMmCaqIm54qtUKHti3rpDis3Z4KQ=;
        b=RSPHJuG9gKjfq3PTqfxEqoZaN1lyRhRqmogY1pR0cx2GUISw96QOIicB39Cx0PBI8b
         7tB5/kYET0c8gQvV1eMiOk72DJdDK5tAvHqgcJfqL89A9dxdegaSINOwZfXbDVIGxRuL
         yv/lVW5A4pnxE+VqyDLw1Zyo93R+6IKXQyjUbqxyPgHTmPwFqNaxevpdOIPEJXdROEsA
         sfnV+SbgCwyuOKpAyaXwYwTzNzQ/6LawhHIo6/Ut/kR0zNPgD2P4fGxaXhtNrBsM952R
         0QqyFjgCRl6t38Te0KsnSM1zC9B/gAUYYdbSgLGHtB6irdiU3z9qt1fp21V0nBeQJWCb
         p+GQ==
X-Gm-Message-State: AO0yUKVVREjvVUHNXHH2Vu/V4bp0QPSlbcBQrfVKWuMeJmLYOr6Lc+Fc
        NGg4XOZt2mbLjoOvKKGtWLj8TA==
X-Google-Smtp-Source: AK7set9c9U6aFUSE5blTp0W18f9GXzu2moggONqauOufXRhf7u1FRo2LXiqHreAgaQ3vdbNDo6b9oQ==
X-Received: by 2002:a17:906:3855:b0:889:7858:bb10 with SMTP id w21-20020a170906385500b008897858bb10mr17470671ejc.52.1676081493180;
        Fri, 10 Feb 2023 18:11:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 36/43] drm/msm/dpu: drop unused macros from hw catalog
Date:   Sat, 11 Feb 2023 04:10:46 +0200
Message-Id: <20230211021053.1078648-37-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

Drop the version comparison macros from dpu_hw_catalog.h, they are
unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5355a6c5aaac..8490e5e58469 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -23,14 +23,6 @@
 		((MINOR & 0xFFF) << 16)  |\
 		(STEP & 0xFFFF))
 
-#define DPU_HW_MAJOR(rev)		((rev) >> 28)
-#define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
-#define DPU_HW_STEP(rev)		((rev) & 0xFFFF)
-#define DPU_HW_MAJOR_MINOR(rev)		((rev) >> 16)
-
-#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
-	(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
-
 #define DPU_HW_VER_170	DPU_HW_VER(1, 7, 0) /* 8996 v1.0 */
 #define DPU_HW_VER_171	DPU_HW_VER(1, 7, 1) /* 8996 v2.0 */
 #define DPU_HW_VER_172	DPU_HW_VER(1, 7, 2) /* 8996 v3.0 */
@@ -52,14 +44,6 @@
 #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
 #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
 
-#define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
-#define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
-#define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
-#define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
-#define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
-#define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
-#define IS_SC7280_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_720)
-
 #define DPU_HW_BLK_NAME_LEN	16
 
 #define MAX_IMG_WIDTH 0x3fff
-- 
2.39.1

