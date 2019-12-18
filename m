Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B63011247FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 14:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfLRNWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 08:22:41 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26699 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726969AbfLRNWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 08:22:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576675360; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=gJteFETaOrkhNWBbzpOZWWr+q40zt1FuW5gOqxEFqQM=; b=TZSjbtrHeJniXdjldojlqdNslVDS68OtYiO51S81Vn9ftogitWtNFxEJ46e90MN7YmET9XW6
 bF1Vxr2ye65Upwjqur54vKMg5seGp1SErKBtoHEEWqRqaIGqLXc7H483dnrIipUtuFk4L1Uu
 JT98BFYBqa/M+YPkT4zNhQ10n50=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa2818.7f0ba9d43848-smtp-out-n01;
 Wed, 18 Dec 2019 13:22:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1F196C4479D; Wed, 18 Dec 2019 13:22:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E683C433A2;
        Wed, 18 Dec 2019 13:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E683C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/5] Add the missing remoteprocs on MSM8998
Date:   Wed, 18 Dec 2019 18:52:12 +0530
Message-Id: <20191218132217.28141-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for booting the Audio, Modem and Sensor
DSPs found in Qualcomm's MSM8998 SoCs.

Patch 5: arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI
depends on RPM_SMD_XO_CLK_SRC

V2:
 * split the series according to SoC
 * gpu reserved memory size is now updated
 * addressed review comments from Jeff

Sibi Sankar (5):
  remoteproc: q6v5-mss: Remove mem clk from the active pool
  dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998
    SoC
  remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
  arm64: dts: qcom: msm8998: Update reserved memory map
  arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes

 .../bindings/remoteproc/qcom,adsp.txt         |   7 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |   8 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 194 +++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   1 -
 drivers/remoteproc/qcom_q6v5_pas.c            |  32 +++
 5 files changed, 230 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
