Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7507168A64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2020 00:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgBUX20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 18:28:26 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:36837 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729636AbgBUX20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 18:28:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582327706; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7EB6Ii0LLM/PkrAod3FKxHudIpXfGPc54qU4cLDF2j4=; b=s6YxEb4jAFGBRr2aIRvwqSr0ntcNrplVwhlreCoH/byU2QUhJK2RmqRY6o0cHTZ6Stc43n8q
 e8kTDpAg6iQj5eXDeDTVt8ag2y6F2HdIpqP+OqxpkYTisAFI+yojV8Mr6X6AS0BvIuHfdLFo
 +81c3w2sBGMMBOMfGnl39A1gyjY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e50678d.7fde1af903b0-smtp-out-n02;
 Fri, 21 Feb 2020 23:28:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 618F8C4479C; Fri, 21 Feb 2020 23:28:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84377C43383;
        Fri, 21 Feb 2020 23:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84377C43383
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
        linux-arm-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ARM PSCI: Add support for vendor-specific SYSTEM_RESET2
Date:   Fri, 21 Feb 2020 15:28:02 -0800
Message-Id: <1582327685-6316-1-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for vendor-specific SYSTEM_RESET2 to support
Qualcomm target use cases of rebooting into a RAM dump download mode.

This patch series applies on top of [1].

[1]: https://lore.kernel.org/patchwork/cover/1185759/

Changes since RFC v2:
 - None, tested on SM8250 MTP

Elliot Berman (3):
  dt: psci: Add arm,psci-sys-reset2-type property
  firmware: psci: Add support for dt-supplied SYSTEM_RESET2 type
  arm64: dts: qcom: sm8250: Add vendor-specific PSCI system reset2 type

 Documentation/devicetree/bindings/arm/psci.yaml |  5 +++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |  1 +
 drivers/firmware/psci/psci.c                    | 21 +++++++++++++++++----
 include/linux/psci.h                            |  1 +
 include/uapi/linux/psci.h                       |  2 ++
 5 files changed, 26 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
