Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F563A04D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 21:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbhFHT6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 15:58:50 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:42594 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235531AbhFHT6m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 15:58:42 -0400
Received: by mail-qk1-f178.google.com with SMTP id o27so21434483qkj.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HN/dADQ65ljJkOdLNlsYJNf64TdCy5snXLeJXI/fSws=;
        b=tl6qBfeR1ctMdKOjD5T7yqHao2tzBYPwBZ6V7bhuPFKO/eH0NCRXEHAZNCBXm21vh6
         y+Jo6Lh2RnmrDGBcqsjKAkzFJkxr7aCjm19n/+UXJWae4U8zd3GMNLBODNvdGNIICjan
         Wk01zjyEh80E5jQGbtt4eSMWfBMj5BCcLPr4/vsqVc0SFWUjvYYTR9eqwatQ4qyUsDYL
         sxqIeBRVaLxnIVC4Ae/NGANFJ25uT7q1kEcFs/0s6XMesfA4z/g4NGVZz7hBQ3g+TxFz
         vHekfmbcapwt4zasp8IASP5xmqq0xOkziXoyPB9saT/TMxZVUKM94a6nnAJqepFv06za
         AT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HN/dADQ65ljJkOdLNlsYJNf64TdCy5snXLeJXI/fSws=;
        b=gGZ4f8VSvoLlgZXDhzxkfcVnloDwR13VO7MzlL8LCpihfFQnzk9Cb1cODiBKd9JVvL
         IuYV9kROv7uISyZx+omnIvDffjaxtRkNpVrNZnOSJQ+t7t1V7ACxZQv5bMhrSKguA6LZ
         I3Ac0/xd+CcbQ9JAbAmRp9obP5TrWaiIK/PaZ8xA+14ql80nGfBX6XxD/6vlPS8tYVzR
         mLr6kreXFpoKv8V3yjfBcFQOPVN0uSdmWo9k9U2ywBrN9ojckTn3o+roSvTfeFYVJdPI
         cju/SaFHoYQPe4USQTJ5VLtbp42fLYjuXvaIWCoYuZVeNrMWRvSTe3IXssAnyedfXDBk
         SORw==
X-Gm-Message-State: AOAM530iPFY+f2PJ6k6m/eqcgnmd1MM8bSx+jI2ZWlRUH4E7rt2O06p/
        un4TSzicfPII9tdir3IOqe98/A==
X-Google-Smtp-Source: ABdhPJxCiMcEk4rEfSFxoc9MLYPAFpeFQHE1XQnjKYvFYU9dDovhkcdD8gGzWd5X3y+DjjX9qqPZtw==
X-Received: by 2002:a37:d58:: with SMTP id 85mr20317382qkn.414.1623182131919;
        Tue, 08 Jun 2021 12:55:31 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id l141sm643687qke.48.2021.06.08.12.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 12:55:31 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
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
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/dsi: support CPHY mode for 7nm pll/phy
Date:   Tue,  8 Jun 2021 15:53:26 -0400
Message-Id: <20210608195342.18269-1-jonathan@marek.ca>
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
 - changed binding to "phy-mode = <PHY_TYPE_DSI_CPHY>;"

Jonathan Marek (3):
  dt-bindings: msm: dsi: add missing 7nm bindings
  dt-bindings: msm: dsi: document phy-type property for 7nm dsi phy
  drm/msm/dsi: support CPHY mode for 7nm pll/phy

 .../bindings/display/msm/dsi-phy-7nm.yaml     |  70 +++++++++
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  49 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 145 ++++++++++++------
 include/dt-bindings/phy/phy.h                 |   2 +
 7 files changed, 258 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

-- 
2.26.1

