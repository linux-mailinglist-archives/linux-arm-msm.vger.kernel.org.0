Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DB23F11CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 05:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236481AbhHSDhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 23:37:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17277 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236448AbhHSDhS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 23:37:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629344202; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BRlKnvIszGeVtgYU6QZFP1RjVcH510IRHsfahZ/MSvw=; b=saK2uFpuYWySo5tKPlFEGAAq/ZjhIIhOfFsCatbJsIE1nVbb7Clny/KIikP6qbHGvLItGRIa
 pxiBOwAdtchtkAStBhaxGUsk6sTpfYubBOKshW0XQP2nrC7v/tzPPJRXOts1nWXh0af1JRDR
 kCDDmWzayu4YoLAgzzJNWVtJgG0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 611dd1c9454b7a558f80f29b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 03:36:41
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E1EFC4361A; Thu, 19 Aug 2021 03:36:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4535C4338F;
        Thu, 19 Aug 2021 03:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D4535C4338F
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
Subject: [PATCH v3 00/10] Add Modem support on SC7280 SoCs
Date:   Thu, 19 Aug 2021 09:06:15 +0530
Message-Id: <1629344185-27368-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for booting the Modem Q6 DSP found on
Qualcomm's SC7280 SoCs.

Depends on:
qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1629113954-14084-1-git-send-email-deesin@codeaurora.org/
rproc qmp: https://patchwork.kernel.org/project/linux-arm-msm/cover/1629342136-3667-1-git-send-email-sibis@codeaurora.org/

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

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   6 +
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  32 ++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  59 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 107 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 252 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   1 +
 7 files changed, 452 insertions(+), 6 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

