Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2EEB6F2272
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 04:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjD2Cmr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 22:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjD2Cmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 22:42:46 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6BA10F1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 19:42:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f1950f5628so3446555e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 19:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682736163; x=1685328163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5z0j9caTAK+t1Y50Hn33TpAq9vT8mZ8FHh0G4wESvXw=;
        b=rNNhV/bQkbMsukKkYsJX1r5ywXKd+uJCgUnnhPitTcYUBiXG9DwUaO8gW+VzgOBRtO
         rfro0ivS50rB1x6/4rIVC01AyuR1HHPusnZhKsVEnzRmsli+1ARdXGTBZ9vk+QGPE4LJ
         xHMR+LxL4/9UH/6Ag/mJCAujoGrWXnfNJfLZ9Q0YivLb97xeIHvdYTfcTVnWbjSvsprW
         bDi08XqzX2ZT5MeKWOzaF+kmLFOjPC+dBuceLUpcRiggZlZnTwNQ4sWiFU2mVtKGGfzP
         FzmjYktixZEWvD9Ur9zX/j1oDHk17BfvI8EJR5jRw0J6YjCEIFAZQUgP+6WQfge0dI33
         2aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682736163; x=1685328163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5z0j9caTAK+t1Y50Hn33TpAq9vT8mZ8FHh0G4wESvXw=;
        b=YAKhFuiCjEQO1Rwlojw24tSNpg36h0/nDuzXVUJY4NbcbVI7d0g5wojqMOqFT/THi9
         6sGikGXh5vXyJy8QF7yugBR2xRqYarirhBo5Fbc66Bp71j45uqUGr8rlnXGkXo7NJDc1
         EzHk5ZoIK2GpvqyCV6qwsW5cw0cSSxWSXr1nvMklvXGsPjaHEHXWIk+3xJnqdxsq3kSv
         OWf651co2AuaaO2JLKoympjlogD4EDMvF7tPBhfg8RxC9TdUory9/hF09s9px7mVcFNO
         sY8d9NFbH7CBARmQM72iXjVjPIl3vgLa9EWd0WidxISTvb7I1FFsVONg9pCiNKcaKmPm
         mw+Q==
X-Gm-Message-State: AC+VfDwun4dGhkbs0+XBIo8LJqdAewKNk9YLcRyMY79Z1TIWMDmU2t9F
        9aDSGqKuokGH/3MDKULSRXfb+Q==
X-Google-Smtp-Source: ACHHUZ7mXx8ocQsamoMmD+wEHGo+Nr/9Lx40yplpDfClfBEbl9Lpw7Ug3RYLL8b5JfvqAMunOGv/+g==
X-Received: by 2002:a05:600c:281:b0:3f0:9fef:1028 with SMTP id 1-20020a05600c028100b003f09fef1028mr5017684wmk.17.1682736163649;
        Fri, 28 Apr 2023 19:42:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([81.145.206.52])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c1d0900b003f17eded97bsm29827071wms.19.2023.04.28.19.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 19:42:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: drop unused SSPP sub-block information
Date:   Sat, 29 Apr 2023 05:42:42 +0300
Message-Id: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
Drop corresponding definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3e92c2c66716..db6488a6929d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -384,10 +384,6 @@ struct dpu_caps {
  * @qseed_ver: qseed version
  * @scaler_blk:
  * @csc_blk:
- * @hsic:
- * @memcolor:
- * @pcc_blk:
- * @igc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-	struct dpu_pp_blk hsic_blk;
-	struct dpu_pp_blk memcolor_blk;
-	struct dpu_pp_blk pcc_blk;
-	struct dpu_pp_blk igc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
-- 
2.39.2

