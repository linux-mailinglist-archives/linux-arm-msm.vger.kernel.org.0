Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C707E6934FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBKXN7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjBKXN4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:56 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53727193CA
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:53 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id qw12so23996199ejc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7+OBePNDUGUfFbzMmCaqIm54qtUKHti3rpDis3Z4KQ=;
        b=XeEa+uDDfAG+y/TetpB2O71+A1bGStciAdTbbP7p4mT5r76sm2UxqOfQBP3m3KrwOW
         fFcDvB/20ehY49xfYR3bRdNj18JaTSuzxxuF8TiXvF8re6MKNZcKWT1RgDcIc4cD9Mu6
         MItm3j7CNf421Fvs832JcQfeAyNjPLYJo7TNmKSWH+1P4XUFd6WqM2b/jULTDGsUZU/2
         9QBlVaODxxSyRouu8aeRpQ/6O2fmu9C7lunbmGNckGloNH+S7yb6lW+W0aQxfBF/8Dgt
         sr0t8HsPHHd2nT+Mjg3HpQ/LmtJ+7ZCAnVMTugGhxilVHDn0mdB82zgFvLg0eeYz/5IH
         /x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7+OBePNDUGUfFbzMmCaqIm54qtUKHti3rpDis3Z4KQ=;
        b=kVKA/OlD/5CwhK44aHFVF8qXmXaJxP9QB+7r+IcKbF1LTri7fHHQvqT9FNM3jsOm7j
         eFu8K0VDmRb+rjyvSk7cFkq6CAqDCmBrZd8BdEXoz1rlGBhNyB6BCcYr/gvI20Axepoq
         MipvqkaH/9doXxfW32dm8UXN0Jk/JAE//kh2O7uTKsTci8QqealnVBZMbB8HXu0mgke+
         FFoTWvL+y89rZhouml4l8yTIz0+M0S1Dj5bsOWvqtzr4W5JPP+Q535yG4EQZMdEHsfRO
         KOaCV5jwfc0Rn8v6gCKX7Plabiz/hF4KKn1sVm7HcTJuZVSW28hccXkFVBl1TLAGgZOm
         TxdA==
X-Gm-Message-State: AO0yUKUcvhF7xdE7UluY6ejBY4IjhZirXlxIfLDdsZ/DhyKIx5YNwzCY
        o2WSSiryBvjdIl1trL79dZZp7w==
X-Google-Smtp-Source: AK7set9p5qDmFHU0D49qnJCAVumOA5jhdjrpCTHk6vBwiZLpaf+8/SfzvXExmVanZ8hLuC4t1Uhf0w==
X-Received: by 2002:a17:907:76ca:b0:889:d156:616d with SMTP id kf10-20020a17090776ca00b00889d156616dmr18960311ejc.27.1676157232585;
        Sat, 11 Feb 2023 15:13:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 44/50] drm/msm/dpu: drop unused macros from hw catalog
Date:   Sun, 12 Feb 2023 01:12:53 +0200
Message-Id: <20230211231259.1308718-45-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

