Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6169AF09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 14:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390079AbfHWMQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 08:16:51 -0400
Received: from onstation.org ([52.200.56.107]:50720 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387637AbfHWMQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 08:16:51 -0400
Received: from localhost.localdomain (wsip-184-191-162-253.sd.sd.cox.net [184.191.162.253])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B5FEB3E83A;
        Fri, 23 Aug 2019 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1566562610;
        bh=eh6YeVR/aaRQNy0BfSesizLKEGUOODPOyckdT4m9Imk=;
        h=From:To:Cc:Subject:Date:From;
        b=j+jFpA5dm8HNQPPS6RDTSJGMa2v6pL8IZuN0d/WDqF0vpib3TTBvrwAd/SWd0ynsI
         AZQSp3DLmHdo4EA5Wz6xya3DkGu31B5rttiRE4YhsOhRZualg9mChcRFkRrPkI+fdr
         4Yu0F/g+nstdUJFxyEqzR/9w+M6tnc+9KJ2zRDzM=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v7 0/7] qcom: add OCMEM support
Date:   Fri, 23 Aug 2019 05:16:30 -0700
Message-Id: <20190823121637.5861-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
that is needed in order to support some a3xx and a4xx-based GPUs
upstream. This is based on Rob Clark's patch series that he submitted
in October 2015 and I am resubmitting updated patches with his
permission. See the individual patches for the changelog.

This was tested with the GPU on a LG Nexus 5 (hammerhead) phone and
this will work on other msm8974-based systems. For a summary of what
currently works upstream on the Nexus 5, see my status page at
https://masneyb.github.io/nexus-5-upstream/.

Changes since v6:
- link to gmu-sram child node in device tree
- add ranges property to ocmem example in adreno GMU example (patch 2)
  to match bindings in patch 1

See individual patches for changelogs for previous versions.

Brian Masney (5):
  dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
  dt-bindings: display: msm: gmu: add optional ocmem property
  soc: qcom: add OCMEM driver
  drm/msm/gpu: add ocmem init/cleanup functions
  ARM: qcom_defconfig: add ocmem support

Rob Clark (2):
  firmware: qcom: scm: add OCMEM lock/unlock interface
  firmware: qcom: scm: add support to restore secure config to
    qcm_scm-32

 .../devicetree/bindings/display/msm/gmu.txt   |  51 +++
 .../devicetree/bindings/sram/qcom,ocmem.yaml  |  96 ++++
 arch/arm/configs/qcom_defconfig               |   1 +
 drivers/firmware/qcom_scm-32.c                |  52 ++-
 drivers/firmware/qcom_scm-64.c                |  12 +
 drivers/firmware/qcom_scm.c                   |  53 +++
 drivers/firmware/qcom_scm.h                   |   9 +
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  28 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h         |   3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  25 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h         |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  40 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  10 +
 drivers/soc/qcom/Kconfig                      |  10 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/ocmem.c                      | 433 ++++++++++++++++++
 include/linux/qcom_scm.h                      |  26 ++
 include/soc/qcom/ocmem.h                      |  62 +++
 19 files changed, 871 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 include/soc/qcom/ocmem.h

-- 
2.21.0

