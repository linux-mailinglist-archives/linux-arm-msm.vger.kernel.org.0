Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C131B2E784D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 12:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgL3L5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 06:57:32 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:25903 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgL3L5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 06:57:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609329426; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5SYiNSA29c+d0VrAWCxH75bdMehsRh7C5NQKV7jevHw=; b=RQ8GMGGRFSFLPmCD9I3vushQ7pnHUHp4/BN9FZ/V6+rSd7NHjGgxx0xDtV1whcnt0x6cF6+B
 avuROKjt+IXUNXB70Ag+6ALIhdvbPuSHGQFo9JLqW3ePBaKuxii9ZHfQv20uv659k8tRkLXQ
 9w03YKeNjTP/c4YgReK/OQsBwPI=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fec6af8d3eb3c36b4125c67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Dec 2020 11:56:40
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 20326C43462; Wed, 30 Dec 2020 11:56:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16AD2C433CA;
        Wed, 30 Dec 2020 11:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16AD2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     swboyd@chromium.org, lee.jones@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        mark.rutland@arm.com, linux-arm-msm-owner@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V5 0/2] Convert qcom,spmi-pmic bindings from .txt to .yaml
Date:   Wed, 30 Dec 2020 17:26:21 +0530
Message-Id: <1609329384-15534-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series does the following:
 - converts the qcom,spmi-pmic bindings from .txt to .yaml format
 - Sorted the compatible strings
 - Adds PM6150 and PM6150L subtypes.

Changes from V1:
 - Sorted the compatible strings as per Stephen Boyd's comments.
 - Added a patch to convert the qcom,spmi-pmic from .txt to .yaml format.

Changes from V2:
 - Addressed Stephen Boyd and Rob Herring comments.

Changes from V3:
 - Fixed compilation error in .yaml file.

Changes from V4:
 - Addressed Stephen Boyd comments on .yaml conversion patch
 - Added "Reviewed-by" tag from Stephen Boyd
 - Added "Acked-for-MFD-by" tag from Lee Jones

Kiran Gunda (2):
  mfd: qcom-spmi-pmic: Convert bindings to .yaml format
  mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l

 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 --------------
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 119 +++++++++++++++++++++
 drivers/mfd/qcom-spmi-pmic.c                       |   4 +
 3 files changed, 123 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

