Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D181568A19E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbjBCSV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:21:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbjBCSVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:21:54 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BF8ADBBF
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:21:47 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id v13so5985696eda.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5btqhFRuWK2bCxMoKGUSeLwwlUSIoT2LPOGwxcks8c=;
        b=wMyFHbReqCEenMqf/3EZuSq0be/5Lg7Y7kfhK8yMhV0dzHpJgYaF9MNriTCNc3z5WP
         eMSRVabW0BO9BWEyyisszu/eEgWciCcQucq/5pKp3sZ0eY6GCTrVc1ztZl54pDbG3FP2
         1/906mNK3efi9BeGNLePxWGATk1cvu/RQkl1RdkR6KNYe7QNi0EpNSVV8dmeZB56jCMZ
         v+3PZ9Prlhu5NX6I6Ze7IR/zkUEH8+uWCP1SeCKCnKXBTa4AWnrW+wyOw0XtYYtoTXV/
         s8xctSj9CgV2Dxlq/Y9XmrNTcu6WVF8yI1nM9l3vLqWoUf5D3zO2W/dLCL7VqMYdgPKK
         GexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5btqhFRuWK2bCxMoKGUSeLwwlUSIoT2LPOGwxcks8c=;
        b=669eGZkk6m9bQHurLu2VWsfUeo3fiQB3H26xDepkPJM8zFHGEmY4+qd49qbK3b6nv6
         IM12XOawLWHL3MnWxKpNB8gRakITg2klWPzV1Mt59+o2d9E4nz+zHZ3oN57K0mjnXVWL
         hXIB5ZS/gu7OmpCxabWGh4Pf8xQkBi4LtFI8U2Svxgus8JEVCvtKQRkFwr7p4/ZkV0pW
         nMEGUrpIGU3WxKWA3swQWVNop1iPL3+Ob84pSXgu3mLz/4LT+UcXSss1AvF4OwJ+zvYr
         LiZQDeQkHmSwk+a5HEGSLZWp7wnD0gvgvnZNS3CTaDQSi0nV/TlT19I18vTbHCf3jaih
         KidA==
X-Gm-Message-State: AO0yUKVL1d4Uh5sMZMj2z5EqRh9s8zemxuuUyHeFJHc4AjAv2Vm7wNpC
        0GUhP70X66uwzmNIm6imAi6AXw==
X-Google-Smtp-Source: AK7set9NlobfG117l884HDqO8xnDZAGqNVNTdl06reae2XXp6rxb+BeFVocuj7X13WKRbiAySTrdKw==
X-Received: by 2002:a05:6402:5241:b0:4a3:43c1:8430 with SMTP id t1-20020a056402524100b004a343c18430mr7502431edd.4.1675448506633;
        Fri, 03 Feb 2023 10:21:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 10:21:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 10/27] drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fill
Date:   Fri,  3 Feb 2023 20:21:15 +0200
Message-Id: <20230203182132.1307834-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index abf499275242..4c05f4b5e050 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.39.1

