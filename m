Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B8F2DD08E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 12:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgLQLkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 06:40:14 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:26904 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbgLQLkM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 06:40:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608205190; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7Yg6xNOM3VYiXhvXI3DlIbHbX6PzXmWdcwTd7EEBj5s=; b=k1DHjZlUgsyCfOGMlcXEm7q8cNVGLzZ/8hgOMVarPtdsZy1+fqXvhOPy9rePfRi9k6/0mlhM
 zfwiJ0iBixT4CZi3soxS77RPPczFZwNpBx4PT9C1AaMRzxMaBxzi4GrN9eQqPmuIRjuMwLHQ
 fraexxJ0S6Vagv9Ps2P+PxsUrF0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fdb435e75ab652e872c02ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 11:39:10
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BAD22C43462; Thu, 17 Dec 2020 11:39:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28909C433CA;
        Thu, 17 Dec 2020 11:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28909C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     swboyd@chromium.org, robh@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V3 0/2] Convert qcom,spmi-pmic bindings from .txt to .yaml
Date:   Thu, 17 Dec 2020 17:08:41 +0530
Message-Id: <1608205123-23119-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series does the following:
1. converts the qcom,spmi-pmic bindings from .txt to .yaml format
2. Sorted the compatible strings
3. Adds PM6150 and PM6150L subtypes.

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

