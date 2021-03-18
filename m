Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD1A340405
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 11:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhCRKzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 06:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbhCRKzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 06:55:05 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C54C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 03:55:05 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b83so3836707lfd.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c1PjxkJWRqZH9Itgha41YGjrgemxzg/sWl+7Uk4MUXE=;
        b=t0DFqimi3isfDhx/V5eIsDPMDk/202h7dNwHp8feagKuHmr81mfBNAZD3Ua9uYCqTk
         Rk07oobZbjl/frYTn+tWu3IAdfDK5A/7Z3yKOwSnW1ZLN+I2SMcZLvhb7YipCks2ADlT
         Bl/C33QVwRjiNLg0lCrKOpMNcqwwNrX5bbAngr/cFp6XA/fZ3XwpDhLnSWvHs02kf7ey
         D7x+jauGD5VgD3qUZN4SzjHmcjKWGhggPPuVrGu7vlGQAcsCcaP3JBcV73G4Y7RKYHaA
         oN9Y5Er7K1TT7kxj3D+CP+SfEb+1heNnTFA9YGEy7J0CIbUWBe/p2MqCovuaUqO8qlxn
         bCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c1PjxkJWRqZH9Itgha41YGjrgemxzg/sWl+7Uk4MUXE=;
        b=MTbA69Tkb6Tp6u2wV/Dqe9Sghk97hXwO5vIp+B4erTK5X22/SO760coQ5w/yxm8U7e
         jCS6hvAo2JcscMEPP7/Wb6z2okBo86MMeEX+Wpv34MgbG6xiHXypavs7g6hHbYkR2OcN
         8N8MzDqGKZXNkMOXlmdjxeEc9k+xuHeaY/nwtFdqcFKfcktOcDqGyjeemyTfaCcOZGd4
         7TCWPcHJ4zj/mNQczPG8178Ol0Y20P+4Tzv3z26sVYcYADc25iwbZTddpvtkK/RIk1Xw
         dy4/LUy3UoP6u7oDZpaiZoobERZmaLXNfjUOukCb5FWXPyk7qdfosyrAfCv/2t7j08Lq
         Ejaw==
X-Gm-Message-State: AOAM531nl/5eQ/AoliNhZgDMieH2JkByakkisZ9KN0hQvdWArkh2fRl5
        xfqrjEiAaA725GwmlJcaNQudIg==
X-Google-Smtp-Source: ABdhPJy5DFNkpcJO3HWxt+NbsIqKlrwbQRcnKhDAF24WkxblOuK7JpO9m+TJryIBSuRJ/X5VMOuTOg==
X-Received: by 2002:a19:5213:: with SMTP id m19mr4960818lfb.203.1616064903653;
        Thu, 18 Mar 2021 03:55:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i18sm182110lfl.22.2021.03.18.03.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 03:55:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for SM8250
Date:   Thu, 18 Mar 2021 13:54:35 +0300
Message-Id: <20210318105435.2011222-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 platform has a 8-Levels VIG QoS setting. This setting was missed
due to bad interaction with b8dab65b5ac3 ("drm/msm/dpu: Move
DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks"), which was applied in
parallel.

Fixes: d21fc5dfc3df ("drm/msm/dpu1: add support for qseed3lite used on sm8250")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index bffe5969ed7e..f21f630af476 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -22,7 +22,7 @@
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
-- 
2.30.2

