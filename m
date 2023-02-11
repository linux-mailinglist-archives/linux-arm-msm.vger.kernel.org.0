Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209FE692CB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 02:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjBKB7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 20:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjBKB7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 20:59:12 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84046C7F9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 17:59:10 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id p26so20106895ejx.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 17:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WsYj1dvpr8aqC1MHtJmuXbUcdvOjnso7J/f67jxofCo=;
        b=lXI/sFqen0oshgAA2YEH725UdyKaMCaZFY6j5dXA9HdJ8+Ek3+h8A/lGz0RlgUb6r2
         /CzbteHFyPs8xHI+wfz4ZkjNx0z2ZJW0F3Y3/63cIx3IFN5G3ea1PAlAtrbUG8qIlq5o
         xW5qTABRYlEquNfOtVfH/K825dJr75MLLZT6ImJssxfxEwOFprutnhjvPZoOtwvbIO5D
         mAeolfEO6pPuti99MXkWMNuNKj15gmxCEgoI7JPNU29f3ylK2kiSYw6Y5PRsDBo8Pmwu
         1ZAZCBt83iK6kjmDxw3z0JpqPssWaDxp0krc+vkNhG8PIOcTD3e/uzCuWeRiveZrPi1I
         tzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsYj1dvpr8aqC1MHtJmuXbUcdvOjnso7J/f67jxofCo=;
        b=ci2XpfU895pYLr4ejKGX/nL/Xs1ZG0XWp99KDJ9Lga80/HKsNI6dOEUucNGtyuQc2q
         yXTVbGX5fIAtWhFcc7fAJvWmOoTrejGx4UTV1b5e1P8ImFHJcNOfLOf9XcVruIxZykUv
         sDYZCAkAtAFxFHqAvvYPAgc8J2dLnY565z7FOCXf4ST0x2j0wRj9Sb3QOzM7rLDn16Hd
         oc6uZxKS8i3nLBEKQKCAa5x1FHT/JC1zWR4aTWyPJ46HrteNf1D9PbvfncULdVv5KunB
         EnCmJvwdivN0bevVMWw3yeyJSb42BVfvBcnw5rGIi/DVQO6WJxddIK/adoUzE3ZW3Pwn
         5ldA==
X-Gm-Message-State: AO0yUKWTPXBzX7eC9Ilf3x4x0ngXxX/GyFBC0Il4tw6rRYcXF1Ai8Nwt
        tgvIFUnKTQR7yVbxOQWKd7qo6DpsTC7qRZZX
X-Google-Smtp-Source: AK7set8lr2hecxNLdc0jB2qgDBb3EvRe0hdI1d1P8WmlFNoiqDDr5c3KP/VvgRK/pFJjHN01M6fq3Q==
X-Received: by 2002:a17:906:1250:b0:87b:da77:eec2 with SMTP id u16-20020a170906125000b0087bda77eec2mr18025808eja.19.1676080749346;
        Fri, 10 Feb 2023 17:59:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j9-20020aa7ca49000000b0045ce419ecffsm2987146edt.58.2023.02.10.17.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 17:59:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
Date:   Sat, 11 Feb 2023 03:59:07 +0200
Message-Id: <20230211015907.1077839-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: rebase on top of the msm-next

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 71df24a134ed..fb5120afb028 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -696,7 +696,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 2,
 	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
-- 
2.39.1

