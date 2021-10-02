Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB44A41FDB7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 20:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233778AbhJBSdI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Oct 2021 14:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhJBSdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Oct 2021 14:33:07 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96B2C0613EC
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Oct 2021 11:31:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y26so52747126lfa.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Oct 2021 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0TOsxY2C2gcID0yo/4ltic8viK9R7xT9wFfMMcLu9ro=;
        b=YOZy7cFDGr/Q/xTYZPKmmixJVhBWywFG98Onlmyb/fatkVb6thgrG7xrC/G6DTr4lE
         7RAQRmQIajpd14yBwouwaEq5K9Y0tX61rbBLEW+VSBtJfDF6Rr+a6JDdBmiqrq0yUHJc
         iuJU1vwngQ6iSW4FS2uYv9yHorF460tj3v2HQW/dgJTnfBS36pKNsxsxUl26Eh1IE07T
         3/fKkiYZ7ml/AR0HAEBsfvQdKdMMDBjZjs8KTzJTsSnLIXA7+O8YZwbA//t/cdMYc0ZK
         22mY2T+uE3Wu4jZRz4Cr70IzcodFnbEFsTHRthkktNHmqDQOIy5Y0rh8PJtalS7fmlHe
         vCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0TOsxY2C2gcID0yo/4ltic8viK9R7xT9wFfMMcLu9ro=;
        b=iqU7p+jS5XliIpf4u+rIz1IJAWlDHd16WSALF5NzWJbV2cul1i/+QGi4lDMqnj5G+Z
         LsWCZa7W/F0+9bDg/8ew8ZbWXgeYzsaz1vGfchEYSOlvD70GJ8PGQUQF2v1hiJ/JKPmK
         A5D++FZ7wxcd7cwjbIUJ3In44FpYE61jS6n3g1ADTTwBOUHvpZF+LU6z+XCXrvYjZmMr
         E0pGbDSFR4QUHo08nmxzDJF15ZxAzX4g161C+U43X9Oa5N0Dznb38Q9iqBIsxym4IR7K
         C+B2GdoXw0azwi2AmGu95rPaMofHUOgeyyemVynq19t3itHrR76bHiVT1x0RfAvGWup5
         fbwA==
X-Gm-Message-State: AOAM530mhaf0B7J5HSg3n5EaL8iximHE0CS1Z4PfFcJTjahrXcb7VlQz
        byW/jz6OknxyQXVcYELQbhxP8g==
X-Google-Smtp-Source: ABdhPJy8m4i2Oku6/vsJU1h6QPiGIK/uE9SJIhSZqadR7hSfSSI7MhWm6lisY30xU9zxBX4GAQDOkA==
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr4916664lfd.657.1633199479933;
        Sat, 02 Oct 2021 11:31:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bd7sm1020419ljb.20.2021.10.02.11.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 11:31:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: correct cx_debugbus_read arguments
Date:   Sat,  2 Oct 2021 21:31:18 +0300
Message-Id: <20211002183118.748841-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

First argument of cx_debugbus_read() should be 'void __iomem *' rather
than 'void * __iomem' to make sparse happy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index e8f65cd8eca6..7501849ed15d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -180,7 +180,7 @@ static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 	msm_readl((ptr) + ((offset) << 2))
 
 /* read a value from the CX debug bus */
-static int cx_debugbus_read(void *__iomem cxdbg, u32 block, u32 offset,
+static int cx_debugbus_read(void __iomem *cxdbg, u32 block, u32 offset,
 		u32 *data)
 {
 	u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
-- 
2.33.0

