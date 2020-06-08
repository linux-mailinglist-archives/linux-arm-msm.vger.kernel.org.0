Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB561F1585
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 11:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbgFHJhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 05:37:35 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:16558 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729144AbgFHJhe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 05:37:34 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jun 2020 02:37:33 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 08 Jun 2020 02:37:30 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 3D25B217F6; Mon,  8 Jun 2020 15:07:29 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/4] Add ipq6018 apcs mailbox driver
Date:   Mon,  8 Jun 2020 15:07:23 +0530
Message-Id: <1591609047-29995-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ipq6018 devices has apcs block for ipc interrupts, this block also
provides a clock controller which provides cpu clocks.

This series adds support for the apcs block found in ipq6018 devices.

This series was originally part of ipq6018 apss clock controller series
https://lkml.org/lkml/2020/5/27/637

[V3]
 * Divided mailbox driver into two patches, patch 3 will re-arrange the code.
   patch 4 adds support for ipq6018 apcs
[V2]
 * Addressed Bjorn's review comment, created a new structure for driver
   data.
 * Re-arranged compatible string based on sort order.
 * dropped dts patch from this series, will send it separately

Sivaprakash Murugesan (3):
  dt-bindings: mailbox: Add YAML schemas for QCOM APCS global block
  dt-bindings: mailbox: Add dt-bindings for ipq6018 apcs global block
  mailbox: qcom: Add ipq6018 apcs compatible

 .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 88 -------------------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 99 ++++++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 61 +++++++++----
 3 files changed, 142 insertions(+), 106 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml

-- 
2.7.4

