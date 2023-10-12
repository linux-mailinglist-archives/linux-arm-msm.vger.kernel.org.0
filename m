Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32E37C623A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 03:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbjJLB3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 21:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbjJLB3Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 21:29:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9774BB6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:29:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50444e756deso690340e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697074151; x=1697678951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
        b=vwcky0gHTzZ6vzgPcwygKdR944VvpM2S+CkMzkF2arwGFnmf+lLnGh4TuFAjk6TvR6
         9k8wmf8QUkbAMgQqW3bXU78+REnaThV19cI3bXdOQLEF3UoHBLco75ELpoVpGBrLP3o6
         a06H41z+Hm+BoVgMQxcFI113yIx3aU2Ak9bRNddc4MUEULCpsmVMuoWzmAUcyD5OXLfg
         R4i9vyoE2ZqJCD7sI42Z4XqXVwskRORsaAmopJFZvrsHAZKcaxOD31Tq8P3ATXhFpWfj
         0cNYOyVtlhOzC01X9T9M/8lxdFdnOFH8ITPcOw96e637wpJB16SiukZ5Wtzfb94DP1i/
         0Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697074151; x=1697678951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/MpJ17XmYHnlx8i/0n3G5y7B3wsnf8U/DZ/uSJ5ETk=;
        b=AcTdKap9Fve1qXhLAfad5Xx7kj8+CbV1/bJxNiah+mJwbMle52PZy+fmdzE3k3yIvM
         ciEs1KcJc3qj8TayIQlUcs9RoLB4zDDxgz56dZrksAN0HPARTIDf9X4FxDbVLRLUANsg
         elJS+CRKETesjbMkL8MsuO/mH4i0EYYjeJuraW/7brSZdtOGmhaSxCgPUjLwAK8sDQAX
         vbopwGoy75Bm/9RpN0DXWBXLzzP5YGhvVDLKk7tMjt1mQm9vk6Be+O2cW+OQZ+/7YX6F
         /axQJCQTMTNS/+rR7xOL7LHpJCV7YQmHF+pqava52TkkGBdMhAWLaXGZNQN5xSIHqVfB
         0DBw==
X-Gm-Message-State: AOJu0YxrUdMyrFAvhDdsdt+q7CNCrazjmCe4/A1iOp3XIM1U6/Vwm3ed
        JgJPs4oiia67FVSu7YEA4fWkx4/kb0RKzKXGAKQ=
X-Google-Smtp-Source: AGHT+IFfXujRcXoYf0z1/G8UCFMg36O3UhSXJk5XZ1oIR0k0a3yVyGALDMVB9CWeygngjBxRM6+/Xg==
X-Received: by 2002:a05:6512:4015:b0:503:9eb:d277 with SMTP id br21-20020a056512401500b0050309ebd277mr23298737lfb.49.1697074151565;
        Wed, 11 Oct 2023 18:29:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k10-20020ac2456a000000b004fe3a8a9a0bsm2526588lfm.202.2023.10.11.18.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 18:29:11 -0700 (PDT)
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
Subject: [PATCH v2 1/2] drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
Date:   Thu, 12 Oct 2023 04:29:08 +0300
Message-Id: <20231012012909.450501-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
References: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
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

Use exiting function to free the allocated GEM object instead of
open-coding it. This has a bonus of internally calling
msm_gem_put_vaddr() to compensate for msm_gem_get_vaddr() in
msm_get_kernel_new().

Fixes: 1e29dff00400 ("drm/msm: Add a common function to free kernel buffer objects")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index fd2201cb62db..19019c764f11 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1180,8 +1180,7 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 
 	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
-		msm_gem_unpin_iova(msm_host->tx_gem_obj, priv->kms->aspace);
-		drm_gem_object_put(msm_host->tx_gem_obj);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, priv->kms->aspace);
 		msm_host->tx_gem_obj = NULL;
 	}
 
-- 
2.39.2

