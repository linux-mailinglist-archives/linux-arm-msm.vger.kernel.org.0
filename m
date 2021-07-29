Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF233D9A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 02:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhG2ASB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 20:18:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35062 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232827AbhG2ASB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 20:18:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627517879; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=llW9tgikf+tI7XzUzcPhyL+rus4BGtWqJmBZw8FH9Bs=; b=PaZOodIvXKrAkaQ7gxSvLya85agpKlxyDHahoOvI4udE8C3rRtkB0E2ZVBT+ldKtcVK/aULz
 gCwLZAUzjkgTs5K8OUVixHXazJdEDcOLp0M8gy02Ch5wp+wiqH3CfEoA65HnY57wIQKNzzD2
 pAnrmAkSUUQalEC2lxBtN6TeunM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6101f3aeb653fbdadd28d883 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 00:17:50
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB8D1C4338A; Thu, 29 Jul 2021 00:17:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CDCBC43460;
        Thu, 29 Jul 2021 00:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9CDCBC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 0/2] Fix serial number usage in MHI bus
Date:   Wed, 28 Jul 2021 17:17:38 -0700
Message-Id: <1627517860-39417-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some cases, device may boot straight to the mission mode. The serial number
and OEM PK hash values would remain unpopulated in those cases. Hence, move the
reads for those to the power up preparation phase such that controllers always
have them populated. Also, in order to maintain consistency with the way OEM PK
hash is displayed and improve the current way, depict serial number in
hexadecimals.

Tested on: X86_64 architecture with SDX65 on Ubuntu 18.04 distribution.

v2:
-Fixed nitpick for 0x%x
-Minor update to commit message for "Depict serial number" patch
-Added reviewed-by tags

Bhaumik Bhatt (2):
  bus: mhi: core: Move serial number read to power up phase
  bus: mhi: core: Depict serial number in hexadecimals

 drivers/bus/mhi/core/boot.c | 17 +----------------
 drivers/bus/mhi/core/init.c | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 18 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

