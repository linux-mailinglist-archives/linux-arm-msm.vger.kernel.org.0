Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13659515FAD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 19:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiD3R7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 13:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244007AbiD3R7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 13:59:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A053F8B7
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 10:55:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j4so19058478lfh.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Y45HNTyNT2hIp564O0VhShXCVFtrKbtd8uqrhfCQS8=;
        b=VQO9DA6oWtzvHO2nzA53gzSN26hGTrlLZ9a5daFM9idyeltWKQguBQB9yx02wZL6bp
         RKYT4jp+KBstu5rGLXuQtnZFa0xRTGUXxPcVg9aIwbob59zVgHIYUJuxkR12LjeHEeV2
         hy0Ta9sSF8h0hNdsrAcYYfqF1Jne0eggAHb21qo8WjP7+iM/gpLlXDcfEQcALEmAaSET
         rtHAT270Lga1nzxfjrAUKFk2XuZF9gVWbo6UsgVYqyuOYcjDHijXjzvPmlWuqg3lYr0B
         c/ZoG/2D5etFJjzkZdRDgGxNy90vw3b7tp3zy4Yhx/rqy7V8+RNSgc46wqaVXOMxlEej
         9joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Y45HNTyNT2hIp564O0VhShXCVFtrKbtd8uqrhfCQS8=;
        b=tZkp0VkJGMBUk2MWJjbtnffMEDQ9/SHOE1XrcEEPJc6i2rXcqXIfQFeNJKhPWj+STq
         cBIXsRHWyFt5X0le5vE351V8OydFZ8qy7NOFJ1N62IYd0wud8bzgCnxONkSy9Dz6Zsoe
         LJIe41HkdUs5o4LMOjKW/K245abp97UDHPi2GPp3UIPcnLtqniS9n/ymgZfCIz3/I/Rc
         EaXAmGYAgHUI7bytjlXVjPMrI5Y+bWBzWSxdddw6z2dyhRjc58o2EZJierSSfz4cbm3z
         gUCqNi8gP+cmSz/nMK0hzTGhPQni/ZLV57WK+vW5bLU8bWq5/POexrKPAyEQvkSC5hNS
         coiQ==
X-Gm-Message-State: AOAM530SfJu1ogh/2qnL97cO6Ni4MdZfHo5q0Xvi3mkSv2/uxG1vY5Ed
        +FmhYXmSt3irrqHqq9tkF6QGMg==
X-Google-Smtp-Source: ABdhPJwQUukHgHTGombGLcoN6OonLQ2X20+3n9oaDC27k5RVejdILlrlv39taysZbQ2Hy4pjVVmbvA==
X-Received: by 2002:a05:6512:3b26:b0:472:44ba:1a37 with SMTP id f38-20020a0565123b2600b0047244ba1a37mr3593054lfv.581.1651341335136;
        Sat, 30 Apr 2022 10:55:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u5-20020ac24c25000000b0047255d21179sm240369lfq.168.2022.04.30.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 10:55:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Date:   Sat, 30 Apr 2022 20:55:33 +0300
Message-Id: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The downstream uses read-modify-write for updating command mode
compression registers. Let's follow this approach. This also fixes the
following warning:

drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
   (Abhinav)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c983698d1384..a95d5df52653 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
 		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
 
+		reg_ctrl &= ~0xffff;
 		reg_ctrl |= reg;
+
+		reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
 		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
 
-		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
+		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
-- 
2.35.1

