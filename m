Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA084B6E80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 15:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238057AbiBOOQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:16:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238489AbiBOOQ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:16:57 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FFF22B11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:46 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id u20so8581308lff.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22TX4LYstdLNVIjkGd2GuVsGQO8yGKAR+N5sETL9hVQ=;
        b=PMbfdPlFSOsOXZ+TfL72dreiL7ntrfsZYcK/k0PURLikQS3bZtEf7zIJjd7BQZKQjo
         VI6/8QL8FME5YR1NfVZqtMdybr/q7Md1vISskflD4+YP9B3P2SQp24wKjMBtETzlk7tj
         Ycf7XBZjaEWQSjTCuMw/SOQLzKrGzWZanz8pM/U/a4X1c8K67cL3GCJM8qqVyUeKLoRI
         j6H3jpfsL8EybwMBy2mIvEIq+UFfoCVchcAmyWuz3DKsAm1GMpGDx5EWDtRLAUD1MyfD
         euxvXpEObSBFMP+1sQX7th6z7GlL8H+t3QOEc3p2u7KXIi4SH+WhomrrwGR2s3z4dJR+
         QmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22TX4LYstdLNVIjkGd2GuVsGQO8yGKAR+N5sETL9hVQ=;
        b=HxvCNu7npLaOSXwo6Dcp0BXk3zRXVTH/GV128PRtrZAdW2XAnvMC0BVQUVjet+S/FF
         Fdj3Ti3n79j3/5Le1MuuaBWV5SqumC9ZmN1v4+0d5lFn7m9GxmRdHewFMQFaecMovNkF
         i48x9OW3KF49J4xooftmRKk6OoyXlbccubRA4XjyU1tKf7DeRPLOJiEAU4gQvUGohCr4
         ooD50VJBB9Ku7AxN8t79FtKCABBS2091QgH5m0HWoVFd6kuJ5z0VckASAC9fFTE7LCY1
         FqsTqabkqimdaLsyiNVExlqmy3S1+yCw1hki7rom3CsfisSxhQebacbYdQqPO9xiAaki
         1rvw==
X-Gm-Message-State: AOAM5332nqh45DekfkQ3EOCcTgTxoa6oJByKSEIn4aHA4iLuH6kzGHuz
        028nRbpuKZMrP+lt6lLBdNAzeQ==
X-Google-Smtp-Source: ABdhPJya95X7LDNjmXmmcG6iI2tJCEsuHR7RtyI1OLcSwvfSVxQt14x6P8m+Jtrtl+IsAhuEGqI3Gw==
X-Received: by 2002:a05:6512:ac3:: with SMTP id n3mr3157187lfu.379.1644934604637;
        Tue, 15 Feb 2022 06:16:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:16:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/8] drm/msm/dpu: cleanup dpu encoder code
Date:   Tue, 15 Feb 2022 17:16:35 +0300
Message-Id: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset targets DPU encoder code, removing unused artifacts (empty
callbacks, MSM bus client id, etc).

Changes since v1:
 - Split dp audio fixup from the intf_type patch
 - Remove atomic_check() removal, used by the posted WB support

Dmitry Baryshkov (8):
  drm/msm/dpu: fix dp audio condition
  drm/msm: move struct msm_display_info to dpu driver
  drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
  drm/msm/dpu: drop bus_scaling_client field
  drm/msm/dpu: encoder: drop unused mode_fixup callback
  drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
  drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt
  drm/msm/dpu: simplify intf allocation code

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 83 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 18 ++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 14 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 +------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 28 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  5 +-
 drivers/gpu/drm/msm/msm_drv.h                 | 18 ----
 7 files changed, 55 insertions(+), 139 deletions(-)

-- 
2.34.1

