Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDEE2C82C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 12:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387455AbgK3LCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 06:02:51 -0500
Received: from z5.mailgun.us ([104.130.96.5]:64820 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387445AbgK3LCv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 06:02:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606734150; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IGL15AAZU+PGlm+vPv6IhRcx7pud7hMHBeIih118egs=; b=sgLd2dq3LWyuYBSzNliUrLxL9/40zxRTv9S1dkNmjDJ/XTK0dpKi1tC0pMGN8Cjqxelmf4wg
 Mi71jQzYKGCl/427IQUfU1SFNR99CvFTJFetGFBKz8ATHLhZpI85H5I44h6+rOLLO0pDhzrS
 xLmu9d3AvFjqKpMz4+uvqFwXuhQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fc4d1261b731a5d9c8e3e3c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 11:01:58
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21D8FC43462; Mon, 30 Nov 2020 11:01:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54AACC43460;
        Mon, 30 Nov 2020 11:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54AACC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH V3 0/1] Add QPIC NAND support for IPQ6018
Date:   Mon, 30 Nov 2020 16:31:44 +0530
Message-Id: <1606734105-12414-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 has the QPIC NAND controller of version 1.5.0, which
uses the BAM DMA. Add support for the QPIC BAM, QPIC NAND and
enable the same in the board DTS file.

[V3]:
	- Rebased on v5.10-rc6
	- Renamed the qpic bam dma node name from 'dma' to 'dma-controller'
	- Update the device register space to 64bit format

	Above mentioned last two points based on the latest changes in the QCOM tree.

[V2]:
	- Rebased on v5.10-rc2
	- Replaced "ok" with "okay" for status property
	- Dropped the MTD and dt-bindings patch as they are already picked in MTD tree

Kathiravan T (1):
  arm64: dts: ipq6018: Add the QPIC peripheral nodes

 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 41 ++++++++++++++++++++
 2 files changed, 57 insertions(+)


base-commit: b65054597872ce3aefbc6a666385eabdf9e288da
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

