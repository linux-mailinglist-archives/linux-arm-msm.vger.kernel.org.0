Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 729ADEDBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2019 02:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbfD3Aai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Apr 2019 20:30:38 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45293 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729323AbfD3Aah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Apr 2019 20:30:37 -0400
Received: by mail-ed1-f66.google.com with SMTP id g57so4176285edc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2019 17:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmHyoZA3s8+eH8irHXDQwuHohJUycE2ziw5RpU+dlOU=;
        b=MOPfSeYvgFTPgmXOyqu5vdYm5hkSdQbjS+ZqEcO2RU+mAi+5MAMZoFxX3IpBDPLPQS
         +6cxB/pSPBzbPChynLlIkPp4j946qOnm4Ye/TMQhOEbAMuMfpeVVBcoKcz4+RJW8yx6/
         Ved8pdw06sn2gpyLII0BLDY6t7Sg8N2naFdo6CAqbtTC39FR3o1Tc1kBC5kIorVz+Ak4
         ako09dGNcEJDViNxWaT8wPfz1pEdUxqyVHmDsDi6DvZ163SxxHJc0/irfHhaluAhRXut
         fRdoOWoA4QNK2yK1oJ5SHB/z+IS3njGTe+Ft9ivlpb8yi+AAVdDoaUQ0ZqtYNO7vRck8
         qUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmHyoZA3s8+eH8irHXDQwuHohJUycE2ziw5RpU+dlOU=;
        b=omwDNkTBd3BU3N9gUXAYCmTsoBy+N6JAlrWdKr8jd2nQLP/30NMpzKJ0Wo0T0FWGha
         3r0+MuW+CQOpr3rJFna2t4TjBN4a+k2oXnCZr5enMXg2zTgvczL1efTTMaklfvu+eDja
         P3KDNpdkFujC2kNogmVY41be7Q+bF1aidsfP2lc1ssOrlg5kYYmT1xvPqOIw2txCsSRc
         n1P8FZ9iH2IhMkzuMbGzTWVxiN62SHNTwmejsLzYTp7Pzd6gl1NSPMbnqCXGCnurWek4
         wVUFJhNfM0C+mHcZf63pG0JUkQDdtWM/tJ7239IHgoYVzDUDczvsamhhO25YL7YSTwdO
         fUQw==
X-Gm-Message-State: APjAAAVcVjZSWXF3T+rMonQQfElFd1MfCjUjQ6U/c05Kai8v8SJGI2nl
        Fg/asvcRadmly0KNFEZ6L6twMw==
X-Google-Smtp-Source: APXvYqxnysyX/Gy2Mv+d0SzufhcdmkrISFZgci8tZfFs0rMtqN5Lk2YDEgY4FPz5PnrMa8o5ipagUg==
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr41403077eds.145.1556584235673;
        Mon, 29 Apr 2019 17:30:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:7d76:7b66:68:3b5f])
        by smtp.gmail.com with ESMTPSA id a9sm9424163edt.93.2019.04.29.17.30.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 17:30:35 -0700 (PDT)
From:   Tom Murphy <tmurphy@arista.com>
To:     iommu@lists.linux-foundation.org
Cc:     murphyt7@tcd.ie, Tom Murphy <tmurphy@arista.com>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/4] iommu/amd: Convert the AMD iommu driver to the dma-iommu api
Date:   Tue, 30 Apr 2019 01:29:47 +0100
Message-Id: <20190430002952.18909-1-tmurphy@arista.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the AMD iommu driver to the dma-iommu api. Remove the iova
handling and reserve region code from the AMD iommu driver.

Change-log:
v2:
-Rebase on top of this series:
 http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-iommu-ops.3
-Add a gfp_t parameter to the iommu_ops::map function.
-Made use of the reserve region code inside the dma-iommu api

Tom Murphy (4):
  iommu: Add gfp parameter to iommu_ops::map
  iommu/dma-iommu: Handle deferred devices
  iommu/dma-iommu: Use the dev->coherent_dma_mask
  iommu/amd: Convert the AMD iommu driver to the dma-iommu api

 drivers/iommu/Kconfig          |   1 +
 drivers/iommu/amd_iommu.c      | 694 ++++-----------------------------
 drivers/iommu/arm-smmu-v3.c    |   2 +-
 drivers/iommu/arm-smmu.c       |   2 +-
 drivers/iommu/dma-iommu.c      |  52 ++-
 drivers/iommu/exynos-iommu.c   |   2 +-
 drivers/iommu/intel-iommu.c    |   2 +-
 drivers/iommu/iommu.c          |  43 +-
 drivers/iommu/ipmmu-vmsa.c     |   2 +-
 drivers/iommu/msm_iommu.c      |   2 +-
 drivers/iommu/mtk_iommu.c      |   2 +-
 drivers/iommu/mtk_iommu_v1.c   |   2 +-
 drivers/iommu/omap-iommu.c     |   2 +-
 drivers/iommu/qcom_iommu.c     |   2 +-
 drivers/iommu/rockchip-iommu.c |   2 +-
 drivers/iommu/s390-iommu.c     |   2 +-
 drivers/iommu/tegra-gart.c     |   2 +-
 drivers/iommu/tegra-smmu.c     |   2 +-
 include/linux/iommu.h          |  21 +-
 19 files changed, 187 insertions(+), 652 deletions(-)

-- 
2.17.1

