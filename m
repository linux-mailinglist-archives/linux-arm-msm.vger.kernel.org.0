Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE6B20026E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 09:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgFSHFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 03:05:41 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:55955 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728109AbgFSHFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 03:05:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592550340; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MKrIRmLQE/O1J309JvHBik717o1UeH59O6+bIbOXI5s=; b=d8REDSFDSz4JK/D0fUx0vuXnxWv2/uv5RA9+CB97o9VSxyQDxtUjYzBdm+5mK3UdSA+XXh0a
 y6f7VXM7rUZfJivvBnVvdTMC9LBjHHZCy1kkk4Lx25clIB2Z3akl0SoS8/UyqjaWi/txU0wx
 7z4uYmEfQLe1WM5InHo0zCuzo+k=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5eec63b56bebe35deb53f5c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Jun 2020 07:05:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E47AC43395; Fri, 19 Jun 2020 07:05:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3536C433C9;
        Fri, 19 Jun 2020 07:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3536C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH 0/6] Add frequency and voltage scaling support for IPQ6018 SoC
Date:   Fri, 19 Jun 2020 12:35:01 +0530
Message-Id: <1592550307-11040-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator of MP5496
controls the APSS and SDCC voltage scaling respectively. Add support
for the same.

Kathiravan T (6):
  dt-bindings: soc: qcom: add YAML schema for SMD-RPM driver
  dt-bindings: soc: qcom: Add IPQ6018 compatible
  soc: qcom: smd-rpm: Add IPQ6018 compatible
  dt-bindings: regulator: add YAML schema for QCOM SMD-RPM regulator
  dt-bindings: add MP5496 regulator compatible
  regulator: qcom_smd: Add MP5496 regulators

 .../bindings/regulator/qcom,smd-rpm-regulator.txt  | 320 ---------------------
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml | 106 +++++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  |  62 ----
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  92 ++++++
 drivers/regulator/qcom_smd-regulator.c             |  34 +++
 drivers/soc/qcom/smd-rpm.c                         |   1 +
 6 files changed, 233 insertions(+), 382 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

