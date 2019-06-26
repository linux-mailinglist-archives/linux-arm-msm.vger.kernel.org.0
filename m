Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42A4D55E5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 04:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbfFZCWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 22:22:05 -0400
Received: from onstation.org ([52.200.56.107]:46072 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbfFZCWF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 22:22:05 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id BE7C03E887;
        Wed, 26 Jun 2019 02:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561515724;
        bh=6wTPy9KKBizKnrnUdUtaxPyNqun7HU3CFL9ZBYn8eao=;
        h=From:To:Cc:Subject:Date:From;
        b=vjDl/c5rDxt9/iXgEfyHgGFUd4hclgr5iKX9dqRsko7AYdv5rS5SfORMqoIhPIJNX
         yhNUD0sPAdBvrfFsLJaFFN1eIS2U62QfBhjMgFhdozVqifGycrWEwn1TqF5VIVgsoJ
         Gk3dy0Ndiq6iePQi2whkM7NVmsJfrJpVZC2Va/0c=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v3 0/6] qcom: add OCMEM support
Date:   Tue, 25 Jun 2019 22:21:42 -0400
Message-Id: <20190626022148.23712-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
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

Brian Masney (4):
  dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
  dt-bindings: display: msm: gmu: add optional ocmem property
  soc: qcom: add OCMEM driver
  drm/msm/gpu: add ocmem init/cleanup functions

Rob Clark (2):
  firmware: qcom: scm: add OCMEM lock/unlock interface
  firmware: qcom: scm: add support to restore secure config to
    qcm_scm-32

 .../devicetree/bindings/display/msm/gmu.txt   |  50 ++
 .../bindings/sram/qcom/qcom,ocmem.yaml        |  84 ++++
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
 18 files changed, 857 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/qcom/qcom,ocmem.yaml
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 include/soc/qcom/ocmem.h

-- 
2.20.1

