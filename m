Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97D538CF40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhEUUrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhEUUrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:47:24 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8C2C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:46:01 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id k15so15153013pgb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qc/OISeLg533se0Ov/+qOFnvI05ew7O5rEcNf/rVX1Y=;
        b=nC0UhFlm212CnyrWNvtpu6kE4mWwHySnKzDUPQtf26R7PkPF3sEaIawFgxiZDnjE5+
         XuCnVcokB8yonlU/uLTQRrsmuDfyHP3LsE6xgP46I7yj2qYekBw37sqpR1BXXO1wtp/5
         nD7wVwtKmtqaU23+De1xsc0EeoyHYNqvlPD0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qc/OISeLg533se0Ov/+qOFnvI05ew7O5rEcNf/rVX1Y=;
        b=RresiiYTxDzQUY+HFYyw3jpZ377YrVofqCFLZyV2Aj3jSTK3EP/jsNUQx7FliFSUOQ
         p/0lGm3f9tW9aRMxiyadmTLUtjWhNspFlG8nUhh578qzvDz9avkYnTTHpvJo1eZE7LO0
         n1X+MRjmH7BhB9dMGycA52eQZLxW9PsC6lRm3N3Bb65pFN4IYEDsUzCUuhvqPWnOXc2M
         YpQ3K7Qw30GDI85qN3PYEkv2OlG4irNE6hC0dkEN4IUG3hMBKRa1+TGFZ+F6iIYlB/q1
         bJHyPxtgNG5G/DLjGecvxZUREEtUSfndOg3wrDejGXxE0G6bTc/wBiR+nuz0vtELMgiL
         vjzQ==
X-Gm-Message-State: AOAM530ryCdkYRMfMb7l+5CRXuDZtBorC7eHebMbNezSJ6FlK4Dr/bHF
        /yoD5OPcojSHrE0QKUV+YTmIVA==
X-Google-Smtp-Source: ABdhPJyuVEaAW1PGylYq3ioVKFB2/Cb+DhaAneOsAuDfXLhYsdtUdaTbycQanmvelf0UhoTAzWM3vg==
X-Received: by 2002:a63:ed41:: with SMTP id m1mr616385pgk.252.1621629960856;
        Fri, 21 May 2021 13:46:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:10e9:a6cd:727f:561e])
        by smtp.gmail.com with ESMTPSA id mv15sm4839635pjb.25.2021.05.21.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 13:46:00 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>, swboyd@chromium.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm: Use nvmem_cell_read_variable_le_u32() to read speed bin
Date:   Fri, 21 May 2021 13:45:50 -0700
Message-Id: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
proof ourselves a little bit.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The patch that this depends on is now in mainline so it can be merged
at will. I'm just sending this as a singleton patch to make it obvious
that there are no dependencies now.

Changes in v2:
- Rebased

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b4d8e1b01ee4..a07214157ad3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1403,10 +1403,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 {
 	struct opp_table *opp_table;
 	u32 supp_hw = UINT_MAX;
-	u16 speedbin;
+	u32 speedbin;
 	int ret;
 
-	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
 	/*
 	 * -ENOENT means that the platform doesn't support speedbin which is
 	 * fine
@@ -1419,7 +1419,6 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 			      ret);
 		goto done;
 	}
-	speedbin = le16_to_cpu(speedbin);
 
 	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
 
-- 
2.31.1.818.g46aad6cb9e-goog

