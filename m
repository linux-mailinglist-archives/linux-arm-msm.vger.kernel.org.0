Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC2497B1B2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjI1Lf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbjI1Lfk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:35:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C469C
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-504427aae4fso12522403e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900937; x=1696505737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd9c6ztV9NgOdZFl/EIKNBqH7SPpFlvCiJ4afy1QU2w=;
        b=cQyCejRTQL2Vt7R19YjImN4oLRkH23QltVusniZtPOB00hq7NQrPLOvoGm7KVeEb4W
         tZY7eZlGKV6yF752dcUgW/+JwMJyD7G2PxY8wTze2uVcZAklX8RC/0apzdu8P6naSirb
         BkyhVnPP3LSyO5jfF597epC2AroqxQrUPXKb7iJidW+717pCxXTEM1Vkkw+dzUBX9Nkl
         aEdeQMAyK9stgHNLPRgKP8yA5Clzd5YQJLu3wG7kNxjFhAbCJ+2iN13RMJObQlzOJJRk
         ehLCdt2VazZdQPiq6A69dCyj/g4503XNAho3eJWkL+UtWsrUczoFe7pU/VmcFsTmOjF9
         6p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900937; x=1696505737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd9c6ztV9NgOdZFl/EIKNBqH7SPpFlvCiJ4afy1QU2w=;
        b=ckzEw0rmpK3v7xDkMGHevTdKsD3CaHZdVz7EuvSNUTC2pVub367efuVBvDCbxQwVao
         He/g2fuhBDF4GVA1vR5a+O/nuJQ9jebZcV56pGASugWHVgzC1mqVnUbipRt28LQOtIrj
         LRBdD4TXY2/EDH8+fvuAsjbOTKG/1UuzpMQDdLMt5/TROnayiVZQQPPV2pkmV6uAsH8f
         HYT8ZPew6oNWNWo8TgApzYyRKqj7iSwwiRv/j9aWBriVnqvsAcUxp/NJH+x1U4gIwrkm
         nkgbtbbtpInE3MxtErjXYmq/yrNi6G5rNk1maANHj1wrlQvyUs/z61wpM+LfOaJ+HUQM
         9Thw==
X-Gm-Message-State: AOJu0Yy8OOzR29mhE0lKxCd0iMNv5dblFnqqFY344BLRVAxeuj7MHAQB
        hUaOZZoCYvk4lgtJLTmxt+r6QA==
X-Google-Smtp-Source: AGHT+IFptf8IZrGVaiyuvv1Y/4tf1gDesh8LBU7Yonb5WudtCFrSsWJ2l7SSrzYkZ+tT6JDJHTOP5A==
X-Received: by 2002:a05:6512:110f:b0:503:cca:e535 with SMTP id l15-20020a056512110f00b005030ccae535mr781994lfg.12.1695900936756;
        Thu, 28 Sep 2023 04:35:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:35:36 -0700 (PDT)
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
Subject: [PATCH v3 0/6] MDSS reg bus interconnect
Date:   Thu, 28 Sep 2023 14:35:29 +0300
Message-Id: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Per agreement with Konrad, picked up this patch series.

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects. from none to otherwise
inexplicable DSI timeouts.

This series tries to address the lack of that.

Changes since v2:
- Rebased on top of msm/next aka 6.6-rc2, Dropped merged patches.
- Dropped the *1000 factor from reg-bus BW values (Konrad).

Changes since v1:
- Dropped the DPU part, the MDSS vote seems to be enough
- Reworked MDSS voting patch. Replaced static bw value with the
  per-platform confgurable values.
- Added sm8450 DT patch.

Dmitry Baryshkov (3):
  drm/msm/mdss: switch mdss to use devm_of_icc_get()
  drm/msm/mdss: inline msm_mdss_icc_request_bw()
  drm/msm/mdss: Handle the reg bus ICC path

Konrad Dybcio (2):
  dt-bindings: display/msm: Add reg bus and rotator interconnects
  drm/msm/mdss: Rename path references to mdp_path

Linus Torvalds (1):
  Linux 6.6-rc2

 .../bindings/display/msm/mdss-common.yaml     |  2 +
 Makefile                                      |  2 +-
 drivers/gpu/drm/msm/msm_mdss.c                | 96 ++++++++++++-------
 drivers/gpu/drm/msm/msm_mdss.h                |  1 +
 4 files changed, 65 insertions(+), 36 deletions(-)

-- 
2.39.2

