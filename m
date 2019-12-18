Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0E1124C78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 17:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfLRQGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 11:06:21 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:63168 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727121AbfLRQGV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 11:06:21 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Dec 2019 21:36:17 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Dec 2019 21:35:48 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id A895E3C50; Wed, 18 Dec 2019 21:35:46 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V4 00/10] remoteproc: qcom: q6v5-wcss: Add support for secure pil
Date:   Wed, 18 Dec 2019 21:35:36 +0530
Message-Id: <1576685146-17135-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 needs support for secure pil as well.
Also, currently only unified firmware is supported.
IPQ8074 supports split firmware for q6 and m3, so
adding support for that.

This series is based on Govind's
"[v5] Add non PAS wcss Q6 support for QCS404"

changes since v3:
 - In patch 10, Added release_firmware to free up
   memory requested for m3 firmware.

changes since v2:
 - In patch 5, Added a driver data 'bcr_reset_required'
   to select if bcr reset is required
 - In patch 10, Removed syscon implementation and moved
   to mailbox framework to access APCS IPC

changes since v1:
 - In patch 10, Addressed minor review comments.

Gokul Sriram Palanisamy (10):
  remoteproc: qcom: Add PRNG proxy clock
  remoteproc: qcom: Add secure PIL support
  remoteproc: qcom: Add support for split q6 + m3 wlan firmware
  remoteproc: qcom: Add ssr subdevice identifier
  remoteproc: qcom: Update regmap offsets for halt register
  dt-bindings: clock: qcom: Add reset for WCSSAON
  clk: qcom: Add WCSSAON reset
  dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
  arm64: dts: Add support for scm on IPQ8074 SoCs
  arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC

 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 127 +++++++++++++++++
 drivers/clk/qcom/gcc-ipq8074.c                     |   1 +
 drivers/remoteproc/qcom_q6v5_wcss.c                | 157 +++++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   1 +
 5 files changed, 258 insertions(+), 29 deletions(-)

-- 
1.9.1

