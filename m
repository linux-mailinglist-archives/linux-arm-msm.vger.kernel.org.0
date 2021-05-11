Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7ED379E36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhEKEUS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhEKEUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:20:09 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95724C06138E
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:19:02 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id j17-20020a4ad6d10000b02901fef5280522so3961025oot.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rN0DT3zlZfmYWomZy/xhSTmw4G63PXYLKWmt/5607Kk=;
        b=Pol1SjKqEVGlx/WScV9FX5CZvpeia/m9qrHo+ror/7kmCvGHG3QC38IWj6KzE3c9XH
         ce7ASja3E5wkKuCbXBH0Uk9ac82RNb6ROPT8XyBHYsDx42bPg78cUCyXPZn18+QG3km6
         GHnFlUN/BJdAjN8ZVP6vqoMiMpzRA6yMcEAV6P3ZS8zezHZux1hL/s+4V5gFGP+t4lpx
         +2z0/WFKljoMLNXwPxTF9G7CnMZ5Ka0eT/NRsIK0GOKzWHFak7VozsDigy9BrW9EkSp9
         WGorcxAarLHSepbVVfB6Ep7Jd0fbSRcsjLUDQB666W08InmAu/Dwpj9hsnfuib1vDWBj
         uhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rN0DT3zlZfmYWomZy/xhSTmw4G63PXYLKWmt/5607Kk=;
        b=XL/2fcq7wytZ98fPU7Ab2rpsu7WRF5iRdiX9Ug1ZPRrZxUx5XeEcFI0UpIOlcFheJC
         fXO5Ch2k+aEE3UApCT0SpG5DVYqbiDU56tEeu24ueJfuu8XG9+UOlIeH+8+IQokJSQBB
         w1g5fALHwt9ASxdZXG9mD0sqriONDfOksaTpHMNAI0eKnSqIr28GsPUy4TGN3NBb6KoQ
         Yo5TeXojvL0eF/rhCgx/jXB98JGf3zDZyhm9lrdYSXD0OpEjeyEQACfzbz5OIO2DdWGx
         EhhopuofEY1mrGPRJcQQyU7cPfuUkctuVwRc2bgO9LtYDuqqLD+FyEwF1MQ6dPv3MS1d
         nVGA==
X-Gm-Message-State: AOAM532qw138GrAAQaVVmeV2jXgWsqUDyJgSML3HS+sy/WloEPFT5eQN
        3N3wJd6d0ZIhfZSyUNy1UBQ6Fg==
X-Google-Smtp-Source: ABdhPJzxymsZa4j9D945sY4/mED7VULyiH1STgKoObJ3xYiJP+20nom2ZFRast2hI3f29OZ20Y5cfg==
X-Received: by 2002:a4a:d4c7:: with SMTP id r7mr6433326oos.85.1620706742050;
        Mon, 10 May 2021 21:19:02 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id z15sm558647otp.20.2021.05.10.21.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:19:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] dpu: hack up the irq table for 8180 intf_5
Date:   Mon, 10 May 2021 23:18:52 -0500
Message-Id: <20210511041852.592295-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511041852.592295-1-bjorn.andersson@linaro.org>
References: <20210511041852.592295-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This is a hack and as discussed on IRC this should be replaced by some sane
mechanism for dealing with the old and new IRQ layout. Including it in the
series for completeness.

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 48c96b812126..fa576c617f86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -72,11 +72,13 @@
 #define DPU_INTR_INTF_1_UNDERRUN BIT(26)
 #define DPU_INTR_INTF_2_UNDERRUN BIT(28)
 #define DPU_INTR_INTF_3_UNDERRUN BIT(30)
+#define DPU_INTR_INTF_4_UNDERRUN BIT(20)
 #define DPU_INTR_INTF_5_UNDERRUN BIT(22)
 #define DPU_INTR_INTF_0_VSYNC BIT(25)
 #define DPU_INTR_INTF_1_VSYNC BIT(27)
 #define DPU_INTR_INTF_2_VSYNC BIT(29)
 #define DPU_INTR_INTF_3_VSYNC BIT(31)
+#define DPU_INTR_INTF_4_VSYNC BIT(21)
 #define DPU_INTR_INTF_5_VSYNC BIT(23)
 
 /**
@@ -310,14 +312,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_3,
 		DPU_INTR_PING_PONG_3_WR_PTR, 0},
 	/* irq_idx: 20-23 */
-	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_0,
-		DPU_INTR_PING_PONG_0_AUTOREFRESH_DONE, 0},
-	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_1,
-		DPU_INTR_PING_PONG_1_AUTOREFRESH_DONE, 0},
-	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_2,
-		DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE, 0},
-	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_3,
-		DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE, 0},
+	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_4, DPU_INTR_INTF_4_UNDERRUN, 0},
+	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_4, DPU_INTR_INTF_4_VSYNC, 0},
+	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_5, DPU_INTR_INTF_5_UNDERRUN, 0},
+	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_5, DPU_INTR_INTF_5_VSYNC, 0},
 	/* irq_idx: 24-27 */
 	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_0, DPU_INTR_INTF_0_UNDERRUN, 0},
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_0, DPU_INTR_INTF_0_VSYNC, 0},
-- 
2.29.2

