Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14B5765AB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbfGKPrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:47:55 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:11122 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728904AbfGKPrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:47:53 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jul 2019 21:11:33 +0530
X-IronPort-AV: E=McAfee;i="6000,8403,9314"; a="10317406"
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2019 21:11:10 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id D6EA932C4; Thu, 11 Jul 2019 21:11:08 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 00/12] remoteproc: qcom: q6v5-wcss: Add support for secure pil
Date:   Thu, 11 Jul 2019 21:10:56 +0530
Message-Id: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 needs support for secure pil as well.
Also, currently only unified firmware is supported.
IPQ8074 supports split firmware for q6 and m3, so
adding support for that.

Gokul Sriram Palanisamy (12):
  remoteproc: qcom: Add PRNG proxy clock
  remoteproc: qcom: Add secure PIL support
  remoteproc: qcom: Add support for split q6 + m3 wlan firmware
  remoteproc: qcom: Add ssr subdevice identifier
  remoteproc: qcom: Update regmap offsets for halt register
  dt-bindings: clock: qcom: Add reset for WCSSAON
  clk: qcom: Add WCSSAON reset
  dt-bindings: mailbox: qom: Add ipq8074 APPS compatible
  mailbox: qcom: Add support for IPQ8074 APCS
  dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
  arm64: dts: Add support for scm on IPQ8074 SoCs
  arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC

 .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
 .../bindings/mailbox/qcom,apcs-kpss-global.txt     |   1 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 131 +++++++++++++++++
 drivers/clk/qcom/gcc-ipq8074.c                     |   1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   1 +
 drivers/remoteproc/qcom_q6v5_wcss.c                | 158 +++++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   1 +
 7 files changed, 264 insertions(+), 30 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

