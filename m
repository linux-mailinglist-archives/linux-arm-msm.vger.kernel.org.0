Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E71347B6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236331AbhCXPAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbhCXPAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:32 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A360EC0613DE
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i26so16552039lfl.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5a0SElwgMSR05OnVZxlFyzafRcs18clf2FpnQ1Pirw=;
        b=FXluN6BbG0HZTXJyP6TVendzyux+n4NQNsn62YDIl3r/Qny5xdJHvNxbxGhpTrCQ7W
         gIGKyE8tqlpcLOmjhNAa8wLoN0pp+5LDqnlf9sYGsTRyR39zxWWJPEc9S9c8FMPOV30w
         ftto/Aga4NhiyCJHnsTQYOvI/mGU5s5lSrk5WT0HYFY6HKoc7WjYfQrbpN28Kd8uQnpa
         dP3k6QNk/efsrfLBbVqgQhcahr74CzaVBPh3USS9P/HjhgDUg7WrwpRISyLcKiuTOyFF
         YZA4XfiII9nut4F8PLNh2vFUPekIPM+OhNk+fLGZGWElNWcqwYcQaCR+WhvNTOdSi1lF
         HNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5a0SElwgMSR05OnVZxlFyzafRcs18clf2FpnQ1Pirw=;
        b=Z9pxxgafi7PXQVUWYX3WGQhWPAPnkg7qfu01Pe0gKkFW9aCHCPul8sNbxAvk4LVbrQ
         xD9tGi46EOvL2n76QbZegY5zPlqgDmwCpifBpUEcvmtq6a11+fv1QkItaH/FmzMyfIno
         2WfHoB42Zpp0yfqqcwjXcOf7d4m+r8iN9n1yHj4XySB8igxh2xYrB+J21DK0tzVvqc8b
         xRYgriATurl8z/Gwd0JriWaShGsuyTKEsPG8p1Lve5oGzheeRnWOahYTwCPzrYXxqDJu
         6jqp7tdDCgIRaNA8pArFAdOBaeV7QTQuvyYPi5Se0hdrloxIIn/yTCrEbjlURX7q+OPj
         AkEg==
X-Gm-Message-State: AOAM531ybBgZxi8yx8SPA12LV2aCQi1sxzKoOlrLRP46d/DAs+3db3cf
        PGVUMjntxqvRJe9MjwanHDf7Ew==
X-Google-Smtp-Source: ABdhPJw6w16Zus9bj6ywWeRfCOVFk45iSfhf9EZexnbh1wiTTH2GJmAbiUgKI4AgiZpogPcSPoTmFQ==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr2185512lfi.538.1616598030092;
        Wed, 24 Mar 2021 08:00:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 01/21] drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for SM8250
Date:   Wed, 24 Mar 2021 18:00:04 +0300
Message-Id: <20210324150024.2768215-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
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
index 189f3533525c..e4444452759c 100644
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

