Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7652216B152
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 21:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgBXU5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 15:57:52 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:64019 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727714AbgBXU5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 15:57:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582577871; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0lH/eUvyQ1WTwNmjI+Fd0gSj7y5CZSWBlCF6z1ABS7I=; b=HSjYQMkY0M+nWw/2YWvtR84qc10maoOyAnAs2sKZ1xTvqq7TOFelpFu6bMJOMytN2c5FNYKO
 M26DagbSNJc/x63j2nIr/MTbqFkRD4tSMzCv6HVvobItKEVMUjBKIlhfbGxHXBhHP1O/rE1z
 jJx2bmbAKL/B2xrEm9z16j+2JqY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5438ce.7f15093689d0-smtp-out-n03;
 Mon, 24 Feb 2020 20:57:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1AEA2C433A2; Mon, 24 Feb 2020 20:57:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C63FC4479D;
        Mon, 24 Feb 2020 20:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C63FC4479D
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8250: Add vendor-specific PSCI system reset2 type
Date:   Mon, 24 Feb 2020 12:57:38 -0800
Message-Id: <1582577858-12410-4-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
References: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm Technologies, Inc. SoCs do not guarantee that an architectural
warm reset boots back into Linux kernel. For instance, if download mode
or reboot reason cookies are set, the SoC would do a warm reset into an
alternate exception level (e.g. a mode to collect RAM dumps) or
application at EL1 (e.g. fastboot mode). Thus, Qualcomm Technologies,
Inc. SoCs support a vendor-specific warm reset type that can be used in
all instances of warm/soft reboots.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f63df12..ca49d22 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -162,6 +162,7 @@
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		arm,psci-sys-reset2-param = <0x80000000>;
 	};
 
 	reserved_memory: reserved-memory {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
