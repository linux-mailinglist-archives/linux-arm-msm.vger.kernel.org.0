Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D5227B69E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgI1Urg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgI1UrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:47:18 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A90CC061755;
        Mon, 28 Sep 2020 13:47:18 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id b79so2485573wmb.4;
        Mon, 28 Sep 2020 13:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ziMJA1iAl+X5B9d1htcymFy9Dzvpmo6/9Mbcbhl/So=;
        b=lhhlipNfqHYh9MhQQuWjdQvaiskcbpYDeBDMStFVQFJNXP9Un8SFDdHt37qmpBDjgY
         ckJ4yiJaWfpHgIfeAM+lHTY/fCdNo7ENInQAiL4Bsf6xuQdZInWhn0KqM1kkWnf6QkjI
         EtNY+0NUgDwnUG3p3fWjaaE8+gibgaUbxM+1JXk7p0SfDqIMGaKjTAoUyw1hh2Kr3l1Y
         mGc+4WUM/PJbOZKVzE7JrHR35LOWuGug6g24DAXtMfS2uIYoZ4Fz4a9e+fXKtowOjF+Y
         UkGvsLI4CiCoOUyga5wGRpXcgFQXa8kXZuxSVcaWC4BlaXyOlHiVR0WQCCuyEZYfkoO3
         4/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ziMJA1iAl+X5B9d1htcymFy9Dzvpmo6/9Mbcbhl/So=;
        b=Xk3/UWY3jQCFZ1Hz8usehGxxliiRD66z/781E7odLZCQHO7oFedSvCI7R3QWCFaRbx
         m1XOa8IQiTOI8ipGaoOoSFwmeVkcNZ6JXQ+3Gt/WEJjUroZufwzjMYAnsAWC2w8plYF+
         HZhnNDdQ3C7sn1IuoFRZeUw6PeMliQRIJg+NPhtuSAScCpBXCcAJkX5v66TshQ4Lulaq
         8aTYUKuGbvzitCuYrlVrp9MXqifne0s9SQ4uUYuh7VWGQVff5+wCKMa7YcxB9y8aJKSp
         JkFTJFynZmsBG26RqTwa0C8eHTykSyqtfZQAdi1VWQ6H1UydlWjKuIdIKopz4eZul46N
         BjrA==
X-Gm-Message-State: AOAM533PqgQi1EgcU6XOBtQWMNnuCvDqCFIVTt0KwQT6FApSUAKkahPE
        GriX4IxwG4usxrhomWV2PjonOv7wuJbo0Q==
X-Google-Smtp-Source: ABdhPJwHLnaWduzznR4445DGO1uZiwlNxH5xDQYmlpXk/mmOnEUuf7Tpxrgpah5JChgfT7ZolOOVmg==
X-Received: by 2002:a05:600c:2742:: with SMTP id 2mr919838wmw.136.1601326037053;
        Mon, 28 Sep 2020 13:47:17 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:47:16 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] drm/msm/a5xx: Fix VPC protect value in gpu_write()
Date:   Mon, 28 Sep 2020 22:47:07 +0200
Message-Id: <20200928204709.45746-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

The upstream API for some reason uses logbase2 instead of
just passing the argument as-is, whereas downstream CAF
kernel does the latter.

Hence, a mistake has been made when porting:
4 is the value that's supposed to be passed, but
log2(4) = 2. Changing the value to 16 (= 2^4) fixes
the issue.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6163c3b61a69..448fded571d3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -789,7 +789,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	/* VPC */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(14), ADRENO_PROTECT_RW(0xE68, 8));
-	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 4));
+	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 16));
 
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
-- 
2.28.0

