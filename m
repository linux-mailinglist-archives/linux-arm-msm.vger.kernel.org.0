Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C17136245
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 22:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbgAIVMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 16:12:41 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:36555 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbgAIVMl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 16:12:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578604360; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=tEJ8JSL6q32I9DCAuXKbYdNVju0RtbClGyS7FaRbbKc=; b=O1GERyEeZ5f5fEDiHS/mONK+wN6axX/rN5sXhtt1OLa7mqt8b11FoTrSLK57WXwSM8ELE8Pj
 JeVfRTjR44A1kfbvoNBBDpy1kxWxksiTK5WKZ+S5lO/geA2f3tUv3KvE011KHkYwYO3FAsu+
 EUyY8L7EGlCzBr1kPbH+EwCB7bk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e179742.7fc93bbe7998-smtp-out-n02;
 Thu, 09 Jan 2020 21:12:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F50BC447A3; Thu,  9 Jan 2020 21:12:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C58B4C43383;
        Thu,  9 Jan 2020 21:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C58B4C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/4] Add OSM L3 Interconnect Provider
Date:   Fri, 10 Jan 2020 02:42:11 +0530
Message-Id: <20200109211215.18930-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series aims to add Operating State Manager (OSM) L3
interconnect provider support on SDM845 and SC7180 SoCs to handle
bandwidth requests from CPU to scale L3 caches.

V4:
 * add SC7180 support
 * use icc_std_aggregate
 * use icc_nodes_remove
 * Fixup Evan's review comments.

v3:
 * switched the dt-bindings to dual-license
 * Rebased to linux-next

v2:
 * addressed review comments from Evan
 * dropped unused gpu icc node on SDM845 SoC

Sibi Sankar (4):
  dt-bindings: interconnect: Add OSM L3 DT bindings
  interconnect: qcom: Add OSM L3 interconnect provider support
  dt-bindings: interconnect: Add OSM L3 DT binding on SC7180
  interconnect: qcom: Add OSM L3 support on SC7180

 .../bindings/interconnect/qcom,osm-l3.yaml    |  62 ++++
 drivers/interconnect/qcom/Kconfig             |   7 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/osm-l3.c            | 287 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    |  12 +
 5 files changed, 370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 drivers/interconnect/qcom/osm-l3.c
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
