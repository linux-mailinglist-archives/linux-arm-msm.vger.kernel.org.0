Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD5D7790FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 04:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350520AbjIDCFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 22:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240586AbjIDCFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 22:05:02 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919AE100
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 19:04:57 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2bd3f629c76so15172481fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 19:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693793096; x=1694397896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1nAMmRQCWVsoeyuEdqi5PFFET6oxn1mJnH5bH17bkA=;
        b=dc0byLdFb4q2hin7HQBH8pw0ol/GHfYLO5LHs65zAhDGW7XpHniSeCCWPS+KFLJjnq
         OkwfSTT8mZLUi8rVCW77ii39PV1QLqsjx7t5YegfVMBkVg8WiaHZ0sAtw/6owkBRf6nE
         26OiI9zIAzkfzWZjUSeBQl30giNshMthm7bkBtzbEI6iioXyQ2ZKfEjCbqfeGtK8dRXk
         vaZ0uw81kITFFHpSUOAJ4LpHZZnueu/+wUbUZuNTakv6iud/UMWD3U7Ov9K3H0Vq7bwk
         WBOTTylqPAge1Vb+aec0NFEEQYTYFbsS4G02pDtAwyxPaDk6A32iLfR710EGHT3/JzgO
         k3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693793096; x=1694397896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1nAMmRQCWVsoeyuEdqi5PFFET6oxn1mJnH5bH17bkA=;
        b=Ajy4Bq+09pm7hcuU8Rg3cRx1QEeAO+F8Gp1cvmiDvYMSPLDN3tWMYyoICo8h2b16iG
         pwLkaT7hF+XAVmy0698hLAncoAPJamXJOzDTsWuuJINEIyuTfaV+bFPIjYQUcgiN4zlC
         R/pP7LpeJqGzWZ0HpNmvVjjevDrdSYPjI6XGiVAoUCqQDSHEvsNXjBRA9068yFRFM0a/
         5ZqqmKnRZkhMkEGEtbWb+/qUASI+dir7d5AEaclJkZmlgQhUSceFoi1S3kikowS4fQ7z
         zRME/h18fPiGcngU/Ho7cBzRExXzIvRgLekskpTFzd2lpR86fwFtQS0ZVi1rLOsHCxU8
         eZeQ==
X-Gm-Message-State: AOJu0Yyw6K101/3qXjhXak7vZWIkR3hk/EyCs2KwHhNSXScgo0tkFOPm
        NP4UWa1Sp/E0gnpBMVG9CBA0NQ==
X-Google-Smtp-Source: AGHT+IEz5VP4VAQtWkB9LUVf53ub9h4E1B6a1uLgeIkljMWf2NqCyovPBlaN3j3OvIlRlVZP+98fDA==
X-Received: by 2002:a2e:8515:0:b0:2bc:e808:e735 with SMTP id j21-20020a2e8515000000b002bce808e735mr5731279lji.21.1693793095254;
        Sun, 03 Sep 2023 19:04:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 19:04:54 -0700 (PDT)
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
Subject: [PATCH v3 0/8] drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_ini
Date:   Mon,  4 Sep 2023 05:04:46 +0300
Message-Id: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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

rop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
performing the MDSS revision checks instead.

Changes since v2:
- Added guarding checks for hw_intf and hw_pp in debug print (Marijn)
- Removed extra empty lines (Marijn)

Changes since v1:
- Added missing patch
- Reworked commit messages (following suggestions by Marijn)
- Changed code to check for major & INTF type rather than checking for
  intr presence in catalog. Added WARN_ON()s instead. (Marijn)
- Added severall comments & TODO item.

Dmitry Baryshkov (8):
  drm/msm/dpu: inline _setup_pingpong_ops()
  drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
  drm/msm/dpu: drop the DPU_PINGPONG_TE flag
  drm/msm/dpu: inline _setup_intf_ops()
  drm/msm/dpu: enable INTF TE operations only when supported by HW
  drm/msm/dpu: drop DPU_INTF_TE feature flag
  drm/msm/dpu: drop useless check from
    dpu_encoder_phys_cmd_te_rd_ptr_irq()
  drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 52 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 51 +++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 41 +++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 7 files changed, 75 insertions(+), 83 deletions(-)

-- 
2.39.2

