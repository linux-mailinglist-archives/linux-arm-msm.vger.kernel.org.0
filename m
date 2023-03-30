Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1B26D1119
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjC3Vxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjC3Vxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:53:32 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBEA10432
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:53:29 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id c9so15959363lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZJWk/sms01Zh3ZBIBe2mmcsugNs8WbGB7AtvX58eRI=;
        b=F5knO7bj9cY/4llO0nO0kn3LAwwlaZmz9s532YaFxnTUHOdr+ga+VtTwGX0/bIIax+
         lkoqIaJBnmeFQ3BJD/xk991/8XcbnOdKENou3/06PGAZdrUwra/lyiBn3Lkmb1yirIkL
         e5cAQq+QNCWmmhikkuYaUhZ9hiNWTIhvV78T3pfBCHkPtYcwm50Ffd1vVnWlTRzVZVxy
         5jne5Bpf4h1mn/7TFSLOYLRf2JD0UmNow/Dquu+LFxr7f3YKOJhL7UZ/svccPPb55ZPU
         RG2xl7Jlb/aq8e45Icv8R+VF89TNT1xBikS042XhMLh7yRKmU2LKBOvJEIzTOtpB9/Fv
         fMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZJWk/sms01Zh3ZBIBe2mmcsugNs8WbGB7AtvX58eRI=;
        b=Ee80MOQCEJKtOWub7ampQnImnauPYop4LzCD168ZPnxtU+XC/CbwZ5w94NzEhpMiab
         KZd0iZip2lP3+Ppe7q3peXhMUDusJ4Yhwy1l74SYwzhAszBig0eju3qw/sQ+ZKbrF7Jx
         zyg6lMq5C4FjDLVkddHPPYMXw48Cpjnu9USPv2M8HF5D7WttE2KhqhMWlKtZEkhP9eeg
         yL6hHIa+EslvVj627v1oN6KJn64FiivR8mzY4ucUYsYttK7lS1+o/+KsxG1mpoe1gYOM
         kimK//cHXnbgDIV0BZi/rPqmkWYcqbcyx90yl6CPc9ozX0Vk9o2nCobxL/O6c71CFEDS
         JZCA==
X-Gm-Message-State: AAQBX9d4tYOYA+dBq2gB4e9zZLYXOpD3qALJtVLBipy8VlyfEYtQuNIg
        fgWGCZufMxsNe+bhc8Qh9fIFmA==
X-Google-Smtp-Source: AKy350bDkBUh9ZGKLdSM7Z6eAaQyTFkqyZ/IPOIJdzCkrgbNawk1N1Jn7qH+35dyL+j2JKqxbxFOtw==
X-Received: by 2002:ac2:5096:0:b0:4a4:6af4:43b7 with SMTP id f22-20020ac25096000000b004a46af443b7mr6042896lfm.69.1680213207462;
        Thu, 30 Mar 2023 14:53:27 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:53:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 03/38] drm/msm/dpu: mark remaining pp data as const
Date:   Fri, 31 Mar 2023 00:52:49 +0300
Message-Id: <20230330215324.1853304-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index be9b9f8f143b..a3fd5dc5f368 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1660,12 +1660,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static struct dpu_pingpong_cfg sc7180_pp[] = {
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
-static struct dpu_pingpong_cfg sc8280xp_pp[] = {
+static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -1729,7 +1729,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.2

