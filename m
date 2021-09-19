Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30CF41097A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Sep 2021 05:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbhISDMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Sep 2021 23:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbhISDMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Sep 2021 23:12:45 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889C2C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 20:11:20 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id v2so8802235plp.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 20:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=G6BucwPaZnnmqaLd4fYBveJkURWi7kDjQMGIY7cMKK0=;
        b=r554Mpl0BWcOt8Cj0gmLagxeJwfxwlc/lRfhLTiC/U10hq1fm02juk0DBXOnlhO7mZ
         eFTtK4sU4KRhV9WL5ip37UxxO2DIOlGG1CWc+fEtBkxnM0vOrZnczvUShnT4pX0ukXLH
         1UcS09Gs5zyYd1hMxAhh9Dv+grhC2FjI1cR2NnP1eLXmXFSFKgX0gSpa6AU5ZbFABRxb
         CuvgcLJ8iFhsYUHLFmzz84762YJSYQBiLmFOEOV2z1b9dh0389DftNeiT5knN0Q2m2HI
         mrXP940pu86rSEjg1TCwE80SUQT89FltRfKCNuNqczD3ELv2yj/pBvuNVsg+Q8EUOZvI
         SZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=G6BucwPaZnnmqaLd4fYBveJkURWi7kDjQMGIY7cMKK0=;
        b=3GTILXcCZ0R59v165TGw2MXNFdzhqc8BVN71P5foAAat97dPV7H7OPUhISLibhvEA+
         IFFQ8ERKhnMk4McHxT757qqkxEEovBzXVgP7Ew/zS+3eLhn1FhYLy9oOSsE2ExIg9Zbw
         9MTQ7LZOhiO7wkpstCN5iHXWns0ksdfOa53Y1H2vLpuhNgeq/GENam9BHnuV31kvBFul
         U2h1VuZutetaqBiJdD0hYnad9eX5208S+VkGowsOMUkSm3oFnQYwQskoiInAKE3+x3xO
         eHKqut5f2qSQri2C/x//eab6WAaPxg2aBUMwwZQyAF/L21O7kn3mIeqT2ehA/yAsnjC6
         0lng==
X-Gm-Message-State: AOAM533S3/KDNEO10tgUcUwF6YTF5IR1jpZNoNF8XuvxG7s1DXZubZpT
        lNowWi/VBT7v8DDjbMn1R0kR4A==
X-Google-Smtp-Source: ABdhPJyD0FI4fnI4/dC47KuFVzltQiWcHwub0OlDiE8wqzPFlaUZqzP3X0SR2VsCBK4dWHaKdSVv4Q==
X-Received: by 2002:a17:903:1208:b0:13a:8c8:8a33 with SMTP id l8-20020a170903120800b0013a08c88a33mr16701433plh.89.1632021079903;
        Sat, 18 Sep 2021 20:11:19 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 132sm10224931pfy.190.2021.09.18.20.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 20:11:19 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add QUSB2 PHY support for QCM2290
Date:   Sun, 19 Sep 2021 11:11:08 +0800
Message-Id: <20210919031110.25064-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds QUSB2 PHY support for QCM2290 platform, by documenting
the compatible and it into driver match table.

Shawn Guo (2):
  dt-bindings: phy: qcom,qusb2: Add compatible for QCM2290
  phy: qcom-qusb2: Add compatible for QCM2290

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.17.1

