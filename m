Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570567BB964
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjJFNnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjJFNnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:43:49 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041F2A6
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:43:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so2779456e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599824; x=1697204624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQRUnrmlv22K+qm/l/EDKbK/vVJjVanCFgGw0OwEYes=;
        b=xf3e4x8iwAeL86WdvPPRdRYbSvqZmtusEEzUN0UMfSoNniDbknhKZtHqBBnDUNg7+5
         PfoYT9J0+Nr84adhMVHeo7f1jfj+ju/b1i2VCbiYUSpclN1BUs1WYToMa+hgBmOX8LRk
         jFxiXrJTb4/zNJE1E6x0UeBaCm6ZWjCszL4RxUbcdiJnUcRnbMSr4WGdB8wm+4T6GBBN
         oULNtmFi2wED70hEUA9p7Nlm/+rOvPv1VTtXwuXEDpy20PLrpOx4f5Tw1qjQo4ETmkA+
         rUmh7gUVfaX6WCnVKy0nFNy5KMtPsI3WFsAWlHJu3U0nHdUrql+VUOsySJOqlGhVjVZE
         QLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599824; x=1697204624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQRUnrmlv22K+qm/l/EDKbK/vVJjVanCFgGw0OwEYes=;
        b=bdDCnV/bOUFz9/mtV/8JKSDcVqr4qkWPGLBfk9JTphlMm/bsgRKh95jQSvwqn+FTal
         48XlmED0ukGl0nxiHEgRBiyonW4MjYRlnwhaIHIxqSBFEsBbABWiexKh5VDvbRuaf68L
         sAf1/Yj+NPLqXFPt4Qw6miWz/IJ+gU913kH9x4ooQG/KohXSslJ+0SiQEj3Di8w439vv
         0Z1kG/6VPHfBxl6p2qrGmYTy2ImUidU6X7mGIRDn1D3NuPVljv5eS4fbOvFhP1NGMPNO
         Z62XdMliWbSfaiLRA+4dzbf3Glt7S6KkC1YGQfL2QSJJOM+uUhYaUTRo+Y7QjGMb+WqB
         aV6w==
X-Gm-Message-State: AOJu0YxCdShrHbFYGgZTL07JK3vApnjKkrhvMI4PBObENrY/VE7G0bK4
        MQM3d0EGQ7LVZv9cwWFLrYUVVQ==
X-Google-Smtp-Source: AGHT+IF/lAWyz3eLooDpOU321TJhhgi8Rexg+Pi2O38pQsad1e7E9h2Zy8QQK/DG1zUpmAapNhi8NA==
X-Received: by 2002:ac2:52b1:0:b0:503:3587:fd15 with SMTP id r17-20020ac252b1000000b005033587fd15mr6103240lfm.61.1696599824201;
        Fri, 06 Oct 2023 06:43:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b15-20020ac2562f000000b005009d4a5e6fsm315505lff.22.2023.10.06.06.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:43:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Luca Weiss <luca@z3ntu.xyz>
Subject: [RFC PATCH v2 0/3] drm/msm/dpu: convert even more MDP5 platforms
Date:   Fri,  6 Oct 2023 16:43:40 +0300
Message-Id: <20231006134343.2472493-1-dmitry.baryshkov@linaro.org>
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

Extend DPU driver with experimental support for even more MDP5
platforms: MSM8937, MSM8917, MSM8953.

As with other MDP5 devices, one has to pass `msm.prefer_mdp5=false`
kernel param to test DPU driver insead of using MDP5.

Note, Luca Weiss has reported timeout issues with CMD panels. This is
not yet resolved.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/123294/

Changes since v1:
- Added these platforms to dpu_dt_match to facilitate switching them
  between MDP5 and DPU drivers (Luca).

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
 drivers/gpu/drm/msm/msm_drv.c                 |   3 +
 7 files changed, 647 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h

-- 
2.39.2

