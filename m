Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6659B7AC53E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 23:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjIWVtW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 17:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjIWVtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 17:49:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E2B180
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 14:49:15 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50435ad51bbso4679010e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695505753; x=1696110553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0mKikz6iQlf/2X/8udeNvqptmCav0BXWVkbR1ppszpA=;
        b=WgfiLDJzrEwt58a53BlVL56PIC77SggWO4YUCQJtcqgtB14Sfii0Uaej012F614ccb
         1/GSXm8ZMYzM0RH3iYXdF4tk8meQXrzmnGGsoGMJrppoLhibdn20+STWM7iBOrYndPkw
         /QxzIwwSHGF8YSCDMepzMTLFFykA2lFyOCRLuosh6F8tiSxYOsIjTLnMXxmq0Xep/76x
         R13nK0iSdCQ9hh6Fkq1+t8B+K9F1Mzsx6WFclyvKvnH8fPrJQq7Azt+1Y6ZBmXbRQVFe
         P1Ik8R2c0fJkodmP6St6MXc35lWqpwTjkyD3AWMLMGRnxy4sQHLDbbqMEMqJdtqYatJQ
         2O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695505753; x=1696110553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mKikz6iQlf/2X/8udeNvqptmCav0BXWVkbR1ppszpA=;
        b=aSpAG6+H9ps/zZylfhfmCVFpQjIYMjE/wTGD2AwFUostLlBBmXU8uTlvPDLVJdG6GW
         rAjl3kbDcsqBzel8O2vDN1L26TU6xGTdNmDVO/QuCV1Iv+fY6Lzdx23nNKJr6nxU4aR/
         qZ9zlxHJk+EQjGp4dthyBZ3dlFhhj45HJfpV6isKpNRbB+vXAcRIx8qW6M/aZ7WYMxgG
         +Fw92P90OU7juecQhn2Gm15u68WgU0L5bt2tWvVd0rrWYxyYCxAgDoilmGsPdlVoT7Wd
         Hc6cs+Mi+LhohXAs/+fs06Ous4lcpfGBvj3MVCavFOw+F8+YmvvE2wK5areO0Q87fkRd
         mONw==
X-Gm-Message-State: AOJu0Yyq1Fv6P8vPG+dIGU5m5uS2CezMnQz4OrhNpcFTsuMvsjcT5vKG
        7FPbQDTas5JaSxD7kBDfgesIGA==
X-Google-Smtp-Source: AGHT+IHfMWz0YFTxERDUiIQgVQVWvbsVCtLPEAqGh68CRmNrR2JB/mBEc7E8zYr1iE8TPrS5PMEC9w==
X-Received: by 2002:a19:6905:0:b0:503:26b0:e126 with SMTP id e5-20020a196905000000b0050326b0e126mr2010709lfc.59.1695505753532;
        Sat, 23 Sep 2023 14:49:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m12-20020a19520c000000b004fe0760354bsm1196590lfb.275.2023.09.23.14.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 14:49:13 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] drm/msm/dpu: convert even more MDP5 platforms
Date:   Sun, 24 Sep 2023 00:49:09 +0300
Message-Id: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Extend DPU driver with experimental support for even more MDP5
platforms: MSM8937, MSM8917, MSM8953.

As with other MDP5 devices, one has to pass `msm.prefer_mdp5=false`
kernel param to test DPU driver insead of using MDP5.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/123294/

Dmitry Baryshkov (3):
  drm/msm/dpu: add support for MSM8953
  drm/msm/dpu: add support for MSM8937
  drm/msm/dpu: add support for MSM8917

 .../msm/disp/dpu1/catalog/dpu_1_14_msm8937.h  | 213 +++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_1_15_msm8917.h  | 190 +++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_1_16_msm8953.h  | 221 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  14 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +
 6 files changed, 644 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h

-- 
2.39.2

