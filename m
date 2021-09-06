Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB624017C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 10:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240742AbhIFIZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 04:25:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44479 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240730AbhIFIZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 04:25:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630916652; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EvV4dfy4I8iR55oWtbuMC4EISY7EwSUf8/sJpTChJdQ=; b=pGojqTdoMrwVqPQeWOv3pt5KvA4jAi7Oz8xY3mJFsSgUwr2PQ1tpoeMqsS9IoVnw3w14pK6b
 DLHyhiUxvmfwP2ICI/z17usTODzV0vkDauRVSGEwFcaj723iweksEyoFsRDJXARm4g9kiwep
 tKPzKZXFtsZqX0FRwOdmj7TeIy4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6135d02a40d2129ac10b94dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 06 Sep 2021 08:24:10
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64F2AC43460; Mon,  6 Sep 2021 08:24:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DEDD6C4338F;
        Mon,  6 Sep 2021 08:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DEDD6C4338F
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
Subject: [PATCH v6 00/13] Use qmp_send to update co-processor load state
Date:   Mon,  6 Sep 2021 13:53:44 +0530
Message-Id: <1630916637-4278-1-git-send-email-sibis@codeaurora.org>
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
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  61 ++++++------
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   7 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |  11 +--
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   8 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  28 +++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  22 ++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  30 +++---
 drivers/remoteproc/qcom_q6v5.c                     |  57 ++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |   7 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   7 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  44 ++-------
 drivers/remoteproc/qcom_q6v5_pas.c                 |  85 ++++------------
 drivers/remoteproc/qcom_q6v5_wcss.c                |   4 +-
 drivers/soc/qcom/qcom_aoss.c                       | 107 ---------------------
 include/dt-bindings/power/qcom-aoss-qmp.h          |  14 ---
 18 files changed, 183 insertions(+), 321 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

