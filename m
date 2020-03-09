Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F6E17E703
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 19:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgCISXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 14:23:40 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37549 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727458AbgCISXj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 14:23:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583778219; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=0L6hvTnXaIEvYUm41ewmxRMMySvYQQsl8lFHaAgfCVo=; b=G2WghETOV5LbiH69tgkMJOmRruk2OxjPGirzYGVU3JkEHl7Oe5UpYZCN3OV2oblpjE86h3FH
 KJewckrkQ/btHcPUodhqCS+uRMglt2Nd20DBSkeH6TA3LZTGrvtk2diSXLCa42rpUkrBe/Zr
 VMM5dIdJzEn8h7eLBn1AU0HeaUQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6689a1.7fa1ff099650-smtp-out-n01;
 Mon, 09 Mar 2020 18:23:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BA67C433CB; Mon,  9 Mar 2020 18:23:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D764C44793;
        Mon,  9 Mar 2020 18:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D764C44793
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom: Add modem-firmware bindings
Date:   Mon,  9 Mar 2020 23:52:54 +0530
Message-Id: <20200309182255.20142-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200309182255.20142-1-sibis@codeaurora.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce modem-firmware binding to allow Q6 modem to boot on platforms
which do not have trustZone.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 88dfa3fc15f78..b1715bc90fb05 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -198,6 +198,10 @@ The Hexagon node may also have an subnode named either "smd-edge" or
 related to the Hexagon.  See ../soc/qcom/qcom,smd.txt and
 ../soc/qcom/qcom,glink.txt for details on how to describe these.
 
+The Hexagon node must contain a subnode named "modem-firmware" on
+platforms which do not have TrustZone. The sub-node should have the
+iommu property as described in ../iommu/iommu.txt.
+
 = EXAMPLE
 The following example describes the resources needed to boot control the
 Hexagon, as it is found on MSM8974 boards.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
