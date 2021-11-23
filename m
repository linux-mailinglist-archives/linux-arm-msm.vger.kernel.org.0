Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DA8459B35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 05:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbhKWEeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 23:34:10 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:22718 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233730AbhKWEeC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 23:34:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637641855; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=uLtUrPaxrs3TxQEsVzUffNucdpkhobfe2yKEGXRz+aM=; b=mgFYbrrobs7uPvu1tlrORoG7k4ljyJRAbBN4738pGdqxXmckyRJ+xL6wC0PHHST6GTMfC9G9
 JZk88bylPJGHLjQ9TpeG3jN2DpG4uB6kNgLPWbFBJcs2E828cA2Fvl5/Oqf8YhObzCA1kemC
 /n8SceT2mTz+V1iIFNvAUHAonG4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 619c6e7edf12ba53c4f4d4ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 04:30:54
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D711DC4363B; Tue, 23 Nov 2021 04:30:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 969A6C43638;
        Tue, 23 Nov 2021 04:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 969A6C43638
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        bjorn.andersson@linaro.org, greg@kroah.com
Cc:     linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        quic_schowdhu@quicinc.com,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 7/8] arm64: dts: qcom: sc7280: Set the default dr_mode for usb2
Date:   Tue, 23 Nov 2021 09:58:25 +0530
Message-Id: <266a032cb9b45593707874da0ddc3faa29665baf.1637639009.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1637639009.git.schowdhu@codeaurora.org>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1637639009.git.schowdhu@codeaurora.org>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set the default dr_mode for usb2 node to "otg" to enable.
role-switch for EUD(Embedded USB Debugger) connector node.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22a..7c69c78 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -61,6 +61,10 @@
 	modem-init;
 };
 
+&usb_2_dwc3 {
+	dr_mode = "otg";
+};
+
 &pmk8350_vadc {
 	pmr735a_die_temp {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

