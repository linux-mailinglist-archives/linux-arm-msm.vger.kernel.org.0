Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D002434C546
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 09:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhC2HvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 03:51:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60247 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229873AbhC2Hul (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 03:50:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617004241; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=hEE3w8HTASHETEiuf9bTDObpKPT8w+L8zVEz6r58fms=; b=uZysTw6wxC0rSaIvZIt3fhp7haxa6KBv8cnGv4hw0g/65mLP+vNsT6U33ofHYFVE378CW+Oo
 iJ1TLWfGKHiq2j3erI7tGVm8fHSfvuXskJk/0btI9CNFPT+FliJRABgM0nGoiAYqC+bej2M4
 RZrRTwnkID3DNSZ7x/f/jFMabok=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 606186c4876af85fc460f4c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 07:50:28
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D69CCC433C6; Mon, 29 Mar 2021 07:50:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 593FDC433CA;
        Mon, 29 Mar 2021 07:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 593FDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [Resend PATCH V3 4/5] MAINTAINERS:Add the entry for DCC(Data Capture and Compare) driver support
Date:   Mon, 29 Mar 2021 13:19:13 +0530
Message-Id: <561f49280935ec8b00b8502419ad7c13b3fa8195.1617001132.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1616651305.git.schowdhu@codeaurora.org>
References: <cover.1616651305.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1617001131.git.schowdhu@codeaurora.org>
References: <cover.1617001131.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added the entries for all the files added as a part of driver support for
DCC(Data Capture and Compare).

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85c..fb28218 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4969,6 +4969,14 @@ F:	include/linux/tfrc.h
 F:	include/uapi/linux/dccp.h
 F:	net/dccp/

+QTI DCC DRIVER
+M:	Souradeep Chowdhury <schowdhu@codeaurora.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-dcc
+F:	Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
+F:	drivers/soc/qcom/dcc.c
+
 DECnet NETWORK LAYER
 L:	linux-decnet-user@lists.sourceforge.net
 S:	Orphan
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

