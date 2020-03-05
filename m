Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 365B917AEB7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 20:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgCETGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 14:06:00 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:23666 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726751AbgCETGA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 14:06:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583435159; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YH+QWh0B2Sy6GXDxwNE87QSZhteGeflftaYJuX5RZ/w=; b=hIrhHWgC1GAYnkJpmNb6nl1zK1FTv85E7Px5VehKDIFtplb22eYw8gkTny1JUAXAf+QItp8F
 DKK4YXedlfraQ6xcMw86fqabfy7LRMdhXCQplyuAM5a4TM2tRvdUik/gscn4Qv5LPfUBSuxT
 exnUQKpziwqjYUiQFPQCDeEmANg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e614d89.7fa75291bce0-smtp-out-n02;
 Thu, 05 Mar 2020 19:05:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D91F7C447A5; Thu,  5 Mar 2020 19:05:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D3E60C447A0;
        Thu,  5 Mar 2020 19:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3E60C447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8250: Add vendor-specific PSCI system reset2 type
Date:   Thu,  5 Mar 2020 11:05:29 -0800
Message-Id: <1583435129-31356-4-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583435129-31356-1-git-send-email-eberman@codeaurora.org>
References: <1583435129-31356-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm Technologies, Inc. SoCs do not guarantee that an architectural
warm reset boots back into Linux kernel. For instance, if download mode
or reboot reason cookies are set, the SoC would do a warm reset into an
alternate exception level (e.g. a mode to collect RAM dumps) or an alternate
EL1 application (e.g. fastboot mode). Thus, Qualcomm Technologies,
Inc. SoCs support a vendor-specific warm reset type that can be used in
all instances of warm/soft reboots.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f63df12..11cede1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -162,6 +162,7 @@
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		arm,psci-sys-reset2-vendor-param = <0>;
 	};
 
 	reserved_memory: reserved-memory {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
