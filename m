Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1AF40DC05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 16:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236822AbhIPOBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 10:01:34 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12485 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbhIPOBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 10:01:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631800812; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1HDw1GuWcm7V54NtvtVtUQalQsKuCbF2MK5RGacuHOU=; b=nY0L+1zAj3XMjOba6g8AmO31IoW5rn1R+UorJUPs4FPVrCHwgsN0g8ZrCNPnV5jJPf0Gql8W
 N7ZTtJaxGTXq+T74C2eIDmD4qhgSNtkro3gNvHolr/ex433S50EzmDFM4cHrbImd/zTqKRIF
 6x6Wz7knKAgaysR5XiQw6tG8VZ8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61434dd2c1b30e2f02b133d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 13:59:46
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C29AC4360C; Thu, 16 Sep 2021 13:59:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA928C4338F;
        Thu, 16 Sep 2021 13:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BA928C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v7 00/13] Use qmp_send to update co-processor load state
Date:   Thu, 16 Sep 2021 19:29:17 +0530
Message-Id: <1631800770-371-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The power domains exposed by the AOSS QMP driver control the load state
resources linked to modem, adsp, cdsp remoteprocs. These are used to
notify the Always on Subsystem (AOSS) that a particular co-processor is
up/down. AOSS uses this information to wait for the co-processors to
suspend before starting its sleep sequence. These co-processors enter
low-power modes independent to that of the application processor and
the load state resources linked to them are expected to remain unaltered
across system suspend/resume cycles. To achieve this behavior let's stop
modeling them as power-domains and replace them with generic qmp_send
interface instead.

https://lore.kernel.org/lkml/20200913034603.GV3715@yoga/
Previous discussion on dropping power-domain support from AOSS QMP driver

Depends on:
qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1630420228-31075-1-git-send-email-deesin@codeaurora.org/

V7:
 * Set "qcom,qmp" property to false for unsupported devices (patch 2). [Rob]
 * Let's not miss adding qcom,qmp to ADSP/CDSP on SDM845 SoC.

V6:
 * Updated commit message to explain binding breakage (patch 2). [Stephen]

V5:
 * Fixup power-domain count (patch 2). [Matthias]
 * Add WARN_ON on truncation, remove redundant initialization
   code, use dev_err_probe (patch 4). [Stephen]
 * Use devm_kstrdup, handle kstrdup failure due to
   no memory and set qmp to NULL when not available
   (patch 4). [Bjorn]

V4:
 * Rebase patch 1 due to the aoss-qmp yaml conversion (Dropping Rb).
 * Commit message change and sc8180x co-processor addition
   to patch 2. [Rob/Bjorn]
 * Drop unused pdev and kfree the load state string in q6v5_deinit
   /probe path for patch 4. [Matthias]
 * Replaced "binding" with "property" across the series. [Matthias]
 * Commit message change and drop incorrect cleanup on cooling
   device probe failures. [Matthias]

V3:
 * Misc. documentation fixes [patch 2]:
  - Reduce power-domain maxItems due to load_state pd removal
  - Combine compatibles where possible with the load_state pd removal
  - Fixup the qcom,qmp ref to phandle type

V2:
 * load_state is currently broken on mainline so be safely dropped
   without side-effects.
 * Rebased on top of qmp_send v3 series.
 * Dropped R-b from Stephen and Rob on patch 3 due to the yaml
   conversion.
 * New patch [12] to drop unused aoss-qmp header.
 * Commit message update [patch 1] [Rob]
 * Reorder the series [Stephen]

Sibi Sankar (13):
  dt-bindings: soc: qcom: aoss: Drop the load state power-domain
  dt-bindings: remoteproc: qcom: pas: Add QMP property
  dt-bindings: remoteproc: qcom: Add QMP property
  remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state
  arm64: dts: qcom: sc7180: Use QMP property to control load state
  arm64: dts: qcom: sc7280: Use QMP property to control load state
  arm64: dts: qcom: sdm845: Use QMP property to control load state
  arm64: dts: qcom: sm8150: Use QMP property to control load state
  arm64: dts: qcom: sm8250: Use QMP property to control load state
  arm64: dts: qcom: sm8350: Use QMP property to control load state
  soc: qcom: aoss: Drop power domain support
  dt-bindings: msm/dp: Remove aoss-qmp header
  dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions

 .../bindings/display/msm/dp-controller.yaml        |   1 -
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  54 +++++-----
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   7 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |  11 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  12 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  28 ++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  22 ++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  30 +++---
 drivers/remoteproc/qcom_q6v5.c                     |  57 ++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |   7 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   7 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  44 ++------
 drivers/remoteproc/qcom_q6v5_pas.c                 | 113 ++++++++-------------
 drivers/remoteproc/qcom_q6v5_wcss.c                |   4 +-
 drivers/soc/qcom/qcom_aoss.c                       | 107 -------------------
 include/dt-bindings/power/qcom-aoss-qmp.h          |  14 ---
 18 files changed, 206 insertions(+), 323 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

