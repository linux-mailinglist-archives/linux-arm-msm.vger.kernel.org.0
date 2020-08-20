Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC8624BDD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 15:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbgHTNOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 09:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbgHTJg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 05:36:26 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDF6C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 02:36:26 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so1348178ljj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iyIFHI/GagIm4is2IjKR4dFCd2u6tmF485sTbdWxVbM=;
        b=MLkiiqpTIK0T8bIG8a7cw3MlTUto09mHqhVzUWPfnkk4OxAgoe4yk5RS+KzyPkc0rV
         fSzxXaaHo2Ohq+lyWw4WVH93TRgv0UhPZUicHg09AtCULq+HW79090fk/I68wSIlGQG2
         2YPoUJB+09rDM1BounEJ/4DbnRsg71ly86n0zyynHqByO23KsJ1MgRQ/VchwqV4iuXtR
         EPP+1nsst3H0kTK7jgtwccEi40dav3czNwj4Djj7S330dhKMPaA5ZW7WUY6bzUnGclve
         uVQdReKKsIlH6FcLOEOc27TBBv89loXlhqZcWAYQOMFu+5mX+RGolF/sT/kU6WzuEh1Z
         mtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iyIFHI/GagIm4is2IjKR4dFCd2u6tmF485sTbdWxVbM=;
        b=szyYNUq67pK4qNjG5NVhCYk8y+TCuCSNG6TLJ8NDhfLHJjnAeHlnQbzuCY9h7b0Huo
         mVxTPefQSUVbD9XokfxvjkBZVjerViLk0vDy5psLGxF7J8FnmhFaRJmg44qpnKRfAdcw
         PdDufDt0d5DgEiOe7PhGtShCG25RpiNknXvuWcD6s6NE8XwBtuECTrNyZ+yutyKgUOhx
         o1pgYOYgSQu99o51dMUFileBnkeosnUJ9u51JKNThlbtzuJC0LZOGcTaG/+txuB8PhFF
         yi0xPBKRzz6dP/PTGs8A7n+qe/sx27MSrXzrBfET8fdduJXuUu4W7uZOJkz50qfpLDEP
         iPrQ==
X-Gm-Message-State: AOAM532765YTaJ3/Xc6yjcWJvhMd1j/iEsWekHa7kDLa0e31uMSgWyvx
        gSyyZCt/0VRvgUeEoCZOcJd4cdgbgaNelg==
X-Google-Smtp-Source: ABdhPJzkrJAsNCFVlqgWwzF85xdP8TGCbYUj+sMOPyxm2W8leLqPgVkA3ZiRvIiKvXe8klbPf8wjPA==
X-Received: by 2002:a2e:71a:: with SMTP id 26mr1262048ljh.198.1597916184580;
        Thu, 20 Aug 2020 02:36:24 -0700 (PDT)
Received: from eriador.lan ([188.162.65.245])
        by smtp.gmail.com with ESMTPSA id o1sm341811ljc.3.2020.08.20.02.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 02:36:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/a6xx: fix gmu start on newer firmware
Date:   Thu, 20 Aug 2020 12:36:22 +0300
Message-Id: <20200820093622.3801751-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

New Qualcomm firmware has changed a way it reports back the 'started'
event. Support new register values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b67b38c8fadf..0df56292e227 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -204,6 +204,16 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
+	u32 mask, reset_val;
+
+	val = gmu_read(gmu, REG_A6XX_GMU_CM3_DTCM_START + 0xff8);
+	if (val <= 0x20010004) {
+		mask = 0xffffffff;
+		reset_val = 0xbabeface;
+	} else {
+		mask = 0x1ff;
+		reset_val = 0x100;
+	}
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
@@ -215,7 +225,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
-		val == 0xbabeface, 100, 10000);
+		(val & mask) == reset_val, 100, 10000);
 
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
-- 
2.28.0

