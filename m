Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BFD289E86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Oct 2020 07:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730468AbgJJFcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 01:32:22 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18434 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730349AbgJJFcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 01:32:13 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:08 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 09 Oct 2020 22:32:06 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
        id B9926217BA; Sat, 10 Oct 2020 11:01:42 +0530 (IST)
From:   Md Sadre Alam <mdalam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mdalam@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
Date:   Sat, 10 Oct 2020 11:01:37 +0530
Message-Id: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QPIC 2.0 supports Serial NAND support in addition to all features and
commands in QPIC 1.0 for parallel NAND. Parallel and Serial NAND cannot
operate simultaneously. QSPI nand devices will connect to QPIC IO_MACRO
block of QPIC controller. There is a separate IO_MACRO clock for IO_MACRO
block. Default IO_MACRO block divide the input clock by 4. so if IO_MACRO
input clock is 320MHz then on bus it will be 80MHz, so QSPI nand device
should also support this frequency.

QPIC provides 4 data pins to QSPI nand. In standard SPI mode (x1 mode) data
transfer will occur on only 2 pins one pin for Serial data in and one for
serial data out. In QUAD SPI mode (x4 mode) data transfer will occur at all
the four data lines. QPIC controller supports command for x1 mode and x4 mode.

Md Sadre Alam (5):
  dt-bindings: qcom_nandc: IPQ5018 QPIC NAND documentation
  mtd: rawnand: qcom: Add initial support for qspi nand
  mtd: rawnand: qcom: Read QPIC version
  mtd: rawnand: qcom: Enable support for erase,read & write for serial
    nand.
  mtd: rawnand: qcom: Add support for serial training.

 .../devicetree/bindings/mtd/qcom_nandc.txt         |   3 +
 drivers/mtd/nand/raw/nand_ids.c                    |  13 +
 drivers/mtd/nand/raw/qcom_nandc.c                  | 502 ++++++++++++++++++++-
 3 files changed, 494 insertions(+), 24 deletions(-)

-- 
2.7.4

