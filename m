Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D447D3CF36A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 06:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245254AbhGTD5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 23:57:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19121 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346226AbhGTD5A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 23:57:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626755859; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZGzo7qtd5RMmOHJdMfl1iSfPpBIFAZ1rPzgtyoO52QI=; b=biyvBVZWhL7rVEcZv8aJzzqfIjn1niiPuCrEHl5M9ourF4S9DEQXmDzlWyVu+29N7I48G70I
 t/3+LVS/ol5u6DGBplA66y3vl2L80KNnDkGLCYPD03j0UHRC/rnHfk3yhlnp2/zBS3i4ELUi
 lLpODBDppyotXGU2oIieQuwKE5Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60f652fe56871ded7737fb8f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 04:37:18
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3C68C4360C; Tue, 20 Jul 2021 04:37:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E106C433D3;
        Tue, 20 Jul 2021 04:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E106C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 00/13] Use qmp_send to update co-processor load state
Date:   Tue, 20 Jul 2021 10:06:34 +0530
Message-Id: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
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
aoss yaml: https://patchwork.kernel.org/project/linux-arm-msm/cover/20210709174142.1274554-1-bjorn.andersson@linaro.org/
qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1623237532-20829-1-git-send-email-sibis@codeaurora.org/

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
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  65 +++++++------
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
 18 files changed, 185 insertions(+), 323 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

