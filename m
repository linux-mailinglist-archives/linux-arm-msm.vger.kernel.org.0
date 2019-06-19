Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 884714B01B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 04:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfFSCcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 22:32:13 -0400
Received: from onstation.org ([52.200.56.107]:35084 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfFSCcN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 22:32:13 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E4A803E916;
        Wed, 19 Jun 2019 02:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560911532;
        bh=CgLY5oLR5lb5ja9eObXPqJkD6mFawrypxrsKG6eRDBw=;
        h=From:To:Cc:Subject:Date:From;
        b=TFWXNjZNLhbD5D5xvTYPsg936DgaLeNPI5FE11ly6KUE14fMvGdlAWBa7pbizHT9y
         7WXus2cabxrqFyBQXWBvblmok7bCoDhqyes6aR+QpMuRxypXdHDb/9l+HxCUwQrTL8
         1F2GECRTv+2XK8e/yMephrrlEw0vXUtydCi7UOSc=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] qcom: add OCMEM support
Date:   Tue, 18 Jun 2019 22:32:03 -0400
Message-Id: <20190619023209.10036-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
that is needed in order to support some A3xx and A4xx based GPUs
upstream. This is based on Rob Clark's patch series that he submitted
in October 2015 and I am resubmitting updated patches with his
permission. See the individual patches for the changelog.

This was tested with the GPU on a LG Nexus 5 (hammerhead) phone and
this will work on other msm8974-based systems. For a summary of what
currently works upstream on the Nexus 5, see my status page at
https://masneyb.github.io/nexus-5-upstream/.

Brian Masney (4):
  dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
  dt-bindings: display: msm: gmu: add optional ocmem property
  soc: qcom: add OCMEM driver
  drm/msm/gpu: add ocmem init/cleanup functions

Rob Clark (2):
  firmware: qcom: scm: add OCMEM lock/unlock interface
  firmware: qcom: scm: add support to restore secure config to
    qcm_scm-32

 .../devicetree/bindings/display/msm/gmu.txt   |   4 +
 .../bindings/sram/qcom/qcom,ocmem.yaml        |  64 +++
 drivers/firmware/qcom_scm-32.c                |  52 ++-
 drivers/firmware/qcom_scm-64.c                |  12 +
 drivers/firmware/qcom_scm.c                   |  53 +++
 drivers/firmware/qcom_scm.h                   |   9 +
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  33 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h         |   3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  30 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h         |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  36 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  10 +
 drivers/soc/qcom/Kconfig                      |  10 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/ocmem.c                      | 433 ++++++++++++++++++
 include/linux/qcom_scm.h                      |  26 ++
 include/soc/qcom/ocmem.h                      |  62 +++
 18 files changed, 795 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/qcom/qcom,ocmem.yaml
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 include/soc/qcom/ocmem.h

-- 
2.20.1

