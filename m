Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 408AF6934A8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjBKXNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBKXNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:09 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371731114D
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:08 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id jg8so23959655ejc.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAtJf3WKxuylZMOKBWrbgGq6Mwl28bpihXOOTuwZmbY=;
        b=xWNBs3mb2YOaeSMletTGpKrI2aMWigVbRVIM6w4HrvDBsgLUPGL3FPqMK4PIxf4IQU
         rtXxKFCXtOWM340ruA7/NcGb/wHtT6WO/gKqkHQjXxETYukeIZBAISg61culU6y0qt74
         hJJFJmjUv+xtZVSzev5MYb07VvDO19IyqWor01NHxzmFsMVXER2jepAjcvLxAxBfdeI0
         coqfmqEd/7nmPZkUfmRt7c/mQ30+DfMp6uJntG+U56JqvcOmi3RTT6yZlFLPqojwR3is
         jGOUkUJdJL17Oi4uJKnz9oG+FjwuT2ZJ1pVt+YXIGYdewG4Mi9XNkvwlnODGdlCfmaHk
         u9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAtJf3WKxuylZMOKBWrbgGq6Mwl28bpihXOOTuwZmbY=;
        b=aYDKCROs3EmZ2t4jCzlBjuJP+Kf0nHKOSreYdZWzLyn3fgFQIeIXmecXn4dEAxm6Zj
         OTBNg7H6e8oh2agJrcF28vEPaz4Bcv9G48cYtWuKz8XC84GBgv8+3oeBeYc+xJTVDpCy
         BUAzw2dbHraUikI3qCnsF/0z7n8ArS93YJ0LA55ND+rB7z3WAyuJdABc4o8fjHmxH3rb
         hEuLzLLVogWIr2HPOLatLMOUKnWGHUrpS7H5tvRKsFIHU4YyNrYOATmAu/p3SDvaqLix
         qMq2FlsEqLb3eoI8kqRzjrGCCYglcuSUTeAR0FbLTdKQQIurPPLxzzsV/5H7Cno+B5iL
         mrLA==
X-Gm-Message-State: AO0yUKX+o11r8jB1M148IfdN3NtcmmNzDVQ1RC1SribkXtg+jlrpEOPl
        O7ZUOTvrAr39OgBJVPXtrybktg==
X-Google-Smtp-Source: AK7set/cgoYEyc5BrSOPddB0812Yg8tscUoHlSfJ763Ffw/s1DWWMgoFPXdTBJHzihTdjp0oTffvYg==
X-Received: by 2002:a17:907:a095:b0:8af:43a2:cb8f with SMTP id hu21-20020a170907a09500b008af43a2cb8fmr7954729ejc.32.1676157186821;
        Sat, 11 Feb 2023 15:13:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 04/50] drm/msm/dpu: fix len of sc7180 ctl blocks
Date:   Sun, 12 Feb 2023 01:12:13 +0200
Message-Id: <20230211231259.1308718-5-dmitry.baryshkov@linaro.org>
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

Change sc7180's ctl block len to 0x1dc.

Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e8b12788dc94..47de609e2279 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -831,19 +831,19 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0xE4,
+	.base = 0x1000, .len = 0x1dc,
 	.features = BIT(DPU_CTL_ACTIVE_CFG),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0xE4,
+	.base = 0x1200, .len = 0x1dc,
 	.features = BIT(DPU_CTL_ACTIVE_CFG),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0xE4,
+	.base = 0x1400, .len = 0x1dc,
 	.features = BIT(DPU_CTL_ACTIVE_CFG),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
-- 
2.39.1

