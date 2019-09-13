Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48C8AB1CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 14:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388009AbfIMMDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 08:03:06 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:25811 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387896AbfIMMDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 08:03:06 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Sep 2019 17:26:39 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Sep 2019 17:26:13 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id B23C9372A; Fri, 13 Sep 2019 17:26:11 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V2 00/12] remoteproc: qcom: q6v5-wcss: Add support for secure pil
Date:   Fri, 13 Sep 2019 17:25:59 +0530
Message-Id: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 needs support for secure pil as well.
Also, currently only unified firmware is supported.
IPQ8074 supports split firmware for q6 and m3, so
adding support for that.

 Also, this series is based on Govind’s,
 “[v4] Add non PAS wcss Q6 support for QCS404”
 https://www.spinics.net/lists/linux-remoteproc/msg03612.html

[V2] Fixed all comments

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
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 132 +++++++++++++++++
 drivers/clk/qcom/gcc-ipq8074.c                     |   1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |   1 +
 drivers/remoteproc/qcom_q6v5_wcss.c                | 158 +++++++++++++++++----
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   1 +
 7 files changed, 265 insertions(+), 30 deletions(-)

-- 
1.9.1

