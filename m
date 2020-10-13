Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517B928C83B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 07:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732299AbgJMFSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 01:18:39 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:58686 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732320AbgJMFSj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 01:18:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602566319; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7DJYeM79DwYCNxvdVN1/Efj/wUPrE6lX2eZDDy8scis=; b=ZM+Au0iPt8L4BWqoOlPxYCzjNx2FNFO/44Ln6xItuj58muoAYY5oBwTE1zwdt+tDZZ3WQWJa
 GH6X3Ie5amKVndB0OI/e0XlbYlWsqUJsi37nCb5AS5cZMvqIFXiW6RaIVkrkoeNskq9QYQFz
 455MLB5IYtT/0Ttea5XzYKkHFfs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f8537fd3711fec7b141610c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 05:15:41
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 014FFC43387; Tue, 13 Oct 2020 05:15:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89512C433CB;
        Tue, 13 Oct 2020 05:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89512C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, robh+dt@kernel.org, sivaprak@codeaurora.org,
        peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH 0/3] Add QPIC NAND support for IPQ6018
Date:   Tue, 13 Oct 2020 10:45:21 +0530
Message-Id: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 has the QPIC NAND controller of version 1.5.0, which
uses the BAM DMA. Add support for the QPIC BAM, QPIC NAND and
enable the same in the board DTS file.

Kathiravan T (3):
  dt-bindings: qcom_nandc: IPQ6018 QPIC NAND documentation
  mtd: rawnand: qcom: Support for IPQ6018 QPIC NAND controller
  arm64: dts: ipq6018: Add the QPIC peripheral nodes

 .../devicetree/bindings/mtd/qcom_nandc.txt    |  2 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts  | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 41 +++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c             |  4 ++
 4 files changed, 63 insertions(+)


base-commit: bbf5c979011a099af5dc76498918ed7df445635b
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

