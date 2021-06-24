Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4D13B3741
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhFXTu4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:50:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:29608 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhFXTuz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:50:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624564116; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=dAmWmzn0x+M8PmSkuZPubu/ZpTlUaHsBkoAiJdj5hl0=; b=IfxBUa47AwWHUFJUiqEQtvYftIFTZT59ZCUL4yBPeBjCLizqLEj+CpbU1+o92fZTXbElh2V+
 J2b3rvxBY0miaYR9q14w6bvkL6lxgFoeAhoFdiNFrUqzlMsVRjhv605vxK/078tEdxjjuXue
 B9zPOixvYB8nr/fovG0sxjpX8hE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60d4e1827e5ba0fdc0a094c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 19:48:18
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E70B0C4338A; Thu, 24 Jun 2021 19:48:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 14274C4338A;
        Thu, 24 Jun 2021 19:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14274C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/9] Add Modem support on SC7280 SoCs
Date:   Fri, 25 Jun 2021 01:17:29 +0530
Message-Id: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for booting the Modem Q6 DSP found on
Qualcomm's SC7280 SoCs.

Sibi Sankar (9):
  dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS support
  remoteproc: qcom: pas: Add SC7280 Modem support
  dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding
  iommu/arm-smmu-qcom: Request direct mapping for modem device
  remoteproc: mss: q6v5-mss: Add modem support on SC7280
  arm64: dts: qcom: sc7280: Update reserved memory map
  arm64: dts: qcom: sc7280: Add nodes to boot modem
  arm64: dts: qcom: sc7280: Add Q6V5 MSS node
  arm64: dts: qcom: sc7280: Update Q6V5 MSS node

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   6 +
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  32 ++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  59 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 107 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 245 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   1 +
 7 files changed, 445 insertions(+), 6 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

