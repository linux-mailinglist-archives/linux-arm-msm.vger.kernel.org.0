Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB1E139C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 23:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgAMWFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 17:05:08 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36304 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbgAMWFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 17:05:08 -0500
Received: by mail-pl1-f193.google.com with SMTP id a6so4372921plm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zd/53b/YzvxFSSJluHpg2s36yjG1ma0E/zaQrjFe9bI=;
        b=COPCLdzLquZ+pTd+qUGkNUztKc9ghw2B0XavyRbkLgcM3Elx5pxsZzkioDeo5ITOFL
         VGVFmmv/j0NnW8j/7RWd/2S05ILFq+ZdcFS5DzhnkEwCUtnEGMTWz6KQB0UkJDZB3DgO
         nUcESk3UDAcutgobfQAP0KuOYM3n+b0NpLSNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zd/53b/YzvxFSSJluHpg2s36yjG1ma0E/zaQrjFe9bI=;
        b=pU+B466Am4CtucglijcCTMWl83swQT57+4DAKK0SvNXmFCCdB17FieCZ3HfDIXRD3X
         Mj7a4dQAB3g3EC6F0nfDUq5A9W63n2i38tBF/sWtl8MFxhA3DhLZNMBosO66ZoOuIpHm
         akRc+tQzTqFif8NnUVmFmXaFOQYgYKviaoPlDDPCK7Jc8EoRwiJN1irS3pl7yPow3Ffn
         opRr1/k+sY1+DdEOTCmPv1jX60kGfCUiE1QViLQQFUdtKD4N572BtuIXy/z8uQYpI3RZ
         ptR9OZXA7iHy9ti6SuDOc8FuYGg0eCXzU9cF8UFOUIpzxkb3qIqqgtuhxnqHZCzbWVq7
         1Saw==
X-Gm-Message-State: APjAAAVsj8Yl5Qlwz4wNbNIUP6rHCG8k6PEZQ50Aj/UhVXELQHNFGwVl
        JtlW+ZHwvzW9gFwXLEzHkudu3w==
X-Google-Smtp-Source: APXvYqwSgta6aJy/jOmbS+805x0Xsc71s56AGXM8UF7sEDgc66R/QG09EQD8z34BuJIgVvxxx8lXQw==
X-Received: by 2002:a17:90a:2351:: with SMTP id f75mr24735687pje.133.1578953107752;
        Mon, 13 Jan 2020 14:05:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v9sm14682621pja.26.2020.01.13.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:05:07 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: Fix error about comments within a comment block
Date:   Mon, 13 Jan 2020 14:04:46 -0800
Message-Id: <20200113140427.1.I5e35e29bebe575e091177c4f82606c15370b71d7@changeid>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

My compiler yells:
  .../drivers/gpu/drm/msm/adreno/adreno_gpu.c:69:27:
  error: '/*' within block comment [-Werror,-Wcomment]

Let's fix.

Fixes: 6a0dea02c2c4 ("drm/msm: support firmware-name for zap fw (v2)")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c146c3b8f52b..7fd29829b2fa 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -67,7 +67,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	 *
 	 * If the firmware-name property is found, we bypass the
 	 * adreno_request_fw() mechanism, because we don't need to handle
-	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
+	 * the /lib/firmware/qcom/... vs /lib/firmware/... case.
 	 *
 	 * If the firmware-name property is not found, for backwards
 	 * compatibility we fall back to the fwname from the gpulist
-- 
2.25.0.rc1.283.g88dfdc4193-goog

