Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E6A22575E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 08:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGTGMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 02:12:38 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:43387 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726775AbgGTGMh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 02:12:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595225557; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vqsEmAjv+qRcg2NQ6PB2AlTP521/eX6OgTdveeztlpg=; b=YuJ6iwwLkP5bCQ0M/Ugsag+Jo1OgC8nX0RZyw3pjV3Wpbp0mIt0KVUiBeI/03O4cPIS+pp+X
 AMUGWoKOb54BEIYJgWUcdWzady9FY4DGaFhZ9qKPkgvaDC7V+aAW48Qh3/v4YyebgyjglwIN
 rTCzZz+EPtpPEGT1qGtKe/VZU+Q=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f1535d41e603dbb447bb1ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 06:12:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2125C4339C; Mon, 20 Jul 2020 06:12:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27EFEC433C9;
        Mon, 20 Jul 2020 06:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27EFEC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH V3 0/4] Add frequency / voltage scaling support for IPQ6018 SoC
Date:   Mon, 20 Jul 2020 11:42:19 +0530
Message-Id: <1595225543-12127-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator of MP5496
controls the APSS and SDCC voltage scaling respectively. Add support
for the same.

changes since V2:
	- Rebased on top of linux-next 20200717 tag
	- Addressed Rob's comment to drop the 'syscon' node in qcom,smd-rpm.yaml
	- Picked up the Reviewed-by tag for qcom,smd-rpm-regulator.yaml
	- Regulator patches part of V2 was picked up by Mark and it's available in linux-next tree

changes since V1:
	- Moved YAML conversion to the last as per Mark's comments

Kathiravan T (4):
  dt-bindings: soc: qcom: Add IPQ6018 compatible
  soc: qcom: smd-rpm: Add IPQ6018 compatible
  dt-bindings: soc: qcom: convert the SMD-RPM document to YAML schema
  dt-bindings: regulator: convert QCOM SMD-RPM regulator document to
    YAML schema

 .../bindings/regulator/qcom,smd-rpm-regulator.txt  | 321 ---------------------
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml | 106 +++++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  |  64 ----
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  87 ++++++
 drivers/soc/qcom/smd-rpm.c                         |   1 +
 5 files changed, 194 insertions(+), 385 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

