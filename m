Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A546F2E1032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 23:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgLVW10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 17:27:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgLVW10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 17:27:26 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE18C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 14:26:45 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id b2so14439967edm.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 14:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w7THJPT2rmU60w+DOPskH6aoP7sduDFS77dfdLYEIZU=;
        b=h+CwsmNz+UUYAshh+EopcCW0ZE3Ddn8dsBvVMc8IdKlLt46OMkA6rTXL4f++nt/zMa
         0rVR0tTLFR0v7sKXCYF3o/jqewIDXcX77hY5VHpKiM9zxAnlOXGp9ehQmwh5CMwdpyel
         VAHAF2P+jFAyrV8R2nHhppr5X8KSgcb2EkZ2HRPjU+vaV60TBn221PxISNt2EBe4IIiF
         G+7UwEKYa1YkDsxEs/+GxGYLdQud7RzCyEqSruSdk+Yh2h9QZfNuPKtriR/74tFUfvx+
         vM9pCJDIg7PBNOs6n6WyBF4n6gVJdpbEZo691kbxO5aTerl/u5pAhtsYljprYq2kAs8k
         g/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w7THJPT2rmU60w+DOPskH6aoP7sduDFS77dfdLYEIZU=;
        b=KqofAMfr5rpJ4YyApg9NHYncESiGqJl5hCHATxKFqQ5q9L8Nu7EAKnB0xEUMvptjU2
         nmZVWYnW0E4PdVH37Jbh3Cog13T4HDwzFuYg/2riC9wDgvhXGNCbD7ZzH07PcokMeCzH
         1Z6gnfL59KNbRYs+04IWc6FGPDVgil+pk3ji9T801RUALlweL4JXvUUGpxHqdFWIftIG
         BgHuA0n06x7HlGqbvRKhhXlh+8swFbwvafPyC+7Xw8IbqXD8Ha22pIxNkef6lzA+b+jf
         +bwUStZRHNXpPcpN8yj0sBJ9N0PILSVbVPYNmjCyYa/6hBrk8hDkwPDyuuZogo4eHuGS
         s3aA==
X-Gm-Message-State: AOAM531baqbKciriejB9FywxNM8/p9gv8kW59Pdsjy0gcAM6YxaZoiUh
        yM+hFtaqwFd/8pAGhI3v2tYdCqOAOS7j2Q==
X-Google-Smtp-Source: ABdhPJwz8RD/hCOnHNBxhotKvch3DxJ6xlTIWUPkc/Xy1HTxsZhKhXvvw6293WCr7pwBrg/w3whqQQ==
X-Received: by 2002:a05:6402:1352:: with SMTP id y18mr22371623edw.178.1608676004134;
        Tue, 22 Dec 2020 14:26:44 -0800 (PST)
Received: from localhost.localdomain (dh207-99-167.xnet.hr. [88.207.99.167])
        by smtp.googlemail.com with ESMTPSA id c23sm30515385eds.88.2020.12.22.14.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 14:26:43 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, andrew@lunn.ch, linux@armlinux.org.uk
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 0/4] Add support for Qualcomm QCA807x PHYs
Date:   Tue, 22 Dec 2020 23:26:33 +0100
Message-Id: <20201222222637.3204929-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for Qualcomm QCA807x PHYs.

These are really common companion PHYs on boards featuring
Qualcomm IPQ40xx, IPQ60xx and IPQ807x SoCs.

They are 2 or 5 port IEEE 802.3 clause 22 compliant
10BASE-Te, 100BASE-TX and 1000BASE-T PHY-s.

They feature 2 SerDes, one for PSGMII or QSGMII connection with MAC,
while second one is SGMII for connection to MAC or fiber.

Both models have a combo port that supports 1000BASE-X and 100BASE-FX
fiber.

Each PHY inside of QCA807x series has 2 digitally controlled output only
pins that natively drive LED-s.
But some vendors used these to driver generic LED-s controlled by
user space, so lets enable registering each PHY as GPIO controller and
add driver for it.

Robert Marko (4):
  dt-bindings: net: Add QCA807x PHY
  dt-bindings: net: Add bindings for Qualcomm QCA807x
  net: phy: Add Qualcomm QCA807x driver
  MAINTAINERS: Add entry for Qualcomm QCA807x PHY driver

 .../devicetree/bindings/net/qcom,qca807x.yaml |  88 ++
 MAINTAINERS                                   |   9 +
 drivers/net/phy/Kconfig                       |  10 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/qca807x.c                     | 811 ++++++++++++++++++
 include/dt-bindings/net/qcom-qca807x.h        |  45 +
 6 files changed, 964 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml
 create mode 100644 drivers/net/phy/qca807x.c
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

-- 
2.29.2

