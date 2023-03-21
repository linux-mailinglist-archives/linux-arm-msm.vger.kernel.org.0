Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54FA96C2CC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 09:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjCUInc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 04:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjCUIna (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 04:43:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468F71A4BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 01:42:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYi-0001Qt-Cv; Tue, 21 Mar 2023 09:41:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYd-005e8w-Jl; Tue, 21 Mar 2023 09:41:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peXYc-006hGE-Ph; Tue, 21 Mar 2023 09:41:26 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Jon Nettleton <jon@solid-run.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        kernel@pengutronix.de, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 00/10] iommu: Convert to platform remove callback returning void
Date:   Tue, 21 Mar 2023 09:41:15 +0100
Message-Id: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rdSh4Xeg6tHQ79VpKnn+68R53WjFDJ2aA4WrZ0yXy7Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGW2krstvUjjQL/q4EkmqkS0b+KWpRPx1JGlde 3eOjPfzWzKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBltpAAKCRCPgPtYfRL+ ToMUCACnQcRCXUTbwMElh8PDqFXVRLM9/fPmIh/eTNNZeW37hXTU+p85ntqq8ViojhXklq/A4S2 +6ojPGlqDz/ToIwc70XC6nSNJBiKE+QLXIBFEA+9UPpU6uDsP4TfinB/cdeV5MYQueWfWaHCj15 876m8UHC1y7+2JRIT6yta0v2yE3U8JBvqgHNH688UOQDimcPCRUmE/zD+B3GGIbuynQaGfwcNDY 9B2eHrCHXzPILMBtPe0sSnAxEyXi8GSXnEaPwCcEsqweFtYvrTbEcGmuTqjN8V6pRq1Opg0mQMj jmwVUZwveCV7qKMw4dVOAs7fsRN6HS89wm4ryoWjk/PKprPH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

this series adapts the platform drivers below drivers/iommu to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

After the first patch all drivers return zero unconditionally in their
.remove() callback, then the remaining patches convert to .remove_new()
without side effects.

There is only a single interdependency (namely patch #4 depends on #1).
If there are concerns for individual patches[1], please still apply the
others. Then I'd only care for the actual change requests and don't need
to resend the other unchanged patches at a later point in time.

Thanks
Uwe

[1] I don't expect something more tragic than "You picked the wrong
subject prefix" or similar.

Uwe Kleine-König (10):
  iommu/arm-smmu: Drop if with an always false condition
  iommu/apple-dart: Convert to platform remove callback returning void
  iommu/arm-smmu-v3: Convert to platform remove callback returning void
  iommu/arm-smmu: Convert to platform remove callback returning void
  iommu/ipmmu-vmsa: Convert to platform remove callback returning void
  iommu/msm: Convert to platform remove callback returning void
  iommu/mtk: Convert to platform remove callback returning void
  iommu/mtk_iommu_v1: Convert to platform remove callback returning void
  iommu/omap: Convert to platform remove callback returning void
  iommu/sprd: Convert to platform remove callback returning void

 drivers/iommu/apple-dart.c                  |  6 ++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  6 ++----
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 12 ++----------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 12 ++++--------
 drivers/iommu/ipmmu-vmsa.c                  |  6 ++----
 drivers/iommu/msm_iommu.c                   |  5 ++---
 drivers/iommu/mtk_iommu.c                   |  5 ++---
 drivers/iommu/mtk_iommu_v1.c                |  5 ++---
 drivers/iommu/omap-iommu.c                  |  5 ++---
 drivers/iommu/sprd-iommu.c                  |  6 ++----
 10 files changed, 22 insertions(+), 46 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

