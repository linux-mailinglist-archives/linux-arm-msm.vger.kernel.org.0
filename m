Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B5B1678C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 09:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388881AbgBUIux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 03:50:53 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:14719 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388902AbgBUIuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 03:50:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582275049; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mtFFCabUREGLYB41btneKfhLYC1nvRmrhWrz/tudsqg=; b=vA0pGGNSS0jVLxAlcCsEoj3RDi7LCMi1KfxD98dRyNYiCdf/yd7Jcw6AHs2fb0IJqqGF07Dn
 kIwBTlq4ZW5ZA95Ttlxqy8FPupoc4SRb2ItKIGf+yfIBP6fe0V1cfkAqpwrNCQt+4yWkqIsi
 lOnBOqYrdBCOtf+zA+clYUBz74M=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4f99e1.7fd110a1f068-smtp-out-n03;
 Fri, 21 Feb 2020 08:50:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 83FA8C447A4; Fri, 21 Feb 2020 08:50:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D80C3C4479D;
        Fri, 21 Feb 2020 08:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D80C3C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 4/4] arm64: defconfig: Enable SoC sleep stats driver for Qualcomm
Date:   Fri, 21 Feb 2020 14:19:46 +0530
Message-Id: <1582274986-17490-5-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable SoC sleep stats driver. The driver gives statistics for
various SoC level low power modes.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0f21288..c63399d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -767,6 +767,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_SOC_SLEEP_STATS=y
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
