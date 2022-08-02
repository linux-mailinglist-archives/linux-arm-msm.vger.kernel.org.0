Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A586F588459
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 00:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbiHBWhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 18:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbiHBWht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 18:37:49 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8239A1658C
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 15:37:48 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so175309pjf.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 15:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=C3C5nhfQMbZqyCX3pFoZEMov0enNRmYhg5gtHn4KJoo=;
        b=cgMuOxAGBnNnnsU1dMszkwZT6TDSBT1fyFTdTVXMp2WP69HDOP1+cbISIj/PAeFz2i
         JogPs8AQCAxc2Q472v1t/GJdHZWFjvd9sztQ8rjaVBY9zf5Uf3I49l3Q4B2vA38XNP9X
         wu7IYCegUfcCE3/pe55Ws1bKq7nK9FaTPwpfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=C3C5nhfQMbZqyCX3pFoZEMov0enNRmYhg5gtHn4KJoo=;
        b=l3GLJPQDRYAgFK7HESf0MDJRGCdlBvtUwZAr9qxdxsw/e9G3qrzLqQ3JCcosgUCAfh
         joCp7DjItQGIPL3zdTSk+4rvpiqKOwOXZax3WgIOmd/SB1sg5GQIxjY7juSYnUvkZvK+
         zSNM8XN9rgokTHwvCZKK5iNcpx+Fr4JOOkwwoPLsYUvEKmVRDOQqGKd4R/LT32H6tVE5
         D8O7D3ytfXRw29k8tCTuyTrfbZIvNr3PFnP5z/yEoMRttJrLcJ+pq0ArUAZz6zRBiRzd
         7nMunC7oxvBSy83TYcoz9icEH+pg70tSHIUmODghdL+G7ClEA7N7wFBFv+qDF5nuC0Nl
         N9mg==
X-Gm-Message-State: ACgBeo1NdeO2lf/ctNgqz2Xo5efesjWCZvBjnvcNUxAbhW7dKYoCaLuj
        Ph/83DbRLVcwntK4Ou4Qv1j3UQ==
X-Google-Smtp-Source: AA6agR65Pfd53RYkwBBMhSNB0UqWVSHBPJcuyEW6ghwHZJfmcz4Htfy5fvPk4k8HgU+GaWPwvafpmw==
X-Received: by 2002:a17:902:8508:b0:16c:46ff:53cb with SMTP id bj8-20020a170902850800b0016c46ff53cbmr23246764plb.168.1659479868034;
        Tue, 02 Aug 2022 15:37:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:31c9:9937:c6bb:62f5])
        by smtp.gmail.com with ESMTPSA id x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 15:37:47 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] drm/msm/dsi regulator improvements
Date:   Tue,  2 Aug 2022 15:37:32 -0700
Message-Id: <20220802223738.898592-1-dianders@chromium.org>
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

