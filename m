Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBD41845BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 12:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgCMLPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 07:15:48 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41298 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726492AbgCMLPs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 07:15:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584098147; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=yJY+6dCHitU8f2/WN4ruK25OBJeP1BZ47G3o5vW+Sag=; b=A+vc+fBFyTihB3CCzC/JOB7X1E5++SWCK6lV9r1cUTYtHrnk/lzs2mvCGJfrxeGSZiQ0YpPB
 ehj0017jqvr2H7xWYnUXbVmqjR5hgatBjrqMOA/7H1k29+kkNYQ1gTI1i7IxYcSVhYfq/Fmz
 BveNU6rIiEXIduHYOk/XZ6WhRPU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b6b55.7f246bf73340-smtp-out-n02;
 Fri, 13 Mar 2020 11:15:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BFB61C433D2; Fri, 13 Mar 2020 11:15:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30D11C433BA;
        Fri, 13 Mar 2020 11:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30D11C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V2 0/2] Convert QSPI binding to YAML and add interconnect doc
Date:   Fri, 13 Mar 2020 16:45:19 +0530
Message-Id: <1584098121-18075-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Akash Asthana (2):
  dt-bindings: spi: Convert QSPI bindings to YAML
  dt-bindings: spi: Add interconnect binding for QSPI

 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.txt | 36 ---------
 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 88 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.txt
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
