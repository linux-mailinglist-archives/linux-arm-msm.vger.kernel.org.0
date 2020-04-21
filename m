Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0271B29E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 16:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbgDUOdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 10:33:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:34567 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729300AbgDUOc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 10:32:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587479578; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=sqX+vw/JMt2d9YIaemJYxFNU3ZR/6minw4o+HGtf5Vk=; b=J641w+goKPyG2678kB5Bil8tLnJJL8t6EBTM6R9AvrPk2zfCAuppRheT2YPT2JnvO6ng7BqQ
 hVZ+ZOvkRleQ0hSnmbdWOBSDV+6skNrHyvTVnO6k2TrNS3QhH1zO+30w4mahpBOMkohqGZhO
 eVBCtZzJ7d7aqWOKfl9Bi1uM1Xk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f0419.7f8d5ab9dd88-smtp-out-n02;
 Tue, 21 Apr 2020 14:32:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 57B07C44788; Tue, 21 Apr 2020 14:32:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D9EFC44798;
        Tue, 21 Apr 2020 14:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D9EFC44798
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, mka@chromium.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 3/7] dt-bindings: remoteproc: qcom: Use memory-region to reference memory
Date:   Tue, 21 Apr 2020 20:02:24 +0530
Message-Id: <20200421143228.8981-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use memory-region property to reference mba and mpss memory regions.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index bffddd15eb910..1f9a62e13ebe0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -102,6 +102,14 @@ on the Qualcomm Hexagon core.
 		    must be "mss_restart", "pdc_reset" for the modem
 		    sub-system on SC7180, SDM845 SoCs
 
+For devices where the mba and mpss sub-nodes are not specified, mba/mpss region
+should be referenced as follows:
+- memory-region:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the mba region followed
+		    by the mpss region
+
 For the compatible strings below the following supplies are required:
   "qcom,q6v5-pil"
   "qcom,msm8916-mss-pil",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
