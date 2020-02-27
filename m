Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D446171561
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 11:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgB0K4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 05:56:48 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17149 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728744AbgB0K4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 05:56:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582801007; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Cw0CW6iCAIbZGkzVU91jLfCC2FwoX1zIJun9pAYPr3I=; b=NVw9q6+OL/lpWJn71g2OdhFe4jyEKgnWDNUuOnsdsZ9SOxM4wlOrJNqx4JvKdmwlV+RMGjPK
 QA84EbjvwVOqbLRxHMQsaLv6mQrlOkqhAvhq8+t+6J9Ur3h4xXfXXDkxVJs2UncHex9IMRhI
 QjopyZSZMyo7/5vf91Upfe7tSw0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57a06f.7f951fd74570-smtp-out-n01;
 Thu, 27 Feb 2020 10:56:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 829A6C447A0; Thu, 27 Feb 2020 10:56:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 29AFFC43383;
        Thu, 27 Feb 2020 10:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29AFFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        saravanak@google.com, viresh.kumar@linaro.org,
        okukatla@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 0/7] Add OSM L3 Interconnect Provider
Date:   Thu, 27 Feb 2020 16:26:24 +0530
Message-Id: <20200227105632.15041-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series aims to add Operating State Manager (OSM) L3
interconnect provider support on SDM845 and SC7180 SoCs to handle
bandwidth requests from CPU to scale L3 caches.

V5:
 * addressed misc review comments from Georgi
 * allow icc node ids to be used across multiple providers
 * picked up Rob's R-b and Ack

V4:
 * add SC7180 support
 * use icc_std_aggregate
 * use icc_nodes_remove
 * fixup Evan's review comments.

v3:
 * switched the dt-bindings to dual-license
 * rebased to linux-next

v2:
 * addressed review comments from Evan
 * dropped unused gpu icc node on SDM845 SoC

Depends on:
SDM845 icc refactor: https://patchwork.kernel.org/cover/11372211/
SC7180 icc support: https://patchwork.kernel.org/cover/11404167/

Sibi Sankar (7):
  interconnect: qcom: Allow icc node to be used across icc providers
  dt-bindings: interconnect: Add OSM L3 DT bindings
  interconnect: qcom: Add OSM L3 interconnect provider support
  dt-bindings: interconnect: Add OSM L3 DT binding on SC7180
  interconnect: qcom: Add OSM L3 support on SC7180
  arm64: dts: qcom: sdm845: Add OSM L3 interconnect provider
  arm64: dts: qcom: sc7180: Add OSM L3 interconnect provider

 .../bindings/interconnect/qcom,osm-l3.yaml    |  62 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  11 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  11 +
 drivers/interconnect/qcom/Kconfig             |   7 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/osm-l3.c            | 276 ++++++++++++++++++
 drivers/interconnect/qcom/sc7180.h            |   2 +
 drivers/interconnect/qcom/sdm845.c            | 134 +--------
 drivers/interconnect/qcom/sdm845.h            | 142 +++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    |  12 +
 10 files changed, 526 insertions(+), 133 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 drivers/interconnect/qcom/osm-l3.c
 create mode 100644 drivers/interconnect/qcom/sdm845.h
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
