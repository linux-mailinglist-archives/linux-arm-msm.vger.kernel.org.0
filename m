Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478E5160F32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 10:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgBQJty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 04:49:54 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:11246 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728967AbgBQJtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 04:49:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581932993; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=g//IW0nJXQeUIbmBoJDPkGdvKWYJPRzClQ8OWjgSwlw=; b=HRFD5yYhNY46TcDa1yS5z7JXiWg6+xYrZnig6CDJYXei3DFCCBYMkOn4XoYCUbEKKcUcPIew
 jAGcoXI3KJdlMalUg4kIZw97ruumOk6lLOtLQTR/yHisZ1v0FBoPUDHDg2MeOwMG0WDoKLzq
 fKvqBPDHkUQLQSnV4F1/QUICZQM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a61be.7fb7bc9d4340-smtp-out-n02;
 Mon, 17 Feb 2020 09:49:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2621CC447A2; Mon, 17 Feb 2020 09:49:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A027C43383;
        Mon, 17 Feb 2020 09:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A027C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH 0/2] Convert QSPI binding to YAML and add interconnect doc
Date:   Mon, 17 Feb 2020 15:19:32 +0530
Message-Id: <1581932974-21654-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Akash Asthana (2):
  dt-bindings: spi: Convert QSPI bindings to YAML
  dt-bindings: spi: Add interconnect binding for QSPI

 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.txt | 36 --------
 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
