Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A12C39E0C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 17:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFGPmV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 11:42:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26083 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhFGPmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 11:42:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623080429; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=64r24yEhGGQ+dTqb1abtZSvbz6qcbB+fRIjh6n4L4r8=; b=Ftoi+sEnW2sZ7Xo5R+aTlBjPkTQwLoL7vPeUgQK7BkN1vICMbzhVyIJYlV+erkFPtgBd4nPm
 azuK7PCu26KanASbqM/xdII/GsSAXZ2cPYySvWAWt0SOnRc82X/RzCQtX7a21hUJywuJXQlJ
 C/vOFcbtCvjffB7Anms4+vvWpcc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60be3dd0f726fa4188cf30e1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 15:40:00
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D4CFC43146; Mon,  7 Jun 2021 15:40:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19791C433D3;
        Mon,  7 Jun 2021 15:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19791C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, swboyd@chromium.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 00/13] Use qmp_send to update co-processor load state
Date:   Mon,  7 Jun 2021 21:09:19 +0530
Message-Id: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
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
Previous dicussion on dropping power-domain support from AOSS QMP driver

Depends on:
qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1620320818-2206-1-git-send-email-deesin@codeaurora.org/
rproc,adsp_yaml: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210603142639.8335-1-s-anna@ti.com/

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
  dt-bindings: soc: qcom: aoss: Drop power-domain bindings
  dt-bindings: remoteproc: qcom: pas: Add QMP bindings
  dt-bindings: remoteproc: qcom: Add QMP bindings
  remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state
  arm64: dts: qcom: sc7180: Use QMP binding to control load state
  arm64: dts: qcom: sc7280: Use QMP binding to control load state
  arm64: dts: qcom: sdm845: Use QMP binding to control load state
  arm64: dts: qcom: sm8150: Use QMP binding to control load state
  arm64: dts: qcom: sm8250: Use QMP binding to control load state
  arm64: dts: qcom: sm8350: Use QMP binding to control load state
  soc: qcom: aoss: Drop power domain support
  dt-bindings: msm/dp: Remove aoss-qmp header
  dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions

 .../bindings/display/msm/dp-controller.yaml        |   1 -
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  40 +++++---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   7 +-
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  16 +--
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   8 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  28 +++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  22 ++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  30 +++---
 drivers/remoteproc/qcom_q6v5.c                     |  56 ++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |   7 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   7 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |  44 ++-------
 drivers/remoteproc/qcom_q6v5_pas.c                 |  80 ++++-----------
 drivers/remoteproc/qcom_q6v5_wcss.c                |   4 +-
 drivers/soc/qcom/qcom_aoss.c                       | 109 +--------------------
 include/dt-bindings/power/qcom-aoss-qmp.h          |  14 ---
 18 files changed, 181 insertions(+), 303 deletions(-)
 delete mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

