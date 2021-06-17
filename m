Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB9D3AB6FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 17:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhFQPL6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 11:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbhFQPL5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 11:11:57 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEB9C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:09:48 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id c138so3474028qkg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mv9m1rL1gQr7Cq6u236MxatHLn2/MqViMk2h6WZTmRo=;
        b=RhAoT19vBPzCi+padM6Q7iUPclE2KxhFlLSP1W5hes8qWZnAztDI26Z4FvXDDMqucP
         W5JQJ+LluUo4CVKtD8Ou8W9THwUmW9uFmpyN3w2O2DiGqJ9c9w5qOv4G7lMqAWbtPSZp
         +nyS2rvds2wuW0Ui9tRUgXAuNyit+DxYJ1V15wv1mGoktZaDq1vY71NXD3TfnghhBhbv
         h+DJXG0YSEZWCrAXmeVKZICdwmo7FfJUXXYVxAW6TJiqNh2N/cumtG8td2dd8ZUuVSEn
         aUJCPlFNmXTtK6SA3cqG/jqEwAX6jgcpYxIn8IIscqfbcKtHCLut+1uODkwneV6eaqwx
         DkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mv9m1rL1gQr7Cq6u236MxatHLn2/MqViMk2h6WZTmRo=;
        b=LA0aIM1mpxASUJEsgUglA0GG2kbhj9bJQA05BcrgP05fXS6ztqWUHFjf1pEL0+O/j2
         HK2/NHF4RskFfPFP+vYcHuQ5v1/yud7XzV5WWccGBcSGhGTtMkb7Hjtaj3I2nA2WhPhV
         ATyigVsF5nhpfY/byHI8xhhCn2+f7VRX9xNhyCYa6EJGbXChv8FSWt9nvNZ0ZTefC7xi
         KeqSssciaLVgwcK+uCiGC0UyW0nlrtCmpkFuCqUJngdbQzwS+LZ2FAOGvOBj9RFhCtdu
         mtUUChzHB9Ym6FUXyLZI5GQcfKLS3KquOU1W8RlyoXv218ytvKIFq7rFXiQrjmfOTpw5
         zEDA==
X-Gm-Message-State: AOAM533lxbS4dks3rrC+/rCjMrqt7mML3e+JdOwM12lUQoMx0rMibvDH
        Kc3nWbLdxSO6xSRe5VeozH2p8w==
X-Google-Smtp-Source: ABdhPJzglu2BOkfTCvKDZ/8MRUxwg51FjvnIad48oEPHqJArDCQJiVaaZHhuk7PmsZdUyA3nUjVIJw==
X-Received: by 2002:a05:620a:13c5:: with SMTP id g5mr4349545qkl.464.1623942587689;
        Thu, 17 Jun 2021 08:09:47 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g82sm1915427qke.119.2021.06.17.08.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 08:09:47 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Bernard Zhao <bernard@vivo.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jordan Crouse <jordan@cosmicpenguin.net>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v4 0/3] drm/msm/dsi: support CPHY mode for 7nm pll/phy
Date:   Thu, 17 Jun 2021 10:43:32 -0400
Message-Id: <20210617144349.28448-1-jonathan@marek.ca>
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

v3:
 - yaml bindings
 - changed binding to "phy-type = <PHY_TYPE_DSI_CPHY>;"

v4:
 - PHY_TYPE_{DPHY,CPHY} instead of PHY_TYPE_DSI_{DPHY,CPHY}
 - use enum/default for phy-type property
 - remove a stray semicolon in dts example

Jonathan Marek (3):
  dt-bindings: msm: dsi: add missing 7nm bindings
  dt-bindings: msm: dsi: document phy-type property for 7nm dsi phy
  drm/msm/dsi: support CPHY mode for 7nm pll/phy

 .../bindings/display/msm/dsi-phy-7nm.yaml     |  71 +++++++++
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  49 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 145 ++++++++++++------
 include/dt-bindings/phy/phy.h                 |   2 +
 7 files changed, 259 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

-- 
2.26.1

