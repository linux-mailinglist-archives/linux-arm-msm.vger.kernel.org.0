Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA2426829D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 04:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgINCaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 22:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgINCaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 22:30:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902C4C06174A;
        Sun, 13 Sep 2020 19:30:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x123so11296025pfc.7;
        Sun, 13 Sep 2020 19:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZifYdXY/7F2LoiT7gKnIbVwnlCP6qvLug13m2oN5teE=;
        b=gxlzUj0xB0yJzg+U+5am9MlOexD+ex+GBmHcy+ZwRAfevVIs3epB2w8paAeANIXgit
         jx7rLx9HRr9MOiZd4mftyGKHwfhtDN0/8hGve8qYRsygsqN/ApjbJsV/IQeNPAxnBtnA
         9iT3WNn+7BHeNC/w5shwjj1bCDf9ctz3B3lWa8Be3F5lyGLyY2Jem8tob/jESkwV0KDL
         /5sGttriChwnC3Sz0bZ5gfgHFayZ0h/enNYw0hkHT3NltTjhNETsyknhrkSDr5uXQCeO
         alus8zTyjbaKW7s3XMgF4mj3i6whdvI+HWC5zmtziKBJ3ywcA2UuEzpDTMp666/9JCZz
         E1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZifYdXY/7F2LoiT7gKnIbVwnlCP6qvLug13m2oN5teE=;
        b=qTx+O/I1xKfKKsXh0r0nwkmGaVoKYSd7H+dgMVsv+kMUECIEmSZ0fzfqQXa6azyHV3
         wf+Y8AoBHoBvhnbyn7Ovhikxh0CvuFOB/oDJWeyJU241IzGnDLql4eaUirDAbKDKPf73
         3H2cs8G+MUDqSHw2sCMCE8jAxUJ9bjmbBYDVRDxVRffmarVEnKdCt9gZRkURFNUePso2
         fUtsvgR6RlZPcDZm5723uXgx2FQwRqnEssRc7JMACHbzFh8ekydZPGAff+0ZvpdFpTHf
         dtMTLun2qhpPqOrzjaPaiiEpoCUI3zNlRIvWpDFM3s6aqHeSW40QKrKos4q2zYnK2PRp
         tJHg==
X-Gm-Message-State: AOAM5323thxsA1JSfl4nbM+3PoYd3IpPGK6UxJrcZ7BHIT1mKhHtS1O0
        9EiuYupq0Qkt3tsBFiN/wl30pW/tEtk=
X-Google-Smtp-Source: ABdhPJwNFwdUH+e2nolvRlNJB6bmWymbrUxCPUl3Zk8Dd/rloSA++etdrtwOBW10+jp51Wr4Ga/N3g==
X-Received: by 2002:aa7:9795:: with SMTP id o21mr11830850pfp.26.1600050605774;
        Sun, 13 Sep 2020 19:30:05 -0700 (PDT)
Received: from ZB-PF0YQ8ZU.360buyad.local (f.a4.5177.ip4.static.sl-reverse.com. [119.81.164.15])
        by smtp.gmail.com with ESMTPSA id j9sm8426372pfe.170.2020.09.13.19.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 19:30:04 -0700 (PDT)
From:   Zhenzhong Duan <zhenzhong.duan@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, smasetty@codeaurora.org, jcrouse@codeaurora.org,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Markus.Elfring@web.de, Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: [PATCH v2] drm/msm/a6xx: Fix a size determination in a6xx_get_indexed_registers()
Date:   Mon, 14 Sep 2020 10:29:49 +0800
Message-Id: <20200914022949.129-1-zhenzhong.duan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's allocating an array of a6xx_gpu_state_obj structure rather than
its pointers.

Fixes: d6852b4b2d01 ("drm/msm/a6xx: Track and manage a6xx state memory")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
---
v2: Update commit message per Markus, thanks

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b12f5b4..e9ede19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	int i;
 
 	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
-		sizeof(a6xx_state->indexed_regs));
+		sizeof(*a6xx_state->indexed_regs));
 	if (!a6xx_state->indexed_regs)
 		return;
 
-- 
1.8.3.1

