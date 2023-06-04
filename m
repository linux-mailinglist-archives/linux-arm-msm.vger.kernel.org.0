Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBBC7219B6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 22:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjFDUfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 16:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjFDUfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 16:35:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABEFD3
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 13:35:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so4951798e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685910935; x=1688502935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve6ZUdBLYuqTXgoIqe+BvDl7Md9/EbiIkAt3DnPQx0U=;
        b=H2AkMOyl0n1iWZ+xbgI8wJGliZZTArYfHX2dWmDFK22NCcFhSqtZexoWjSPdSniouS
         3s2Y38hXZ212X16tE0GkWdfFMNjRhmbr84L0abttN7y3e4eBWXIL5baSQmcEwFABhnsI
         H7HTEsQEjVYx2dILh6DBaTa0GZPRUhOqjNlDEvUtF3ONd5bxDDplbpbe0AnE0X5zpET2
         5jNg0LsGj2Xfb+RT6QivA24Q60AMPKpWUHm6BhdoGUVbYOVrBVbLcX7suubX/IiCfyP9
         cxHpRb2QrzA4uFZWuw/seBr5Njc8++y0YTuIOinZoCk5koCqKnMf8r7lARYK0LoDWdG0
         XuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910935; x=1688502935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ve6ZUdBLYuqTXgoIqe+BvDl7Md9/EbiIkAt3DnPQx0U=;
        b=byK9keyyCrpftmQwdVpcG/LgvD9mDdSi6Jqkz4KEQw1ck6s9B20TijCOdI7Be0ne2Z
         VsT1vkU4XeCkdZcL/gthFXasFvsd6CqPVAlUzGx+46MFE3E1vLXqfGThGdRKGrVytS4T
         UMMXw9+88XP0ogYzQVYj6HpLE1PbReHD0FEJ+4p+VhPDtnPB2iiVzt8sB5VOjGx+q3gq
         zIqbrHl4gDNY1eeBqiwksK7/jRK815mSM1Ko5AlljFpX/vo/JhOZdxuRMXckzTMJa2qo
         Dk7T6ZAstXE8hCyreRSuViuw06vIWBWr+4EkpRVjQOp/LlMpeiehvuscPIhl1qrkbn5I
         F+VA==
X-Gm-Message-State: AC+VfDyeouycCgPYBbaAZENqp/9xQ8SEDYQ0bKuzdxuFbvjO2CubqPEl
        aXaqOYB5luQizXamERqZxtxTVA==
X-Google-Smtp-Source: ACHHUZ4rArgOGQ1VPKWtYT+F9wL1zuPTdBRFHfi/N7TTiByefF9KAHsaMoSjlA+G4U9YWTQzilYzRA==
X-Received: by 2002:ac2:5473:0:b0:4f6:1805:6096 with SMTP id e19-20020ac25473000000b004f618056096mr1871175lfn.28.1685910935399;
        Sun, 04 Jun 2023 13:35:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 13:35:34 -0700 (PDT)
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
Subject: [PATCH 01/22] drm/msm/dpu: correct MERGE_3D length
Date:   Sun,  4 Jun 2023 23:35:11 +0300
Message-Id: <20230604203532.1094249-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

Each MERGE_3D block has just two registers. Correct the block length
accordingly.

Fixes: 4369c93cf36b ("drm/msm/dpu: initial support for merge3D hardware block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 356280aefa3b..fdc0d0c4ffd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -516,7 +516,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 #define MERGE_3D_BLK(_name, _id, _base) \
 	{\
 	.name = _name, .id = _id, \
-	.base = _base, .len = 0x100, \
+	.base = _base, .len = 0x8, \
 	.features = MERGE_3D_SM8150_MASK, \
 	.sblk = NULL \
 	}
-- 
2.39.2

