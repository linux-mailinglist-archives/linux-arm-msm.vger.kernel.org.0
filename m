Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2347515FC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 20:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238096AbiD3SMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 14:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbiD3SMn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 14:12:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D600183B2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 11:09:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b18so209235lfv.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wrK1K9n3ixaqlPIKj7chJw5kcok94xlounLLosoFz/U=;
        b=BvpO04TPgDmJx6pkxWI3UlhkhdLFsL9WBcBRyADD0GuV9sCDLEnTy0W/cFK2zC/nxe
         Y8jTWhZRXimMY+tgCHyRQ/p8goLwo1rnevJU0Ef40MSQl+Ohxg1uyE73ZmRJbB9shuWM
         GDqUEtzPhb5u6BM34uNQJOotHLNfH2Oo0k/7U+jHUarO7elXZcdv1VnRY7h6/dKB01e6
         4wC6vO5rw46TJPKnyBdRfzEOQSL5lH7mM9+4xVrB/96YMUZ735+jNHezMq5zUvcXtdXX
         lmpSXUQ+hRZNSx7y4CGDpeNKJRjlNe4kXYcZZTKjgoGiNxYo9dcbvTtcFBSmaM8xydLF
         L92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wrK1K9n3ixaqlPIKj7chJw5kcok94xlounLLosoFz/U=;
        b=4srxEKMnnhVIAzvATagGRuOJVUfqFEiV1jEc8cRiDUzJK4Ng6z9VV4a5XQgfNSnguO
         yWDQs00+fS6G7JZQsSJHDQu8ZIjqO7DvXiEw5P3YQqI7Uumq6aRxFoX1M/gfW2N4vyxn
         gMX+GtVHhRa3sIQ22T+cqZ26itn665MN4YADXE93ysgkybXv/NNso9bgbzWDT14GV406
         rflpwETb78hb3ZzA4nrAfdZboPUmt7q3dlCHBmC7Cnr/5ehCb0p/NgbzxAMB3RKair/w
         juFOJg5egXUWRQHXeNZ8CBfRG91zWbo4LXEsdoZXeSsEhcJkyoeLUchVoduKYKr1WrPm
         Cyxg==
X-Gm-Message-State: AOAM532qC3zEGmZTPOmYsyVpZ0oK/LqlAkCio2yEaHcl8nQRHlErdsBl
        yHV84pemtSAQxDQI0x1O73L27g==
X-Google-Smtp-Source: ABdhPJw2eY91hUFi+7oNkK/2T2qyHWtGTfkq3iDxqQaCY9SfqxMm2XuvX/PN6px1rFay88oJuHUAZA==
X-Received: by 2002:ac2:424e:0:b0:46b:9249:8ce3 with SMTP id m14-20020ac2424e000000b0046b92498ce3mr3639302lfl.282.1651342158880;
        Sat, 30 Apr 2022 11:09:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k12-20020a2e888c000000b0024f3d1daed5sm598428lji.93.2022.04.30.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 11:09:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/msm: add missing include to msm_drv.c
Date:   Sat, 30 Apr 2022 21:09:17 +0300
Message-Id: <20220430180917.3819294-1-dmitry.baryshkov@linaro.org>
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

Add explicit include of drm_bridge.h to the msm_drv.c to fix the
following warning:

drivers/gpu/drm/msm/msm_drv.c:236:17: error: implicit declaration of function 'drm_bridge_remove'; did you mean 'drm_bridge_detach'? [-Werror=implicit-function-declaration]

Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
- Fixed file name in the commit message.
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f3dce334553..4a3dda23e3e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-- 
2.35.1

