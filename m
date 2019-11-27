Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091A810B1FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 16:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfK0PNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 10:13:40 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:48549 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726984AbfK0PNj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 10:13:39 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 20:43:26 +0530
IronPort-SDR: TBDIG8QCNINKvfLYpl7YyUHweQDAMQ2q6LZm121XaczWWIG0n/IJ6f46xy2AMHpKypxGECzjsZ
 ix96RPGnQb5BSVyWo+OrIL9b2ni3R2qyfjpC3R/zHakx9/y72sDfN3F/5Iphsg72+px+eN949+
 h4eXNveQnWh8VnszGzH4N051jLOBLH5qcCfXVxzKMpyVZpJyjSv1Hb7fgrjzc3WXUFNOInFX8a
 x0Cy8D11sAVP5hA0v/h8YIhpYUuia68Vy6IVcCyyAelD8z7CxFRAWAXff2miEY+nUjfXTtkrRe
 hyggDBMbwL0/4RGMqhR0QBu0
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Nov 2019 20:42:56 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 313B53985; Wed, 27 Nov 2019 20:42:55 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V3 00/10] remoteproc: qcom: q6v5-wcss: Add support for secure pil
Date:   Wed, 27 Nov 2019 20:42:44 +0530
Message-Id: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
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
“[v5] Add non PAS wcss Q6 support for QCS404”
https://patchwork.kernel.org/cover/11060629/

[V3] Fixed all comments.

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
 drivers/remoteproc/qcom_q6v5_wcss.c                | 155 ++++++++++++++++-----
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   1 +
 5 files changed, 254 insertions(+), 31 deletions(-)

-- 
1.9.1

