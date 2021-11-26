Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092F645E476
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 03:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357648AbhKZCb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 21:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbhKZC37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 21:29:59 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0E8C06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:26:46 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id k23so15883591lje.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQF2Q4CByYkmE+9PKH/2TGs700NnX/meUb70h19yGEw=;
        b=C2J0hJQpmmy8M6PjZ9Tyq50TwtTglJhSGIOrDUjhG1Qft6pkxIa505quo8iDNu+QQk
         jZ31N5V49AF52v1HS4pBLaP5XcPr5qoM1K8qEjYd5ed5+x+cBIFiJaIYxPxPoY37UGpk
         Hj6oWjPR+Zu2gUIN06d75FBpNCbahIwtRT9BBFza8KbHpXThRLsVEXRd45Zae/+1A8ru
         tW/LQ+2QKZNLuPlTW1cSG3Rjww5dlsmVOYvACRgQrsJ1GtKKpN9uZOp/5xr0loSSARzX
         xt8xIKmvtWezmr0xMT7udS+ALNtuo8OYjMymJ/avB11drUlQ+WdospJDSJnpyh8OrKe2
         QdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQF2Q4CByYkmE+9PKH/2TGs700NnX/meUb70h19yGEw=;
        b=ggu0yBGY+WslPinJtwNfWwCTw+k+IbiCErHOg4ey6sycnuHkyJNjbRBF8OtU0JiyT+
         cLfwBWcAGiSWdFSw/kdo2LAdkinJpZvmXvqOHYHPtzvm/49FjUzlvh8PdQfK5DumQXhU
         ZY9naNXlrlInvSrZh/IaopnPYxNnnxldis2CByOs7pjljX9pSp8j7tqx1Nh2B1JWBahK
         Hu3YfAbhlkfrabf6IiJLY5UPFks5XVMQlZjcjrZSUekkAsy/mx1hM2mm61GFuSX576iR
         2ZaUW4dlxGzDV5RwsxLmFDUaWs4MvstmoBhBDaY1UaadkYaB5eV97+QK1+R91Pa2+ghD
         yDUQ==
X-Gm-Message-State: AOAM531yZlMm4AUEhOGLVNOuFOXijDf3sTSCn5YyDEjNIqWjcYSMBJoQ
        ELbRpq+SDLTNSI8KhuDa1x3JOA==
X-Google-Smtp-Source: ABdhPJwRKHBvg4FtsXtNF85arqrAWVrg6oah6JGnIyZ5Sgl3niE4/VFYBKWJrWZp+CWaruu2sRaSBg==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr28123306ljp.188.1637893604814;
        Thu, 25 Nov 2021 18:26:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x6sm388764lff.125.2021.11.25.18.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:26:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/msm/dpu: simplify RM code
Date:   Fri, 26 Nov 2021 05:26:39 +0300
Message-Id: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder. So allocate them outside of RM and use them directly.

While we are at fix, drop the lm_max_width from the RM and fix the
indexing of VBIF in the dpu_kms.

Changes since v2:
 - Dropped DSPP, PP and MERGE_3D patches for now.

Changes since v1:
 - Split into separate patch series to ease review.

The following changes since commit e4840d537c2c6b1189d4de16ee0f4820e069dcea:

  drm/msm: Do hw_init() before capturing GPU state (2021-11-22 10:45:55 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-rm-clean-3

for you to fetch changes up to 3ad9c16d1c1e010abe72ff943f8de25b64968789:

  drm/msm/dpu: drop unused lm_max_width from RM (2021-11-25 11:47:40 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/dpu: consistently index dpu_kms->hw_vbif
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: drop unused lm_max_width from RM

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  36 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  16 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  26 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 104 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   6 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   8 +-
 10 files changed, 32 insertions(+), 187 deletions(-)


