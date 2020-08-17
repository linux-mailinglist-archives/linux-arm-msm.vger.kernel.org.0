Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF7C245DCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 09:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgHQHTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 03:19:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24368 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbgHQHTZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 03:19:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597648764; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=hwlJ5WSyqLCQ3kLhAjhnixhlrCzC9z8oa3p4W6kt32o=; b=T1D2fY/LmVHKHzaE9f1nvXsRNCiCgaVZM/id6lHHy0SASEoM8a1hNDZMtSTvVcrXNXsu90U5
 tLMC8i3foMzBrpAyGgWrqLAxZ55gX5bMYc15cZRSHksVOJGMVQUS7fw0UOwbVZ4UpF/P7zpr
 5h4n2ATr0jzJoR/Dp4kPJ81PvoM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f3a2f60f2b697637a623b47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 07:18:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4F96DC43387; Mon, 17 Aug 2020 07:18:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82022C433C6;
        Mon, 17 Aug 2020 07:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82022C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        devicetree@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH V2 0/2] Enable DVFS support for IPQ6018
Date:   Mon, 17 Aug 2020 12:48:38 +0530
Message-Id: <1597648720-13649-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add A53 PLL, APCS clock, RPM Glink, RPM message RAM, cpu-opp-table,
SMPA2 regulator to enable the cpu frequency on IPQ6018.

[v2]
	- Rebased on v5.9-rc1
	- Picked up the Rob's Acked-by tag for mailbox YAML
	- Regulator binding in V1 was picked by Mark and available in v5.9-rc1

Kathiravan T (2):
  dt-bindings: mailbox: add compatible for the IPQ6018 SoC
  arm64: dts: ipq6018: enable DVFS support

 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |  1 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              | 96 +++++++++++++++++++++-
 2 files changed, 94 insertions(+), 3 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

