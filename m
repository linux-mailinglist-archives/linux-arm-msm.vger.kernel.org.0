Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B099E4BF064
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 05:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240732AbiBVDUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 22:20:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240683AbiBVDU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 22:20:27 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2F7193E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 19:19:51 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b11so22095206lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 19:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqEJ7t7d9werCkQI1i6URimb2OKfZ9/v1747LLNARQ8=;
        b=eaq+M2/o7/EOmqg650t6Y2efxNnE4TBhKbwtMwTAbalatlqM5dCywCQa93hUwKjVZm
         39nDltp5gBGWmmtCQEvTvse+WZgN06zCGtxeL1Tl0U9FpphqWpDMubrHjZTkTKnGqvWy
         12IBeZHC/4nqxb0GvkJJ1EY3u/yBrwwjcwj3bsXGJjVKCF5F6MlGeIyBCcSDtj8j7s28
         jO+0s/IPpc8nRlUJw3vsi6CLRIxuAXOVqmak8F65LYEgjFxCq7vH6/BsrRZn8WmXNecT
         /C40Py+taAG6zLRQdmv8yyDRWI9xMxpyrrDdYE1XFYhEvycst3D0Eo91PxPsQM0zWXrI
         91Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MqEJ7t7d9werCkQI1i6URimb2OKfZ9/v1747LLNARQ8=;
        b=SF6DAS7mUGCvJkeDO+PbG/rrvpSHkl/YS1rhrBGPZHdL/5dxKNbG6JEK0l72/Prfp0
         v9y9Q9B0S/6jqjJlVsNPiMuMJqpry/qPsxz7JnkkpAl1JP9TdjN8VkRQge2KgfODWsQQ
         p1vP2ma3NU1i1tujmFTP9/DTJzC+Fn0quRXAyUk4YAq7WeVSf0ga/MIWK3de1q3hbdfU
         WAcQpXgheNKVUCSXY9QKQ4kMWTEYcmR51W4WuDYEWgPbVF9cZYpHYVdheUGoBtABilly
         symExjR9qYhEIzyJ/KhHHgu3F3TcEcUI63eDRq7s7n/sz4lu7yHlmFBTqPHc8j26Zld0
         GH6A==
X-Gm-Message-State: AOAM532d5Q9dlDN28/AyzLN0hbxrE2PpMAoibPvS0KL4quKL64GXsMx7
        cTIB8gCSd+cBw2PvHFkDe7C003lyJ9UmNA==
X-Google-Smtp-Source: ABdhPJxN7Et9Fa3BJMvbf+D1EJGlcLyWeeAhYydEy1Kljk8I2ZuatGz5YAHPqSivMp/ggIYvGUe4vg==
X-Received: by 2002:a05:6512:4022:b0:443:4cd0:1d67 with SMTP id br34-20020a056512402200b004434cd01d67mr15898913lfb.511.1645499989973;
        Mon, 21 Feb 2022 19:19:49 -0800 (PST)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id v11sm1271997lfr.3.2022.02.21.19.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 19:19:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>
Subject: [PATCH] drm/msm/dpu: wire up MSM8998's DSPP blocks
Date:   Tue, 22 Feb 2022 06:19:48 +0300
Message-Id: <20220222031948.228727-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The commit adding msm8998 support didn't added msm8998's DSPP blocks
configuration, but did not use them in msm8998_cfg_init(). Wire them up
to be used for display post processing.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Jami Kettunen <jami.kettunen@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa4d20762ccb..f74bc7acd901 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1496,6 +1496,8 @@ static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.sspp = msm8998_sspp,
 		.mixer_count = ARRAY_SIZE(msm8998_lm),
 		.mixer = msm8998_lm,
+		.dspp_count = ARRAY_SIZE(msm8998_dspp),
+		.dspp = msm8998_dspp,
 		.pingpong_count = ARRAY_SIZE(sdm845_pp),
 		.pingpong = sdm845_pp,
 		.intf_count = ARRAY_SIZE(msm8998_intf),
-- 
2.34.1

