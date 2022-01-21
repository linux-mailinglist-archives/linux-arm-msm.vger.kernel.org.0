Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807514966FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 22:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbiAUVGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 16:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiAUVGW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 16:06:22 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6659C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:21 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id x11so36378824lfa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0vJ8DhwvnCQdnTeYuE3CkWRZJOO1ip2uJNFoaTJPamw=;
        b=rtY6myzx7rzb+2+xk/btRkYOxuVjnX/xNvgZHq4099bqiiGiiF3worWSzctzRLrHSh
         xan4nUgoHFhnpKtmeqC/5lPJNPFdrDJVAL0gW182Ccy7xGvaA33xIg2xrRTzA7Gzxyy8
         3x/eJODRgjvZpcP0AeqzmFw56uouUWtxeR93sxLLleYHds4pyWjgyT9ruygbdOPcIC25
         iizrN3zHKw77Sr/Cb64at+NdiW2U0A6GgN+qFXSKgR1rBlUg4qRe/EVdzOCULABzX3Si
         iYhHoJHrVjyGwdHQbOAT7oONNM29pY+Prncp9mIQDJGHYPZh8oIsfPf3hANiUZC3UUeS
         0D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0vJ8DhwvnCQdnTeYuE3CkWRZJOO1ip2uJNFoaTJPamw=;
        b=PaFRtQEbGVjYm7CERD6KF1zpDIxSi7WtLJiPEdj2jzWRxnZK1PC/FkC9TUbcWPUAu7
         1M1H02ITpy2Osy/InclsuglgWVgvXU9Z/2DfrLaz600GXZPXjKfLSaVOi2NqnIemJjcM
         5rSyIk5C0I/EZg6GMbBNMb7+uyq8UekCYWP8AUiOacoe6WK8mQsVsFjK8aXAzuSzL/8z
         cfNYUec1LxK8ziQwsok8AeFcXbs4VBY3lpU7RF7bqnn6kowQmcoR88p9961Y/YZHFe/z
         pamdbsut0Z7OO2NTGipsacWZgY/pg4P4oaZiiXHFVJ+5Ke59t7SnoVfxnvAS/30fA4rh
         skpQ==
X-Gm-Message-State: AOAM5308f/R0jcWYdkZN+6TeVuOgDoPNXPRIWKeed5DRHNQWXm7B3Oqs
        7xdGYj4+VtqGps464E04FKYNAw==
X-Google-Smtp-Source: ABdhPJx49jz1SijSo8MyJjMx8hgsEJ6kEQlaDTIQslCRxiPxXAZdmi0yppHMtgeEBo8iwtFlG2h8zw==
X-Received: by 2002:a05:6512:c2a:: with SMTP id z42mr4974720lfu.329.1642799180056;
        Fri, 21 Jan 2022 13:06:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:06:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 0/6] drm/msm/dpu: simplify RM code
Date:   Sat, 22 Jan 2022 00:06:12 +0300
Message-Id: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder. So allocate them outside of RM and use them directly.

While we are at it, drop the lm_max_width from the RM and simplify VBIF
handling (move creation/destruction to the RM too). Once this and SSPP
handling patches are merged, the RM would handle lifetime of all
dpu_hw_* objects.

Changes since v4:
 - Changes IS_ERR_OR_NULL() to IS_ERR() in dpu_rm_init()
 - Removed if(!null) conditions when calling dpu_hw_intf_destroy() and
   dpu_hw_vbif_destroy()

Changes since v3:
 - Add missing DSPP blocks teardown
 - Remove dpu_hw_blk from dpu_hw_intf
 - move dpu_hw_vbif creation/destruction to the RM

Changes since v2:
 - Dropped DSPP, PP and MERGE_3D patches for now.

Changes since v1:
 - Split into separate patch series to ease review.

Dmitry Baryshkov (6):
  drm/msm/dpu: drop unused lm_max_width from RM
  drm/msm/dpu: add DSPP blocks teardown
  drm/msm/dpu: get INTF blocks directly rather than through RM
  drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
  drm/msm/dpu: fix error handling in dpu_rm_init
  drm/msm/dpu: move VBIF blocks handling to dpu_rm

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  36 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  16 ---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   5 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   8 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  11 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  28 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 126 +++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  31 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      |  26 +---
 12 files changed, 73 insertions(+), 225 deletions(-)

-- 
2.34.1

