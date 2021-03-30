Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1AD34DD99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 03:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhC3Beq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 21:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhC3BeP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 21:34:15 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69E9C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 18:34:14 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t18so6901835pjs.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 18:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A8If7oybmQFoEyCFbbgw0aizc2xKMTrL9mIp4UPDLA=;
        b=jitl4f2XQUctjdUPCCbZajr3dY4HcAUyftf12BZnk9gT+ExyOyrfn1aeoQJ97WZv0F
         OziPeisSf7nfUL7Vir9BOCH2pJ0XxVwB1H8xsIXQFZDnO6OkQaoxXASHwwKGvO2wAjMm
         FPgUiUBYn8zXhTWWhrZ1y2FlZIk7LUO6kXJ4vzAp+pxcg48qeGgblFHxoorxNK5OTqDa
         Ar76TxInftkgSBm46CJTsBm13wEPwKxMK42wjPYLc84bsm3TsVTGaSD88tANdPWVNzT/
         34zNyPZ5NkE8fqvKkZ/LalogOaGJB456iDWehYkIyhzq495DhRaEeJd5KxIRH928s9LT
         Cyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8A8If7oybmQFoEyCFbbgw0aizc2xKMTrL9mIp4UPDLA=;
        b=CF43Ky3aBYj0gUnyx5YgQ55Seo5oGfemLr7rEHilFimgStVu83MX2dM4TEokpuBijT
         iX0aHZmYFjXajKnT3rB/Vsmb6l4ts6d+wA1d8iCFkVaHGQCZxBr9FrKWdcaMv/XpBMtk
         T9snHAIa9x+eY9np1gTKCqtC2WmRAUB2yzE+NemODQ9lWB8frqqyWfatCtqArc1IBFrH
         RcI2sAvquoP0BkM44DyAG+snk1PBO8bdSUZAAqqGjEEgoQ0IHwuGGQges9lA+1/BmmT7
         I1FC/odZylpVSLS4lQUeI/qEz9MP8qAkS/3CcwLu2JkykdanTLlN4Wv5KqcgKna+03oB
         KAug==
X-Gm-Message-State: AOAM530sOm6/PJiNqZxJTpbNlx6Vj2s2yHrLbfDzsbPHTnr7XeFGrFCh
        1O8dYIVkQZ9fntqzVEGQmZUW0w==
X-Google-Smtp-Source: ABdhPJzYWn5sEsuZHqydzJcwoR+ebQ0R+EoGQlVFKwWjvoaLyMtIay73TxhsG1977KSK5uO/wF6Mig==
X-Received: by 2002:a17:90a:a603:: with SMTP id c3mr1821365pjq.107.1617068054533;
        Mon, 29 Mar 2021 18:34:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k27sm16752258pfg.95.2021.03.29.18.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 18:34:13 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Subject: [PATCH] drm/msm: Fix removal of valid error case when checking speed_bin
Date:   Tue, 30 Mar 2021 01:34:08 +0000
Message-Id: <20210330013408.2532048-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
access outside valid memory"), reworked the nvmem reading of
"speed_bin", but in doing so dropped handling of the -ENOENT
case which was previously documented as "fine".

That change resulted in the db845c board display to fail to
start, with the following error:

adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware

Thus, this patch simply re-adds the ENOENT handling so the lack
of the speed_bin entry isn't fatal for display, and gets things
working on db845c.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: YongQin Liu <yongqin.liu@linaro.org>
Reported-by: YongQin Liu <yongqin.liu@linaro.org>
Fixes: 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to access outside valid memory")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 690409ca8a186..cb2df8736ca85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1406,7 +1406,13 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 	int ret;
 
 	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
-	if (ret) {
+	/*
+	 * -ENOENT means that the platform doesn't support speedbin which is
+	 * fine
+	 */
+	if (ret == -ENOENT) {
+		return 0;
+	} else if (ret) {
 		DRM_DEV_ERROR(dev,
 			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
 			      ret);
-- 
2.25.1

