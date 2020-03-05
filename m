Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8AC917AEB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 20:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgCETFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 14:05:53 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:23666 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgCETFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 14:05:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583435152; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1sG3u0mTkH09rmGeFRjFz49NiO7dwyUuTIhoDE0H1I8=; b=C3hqFeY9MV2FjE+0cxY5W/jbYlmFe9NOfHj9tOr5avQuOfahFN3fjTqdTg+2cFKtvOmkrzUO
 RAqLEZ3UOwUAx/Mm75ZnCrXOEMN7FBHyUhJG9mXviU5VKpB4PNAof5N/RoZ5zxADTnuALy55
 ZPIeeBlXBiP07SU7iooldZgAgS0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e614d87.7faad0100a08-smtp-out-n01;
 Thu, 05 Mar 2020 19:05:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A66DC447A6; Thu,  5 Mar 2020 19:05:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E59EDC43383;
        Thu,  5 Mar 2020 19:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E59EDC43383
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
Subject: [PATCH v3 0/3] ARM PSCI: Add support for vendor-specific SYSTEM_RESET2
Date:   Thu,  5 Mar 2020 11:05:26 -0800
Message-Id: <1583435129-31356-1-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for vendor-specific SYSTEM_RESET2 to support
Qualcomm target use cases of rebooting into a RAM dump download mode.

This patch series applies on top of [1].

[1]: https://lore.kernel.org/patchwork/cover/1185759/

Changes since v2:
 - dt property forces vendor-specifc reset type

Changes since v1:
 - Address Sudeep's comments

Changes since RFC v2:
 - None, tested on SM8250 MTP

Elliot Berman (3):
  dt: psci: Add arm,psci-sys-reset2-vendor-param property
  firmware: psci: Add support for dt-supplied SYSTEM_RESET2 type
  arm64: dts: qcom: sm8250: Add vendor-specific PSCI system reset2 type

 Documentation/devicetree/bindings/arm/psci.yaml |  7 +++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |  1 +
 drivers/firmware/psci/psci.c                    | 21 +++++++++++++++++----
 include/uapi/linux/psci.h                       |  5 +++++
 4 files changed, 30 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
