Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBD424EFF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 00:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgHWWAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Aug 2020 18:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgHWWAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Aug 2020 18:00:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A82DC061573;
        Sun, 23 Aug 2020 15:00:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v12so7457360ljc.10;
        Sun, 23 Aug 2020 15:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xBKmrcKhwETJmaV6FzpCkwP2aICHpN2nlbu6jRfR+c=;
        b=u0ugw9dJOnti/NZwaVPKZWmelIJE0Hn/4G0ddVGwvFY0e0pyM7DYCx14JAy5DOeaip
         LJzdI6ThbMRp9qvYfGU93C9TRUooVZ86ZMQDBnyMlSRtZz69H5Y3jKX4wzs+ycKVKxFl
         i8M20cd2axTGg9457ctO5Xj8yRQcnVwZRHDrwIdXltzkbCjZ3Yix2Tsp7gTq82P/xYKH
         g2qzgJnyzkv+H7Q90qQNVz2a8dhtLK21bKgX/sw+v4vyI2TUo60lwcq1JLMMoRJ2zQqj
         Y/G2TYnKAhm1Kq360SRC/308+qS6JdFMKPm7bB9T+/jmX6iAIvyt147PDOCnBBSwVFTo
         AK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xBKmrcKhwETJmaV6FzpCkwP2aICHpN2nlbu6jRfR+c=;
        b=O7RvxQgTCb6hThlOkRVTLqw5LTaoxYQ+GG64fh+nfw2TwUfhEg2NG2hEw61fKIcJq+
         3613h4cb9RVi7hSV+hXKzlEMjD7Oc6srCw3IJWyYvOU6wLOPuNGZcCXAdUU4ILmpcLMc
         CyCJTuFlfqW0ZwLGAJGM1mjcU7Y9Gs3Dyq1WlRS90QUZkA1CLFyznnjNh5ISzRipvm0y
         AoTbFnD0pGLLoaIb0mx2y1zFhB7Z3Fkaibg2kdvY9MNE0XWwqwOC8U+CnyEdM+Uw1mjb
         hVKfgMY6OdZfz64iU/lwsCRsOX+mV3b1+DWvQD+klTUlyLpsqPmYlmJ99VF0bxbSMU9N
         +2ZQ==
X-Gm-Message-State: AOAM5308M4URhsinLXAtniFASc6kF30+lB7krHKN5LcCz9H2irvBRFed
        hbfJqxQYNX/DlyUK5jk6QNQ=
X-Google-Smtp-Source: ABdhPJywVuuXApLID135Eooip1Ff4e2Dn6x/pXSjnAIANS+sLxR5eTt56tDbi3F7rrJ9YhU2gVnZ1Q==
X-Received: by 2002:a2e:9516:: with SMTP id f22mr1205665ljh.24.1598220036106;
        Sun, 23 Aug 2020 15:00:36 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id g11sm1825097lfc.46.2020.08.23.15.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 15:00:35 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Seungwon Jeon <essuuj@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/8] drivers: phy: Constify static phy_ops structs
Date:   Mon, 24 Aug 2020 00:00:17 +0200
Message-Id: <20200823220025.17588-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series constifies all static phy_ops structs in drivers/phy.
Typically the only usage is to pass the address of it to devm_phy_create()
which takes a const pointer. The lone exception is in
drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c where the address of the
structs is assigned to the data-field in of_device_id, which is a const
void pointer.

Making the structs const allows the compiler to put them in read-only
memory.

The patches are all independent of each other, and have been
compile-tested only.

Rikard Falkeborn (8):
  phy: cadence: salvo: Constify cdns_salvo_phy_ops
  phy: fsl-imx8mq-usb: Constify imx8mq_usb_phy_ops
  phy: hisilicon; Constify hi3660_phy_ops
  phy: lantiq: rcu-usb2: Constify ltq_rcu_usb2_phy_ops
  phy: lantiq: vrx200-pcie: Constify ltq_vrx200_pcie_phy_ops
  phy: ralink-usb: Constify ralink_usb_phy_ops
  phy: samsung-ufs: Constify samsung_ufs_phy_ops
  phy: qcom-ipq4019-usb: Constify static phy_ops structs

 drivers/phy/cadence/phy-cadence-salvo.c     | 2 +-
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c  | 2 +-
 drivers/phy/hisilicon/phy-hi3660-usb3.c     | 2 +-
 drivers/phy/lantiq/phy-lantiq-rcu-usb2.c    | 2 +-
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c | 2 +-
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 4 ++--
 drivers/phy/ralink/phy-ralink-usb.c         | 2 +-
 drivers/phy/samsung/phy-samsung-ufs.c       | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.28.0

