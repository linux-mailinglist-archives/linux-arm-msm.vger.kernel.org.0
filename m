Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C382C72CDF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 20:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237769AbjFLSZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 14:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237587AbjFLSZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 14:25:31 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A26DE0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:30 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1b3836392so57304241fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686594328; x=1689186328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRzyUIsK6pGxw41itI7qcW9AyOhEGSR+zGX4cSAWEUE=;
        b=P1ebaDZ0Utu/VtBVcEq4AwPmyzWiTMqd/oI2be4YyyHZ+2AA9cNaINLxwe2+97Htt+
         xwbWwOWRiPrvLZ3J0zhyYNMXvVMiJdF+v6WtdcyXdRnXPGZ98GqAcLcqcpJmO41OxqEo
         dhv7VhApeUAQVi4RVR5VzVfXBTFvRLmzR9rbhmcdxfAlOUgUTRO8ohqcDMYhjKx7+SlI
         oGZgAdf3P+/okYUfe8IojoWAn6dfH3NcaV4QTuXapFfv1r5yHkcbKZHS87vgqhJHTC6x
         amw2aUFCqyLEkwCc+30g0PJwqrMG6AKtOvRJufBdV7qqJn3n4/PVAl4RHh0GK7RbgN4H
         ifIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594328; x=1689186328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRzyUIsK6pGxw41itI7qcW9AyOhEGSR+zGX4cSAWEUE=;
        b=iDfJlokq/y832jh6qhXfAtbFUkFDOMjnM0T8U7DLz/h7+NlU057gAD32/cx6jAqeoj
         bMyMXSpAR62L0mE/ArHcKJBLlIq+VwF6riDtKc8CLHnxSmdX0aazj5oNw9dec2lMlVob
         lfLy8cCX77dkrQyMS7XgqZliFy4GebGlLI8EcHaEmMoL7lYDrhKA7Lomz18UA+E63RYj
         SX2aOiPLkrqAMc0O6IekWT4D+4OPKHxKKBQ6fsPMIeihGHjfwRvyOzteqetVRlNbd6i9
         FG9aF9lpTtnsqzBoBG+LCYkUQQ5n/djBiSH2R3xd1yeWx1znGhAc2Ba5VnCmhjo3d6MU
         Pe/g==
X-Gm-Message-State: AC+VfDzDU1+wxWxee0748LcEkZTRo9/xIuHw59wcC20epW+cYHpzMxKS
        JWer03GhHbRyzOTB245+ELaPSQ==
X-Google-Smtp-Source: ACHHUZ7vMn7X3kb0tD+cRSlLHmzDPF8v+1lJz7x03jVDXdtf6kEG5bHgrV44bNAQA2AjJIr5UIvYSQ==
X-Received: by 2002:a2e:95d5:0:b0:2b1:bf5d:4115 with SMTP id y21-20020a2e95d5000000b002b1bf5d4115mr3201417ljh.13.1686594328479;
        Mon, 12 Jun 2023 11:25:28 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e960a000000b002adbe01cd69sm1875106ljh.9.2023.06.12.11.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:25:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
Date:   Mon, 12 Jun 2023 21:25:27 +0300
Message-Id: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change adreno_is_a690() prototype to accept the const struct adreno_gpu
pointer instead of a non-const one. This fixes the following warning:

In file included from drivers/gpu/drm/msm/msm_drv.c:33:
drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function ‘adreno_is_a660_family’:
drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument 1 of ‘adreno_is_a690’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);

Fixes: 1b90e8f8879c ("drm/msm/adreno: change adreno_is_* functions to accept const argument")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1283e5fe22d2..9a7626c7ac4d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -284,7 +284,7 @@ static inline int adreno_is_a660(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 660);
 }
 
-static inline int adreno_is_a690(struct adreno_gpu *gpu)
+static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
 	return gpu->revn == 690;
 };
-- 
2.39.2

