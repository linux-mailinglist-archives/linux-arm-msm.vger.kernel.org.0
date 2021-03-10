Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11356334396
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhCJQs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:48:27 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:30735 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231941AbhCJQsY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:48:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615394904; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=hEE3w8HTASHETEiuf9bTDObpKPT8w+L8zVEz6r58fms=; b=S6HlvvkQYkgfx8xnnsNfCfyYJS4RBuHcEk2gacBMG3f12bCXm0NE8h9MTj5tQBJ9IE2/rTSL
 6SRpbrixjVoumBTSS8v8Rg7V881FLSndgVTEzhPmeGZVR8h89LYqJEn6kz310q2Nvrx0sK6K
 cjT4snJ4o+CMby3/DC5WmKS00VM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6048f84dd3a53bc38f37e989 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 16:48:13
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4DC4C43468; Wed, 10 Mar 2021 16:48:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC81DC43466;
        Wed, 10 Mar 2021 16:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC81DC43466
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 5/6] MAINTAINERS: Add the entry for DCC(Data Capture and Compare) driver support
Date:   Wed, 10 Mar 2021 22:16:36 +0530
Message-Id: <c37392d10f428c1b07cdecdb356deaae8db409db.1615393454.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1615393454.git.schowdhu@codeaurora.org>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1615393454.git.schowdhu@codeaurora.org>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
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

