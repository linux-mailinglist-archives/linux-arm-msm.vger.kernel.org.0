Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB72C46592B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343568AbhLAWaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353613AbhLAWaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:01 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCB3C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:39 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e11so50990041ljo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QyBeyBWo65CT6xBgTBhfrozb0bd0F4LFSrE6RAMpJzI=;
        b=sK7eFA3m+/qIm4InYAdUjHyflgJOPhbZO0tlnNIjvXk2ys/rqr1BOKT3XPAh/NHoPB
         +n8pPsvqHQFOH0aLEJhEbX0oroiWtMp1eSv7/Sj/k126jPjoSqTC08BUX8wKrJCAcS8z
         gdI7sHJ7QRFnhqwXg0czGXLa8wBGaBNmRakIWicAgIJOsgGz2NYfgRRo2JaINCaYZUuE
         NcqHEnffPSufbrhvCAJgCSsF++f+wstM81yAjFyVu3O00oQGzgQZvi65UNgiFrtlvCDR
         fxm7lUOSk85c1GTzCQiJewtCqGOLHv8FJc36PUI/6ON1z5J4uaj2MbKcgapsogFYwDLg
         5ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QyBeyBWo65CT6xBgTBhfrozb0bd0F4LFSrE6RAMpJzI=;
        b=4bhiOUNThi0Xz8x2F9XqfcwbyBNTkoB7Km43OgnuaLGLfX/5qPjdF68D3gGD+ssQGO
         gwUXdmF4FtezE19eyoCHV69r3l77AqABFecrub9XryTl3wrwHsUzfM7nt6xWEC1kgDx6
         JWez/clZ0uqgGj9laFjkWQHiuF0zmx5rg41du3eDyoNYh2wtKuzQOqKT8Zj15g+ZK3Zz
         MZ1lKMiawyTS5ed2X+aDTssGryxJhCoiyDZVarOWImIv14ZH2j4drzPCURwRy8BGEb3t
         9hQDyu7XotpKT1Lm+aO0vdlWm5ZINeohb3/VwV7fT72WLpudgUX3yB3WNvFzDQvOFOEQ
         AjyA==
X-Gm-Message-State: AOAM533+DweI1dVTuBwFnkVYIf7Dw1Ns+2ZTOYKRY/FbMherAWBdvgNJ
        uVPT1fZQKw/BQYtIdt22ly2KdA==
X-Google-Smtp-Source: ABdhPJymE79FwRQmq1c0blin795kAa0mjoNu9ebomIYeKBMKEprD0FWK90XiLNqyK4oIgT3oUYbzvw==
X-Received: by 2002:a05:651c:1696:: with SMTP id bd22mr8162728ljb.57.1638397598092;
        Wed, 01 Dec 2021 14:26:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 2/8] drm/msm/dpu: fix safe status debugfs file
Date:   Thu,  2 Dec 2021 01:26:27 +0300
Message-Id: <20211201222633.2476780-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make safe_status debugfs fs file actually return safe status rather than
danger status data.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 259d438bc6e8..e7f0cded2c6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -73,8 +73,8 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 					&status);
 	} else {
 		seq_puts(s, "\nSafe signal status:\n");
-		if (kms->hw_mdp->ops.get_danger_status)
-			kms->hw_mdp->ops.get_danger_status(kms->hw_mdp,
+		if (kms->hw_mdp->ops.get_safe_status)
+			kms->hw_mdp->ops.get_safe_status(kms->hw_mdp,
 					&status);
 	}
 	pm_runtime_put_sync(&kms->pdev->dev);
-- 
2.33.0

