Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF2F3526C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 09:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbhDBHCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 03:02:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57804 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233954AbhDBHCR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 03:02:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617346937; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=mSszbiF/XpWeFnKiBYn1uPWMfqh0b3UK7KKszNvPJH4=; b=e4NGPkddM1dtdk7oieofWiVbYts4b3rZjMVb/Ht3nxJQWAyXOkFA+lqT/TzoLlpEg/4o2ZGC
 KeYsCG5rjbqaRPLHIu6TuBBskLPJ/iHQpOzkH69rYX6CgmgmmOVYtk3nqBdvHKwHqtWTQJSt
 TWzg/mFAXtpSWFxlYkaqWoOlgtA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6066c16ec06dd10a2df39306 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 07:02:06
 GMT
Sender: manafm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C474AC43463; Fri,  2 Apr 2021 07:02:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: manafm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8390C433C6;
        Fri,  2 Apr 2021 07:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D8390C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=manafm@codeaurora.org
From:   Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
        Ram Chandrasekar <rkumbako@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>
Subject: [RFC PATCH 0/2] Add SDPM clock monitor driver
Date:   Fri,  2 Apr 2021 12:29:05 +0530
Message-Id: <1617346747-8611-1-git-send-email-manafm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RDPM (Rail digital power meter) hardware for a shared rail will
monitor for peak current management. It allocates one simple digital
power monitor(SDPM) for each major consumer of that rail. Each SDPM
estimates the power consumption of the consumer based on operating
frequency for that consumer. The RDPM hardware then aggregates all
SDPMs power estimation and recommends different mitigation levels
based on aggregated power estimation is above or below rail power
consumption specification.

This patch series adds SDPM clock monitor driver which
tracks frequency of different consumers and writes the frequency
into respective SDPM registers. The driver gets the clock source
to monitor and the corresponding SDPM register for a consumer from
devicetree. The SDPM clock monitor driver registers for the clock
change notification for these clock sources and writes the new
frequency value into the SDPM register.

Changes:
* Add dt-binding documentation for sdpm clock monitor driver
* Add SDPM clock monitor driver

Manaf Meethalavalappu Pallikunhi (2):
  dt-bindings: soc: qcom: Add SDPM clock monitor driver documentation in
    yaml
  drivers: soc: qcom: Add SDPM clock monitor driver

 .../devicetree/bindings/soc/qcom/qcom-sdpm.yaml    |  68 +++++++
 drivers/soc/qcom/Kconfig                           |   8 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/sdpm_clk_monitor.c                | 217 +++++++++++++++++++++
 4 files changed, 294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sdpm.yaml
 create mode 100644 drivers/soc/qcom/sdpm_clk_monitor.c

Signed-off-by: Ram Chandrasekar <rkumbako@codeaurora.org>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

