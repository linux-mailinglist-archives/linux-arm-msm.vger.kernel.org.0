Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0002DDF6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 09:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730833AbgLRIQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Dec 2020 03:16:06 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:47321 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbgLRIQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Dec 2020 03:16:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608279345; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=V3Rn9GiKs+Sqe/qXL6ZtUr/G35dJ4J1d1IxF3iceEHk=; b=WL+K/lb2N7FhrKpk2KDSGtuEmOXMVD8uOEZe003AaSvN6NTrrIwSABgnc3rN8k0WuB19UwEs
 WyACc+pdx4AaURh0HKdM7vzQ9FZ/WI+5JX37YEyUVkX6F6d0CStWBdriu3expOMztMu7pcDV
 QoYEKCoXNI08MzWnGquFHdAaMTE=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fdc6511ca81d9e625bfea03 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 08:15:13
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93F3CC43462; Fri, 18 Dec 2020 08:15:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E0ADAC433CA;
        Fri, 18 Dec 2020 08:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0ADAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     robh@kernel.org, swboyd@chromium.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V4 0/2] Convert qcom,spmi-pmic bindings from .txt to .yaml
Date:   Fri, 18 Dec 2020 13:44:50 +0530
Message-Id: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series does the following:
 - converts the qcom,spmi-pmic bindings from .txt to .yaml format
 - Sorted the compatible strings
 - Adds PM6150 and PM6150L subtypes.

Changes from V3:
 - Fixed compilation error in .yaml file.

Changes from V2:
 - Addressed Stephen Boyd and Rob Herring comments.

Kiran Gunda (2):
  mfd: qcom-spmi-pmic: Convert bindings to .yaml format
  mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l

 .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 -------------
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 129 +++++++++++++++++++++
 drivers/mfd/qcom-spmi-pmic.c                       |   4 +
 3 files changed, 133 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

