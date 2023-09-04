Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B93B790FCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 04:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350545AbjIDCFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 22:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350360AbjIDCFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 22:05:03 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8791D100
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 19:05:00 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bd3f629c76so15172831fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693793099; x=1694397899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
        b=Qyq7k3QEuONkTNHnN/GVc4Qs05nJYJx0VmTVnhS526I18BBX8o+AXvXiUwpe65LmEv
         wLUl5V8b8CQnZSxlotmk2L6WMLr9UTaz+yvzyjHTNE545qsXREF/aqC0BS3q1SL9szxP
         oW6TGeFT8oh26K3dqa6OQlaC+jRawj+7Tyoh+GIOCBMCOuLFsZht4EBugMZX7spuGu1b
         qjXHsS68SV3K84U2tuskUyvRSvbgZLFhxfAA8/+AmNcoSwfqoKDHSzrqt3AETT7h6YcE
         stpgXJKGmtZRb4ih/T4yXEj7sgrxKxJi1YZzj3tNFI7fQTYwCfvWh1c1me7g0Iyt2EF1
         HQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693793099; x=1694397899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
        b=ZItNGm8nTlogsYabqlsbhqSVi5Go6dp6Hs41m8Hmph8SA/CrXye0Hz58Kx3pQuIXlw
         FuFVjRlSC3nrnUwZUz6L1T4BIWvdfMESlNUyK2Huz6ENG+wbDqpltIhFROFw3PTEFHAu
         diXOvYrIq9q4J8h3bi9EB4ZhUBUUZy5kHmobaDbBaxmV+Rzb05Qlg+ZENcBWL8QpyY3A
         AYEecuq5LUQqmPs/EXWpCkkvxUnKrkhYsbQbvqwKl1bM4dYaITfjtdvXXpQObvINBaKv
         QrhmBBPYcum7EMrJPA4sEl0YD03l5OJUFIxU9scp/OmdE0uUzv6NujpITdU21Xdw3o9u
         7GdA==
X-Gm-Message-State: AOJu0Yx/Tx+yqCXxsZiCdbODCn5+WQcwbN7SvrAXM6Vj1XK3QTradnsz
        rRdjAMYf1sFiUObmzPIIW/JRmg==
X-Google-Smtp-Source: AGHT+IF36i9EswZo4RNOjRcQk+JyB3dMeWEVFibQ53tNc3oIsE2tmIGKKysdXisyKNbLEyJDlchwQQ==
X-Received: by 2002:a2e:9890:0:b0:2bc:b6ce:eab with SMTP id b16-20020a2e9890000000b002bcb6ce0eabmr5348791ljj.51.1693793098906;
        Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
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
Subject: [PATCH v3 5/8] drm/msm/dpu: enable INTF TE operations only when supported by HW
Date:   Mon,  4 Sep 2023 05:04:51 +0300
Message-Id: <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
only INTF_1 and INTF_2 actually support tearing control (both are
INTF_DSI). Rather than trying to limit the DPU_INTF_TE feature bit to
those two INTF instances, check for the major && INTF type.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index dd67686f5403..95ff2f5ebbaa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -558,7 +558,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
 		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 
-	if (cfg->features & BIT(DPU_INTF_TE)) {
+	/* INTF TE is only for DSI interfaces */
+	if (mdss_rev->core_major_ver >= 5 && cfg->type == INTF_DSI) {
+		WARN_ON(!cfg->intr_tear_rd_ptr);
+
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-- 
2.39.2

