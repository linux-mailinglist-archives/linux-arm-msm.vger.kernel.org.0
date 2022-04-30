Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DAB5160AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 23:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245618AbiD3V7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 17:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245553AbiD3V7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 17:59:00 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAC926101
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 14:55:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id w1so19616242lfa.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzFGGotlG7RlR3r+aJsAnarQlq0qwF4e5LkUUWTXHdg=;
        b=MPDiP134izRt4GfK1GWHrpbIR7KbcRcviRlV5MeyysEimI+615eScwZII4ZAqFoDVb
         6FWzMJ4BF8bUqYRUbLkVat+kAXlNw+cuOFkUuAlhZNk5R3cxTJQLmj1lZIoXK/sAYs9c
         7kUiPRqJL59RKY3muhJbBl8gQuBgKCKmrJGSpLQMh8VvzOoFEYzTPtZbUUscCQ7M+Khs
         AFRZWEiwMgG1mVUECncNkqM9mAYmYv3LpsNVJ9vU7AiTucCdXOsMZfgMOsay6oAiN8kj
         x37EZ84/QV3GGQOmWg2b1wfhkUB4ntZKVDBa9QTobfgNspEv+mIA0iiVAziKidR1vi9E
         kzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzFGGotlG7RlR3r+aJsAnarQlq0qwF4e5LkUUWTXHdg=;
        b=ZZI1rDZxmlBgh61eM7BWwsNv1pLQSxvY7mEbU6qd+63+zk5eP0H2mTsEImDXNk5VKe
         RfFF2bkyiPbIwkCLrubh5eiLeFCwnZBjGaXF1xExJYb06J+tGp59UpWmjQ4z+WNrWNC4
         Tu5gmYj4OiUewjh+j0pcdFo956r5niGK+6ctCDlRbPvbviX0kmYHpsW8FnZCjI3n5aFf
         XUfsXmtTajbupi0W5S8rea4zMoWGbuqdXBsGrZObaI+761x0OG7Qk00WKV6Ql91phs+I
         2nfsUFJq4Hv//oq4uanuQctCcCHR+/ElXksyMMaNRKCg/fbYE+jglOld73Je8CZ+a+ZZ
         oZ4A==
X-Gm-Message-State: AOAM5306zbBEU6udv81Z0CttY7q0RJNYAByantc6rlOLxCjREQn/IsFl
        Tu7MBUFkh4kKGayW+YK0R5IiDTZ/LWVE4w==
X-Google-Smtp-Source: ABdhPJyeOGfm8FWZb1tKY9hXrt3tqJ7LKc9TbQ7XVv+O/za6eefQaeBt868EPs8ExkFvEwYJrZnaqw==
X-Received: by 2002:a05:6512:2202:b0:472:2130:40ea with SMTP id h2-20020a056512220200b00472213040eamr4349197lfu.349.1651355733682;
        Sat, 30 Apr 2022 14:55:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q2-20020ac25102000000b0047255d21151sm282111lfb.128.2022.04.30.14.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 14:55:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PULL v2] drm/msm: several fixes for the 5.19 branch
Date:   Sun,  1 May 2022 00:55:32 +0300
Message-Id: <20220430215532.3850521-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Hi Rob,

Please pull the following few patches into the msm-next(-staging).

They are mostly minor fixes for the issues reported by robot, a patch to
silence CRC warnings during modeswitch, a change to use initializers in the IRQ
regisers array.

The following changes since commit d2dc68276133362f021bc8d429433b5818826c81:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2022-04-27 13:44:44 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to 432c0e2685e025eefe188135d617dc476fba69f2:

  drm/msm: drop old eDP block support (again) (2022-05-01 00:02:38 +0300)

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: remove unused refcount for encoder_phys_wb

Dmitry Baryshkov (3):
      drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
      drm/msm: add missing include to msm_drv.c
      drm/msm: drop old eDP block support (again)

Jessica Zhang (1):
      drm/msm/dpu: Clean up CRC debug logs

Marijn Suijten (1):
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Vinod Polimera (1):
      drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table during probe

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    8 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    5 +-
 drivers/gpu/drm/msm/edp/edp.h                      |   77 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 --------------------
 drivers/gpu/drm/msm/msm_drv.c                      |    1 +
 9 files changed, 36 insertions(+), 1482 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
