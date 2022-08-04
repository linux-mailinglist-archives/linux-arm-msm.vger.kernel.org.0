Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4D4589DA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 16:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239686AbiHDOjV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 10:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239852AbiHDOjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 10:39:20 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060D832060
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Aug 2022 07:39:19 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 12so73470pga.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Aug 2022 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=eiXJeP7WokDKvW2gy8/Ekzn80/y0tYXfb01K6UEv3lo=;
        b=VsrMMFdPnpBCkYIHS/8OlaF+PlqFIGTirKIbaSa5AE4wKgjslo29008CtGT619gMIT
         Ex0cX8v+7y0sm9KVWMiW6+HrHEGQuoEFMt0I52/VPDRolLiEfS3NXdJv92ojd1a6JTDh
         1vSJ6jB4tQPT2ypbNg9C+h3sKPn0vxwcKCjx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=eiXJeP7WokDKvW2gy8/Ekzn80/y0tYXfb01K6UEv3lo=;
        b=zgJN+IPa6BfYd18pIfrd/UU3J01tukSRHjZS3ttiH3KYUHIHK7Ba8GvGnRxo1kjW4G
         65LqoViUjLbkKrPcidR8i15siqjpnAhyu4scQ0f3e7rRWDLObVeG6ASscWmlXI0HKq61
         DrDCS8upbVA7iRAnbijLosVhiVEGzk1XcfU9PWYYDSf91kSaZMdZJXF3guSo3I7YHpkH
         orDwQi7wdQMJQiFYaun5yAnvgFFQwmppgSwZ+22Z+KPIg2GBR9ALvxlLe6beAz+h4RTU
         WEJgqff0I6Hxh/qfUflJvlIWsyhwPF2WPkO7zyA5N8kza+0JjDSSUYVv0DnD7XQFem+O
         byRQ==
X-Gm-Message-State: ACgBeo2J5peYZB/YEhjyKSfO2zbJ1PcV6eEUoUsI7WSrFJVW+M5R/VV8
        YTLsGr1nxZz8/BVx1z36Nz7lFg==
X-Google-Smtp-Source: AA6agR7Rnj6JVadOw+wUTPK9LSMDxWtcpLrIyOUlRbk4YSruGHyO1UKQ+7PBkeD8xesD3fFqH0MeFg==
X-Received: by 2002:a05:6a00:1821:b0:52e:3c7c:9297 with SMTP id y33-20020a056a00182100b0052e3c7c9297mr2278473pfa.54.1659623958441;
        Thu, 04 Aug 2022 07:39:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:aa71:2553:6f54:5cb1])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902680700b0016a111c83cdsm1075071plk.119.2022.08.04.07.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:39:17 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Archit Taneja <architt@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] drm/msm/dsi regulator improvements
Date:   Thu,  4 Aug 2022 07:38:47 -0700
Message-Id: <20220804143854.1544395-1-dianders@chromium.org>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The main goal of this series is to make a small dent in cleaning up
the way we deal with regulator loads for DSI drivers.

As of v3 of this series, the regulator API improvements needed for the
later patches in the series are merged into mainline. Thus this series
only contains the DSI changes now.

I'd expect:
* The first two patches are bugfixes found while converting the DSI
  driver over. Those could land any time.
* The third patch ("drm/msm/dsi: Don't set a load before disabling a
  regulator") is a patch a sent the other day verbatim, included in
  this series because it's highly related. It could land any
  time.
* The next two patches use the new APIs. Since those APIs are now in
  mainline those could also land any time.
* The last patch is just cleanup I noticed as I was touching the
  function. It's not really related to regulators but it applies atop
  these. In theory it could be rebased to land separately.

Changes in v4:
- Correct the commit that this Fixes.
- Mention error code change in commit message.
- Use more gooder English in the commit description.

Changes in v3:
- ("Improve dsi_phy_driver_probe() probe error handling") new for v3.
- Do all the PHYs too.
- Fix typo in commit message.
- Get rid of error print after devm_regulator_bulk_get_const().
- Just directly call the bulk commands; get rid of the wrapper.
- Update commit message to point at the git hash of the regulator change.

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.
- ("Take advantage of devm_regulator_bulk_get_const") new for v2.
- ("Use the new regulator bulk feature to specify the load") new for v2.

Douglas Anderson (6):
  drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
  drm/msm/dsi: Fix number of regulators for SDM660
  drm/msm/dsi: Don't set a load before disabling a regulator
  drm/msm/dsi: Use the new regulator bulk feature to specify the load
  drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
  drm/msm/dsi: Improve dsi_phy_driver_probe() probe error handling

 drivers/gpu/drm/msm/dsi/dsi.h                 |  13 --
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 172 +++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  96 ++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 160 ++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |  20 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  32 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  28 +--
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  12 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  32 ++--
 12 files changed, 197 insertions(+), 390 deletions(-)

-- 
2.37.1.455.g008518b4e5-goog

