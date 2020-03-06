Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF5517BFE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 15:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCFOJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 09:09:30 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:21560 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbgCFOJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 09:09:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583503769; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=l8NStaZa70eykua8tiYXL4ZUFmoEHjzIU8oKlS6RXKs=; b=eMt5c/PBV50fPjj+SnBWQK+kZyEO4lo0dtpfgUCzypNvnJMK4pjqg0iFsCPXCzx6i8UsX7Oy
 XX6ZcXokikvtffcmc6B5JSnSt4LwJl0j3M7hsaImH1zgRunZOwoJWfgm02GKcbkqhXFu5GlU
 fTKsWIM4geIm1sG7t4AAE2KRtJE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e625984.7f82f1727458-smtp-out-n04;
 Fri, 06 Mar 2020 14:09:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62B78C432C2; Fri,  6 Mar 2020 14:09:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C81ACC433F2;
        Fri,  6 Mar 2020 14:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C81ACC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V3 0/2] Deactivate CQE during SDHC reset
Date:   Fri,  6 Mar 2020 19:38:41 +0530
Message-Id: <1583503724-13943-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
References: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Host controllers can reset CQHCI either directly or as a consequence
of host controller reset. In the later case, driver should deactivate
CQHCI just before reset to puts the CQHCI driver into a state that is
consistent with that h/w state.

Changes sicne V2:
	- Added support cqhci_deactivate()
	- Use cqhci_deactivate() instead of cqhci_disable().
	- Deactivate CQCHI just before SDHC reset.

Changes since V1:
	- Disable CQE only when SDHC undergoes s/w reset for all.

Adrian Hunter (1):
  mmc: cqhci: Add cqhci_deactivate()

Veerabhadrarao Badiganti (1):
  mmc: sdhci-msm: Deactivate CQE during SDHC reset

 drivers/mmc/host/cqhci.c     | 6 +++---
 drivers/mmc/host/cqhci.h     | 6 +++++-
 drivers/mmc/host/sdhci-msm.c | 9 ++++++++-
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
