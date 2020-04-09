Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A93D1A3367
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 13:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgDILoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 07:44:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:12026 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726622AbgDILoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 07:44:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586432648; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=TXEhcyucuYKWLJsGT3T9vXlvyVf4FPT2niPKR6PH99s=; b=EA4AfruyWoUSVDE3tSgwkB3RnW535GO2XAjvP5jNU3RVftOGrCupNZFuxyE/PjIDERymlc9N
 9MLVCpHPse2R+6KdxHJOBibhJkzU0vEmHDY4c33UGFV7czC+ZIefV/Xzhsd7oCYz6EsMMPzR
 93r/wB2qKYtc/LOfl2f6RBVyT2Q=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8f0a77.7f02fd888d18-smtp-out-n02;
 Thu, 09 Apr 2020 11:43:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 338F6C4478F; Thu,  9 Apr 2020 11:43:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0766BC433D2;
        Thu,  9 Apr 2020 11:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0766BC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 0/3] Add coresight support for QCOM SC7180 SoC
Date:   Thu,  9 Apr 2020 17:13:35 +0530
Message-Id: <cover.1586263250.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Patch 1 adds the ETM UCI IDs for Kryo 4XX CPU cores.
Patch 2 adds the DT nodes for coresight components on SC7180.
Patch 3 replaces ETM PIDs with UCI IDs for Kryo385 CPUs on SDM845.

v2:
 * Placed the DT properties for ports in one line as suggested by Stephen.
 * Add UCI IDs for SC7180 and SDM845(Kryo385 CPUs) as suggested by Suzuki.

Sai Prakash Ranjan (3):
  coresight: etm4x: Add support for Qualcomm SC7180 SoC
  arm64: dts: qcom: sc7180: Add Coresight support
  coresight: etm4x: Replace ETM PIDs with UCI IDs for Kryo385

 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 471 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etm4x.c |   6 +-
 2 files changed, 475 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
