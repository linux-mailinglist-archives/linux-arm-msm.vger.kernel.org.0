Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A425641AFE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 15:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240711AbhI1NV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 09:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240933AbhI1NV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 09:21:28 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABD3C061740;
        Tue, 28 Sep 2021 06:19:49 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id k24so21176133pgh.8;
        Tue, 28 Sep 2021 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mbGOZOb5Aj7io+E29ChYb6CsUDD7dFSCNT86GCOGyck=;
        b=R7bth3A5PT5PURiz5K18ZdI8YpdB/N/YEwZjer13k7Y2rT3iHQ54V7L/b9h7GZ8WC0
         geKEtD8C26cUfX1heBMp82a4JGKbon62qNGokbEkBCfJ394ZkJX6oa9A0+1i4MvOGkGc
         k6kGHIqUw7YekI8FsJ4tYJtu0BxY11Gh34GNMQZkhtmIpMv02SqZ/wIby4tT3JnObHg2
         KXQbJairfQfI0GajqHashVmAhgGtBPOXD5rlkPR1/8JY17q/tHe7kqTRsXyt50YH/RoF
         zkFn0IpysG5VGVeSTTn7K/XZ+vTUUnLCNixiB27h6z5UXRfjaiIb5AXbGyFcEEUI+5bR
         SXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mbGOZOb5Aj7io+E29ChYb6CsUDD7dFSCNT86GCOGyck=;
        b=d8fkO/ovrQuL2vmek2Re9kqSuexZq4WQT1HcZK0H1nznUwMOj2ANBTky5WX/+7dI1W
         m/xWCeh2fMSdkiJ7Pht7V/sPndwbbD07L8dUpW4SqUtHttPaR6MoTUzj2k8SJJJHDQIS
         f6hhyZiaELyrtIC48L+sM0roKdy/DbvLRW6THjwnWSDrdeIqI/67gNZaz2+q7ts+LrV1
         JCazBy5KVc8HOFO39Z8A8NlGzMJ2SOmcXpLXSa6xwHwaEaDcIgXuY9pSxuz93EuWlsS2
         AfBAZi8nGwuf7kQpua97RZylCm9n4YUML4hJt2L4dEhFaOSOatRtcGdobFOrkx+JTu//
         JjWQ==
X-Gm-Message-State: AOAM5338k3I0ZE2bkGeMGSz0gCSnwZnIQygiEced+Hss3h78bMKoeI60
        PBLsjHdom+LqYoMtoF4T2OzWa0SzGRzzenMRALU=
X-Google-Smtp-Source: ABdhPJwaObiI2BOknhU4lQ+z3pJBh4NFUuZcJXyQl1hfKKpwnY4tJs+iDCyZ149gdxsP9MGtH/9Acg==
X-Received: by 2002:a63:8c42:: with SMTP id q2mr4583519pgn.325.1632835188631;
        Tue, 28 Sep 2021 06:19:48 -0700 (PDT)
Received: from skynet-linux.local ([122.162.197.175])
        by smtp.googlemail.com with ESMTPSA id h13sm22063964pgf.14.2021.09.28.06.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:19:48 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH v3 0/3] MSM8953 MDP/DSI PHY enablement
Date:   Tue, 28 Sep 2021 18:49:26 +0530
Message-Id: <20210928131929.18567-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for the MDP and DSI PHY as found on the
MSM8953 platform (APQ8053, SDM450, SDA450, SDM625, SDM626). All the SoCs
on this platform use the adreno 506 GPU.

Changes since v2:
- Changed dt-bindings to use enum instead of oneOf

Changes since v1:
- Split the dsi phy doc changes into a separate commit
- Add Reviewed-by tag to patch 2

Sireesh Kodali (1):
  dt-bindings: msm: dsi: Add MSM8953 dsi phy

Vladimir Lypak (2):
  drm/msm/dsi: Add phy configuration for MSM8953
  drm/msm/mdp5: Add configuration for MDP v1.16

 .../bindings/display/msm/dsi-phy-14nm.yaml    |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 89 +++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++
 5 files changed, 114 insertions(+)

-- 
2.33.0

