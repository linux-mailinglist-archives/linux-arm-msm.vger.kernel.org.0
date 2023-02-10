Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D8869209B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 15:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbjBJOQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 09:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjBJOQA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 09:16:00 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE8C2F7B9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 06:15:57 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cq19so2116244edb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 06:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/UOK1NShdEMWcdP2SL5M0tg2wUn6YcZoILpbDMoTRQ=;
        b=ahVjRax41pLyUIoo7Zhzu264no6suX+U9ZshrK/YsFZA9xwh536O8qNYJsQCtPEG8F
         ejl86EdgtrYyi8dOvUVcoSiUsKAujNRTWa9eRXlxYHkSUZs7qTUCpdGy1J1u2yS/Zkck
         TpAHYqeYwhZfV6hP6JLFAd2NA7SOjwUQd7uQY8w7CXKs7QyGgo2TJKU1TKR88ab6t93l
         HEPkrcVru7pExcwu9qbbAhD7oMrTTu7SpWkrnqdbsJo+1lnZ7q83qp6K+ECrfV6sCMFL
         J6yCwl6CADXZVD19K507gEMBawEuoxRYF+nG6WEMMyVutYuiYO0/I+DxBwlz50c290x6
         3oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/UOK1NShdEMWcdP2SL5M0tg2wUn6YcZoILpbDMoTRQ=;
        b=ZkyuVogQlHGHCFexBcfDfWxEKhwSxy+DdvdjCofMuYEax+mrg8cPcEyOtqJci0M3N5
         d8q5Xt/sGJ8c+P9sLwj1aaOWwxzxx8sBJh/a86ghoCD/SSm3k7pG4Fgf2SVd6l9RvaA8
         FxqW6J4IEvIHY8EwMSHeqIHoj4w28zpM9WAgJOHI9tk2Zc7/j+w06bRb7U2yM1svP5az
         800OXMmESBc6nbOcOVAhclKUHghzKbSuuaCcEZP3kHl01/2ZsFsk4PEzAz+yucbuQ6Sv
         muNtJhgc69kjqjKS7TuNKLIIfCAx4XDuISDAa6x3IScT0kNVTvPsEIUZL3/x/Sk9KaQo
         jSVg==
X-Gm-Message-State: AO0yUKXi3YTikPX0nTGE0ylByNUq5+7OWW13LDCvhKF1Fr8cpgo8aYr+
        xg/mBs6mHiyHcpZ8a5eV1PjvP/AdDBDvfc0B
X-Google-Smtp-Source: AK7set+7J3Mfr3v9XUDRMKMWaGEgJYmuW8BFK0lnIeISxuy2Yjg+i+Tntx/IXg5exQdFwEXLxsfwoQ==
X-Received: by 2002:a50:9f04:0:b0:4ab:4289:e9f8 with SMTP id b4-20020a509f04000000b004ab4289e9f8mr3408095edf.3.1676038556058;
        Fri, 10 Feb 2023 06:15:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j16-20020a508a90000000b004ab4ba814a0sm847071edj.47.2023.02.10.06.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 06:15:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
Date:   Fri, 10 Feb 2023 16:15:54 +0200
Message-Id: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

The SC8280XP also has a black hole at the top of MDP_TOP region. Set
corresponding bit to disable access to that region.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3fa202da62fb..f792275dc48f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -743,7 +743,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
-- 
2.39.1

