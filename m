Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E31B3F4653
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 10:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbhHWIFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 04:05:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53858 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235243AbhHWIFh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 04:05:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629705895; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UbeUnIaewsJMuXqIc2FtMBAKVs1ca4S21rjIADsGJvA=; b=fEiYPz23n32Q9p22MUIP9NzROY9x7BysOo5GSndOt8JAYxdyDO2jzRy+5KHqC059yC+/Bo8g
 N9L/U7tEa5SyNfmoybFhrft6iBfX0pT5mFVLm563SpDScvhuY/Vj2RSmrIJlMVqWcHFhZu4t
 JFESOpnJlpURWOFMrTgUx63PZJs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 612356a72b9e91b6888bba00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 08:04:55
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2842AC43617; Mon, 23 Aug 2021 08:04:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4399CC4338F;
        Mon, 23 Aug 2021 08:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4399CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v3 0/2] Start getting rid of the GPIO_NO_WAKE_IRQ
Date:   Mon, 23 Aug 2021 13:34:38 +0530
Message-Id: <1629705880-27877-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v3:
- Address comment to call irq_domain_trim_hierarchy() once on v2 patch 3.
- Remove patch2 of v2 as seen no more needed.

v2:
- Use fix from marc [1] and drop v1 patch 2
- Add new patch for fixes irq_domain_trim_hierarchy()

gpio_to_irq() reports error at irq_domain_trim_hierarchy() for non wakeup
capable GPIOs that do not have dedicated interrupt at GIC.

Since PDC irqchip do not allocate irq at parent GIC domain for such GPIOs
indicate same by using irq_domain_disconnect_hierarchy() for it own domain
and all its parent domains.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=irq/qcom-pdc-nowake&id=331b2ba388a4a79b5c40b8addf56cbe35099a410
[2] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=532669


Marc Zyngier (1):
  irqchip/qcom-pdc: Start getting rid of the GPIO_NO_WAKE_IRQ

Maulik Shah (1):
  irqdomain: Export irq_domain_disconnect_hierarchy()

 drivers/irqchip/qcom-pdc.c | 68 ++++++++--------------------------------------
 kernel/irq/irqdomain.c     |  1 +
 2 files changed, 12 insertions(+), 57 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

