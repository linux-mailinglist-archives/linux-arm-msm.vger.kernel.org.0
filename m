Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942C16D622C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbjDDNJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbjDDNJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:30 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11993591
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:27 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 20so33789846lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0qagrlVseey+Z3DXDiCrx8oZOPPRUijOR+Qh85SE+0=;
        b=olKlw9NVMTPY8qU/GMy3FZ8dgTbD1Jb/GpVEVaJQGu6jl3ZEKMNtLjGicwAznkuVeu
         6lupcH5+ddLPTubClAEzBR2SYr/I2/3IGzbgq+vyEtSXbCwWZbrH0QoJ26WDC5H7lp+J
         HAbuu2PynH2UxzrI/63Tz+e27JdjGgKYVwYEBGZRJbPHLMw4lgMzC/YraQ/vD+kSHe55
         rFa20VtdEyoE9AF7YdS3am4luqqQXKlBVnuzZvUpzwVLnezEzDJ73JAx5ee2/GnuF/w3
         H6pYSLoDxUkxPyfeQBOIgcn4gebxkrGRFqxmY4pRe9Bn7jjS/rZgW5jm1TF5JN0C8RpN
         itgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0qagrlVseey+Z3DXDiCrx8oZOPPRUijOR+Qh85SE+0=;
        b=W1K/CY8+OJhekpUHmYk0PWJ/doI9esp+HcuND1k4vJj9Zt+3+3xnIVUyWoAg1s7Dc5
         H5YB+5NsojY3eMEkZ6j30Fg53MINg4+lKmdDNL+Vad+gmqJfTnNmGL6jJUVPyNoq19D7
         rac94ayBFs8y+gcQcKBOwLJ5Ofcj1/KUndpYCZe+g2MQEI1y1bpltZtSg+tdTTf7sYGP
         PMeW4dvN1PstRMbFdyD+n7SzL2uwtYz6TDGLDqB8yWJHUqFoyEINtqvtjplpRAYn8cGZ
         z1ymSOVN+GmFJnI3Wo0VvXU+n3rVQclb06v06pWDvz0rTREZw5eO46nlG5Co+WAr4pjk
         CEEA==
X-Gm-Message-State: AAQBX9fOkJQMT3uubaHAXulS88/QxmrMxYKC7icajctl0k3+64hz91Oh
        ofllZXKp6RX5oW5hlYUjd5hYctZpoBE9i1OkRxc=
X-Google-Smtp-Source: AKy350a5JwmFN0fgNwdhlQ/eKF2KIOS52lTB34fGxCPNrt7lFrktvdV8iHwC42KBZnFsAm4ZyG1llw==
X-Received: by 2002:a2e:854f:0:b0:298:aa96:55c2 with SMTP id u15-20020a2e854f000000b00298aa9655c2mr936425ljj.44.1680613766324;
        Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 31/42] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Date:   Tue,  4 Apr 2023 16:06:11 +0300
Message-Id: <20230404130622.509628-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index d30b797e90e0..3dc850a681bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.2

