Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E314F3092A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 09:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhA3I46 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 03:56:58 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20533 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhA3F3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 00:29:43 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 29 Jan 2021 21:20:30 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jan 2021 21:20:28 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jan 2021 10:50:13 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 5D1EB219E7; Sat, 30 Jan 2021 10:50:13 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v8 0/9] remoteproc: qcom: q6v5-wcss: Add support for secure pil
Date:   Sat, 30 Jan 2021 10:50:04 +0530
Message-Id: <1611984013-10201-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 needs support for secure pil as well.
Also, currently only unified firmware is supported.
IPQ8074 supports split firmware for q6 and m3, so
adding support for that.

This series is based on Govind's
"[v9] Add non PAS wcss Q6 support for QCS404"

changes since v8:
 - Rebased on top of linux-5.11-rc5

changes since v7:
 - Rebased on top of linux-5.9-rc2

changes since v6:
 - Rebased on top of the above mentioned dependant patch series

changes since v5:
 - Rebased on top of linux-5.8-rc3

changes since v4:
 - Rebased patch 8

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

Gokul Sriram Palanisamy (9):
  remoteproc: qcom: Add PRNG proxy clock
  remoteproc: qcom: Add secure PIL support
  remoteproc: qcom: Add support for split q6 + m3 wlan firmware
  remoteproc: qcom: Add ssr subdevice identifier
  remoteproc: qcom: Update regmap offsets for halt register
  dt-bindings: clock: qcom: Add reset for WCSSAON
  clk: qcom: Add WCSSAON reset
  arm64: dts: Add support for scm on IPQ8074 SoCs
  arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC

 arch/arm64/boot/dts/qcom/ipq8074.dtsi        | 127 +++++++++++++++++++++
 drivers/clk/qcom/gcc-ipq8074.c               |   1 +
 drivers/remoteproc/qcom_q6v5_wcss.c          | 162 +++++++++++++++++++++------
 include/dt-bindings/clock/qcom,gcc-ipq8074.h |   1 +
 4 files changed, 259 insertions(+), 32 deletions(-)

-- 
2.7.4

