Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE5438AEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239630AbhETMox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbhETMnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:43:46 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB149C056494
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:08 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a4so17423601wrr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
        b=ECdngyCPXxuV8WED0vFl1Q/XPm49F6DBoppaIbs0HIcfo5XtnDejjHk8tkEzG01VqR
         VynFew87U48BK6UQOUZvX4hik/sKntYuwWjWHhskelw1Lwng6CXVxmjvJYLoh+5gDvFG
         wZTZ6uyJVOIYmg5bUoF2U8S961FxPN9UgvmdvJLprgOh2wDY45n4COM+p2y3GhU/jQ5e
         fukfyAfIzGVH+1KeEWfy8NFfvHqqUApjYjRh5l/GAxWnQZy//rm1pWAWrRvc6MU7kTp6
         MRfqdYUMvpTXpajmj7WC3yZ05xkBqOBCP8CpzfWBkas8+GiV1H07tv6mi3oyarOfc3hP
         4w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
        b=bOcWN0tjc8sGg+itqCj6yM3UcsIEZPrOiddQOLdf2JjK1L0qGn0mZuvazvwUATw8Mv
         kOKGCi9ZyN8IAXA1ppZhDu9Vlp0YHyelvskjYdbTltY8qMzezOQ2C6QJwVtG0VDyu9UP
         g6eO5GkbJEdmRCLtM9Ad5UfggAcRfYcqpE6EdqoCSgnlwk2qp8l11Zq9dRdCsvY9fCGm
         0YOke6j7XsudsTBy+jgRJdjI6pbyU9+wIZmcl6iWYmuX5UDCBFU1MlpMZlQDj8+fW6pF
         UEaWuyUcnNu18mpNV+6GnBjxJJ+PAH9X1pzlAECd0qM1x89/W0+hklmu0zabV1iz6hxV
         rMMA==
X-Gm-Message-State: AOAM5302mYS3+rSuzfKj9romKPD/FClM4r/yEnvdXVY7fFRCHLrgg2mZ
        uh2H5swNkdyNrCY1TN1m4PVvhQ==
X-Google-Smtp-Source: ABdhPJww8GIvcXXddF95MhisGycsLVA2OrrF8dm6FBwFHsH6HeJ8zlz3Bhe5xFrg/og+j4rKvcXOHA==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr4003474wrq.92.1621512187365;
        Thu, 20 May 2021 05:03:07 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 15/38] drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable 'cmd_enc'
Date:   Thu, 20 May 2021 13:02:25 +0100
Message-Id: <20210520120248.3464013-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function ‘dpu_encoder_phys_cmd_wait_for_commit_done’:
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning: variable ‘cmd_enc’ set but not used [-Wunused-but-set-variable]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e4..088900841bf8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 static int dpu_encoder_phys_cmd_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	/* only required for master controller */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
-- 
2.31.1

