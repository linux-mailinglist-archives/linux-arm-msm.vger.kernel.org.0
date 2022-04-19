Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9633507248
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 17:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244915AbiDSP4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 11:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240599AbiDSP4j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 11:56:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FEA1EC68
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:53:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y32so30161901lfa.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FIfb+gmCtEt5H98vB8ohAIXclb9xmDCzfNmIFKE2t9I=;
        b=nUK0AjVJS5kb23t0P9yms6lOOOyCCFFf1w+fJiJrSGS1HknkpDLXh5IkvGOPC++L4b
         PYNPaM88pEEvaDjuS6G0TIwuD1sEewsW+GOrelR0yrTLJaBUZGrvfPbYMdZagY6cO6dn
         7nduz2u9QHk8G/OMGMDzgGoepAZSnZTnAKIRNfksFbi0PgngAvChUn24EKGoHJqDOfby
         cBTbRdS6zYRIDeiX2tB6TQ407bE7SVBDN9XEshiNF5roX4280q0nbAN3+nHFsGQ48iz9
         rdpD9vVOsIooVdTAEW2/UIegwViu8265LYUluCdpCYRaTZ30M56Epzms4pqowoNU/Rdm
         QBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FIfb+gmCtEt5H98vB8ohAIXclb9xmDCzfNmIFKE2t9I=;
        b=dOMlY045UW7CyrsQHe3H86h8U6lJLJD4qKeYRwQejYqkuBC8dDlyp9xbZun60qyA9V
         SBlF8SV5TmWcnb9/99tevHIxe6zvsfsxiHSsKbRtAq8ZjfWSaMK2for4VOOPHqZR+TB9
         l/O1nZ1C7jDlV7HoMf9Xksy27G/QSGS+Ght5OcXOVxQidfQPF7UfbgjsWm5R5lzPMDL8
         RrWqeiFDn0fe2fvDEa4GtIWrhzllDfH0/kzzH3Ihx+OoSlHOQeUu4C8nxEKmcNMzWR/t
         JRMkHykjDG+I+Ot/fqW2xVNNCTb3ZNmdAqgnl26XGlxyS9KgB0r+hcKY1RxJtW3Wo3i0
         YMtw==
X-Gm-Message-State: AOAM5330Yok8rriU/KLjPS0gK1nE+e6wtDhHDGN7mvQzPYxu3m/AckfJ
        niygS4KDT9P+WbAguhORptPBIQ==
X-Google-Smtp-Source: ABdhPJyd8FXgAg9xYtals42a2pylwxV1oZc/1iFaACU3eVNjANG7LKJG3MIS7WB02aYDM4ODBSnWCw==
X-Received: by 2002:a19:8c4a:0:b0:46b:abba:2409 with SMTP id i10-20020a198c4a000000b0046babba2409mr11920802lfj.88.1650383627193;
        Tue, 19 Apr 2022 08:53:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r25-20020ac25f99000000b00471a439838esm313911lfe.145.2022.04.19.08.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 08:53:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 0/6] drm/msm: rework MDSS drivers
Date:   Tue, 19 Apr 2022 18:53:40 +0300
Message-Id: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
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

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

Changes since v5:
 - Fixed the issue with HW_REV access on MDP5 platforms
 - Moved "mdss"/"mdss_phys" distinction from second patch to the first
   one

Changes since v4:
 - Fixed the issue with MODULE_DEVICE_TABLE reported by robot
 - Fixed the comments accoring to suggestions of Stephen
 - Removed extra goto (Stephen's suggestion)
 - Break long kms->dev->dev->parent chains into cleaner dpu_dev/mdp_dev
   and mdss_dev to document device tree bindings. Add related comments.
   (Stephen's suggestion)

Changes since v3:
 - Rebased on top of current msm/msm-next
 - Fixed issue with enabling/disabling MDP4/MDP5 vs DSI driver (per
   Stephen's suggestion)
 - Reworked mdss_probe to remove extra platform_set_drvdata calls (per
   Stephen's suggestion)
 - Fixed a typo in the Kconfig (noted by Rob)
 - Added a patch to move component mastership from mdss to mdp5/dpu1
   devices

Changes since v2:
 - Rebased on top of current msm/msm-next(-staging)
 - Allow disabling MDP4/MDP5/DPU/HDMI components (like we do for DP and
   DSI)
 - Made mdp5_mdss_parse_clock() static
 - Changed mdp5 to is_mdp5 argument in several functions
 - Dropped boolean device data from the mdss driver
 - Reworked error handling in msm_pdev_probe()
 - Removed unused header inclusion
 - Dropped __init/__exit from function prototypes

Changes since v1:
 - Rebased on top of [2] and [1]

[1] https://patchwork.freedesktop.org/series/99066/
[2] https://patchwork.freedesktop.org/series/98521/


Dmitry Baryshkov (6):
  drm/msm: unify MDSS drivers
  drm/msm: remove extra indirection for msm_mdss
  drm/msm: split the main platform driver
  drm/msm: stop using device's match data pointer
  drm/msm: allow compile time selection of driver components
  drm/msm: make mdp5/dpu devices master components

 drivers/gpu/drm/msm/Kconfig                   |  50 ++-
 drivers/gpu/drm/msm/Makefile                  |  25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  86 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 260 ------------
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  54 ++-
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  57 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c     | 252 ------------
 drivers/gpu/drm/msm/msm_drv.c                 | 261 ++----------
 drivers/gpu/drm/msm/msm_drv.h                 |  61 ++-
 drivers/gpu/drm/msm/msm_kms.h                 |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                | 384 ++++++++++++++++++
 13 files changed, 661 insertions(+), 856 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c

-- 
2.35.1

