Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E706449BF5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 00:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbiAYXHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 18:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbiAYXHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 18:07:33 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8B1C06173B
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 15:07:33 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id k18so22602181wrg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 15:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Y9LwOzwvaj9hQQsDetJws7+MI998U+lrWJC7uwIJJ/I=;
        b=FX4F+DMIKGKmh9PQFb9g5hzRstVD20nuH4FkrocpJZlPVtYgB3zhE6mwitpKZDcFC/
         uekdVtlkXjflrtrGJba+H3PBATlZe0npU2KtorCZp1sLM3jkJ+0OwkYwFyi31DvhSAQs
         fb0QvQUfZFS8sitFnno4N6aYL2ayouoQwEHDSVVI8hw4OTWvgCoZVyNarKr0QBo8A/VT
         VdQZ627YqW4oVHrHBzF49a73/fDOUPcyI6FCChs8kjLVKuC4grDiDRpG5FqHGlkHCqPz
         NehwkN3mswrfm7+Xc0Vz/hfNT4JC0t7BgvLiuS5/AnYq98E7S/0PhFJcgvy3YC42HEvA
         zsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=Y9LwOzwvaj9hQQsDetJws7+MI998U+lrWJC7uwIJJ/I=;
        b=vk0QBSKzCZ6iTaIaRWfUUgDKOrLgAhCiAb+6Dy2yG3n3yf5Vq1FGwMKebodFV1+XdI
         F9vmR34kp0MZ/9Fd+GVx7AlAQCaJ9mIp0edEoKxgvsF0zy2XmY+Y2MxEzKifxJzh7jaJ
         as5GyqFNZvup8u22pbLFwPmA+/VLevvHycHHgS/e4Z7bmgZ7Um2qCGW2hTKJZBFlM975
         Fnc11yzCG+bE/X7KbvMA3I+yjRZCQ34lujZLC8+6cE/Fwy7+eq7JHLHaEmdWoGvxEeYp
         oPYuGm0GPmwcEX7K4/W8T3rgr7dvVYbiJf1WPRvUt0cx7YUNs5MZtQa2JpcTou6MNp/A
         p5xw==
X-Gm-Message-State: AOAM530LNmbfXKIPrYbUYMtcyaKBXW02oJIt8rGaykbR+xJA3j/1AvaI
        9QI3eSyg3Ve8nDmZutEcBUpEWYaOLDSNLGVyeR1oSBSuCoc=
X-Google-Smtp-Source: ABdhPJy7pW57yvv0C0Ltewjty7KY3mPgDXMn6HXB3Cn0j/zsfcqkqDzThlWqXh7h4JjErvp80D/KedK8rjz/+x96pDo=
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr20168250wrt.93.1643152052027;
 Tue, 25 Jan 2022 15:07:32 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 25 Jan 2022 15:07:40 -0800
Message-ID: <CAF6AEGvAfsgtr==VM4wixAC_hSTuV=eNWXxX=BhZqQrbxHjKgg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-01-25 for v5.17
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A few fixes for v5.17.

The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3=
:

  drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17
15:09:46 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-01-25

for you to fetch changes up to 6aa89ae1fb049614b7e03e24485bbfb96754a02b:

  drm/msm/gpu: Cancel idle/boost work on suspend (2022-01-25 08:54:41 -0800=
)

----------------------------------------------------------------
Jos=C3=A9 Exp=C3=B3sito (2):
      drm/msm/dpu: invalid parameter check in dpu_setup_dspp_pcc
      drm/msm/dsi: invalid parameter check in msm_dsi_phy_enable

Miaoqian Lin (2):
      drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
      drm/msm/hdmi: Fix missing put_device() call in msm_hdmi_get_phy

Rob Clark (3):
      drm/msm/a6xx: Add missing suspend_count increment
      drm/msm/gpu: Wait for idle before suspending
      drm/msm/gpu: Cancel idle/boost work on suspend

Xianting Tian (1):
      drm/msm: Fix wrong size calculation

Yang Li (1):
      drm/msm: remove variable set but not used

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_device.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 11 +++++++++--
 drivers/gpu/drm/msm/dsi/dsi.c               |  7 ++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c       |  4 +++-
 drivers/gpu/drm/msm/hdmi/hdmi.c             |  7 ++++++-
 drivers/gpu/drm/msm/msm_drv.c               |  5 +----
 drivers/gpu/drm/msm/msm_gpu.c               |  3 +++
 drivers/gpu/drm/msm/msm_gpu.h               |  3 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 21 +++++++++++++++++++--
 10 files changed, 70 insertions(+), 11 deletions(-)
