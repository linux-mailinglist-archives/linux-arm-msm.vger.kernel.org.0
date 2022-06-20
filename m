Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3B7552661
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 23:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbiFTVbB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 17:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiFTVbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 17:31:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A63712D32
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g4so6855861lfv.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8/WOG9Lsdn9ThuiG2M5ftng7nETTq8B1iAmvxjeBug=;
        b=DMvnfxq233w/GmdsxpzV4vv8ETe0Ea4DP0HAWe9RzMJT0EW4BFw22LL2eRyoD4l8MX
         xoP4wld2PU/5dFRoPIE56XwLFVEw3OU7F5UlVcrYtElh4+oQRwGGVf7ONp+M9Qx9glcZ
         4LSDaCgaPoGEEqlbMqYG46iMzWa9sMyXl9gJscXoAA/KwxJ2CF21v6Ls8p5bQzC0QOZv
         0fZ5ehxz/1LDilzlOEgcUGT6UayaNUxIPYyLBolFnqpCojFnMIun6LUl2xR2737ZRPvy
         qa/V2D8Yl8UN/5VDaLQKYT36oO6vCW+WYKX7t0mWqra3LKPEQ/Plj2d+MqMfs67WdqtM
         81aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8/WOG9Lsdn9ThuiG2M5ftng7nETTq8B1iAmvxjeBug=;
        b=x78tU573bBvwAgdIaeMn9LXek79GzsF1jc9EL3Izok6hbnh57SOuAxUtLVdfhUOubK
         loM4yAF5GlgrzyEShWcaeh8HAn+fe2lpSmc8DRIHHqnGwvvqAC9K9sePgmg+zeAx+vm2
         0gTOaBkx5RFx1fvqct0kYBwY9D8dv0NOk22lCUcBFbUprzl+b19R1za4Q9FoCatO3xWF
         qe/WVEhibEpVOwx2u3eG0BTPmVMJ4Cmgd1MVZ6dSCzXzJakOC+Xvqgxt41rOUmjBBoS9
         pwEg/rLcIZ+4u0jpP8c2IAp+2n7kwOF4m3W32UyR89QvfZ1OXZA3eEhRsrtoHFJKXa47
         tOcg==
X-Gm-Message-State: AJIora9aeIaUJzR1zTb3TNoauV7cvYNryDykBL5acBgPFNqnS1XMmJTd
        Lf9fv6eGNalceRXPZDAL76NvQg==
X-Google-Smtp-Source: AGRyM1vGER7uc8+o7jLkwjr73U+Xk8bqIzgQ+EV3WTWt2dZ0kQRBft7p5LqNORhapHoi6vI89MmzKQ==
X-Received: by 2002:a05:6512:11cb:b0:47f:6906:6b94 with SMTP id h11-20020a05651211cb00b0047f69066b94mr5429172lfr.497.1655760656580;
        Mon, 20 Jun 2022 14:30:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 14:30:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/4] drm/msm: move resource allocation to the _probe function
Date:   Tue, 21 Jun 2022 00:30:50 +0300
Message-Id: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

The first patch fixes an issue with drvdata and is probably a -fixes
material, but it is still included as a base for the rest of mdp5
changes.

Dmitry Baryshkov (4):
  drm/msm/mdp5: stop overriding drvdata
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  62 ++++++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 ++++++++++-----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 116 +++++++++++------------
 3 files changed, 137 insertions(+), 148 deletions(-)

-- 
2.35.1

