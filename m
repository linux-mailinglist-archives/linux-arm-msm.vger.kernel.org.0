Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC2667B1A74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbjI1LSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbjI1LS1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:18:27 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE6F7EE9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-503f39d3236so20724261e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899791; x=1696504591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfjzMYGKRcXefgtoWm3YdeqDuz+ynlx3ahQEYUJ7hGE=;
        b=q6D5H1Nl3yzH1O32tou9Vz5l/1FyXYWfwPwQLRrpEi4jxh+LOS5kk5U2juBQ7nWw5S
         lGuFGRhwgWQ2kAiSZuDm4i+nNWRJeSEn2qbo2nQ/Smd6VMByN2FO9nLi7CfCn2tvgBNi
         PoTmjZegejfpibZlPd3TAB8sZSGej6Vo2bxTZDu/Fvu5FY6PSuU0Kj8Pud5w3uZhDDNV
         TTVgWwAVehZbtvceeFUKyPbHJMtCdNbGjOJpbCw89IGbPdjQnJ9iZv3ks0FFqNif81de
         lc7GUpCdeyTvLliFlxq5hxCULS/jUxo/8IzSiPzI48INpeFxLlTshdqZ8vlQ8EEQZjON
         +0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899791; x=1696504591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfjzMYGKRcXefgtoWm3YdeqDuz+ynlx3ahQEYUJ7hGE=;
        b=aat/OeJSwIFPFTvMP9wO+0csWcYM8xWaTiqxOaAFmHCSCqKNiHPw2OBEziZ94zwggv
         PT6eBjUYLeRuqF/ujq7/Ght3o3DIBF7rmp8ILU/k3ZfM27e2a5BB0S/uxCz1KSbZDIWq
         tNyQrw/QzIubs+U0BYEI51dAEv+EBFKVzZoTLVi8vJDqmmCxKdajp+o3N2YcFyU1wO+M
         LqiXiby/SjD9UMmAQTJd4/g2mfHeELXuXOb8Mcmw+YCRXFEAOnIfLZa9DignqavGaqLu
         HKWgUMbjIzLXkofL8AalmP84mm0F08RQTw8i8V+euNw74DWjQUZN7NH1l9LMswk6sSS8
         7e4Q==
X-Gm-Message-State: AOJu0YwQNJ83x33JGlMTmrVYesf956VrCXcj95tpEA4nAKT5ZNkxVlMC
        SGtemlDR2O6ngPedfh0QjeMfng==
X-Google-Smtp-Source: AGHT+IFr9L7bAhBwAUOHZefNcwby9mlsY0cuDdJajWMQoylsh247Y8Hh7skR/x+U6DtxV1husNY3qg==
X-Received: by 2002:a05:6512:6c8:b0:503:a82:b379 with SMTP id u8-20020a05651206c800b005030a82b379mr952499lff.12.1695899791034;
        Thu, 28 Sep 2023 04:16:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:16:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 00/15] drm/msm/hdmi & phy: use generic PHY framework
Date:   Thu, 28 Sep 2023 14:16:14 +0300
Message-Id: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
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

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move all the PHYs to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept close. Also in future this will
allow us to use a common set of functions to setup msm8974 HDMI PHY,
28nm DSI PHY and apq8964 SATA PHY (which all use UNI PLL internally).

This also causes some design changes. Currently on msm8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree msm8960
driver and posted, but not merged, msm8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Merge strategy: unsure. I'd probably prefer for this to be merged
through the drm/msm tree. Also, this patchset first adds new drivers,
then drops old ones, which might be not optimal. I might rework this to
squash add and drop patches into a single commit.

Changes since v2:
- Rebased on top of linux-next, solving conflicts
- Updated Sandor's HDMI PHY patch to the version from v9

Changes since v1:
- Changed msm8960 / apq8064 to calculate register data instead of using
  fixed tables. This extends the list of supported modes.
  (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).

- Fixed the reprogramming of PLL rate on apq8064.

- Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
  driver (suggested by Rob Clark)

Dmitry Baryshkov (14):
  phy: qualcomm: add QMP HDMI PHY driver
  phy: qcom: apq8064-sata: extract UNI PLL register defines
  phy: qcom-uniphy: add more registers from display PHYs
  phy: qualcomm: add legacy HDMI PHY driver
  phy: qualcomm: add MSM8974 HDMI PHY support
  phy: qualcomm: add MSM8x60 HDMI PHY support
  drm/msm/hdmi: move the alt_iface clock to the hpd list
  drm/msm/hdmi: simplify extp clock handling
  drm/msm/hdmi: correct indentation of HDMI bridge functions
  drm/msm/hdmi: switch to atomic_pre_enable/post_disable
  drm/msm/hdmi: set infoframes on all pre_enable calls
  drm/msm/hdmi: pair msm_hdmi_phy_powerup with msm_hdmi_phy_powerdown
  drm/msm/hdmi: switch to generic PHY subsystem
  drm/msm/hdmi: drop old HDMI PHY code

Sandor Yu (1):
  phy: Add HDMI configuration options

 drivers/gpu/drm/msm/Makefile                  |   6 -
 drivers/gpu/drm/msm/hdmi/hdmi.c               |  88 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  79 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        | 108 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           | 216 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c      |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      | 765 ------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c      | 141 ----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c      |  44 -
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 458 -----------
 drivers/phy/qualcomm/Kconfig                  |  21 +
 drivers/phy/qualcomm/Makefile                 |  13 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c  |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c    | 327 ++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c    | 439 ++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c     | 184 +++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c   | 211 +++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h   |  81 ++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c | 184 +++++
 .../phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c  | 441 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h      |  75 ++
 drivers/phy/qualcomm/phy-qcom-uniphy.h        |  65 ++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 24 files changed, 2153 insertions(+), 1898 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-uniphy.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.39.2

