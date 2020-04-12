Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFD11A5F44
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 18:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbgDLQAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 12:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:47416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgDLQAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 12:00:06 -0400
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info [104.130.122.27])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 6E6A3C02A1AD
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2020 08:54:07 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586706848; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=JNwr0CYpXlkkkH3QmBGoB9z4dUS/S2kpKt/5/ceO538=; b=n0or81cqP7l7pbeAlAFT2RfGVyJrF2jJRjHzVAoU0TQ/iMgryWykc/aDy6xJ0TexKt422IGg
 PPAsawcpS4X/2ICZBl89FrpVVptSeUxNcYF4RJocWDJTYm9OwUPraQWF2F9Gy4qB3T4oZJSs
 1EF8Vq425PJvH1e4mVJIFhA6GtU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e93399a.7ff158e6bd88-smtp-out-n02;
 Sun, 12 Apr 2020 15:54:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A268C43636; Sun, 12 Apr 2020 15:54:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 305C7C433CB;
        Sun, 12 Apr 2020 15:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 305C7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V1 0/4] Minor fixes to sdhci-msm 
Date:   Sun, 12 Apr 2020 21:23:24 +0530
Message-Id: <1586706808-27337-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable a couple of CAPS that qcom sd host controller supports.
Set a quirk for enabling support for auto cmd12.
And enable adma length mismatch error interrupt.

Veerabhadrarao Badiganti (4):
  mmc: sdhci-msm: Enable MMC_CAP_WAIT_WHILE_BUSY host capability
  mmc: sdhci-msm: Enable MMC_CAP_NEED_RSP_BUSY host capability
  mmc: sdhci-msm: Set SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12 quirk
  mmc: sdhci-msm: Enable ADMA length mismatch error interrupt

 drivers/mmc/host/sdhci-msm.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
