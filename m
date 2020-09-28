Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E816727B69C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgI1Ur1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgI1UrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:47:20 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74922C0613CE;
        Mon, 28 Sep 2020 13:47:20 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v12so2488312wmh.3;
        Mon, 28 Sep 2020 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qi3QBbwTIzLJyLiPTKqArtAX17f0oV+sDtlvdTST9EI=;
        b=FFkHwlEIKY9lkTUKPFFQJf5c4ZIzjNYFW7ukX1xoz7kGJ27+encAVjvi5xqmUaKSdX
         Yy0XbmQ5rFoCHUvrndTlTQ8Ym6wQICT1CCtk0d4TnwebxYk4hsPbMCviuYxD2bS6bR5S
         wjQCODFycwrSCMKqigHrPKdRHKG+X0nQ7Amf8X5A7DcyVIH6j3wT6Q+q9P1NJX4+Ba8t
         vmnTDiVzSAPamuTFEKNY7YNqmmxxczAqJW9eXb24P+GcI31uO41x1ZW3EcR9IWt4FFdI
         4YD5VI6giABZpkf2tsGoz9gMzuiYt3uT9+WUKBJCqMYzo4JWUCFM2dsRcopJizyvrG8o
         cHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qi3QBbwTIzLJyLiPTKqArtAX17f0oV+sDtlvdTST9EI=;
        b=gBgh0fGSUz+3iz4n4mv1xPMfUxxZdWRDR62aGoEN3/bW/97W85ASo5vETv1z8ewcyE
         RW2FaINSEHQFFRo6J5wGClPkk58gZzPV+eROnWnK3QKLRDLlfDvcf293iqwb+jV5mZqc
         JFptmO7DiBZ12fiBBM8L7GV82GOxXeTcqmdZI+lRpyRv6LlkzSLxtsF/M+zpCB5uqzS2
         f4P6bejX/YaMwBRh1ntNk4QwiliDJ02aNBU3Y75s6t8zNsOYyvtRSO8s5NAOTz2G9v6W
         UuoVwMQeK2pc6JuW1O7Ny0ImwU2NLi8qQ2GRk29TvuTFAIKhFwJe5w599hhsABGP4kz6
         iZmw==
X-Gm-Message-State: AOAM532sHGBJoJZNOX4Lrr7CJfyqVrYk8UmOdPHKMjKa79pnuhaa17P0
        PZH+YBFOkIUeK2wQKA2MZ9U=
X-Google-Smtp-Source: ABdhPJyjrWTObYZdK4RIzlZ1/TcPmklnjYiF4GcGB15/SN8U/IaNASVA1MBBGzulQH3waVkTRb7abg==
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr929365wmk.87.1601326039069;
        Mon, 28 Sep 2020 13:47:19 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:47:18 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] drm/msm/a5xx: Disable UCHE global filter
Date:   Mon, 28 Sep 2020 22:47:09 +0200
Message-Id: <20200928204709.45746-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx.xml.h | 2 ++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx.xml.h b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
index 346cc6ff3a36..7b9fcfe95c04 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
@@ -2367,6 +2367,8 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
 
 #define REG_A5XX_UCHE_ADDR_MODE_CNTL				0x00000e80
 
+#define REG_A5XX_UCHE_MODE_CNTL					0x00000e81
+
 #define REG_A5XX_UCHE_SVM_CNTL					0x00000e82
 
 #define REG_A5XX_UCHE_WRITE_THRU_BASE_LO			0x00000e87
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6dac060902a3..979397372505 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -722,6 +722,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
+	/* Disable UCHE global filter as SP can invalidate/flush independently */
+	gpu_write(gpu, REG_A5XX_UCHE_MODE_CNTL, BIT(29));
+
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.28.0

