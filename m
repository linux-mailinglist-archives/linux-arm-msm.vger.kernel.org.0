Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553DA1844E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 11:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgCMK3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 06:29:46 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:62463 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726512AbgCMK3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 06:29:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584095385; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vPwrLpdye8z7HdM8WtZwBBjCF0ObrstKhrN7qJYwu5Q=; b=FHZ+linAiCWZ1UqZFidhBXYWbyHQ/LjmnZG0CZnAwO5h9h8MvZv/rdpS9Z3St17v1yvKQ9gd
 sZ4/cUCTKKtp0xyqBUrK6nV+yFmU8AJ1OMKGrvO6R3UnNwb7u1gwly/BzyPApta74IZMLcL6
 bi3a0YeMG8HGXAAI7fMrLXfz6hM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b6084.7efb59c60a08-smtp-out-n01;
 Fri, 13 Mar 2020 10:29:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7F4DC43636; Fri, 13 Mar 2020 10:29:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6BE2C433D2;
        Fri, 13 Mar 2020 10:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6BE2C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, c_skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V5 0/3] Convert QUP bindings to YAML and add ICC, pin swap doc
Date:   Fri, 13 Mar 2020 15:59:07 +0530
Message-Id: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in V4:
 - Add interconnect binding patch.
 - Add UART pin swap binding patch.

Akash Asthana (3):
  dt-bindings: geni-se: Convert QUP geni-se bindings to YAML
  dt-bindings: geni-se: Add interconnect binding for GENI QUP
  dt-bindings: geni-se: Add binding for UART pin swap

 .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |  94 ---------
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 231 +++++++++++++++++++++
 2 files changed, 231 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
