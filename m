Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D35636984B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 19:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhDWR2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 13:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhDWR2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 13:28:47 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7053BC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 10:28:10 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id a18so13173834qtj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AzW8gw/lChay/rLNwhgwlXkUklC1imdiRu5IZJc3UKs=;
        b=LRP8c9RoAsA+Ug0WokdedrbQa2U05MvwsRm0dqesAWlibw2QdTtvxcvQdUdPS4/R7k
         Dzzgk/NVhLr39A0/Y+c0E1oIpASUsgWoW44wkizulOIUdGTXJf1TxYOcaOZaGjLiltw5
         RprsqwrB6ufVd6lQbc1PR4I1cP30CgXdaD1SMVUeTa+CWeuN8MVkcryjdYdsMhZSfvcW
         q/bEEWQp8ROwYU7YLpQPR3/29AuViizc0bR4USvz2GkjG5ENkcpzr+g9mFWjncMMjEdn
         cQ8BfK2rAUfr0wNUuQ6115cBIxw5mz2WlRL2LJkboEdvmPFdQjhkkvWM8XnePAToLPEi
         TZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AzW8gw/lChay/rLNwhgwlXkUklC1imdiRu5IZJc3UKs=;
        b=E9ekv3IjLwk2RMpV58+HMzhxd3CZfQ3anrSg+O2BIijLd3zbWaoBrpoEiqVfwQcKS9
         nR9vdI+At6qsHAGQjduaMyNXIxzRJYj/EO71cjVngTrKcV/kIRAmLHH+hyjTmwBOkNfV
         IJ4jygjHML9cvzoYtVo7ZfMBCuERR5Wy6TODCjmEbe4RVYAyIvlje8Gmu5CjIsAeamhk
         G9Dr6jiufh/yrLOTiy6jealt1qnD/twhH2N3YvTpaocDQg2pgpdM/wI5jf1LdxUXYzNS
         KIq65qn2St3z2IVvsOx8sMn2nlYdp/NhgilcNyU3gtj1TVYBNEemgc7pYvoyqA3rwfRP
         8m2A==
X-Gm-Message-State: AOAM531Sn/gk3EtcAjNKHZ+BjH9Pc30FSsQk+XmHEO4dv0KtRvmKdWXg
        LuxzV+4jGNcnIaRHfnh8oVPhtQ==
X-Google-Smtp-Source: ABdhPJxdsCxGFuhVZIOZpCiAsDpeoN9/VhBAMMWbtJ2u0oxLiMSQyFyiBW+kjeIGADoDSII06RkhTw==
X-Received: by 2002:ac8:4d43:: with SMTP id x3mr4954636qtv.326.1619198889461;
        Fri, 23 Apr 2021 10:28:09 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id y23sm4782627qkb.47.2021.04.23.10.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:28:09 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Emil Velikov <emil.velikov@collabora.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2 0/2] drm/msm/dsi: support CPHY mode for 7nm pll/phy
Date:   Fri, 23 Apr 2021 13:24:38 -0400
Message-Id: <20210423172450.4885-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the required changes to support 7nm pll/phy in CPHY mode.

This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
the CPHY mode.

v2:
 - rebased on DSI PHY reworks
 - reworked getting cphy_mode in dsi_host.c
 - documentation change in separate patch

Jonathan Marek (2):
  drm/msm/dsi: support CPHY mode for 7nm pll/phy
  dt-bindings: display: msm/dsi: add qcom,dsi-phy-cphy-mode option

 .../devicetree/bindings/display/msm/dsi.txt   |   1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  47 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 147 ++++++++++++------
 6 files changed, 186 insertions(+), 48 deletions(-)

-- 
2.26.1

