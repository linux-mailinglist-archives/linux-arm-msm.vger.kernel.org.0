Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD84E40F9AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 15:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242191AbhIQN5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 09:57:39 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36747 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241306AbhIQN5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 09:57:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631886973; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JBVHCkLtM4/xMQKfljMOWqvD4lNbxvM3MaLwQGSzXBA=; b=QyFpymuLgwFPxoT4MQnqjre6ZXWw2emxYopMTXBxwRHN/OS+l40/cmJu+XkyjOZfBToFbeHE
 1ZnjZsBBe+u1/3AcNSxmcUR44r1lSBO3RrsZbZhQskOC4MJxQajmWvRke8gCcKiXzY9lyFAX
 irx75Eu86TfKWFVf3sqypIt1WyU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61449e67e0f78151d6bbf6da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 13:55:51
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11C6BC4338F; Fri, 17 Sep 2021 13:55:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0994C4338F;
        Fri, 17 Sep 2021 13:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F0994C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, swboyd@chromium.org,
        mka@chromium.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 00/10] Add Modem support on SC7280 SoCs
Date:   Fri, 17 Sep 2021 19:25:25 +0530
Message-Id: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for booting the Modem Q6 DSP found on
Qualcomm's SC7280 SoCs.

Depends on:
qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1630420228-31075-1-git-send-email-deesin@codeaurora.org/
rproc qmp: https://patchwork.kernel.org/project/linux-arm-msm/cover/1631800770-371-1-git-send-email-sibis@codeaurora.org/

V5:
 * Rebased to linux-next and picked up Rbs.
 * Add pka to the clock list to boot secure modem devices.

V4:
 * Rebased to linux-next and picked up Rbs.
 * Fixed typo (patch 10).

V3:
 * Keep the memory map version in commit message (patch 6). [Bjorn]
 * Rename tcsr node and add qualifying compatibles to tcsr and imem nodes
   (patch 8). [Bjorn]
 * Place remoteproc_mpss node in alphabetical order above pinctrl
   section (patch 10). [Stephen]

V2:
 * Misc. typos (patch 3). [Matthias]
 * Document the q-channel takedown procedure (patch 5). [Matthias]
 * Split reserved memory updates between SoC and platform (patch 6). [Matthias]

Sibi Sankar (10):
  dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS support
  remoteproc: qcom: pas: Add SC7280 Modem support
  dt-bindings: remoteproc: qcom: Update Q6V5 Modem PIL binding
  iommu/arm-smmu-qcom: Request direct mapping for modem device
  remoteproc: mss: q6v5-mss: Add modem support on SC7280
  arm64: dts: qcom: sc7280: Update reserved memory map
  arm64: dts: qcom: sc7280: Add/Delete/Update reserved memory nodes
  arm64: dts: qcom: sc7280: Add nodes to boot modem
  arm64: dts: qcom: sc7280: Add Q6V5 MSS node
  arm64: dts: qcom: sc7280: Update Q6V5 MSS node

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   5 +
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  32 ++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  59 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 107 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 253 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   1 +
 7 files changed, 452 insertions(+), 6 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

