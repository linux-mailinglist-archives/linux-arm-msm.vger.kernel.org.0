Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 883E5996E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 16:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731033AbfHVOh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 10:37:27 -0400
Received: from onstation.org ([52.200.56.107]:46764 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729731AbfHVOh0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 10:37:26 -0400
Received: from ins7386.localdomain (unknown [207.110.43.92])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 50C6F3E8A5;
        Thu, 22 Aug 2019 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1566484646;
        bh=t6TP/PN3jeU5M3ONQYp1VGGuOKetsTewE0YXyKvmcNg=;
        h=From:To:Cc:Subject:Date:From;
        b=rMJkgk0v/7E+UXNxanhygtbLA3/xPZcasXZyYflUk1Ew5ryK8QGcQsOTFqwhLB08r
         fEHi2aWzztbdf36E9FYl3Sz6uVeuOkrY2fQi/xnkom8/1bw7rZ0GIGwp5uFESDnGO6
         QJjKagQ3mCgBIC6vL4eCKPZcJoR07bN7vmjrdxrA=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v6 0/7] qcom: add OCMEM support
Date:   Thu, 22 Aug 2019 07:36:56 -0700
Message-Id: <20190822143703.13030-1-masneyb@onstation.org>
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

Changes since v5:
- Rename ocmem device tree property to sram

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

 .../devicetree/bindings/display/msm/gmu.txt   |  50 ++
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
 19 files changed, 870 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 include/soc/qcom/ocmem.h

-- 
2.21.0

