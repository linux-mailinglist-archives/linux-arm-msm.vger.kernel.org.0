Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFB9313E57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 20:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236005AbhBHTBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 14:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235921AbhBHS7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:59:37 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D30C06178C
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 10:58:57 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id l27so15484486qki.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 10:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYhNq9J4eUCsJQlyB7QDTAg4cfCspRt25Vic1ErfLYE=;
        b=CqixGP/PzRiRbv/LMmJxXg2aPCD6CwmtfGrFoOzBjw9hlC5/BWTQOqPnvOpotAcnS/
         qXTtdYim1pxsFkV3KMZKQG8c5zzT5l8dW4xStkWHis3v+ns1X9EaSMMKNOzTI3olEM3S
         w9rtyQr8aPUaE6v7HLgx6M2k/vEehnm72uJrtIpKmYLYQ17cuR5otqxyWvVu5a/y1Q2f
         UKTVMzJHsGHS2wL0+LSW3kMHdRf7rDD7BlDzyBWit9fMnibCKJ2FJKIRe95FYMnL6YDK
         lcR1L5fRH+ZFPR2yQ5LDS5BNm/kHIOAwej4FsofoTQYA92bgZM4yyY5NJBalUZK1Am9q
         JI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jYhNq9J4eUCsJQlyB7QDTAg4cfCspRt25Vic1ErfLYE=;
        b=qitPQEaw/pAHNInvRlND6KroRVNfUSGk43YW5CbVqrC8k41QtALMTrn4nvIVNV7c3J
         UxKrifUzKVDffGtknDIPmEc2peBWki27GtLGnazSZm2UNKSmh4FpEbmkT0W1Be4pVFSY
         Pwb1i/8CIVfYZMwG6ojJbPGC0u3TqlgEGev78/oRusSmfnm9JcsAu/xKBg1m/hm0KO54
         c8dJ6rmb0+FNS8IyEBPmj+o3APonCHlS8BAXXK+XGNBc5eq8juNrDe6CKP4/mKyR0abw
         CRtRJwXnEmiHwqyONmOypD+dBTMT+X5uExhMqYbQeZLlW2AEkbSDWBjINenL/yMfrA1P
         7www==
X-Gm-Message-State: AOAM5303kMXl7VxKWwgkrI6DC69hmZaY+tdQYnvr18ATHCw4W2q3UUZA
        TFDlFMNM2heYzlbQnDDZqqUgnA==
X-Google-Smtp-Source: ABdhPJxBgoyARebzLux0sy3rxY2UD6jbjWyAv34vrESk8EiNTwfqkD/P/dRw1REVGzbBLj/BH/aj3w==
X-Received: by 2002:a37:a7c3:: with SMTP id q186mr4972322qke.475.1612810736317;
        Mon, 08 Feb 2021 10:58:56 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id o46sm4069218qtb.76.2021.02.08.10.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:58:55 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: fix a6xx_gmu_clear_oob
Date:   Mon,  8 Feb 2021 13:55:54 -0500
Message-Id: <20210208185557.15703-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The cleanup patch broke a6xx_gmu_clear_oob, fix it by adding the missing
bitshift operation.

Fixes: 555c50a4a19b ("drm/msm: Clean up GMU OOB set/clear handling")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 71c917f909af..91cf46f84025 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -339,7 +339,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 	else
 		bit = a6xx_gmu_oob_bits[state].ack_new;
 
-	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, bit);
+	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << bit);
 }
 
 /* Enable CPU control of SPTP power power collapse */
-- 
2.26.1

