Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8703066BBBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 11:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjAPKbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 05:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjAPKa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 05:30:59 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4A85250
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 02:30:57 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id y19so8227059ljq.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 02:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ6BZFlm8LwCDusEm3oaWT92wHiuJKfGaz1mRtrB8xo=;
        b=USqO+XsjPTr6ZaPIi/WP2/HtD/8/FKhMMT8+WJ6U9uL97Hk7peiiJnTXtSTKi3ngth
         uF9PqDE0NNfkYr59Wxfc8CP797WyG0syybEbYOdw4O9Thdo3jJ4mzhrINjeA5eVmuiVX
         ijFUMtc0QAvAMsuALxA5kWh9swCWzpvd2wUIEHE8EmpiBe92pkxcwRkVJh4eAoKGnLBh
         6wUr/qmBl9TYCFfxxTi+VUtHKngNEA2mDZATn9E/rfBNmTyfYKOu5RMj7CoCnNKDoCBq
         KL3HRXjcERKctXjHUJ6T4Dz6Kt3xMTShaWX7Su4EfvnfTPqRGwkCOm/wm/DSiaB1dUVP
         F4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ6BZFlm8LwCDusEm3oaWT92wHiuJKfGaz1mRtrB8xo=;
        b=cF0TqHIGTMY0mrtVNLbWi2UB4+qpWR6nhwJb82g5HHlsNLxFNdp4wspmMOtmo4acdc
         MtLMHiR+1cliKFmLTO7ZW/EwQSfhXaDuQK976h0U9/OsiCTN4ZMEjVHsZ5/w7TarFGma
         CVca2FBrGGdwBS6+OFD/LAJToej7uHciVesUQLYsv8b7cR0Q97e51YYCwn8eugC1YdW4
         C9YkbXLz8TC8Krvd8YC9zU7+2bdeopSh+hY6ZiMk7ioD0LyXM+Tc/6jSRGkCPwGiIfDx
         yk8AqOfXumdjldVtl5LYHS/ICClmiXstgf3OHxwhi0ClTIgjjpe8no4vfyEo2shnbLET
         8Gbw==
X-Gm-Message-State: AFqh2kodrYLyPLW9S2WqVdY4RRCp6dVlJLdYuACpt5yK+7UgjbLYsOv7
        AAI/HCPP+SPs8VIxgSAz6GQ2bA==
X-Google-Smtp-Source: AMrXdXsp/CHV6GDcgSnM8igWHTVGkOM0P8g/2O6q8iXNLeLIDuodbwt5zsjr49GQMRGSO95YEpA2KA==
X-Received: by 2002:a2e:be29:0:b0:281:175d:fa46 with SMTP id z41-20020a2ebe29000000b00281175dfa46mr16021997ljq.23.1673865056237;
        Mon, 16 Jan 2023 02:30:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k10-20020a05651c10aa00b0027fb9e64bd0sm900771ljn.86.2023.01.16.02.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 02:30:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: sc7180: add missing WB2 clock control
Date:   Mon, 16 Jan 2023 12:30:55 +0200
Message-Id: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Add missing DPU_CLK_CTRL_WB2 to sc7180_mdp clocks array.

Fixes: 51e4d60e6ba5 ("drm/msm/dpu: add writeback support for sc7180")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 504a22c76412..c7103b0445b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -546,6 +546,8 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 		.reg_off = 0x2B4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
+		.reg_off = 0x3B8, .bit_off = 24},
 	},
 };
 
-- 
2.39.0

