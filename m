Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45B436C32D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 12:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhD0KY7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 06:24:59 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61647 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237524AbhD0KYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 06:24:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619519032; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Pyfm1pM0srPnnI8uYQKfJWlpQqpKFiXu5zRYYRmRtXk=; b=fTucSSqXqG5OmAIcQxlYpc4M8ICUBlXH6t0nPnjr59XZZmyU+n4rW6NE0SuV9OtaojerW8it
 TIG4x877bou6/1yK0w45LgMqQelLpQGj1iNAdtV8vDodydd/Blnqxj0SiGATOcXa81TCrkmv
 eGwNHDhbsXB9Y4AyOEVwP+tRk50=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6087e623a817abd39aa0ef89 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 10:23:31
 GMT
Sender: fenglinw=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E01C8C433F1; Tue, 27 Apr 2021 10:23:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from fenglinw02.ap.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: fenglinw)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9CF7C433D3;
        Tue, 27 Apr 2021 10:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9CF7C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=fenglinw@codeaurora.org
From:   Fenglin Wu <fenglinw@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     subbaram@codeaurora.org, collinsd@codeaurora.org,
        aghayal@codeaurora.org, fenglinw@codeaurora.org
Subject: [PATCH 0/2] Add QCOM PMIC PWM driver
Date:   Tue, 27 Apr 2021 18:22:08 +0800
Message-Id: <20210427102247.822-1-fenglinw@codeaurora.org>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PWM driver to support PWM modules inside QCOM PMIC chips which are accessed
through SPMI bus. Normally, there would be multiple PWM modules with adjacent
address spaces present in one PMIC chip, and each PWM module has 0x100 size of
address space. With this driver, a pwm_chip with multiple pwm_device individuals
is created, and each pwm_device individual is corresponding to one PWM module.

Fenglin Wu (2):
  dt-bindings: pwm: add bindings for PWM modules inside QCOM PMICs
  pwm: pwm-qcom: add driver for PWM modules in QCOM PMICs

 .../devicetree/bindings/pwm/pwm-qcom.yaml          |  51 ++
 drivers/pwm/Kconfig                                |   9 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-qcom.c                             | 585 +++++++++++++++++++++
 4 files changed, 646 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-qcom.yaml
 create mode 100644 drivers/pwm/pwm-qcom.c

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

