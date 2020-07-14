Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC74721F5C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 17:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgGNPFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 11:05:39 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27943 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728687AbgGNPFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 11:05:31 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2020 08:05:29 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 14 Jul 2020 08:05:25 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id CCB2D21965; Tue, 14 Jul 2020 20:35:23 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH 0/4] Split ipq8074 reset bindings from clock bindings
Date:   Tue, 14 Jul 2020 20:35:18 +0530
Message-Id: <1594739122-29327-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch series https://lwn.net/Articles/825325/ wrongly added clock
bindings into reset bindings. This is caught by 
kernel test robot <lkp@intel.com> after it got merged into the clk-next
tree.

To avoid these kind of future mistakes it is better we split up the reset
bindings from clock bindings.

Since the clock patches in https://lwn.net/Articles/825325/ are applied to
clk-next it would be better if all the changes in this series to go through
clk-next.

Sivaprakash Murugesan (4):
  clk: qcom: ipq8074: remove gcc reset bindings
  reset: qcom: ipq8074: Add ipq8074 gcc resets
  arm64: dts: ipq8074: include reset bindings
  clk: qcom: ipq8074: include gcc reset bindings

 arch/arm64/boot/dts/qcom/ipq8074.dtsi        |   1 +
 drivers/clk/qcom/gcc-ipq8074.c               |   1 +
 include/dt-bindings/clock/qcom,gcc-ipq8074.h | 139 +-------------------------
 include/dt-bindings/reset/qcom,gcc-ipq8074.h | 141 +++++++++++++++++++++++++++
 4 files changed, 146 insertions(+), 136 deletions(-)
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq8074.h

-- 
2.7.4

