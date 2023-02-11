Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765766934E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjBKXNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBKXNp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:45 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FF91114D
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:44 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id p26so23885683ejx.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6N2qRhHnS9cpZnFGuXYwEG4dF/wTRdTqt3cHSvTaPw=;
        b=m8mlB0qsku1rVsZsq3V6dRPYpOrUMeYmnNL64QjhtLvNZor6AxljuXU7vx/qEohpjb
         DF6cymXhMl+EatpXj0ck9EXnxCHymkgYdISM0diSx3ViUHnlv/R1AdMdJQbbOXD4IS5Y
         krHy1R/8+VmQzCubRMlCMnhhAhJDIZNq83V2WaoNrinPoDio99CkRDSZP1Hoap15b9ql
         8dpLSjdBnC+/GW3Ng4LL9U5WWk8TQv/Wr3P6cDS0Ou0dUkv5vLY8iI77AoIVOjCOybqX
         8aAPjXvamCAb/pW2Nk/bRSXJr8uwSBazo79HG1c9T3acx2ZoNKiPPT5JLmoRwxaM3Omt
         JJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6N2qRhHnS9cpZnFGuXYwEG4dF/wTRdTqt3cHSvTaPw=;
        b=Y57mU4saWnmn98xZLagnbQ8/4T0WQIl60/E1Yw7I3FZXZ9fWZVKiQZI8r7bOV7uT/3
         Y8zmZ1OUs8H4WtKrKWZGmCx9AheJKDih4evsXwP0N8EdowUzkdMGyTF+kuI03Q2eyqXo
         9qV+NFkbFOvO/gTOr12/rOK3zhwkZmn0v3E923lwDll6DpZFTC3li+Lu9IunCZiehPJw
         hb50gF6Fmwn/L1FVIy+3O+SY2ZxFvfQQjDlU7Foby/Q8eTysiAolBaspR0OWJ3GVU/2M
         UDzCgVRISSJoIxhqUoJCPSxELxnIuSrfNvzsdPiu4VCTBQevf0z7nj1A5V7u16qVsN66
         0J5A==
X-Gm-Message-State: AO0yUKWbWxADRmy9CcYOt7v81N+b6MaeJgDcX+OQ/e6PHBO+i4k4kM3A
        w5PyOlIp/ghIEj2ZGULjwcPfrQ==
X-Google-Smtp-Source: AK7set8XlkAJ8+3hpgFpWzrr8jeG/7tgp0IViewZISWaygfCQr9dvdqmDROW1k3wQX0dxApxySvm3g==
X-Received: by 2002:a17:907:80e:b0:8af:447a:ff8e with SMTP id wv14-20020a170907080e00b008af447aff8emr10227312ejb.20.1676157223732;
        Sat, 11 Feb 2023 15:13:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 36/50] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
Date:   Sun, 12 Feb 2023 01:12:45 +0200
Message-Id: <20230211231259.1308718-37-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0a5d6d9fe751..a3a79d908451 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-- 
2.39.1

