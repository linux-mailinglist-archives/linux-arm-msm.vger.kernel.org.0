Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03557100DEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKRVnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:43:06 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:56336
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726647AbfKRVnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113384;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=34n8pONOy4hrnY+bCnkyck81F6RCIYF9zArBzSitqyI=;
        b=KuzJXpUQ2sk43luVMgNWDhmszK8v4d1ouMsBCMkjV/x9d9JafK3aVc5GJVjn8wNK
        FZsjjS9QKoQa36doyPrGnyjDfvdidzQMiVVI1Fm/W5YvbPbsvGoJkqxAwnwl3RtdVa+
        X5cqkScNnz6MBdY5vs31dWxB/IbNh4PRkDjZJF6Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113384;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=34n8pONOy4hrnY+bCnkyck81F6RCIYF9zArBzSitqyI=;
        b=ALf+5PY/bPEzDEjkuCEpNcsN9pMKxWgKTXiyGLegjKc3u4ZpOt8iBVBf7+M9OM+r
        hLzYGo8YJlbWlcTNXvTqlVdU56cbVsRJ4WFRySwVh2vIuaa0ua4z/WYp8qa/bu0RI8u
        c6Y/qBrvlfyx7sO3njW3YPNrHbo6iPkqduvJKoaU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C95D5C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 00/16] Add missing remoteprocs on MSM8998/SC7180/SM8150 SoCs
Date:   Mon, 18 Nov 2019 21:43:04 +0000
Message-ID: <0101016e80781930-69ece8d5-deda-4950-8cfc-da44d5955ac8-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch series adds support for the following remoteprocs:
* MPSS reset sequence fixup for MSM8998 (Patches 1,2)
* MPSS on SC7180 SoCs (Patches 3,4)
* ADSP, SLPI on MSM8998 SoC (Patches 8,9)
* ADSP, CDSP, MPSS and SLPI on SM8150 SoC (Patches 10,11,12)

Patch 6,7 Adds support for active/proxy voting of power-domain
for the q6v5_pas driver.

Jeff,
Please free to drop MPSS node on MSM8998 if you already
have something prepared and replace the xo with the
rpmcc xo clock. Just included patch 14 in the series for
completeness.

This patch series depends on:
https://patchwork.kernel.org/cover/11250067/

Sibi Sankar (16):
  remoteproc: q6v5-mss: fixup MSM8998 MSS out of reset sequence
  remoteproc: q6v5-mss: Streamline the MSS out of reset sequence
  dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
  remoteproc: mss: q6v5-mss: Add modem support on SC7180
  remoteproc: qcom: pas: Disable interrupt on clock enable failure
  dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5 PAS
  remoteproc: qcom: pas: Vote for active/proxy power domains
  dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998
    SoC
  remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
  dt-bindings: remoteproc: qcom: SM8150 Add ADSP, CDSP, MPSS and SLPI
    support
  remoteproc: qcom: pas: Add SM8150 ADSP, CDSP, Modem and SLPI support
  remoteproc: qcom: pas: Add auto_boot flag
  arm64: dts: qcom: msm8998: Update reserved memory map
  arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
  arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and SLPI smp2p
  arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and SLPI remoteprocs

 .../bindings/remoteproc/qcom,adsp.txt         |  44 +++
 .../bindings/remoteproc/qcom,q6v5.txt         |  23 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |   8 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 184 +++++++++++-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts       |  12 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 231 +++++++++++++++
 drivers/remoteproc/qcom_q6v5_mss.c            | 264 +++++++++++++++---
 drivers/remoteproc/qcom_q6v5_pas.c            | 260 ++++++++++++++++-
 8 files changed, 979 insertions(+), 47 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

