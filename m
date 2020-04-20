Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EDD1B0171
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 08:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgDTGU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 02:20:58 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41424 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbgDTGU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 02:20:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587363657; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TVKNHQnb5r6KRYTza9DhApjLU9yzE6QtVadiD8mE444=; b=fUkN6fe2zTAtUlnMlTaVEgBbk6MMhMJ2/xkT6ZN0VWzYkLUsXS9S0RRG+VIvJsx0nNxOWx9X
 5PgGArl8J4dnzuEW7e+44yypgMKt+XmjnWbPQBAidEYwymm14U9qPFe3/xoPkHGuenE6PSOY
 aX9vHQkbSXunUsdz87xOpCoYOdM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9d3f39.7fea453a9148-smtp-out-n03;
 Mon, 20 Apr 2020 06:20:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B5E07C433BA; Mon, 20 Apr 2020 06:20:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95814C433D2;
        Mon, 20 Apr 2020 06:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95814C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V2 0/3] Minor fixes to sdhci-msm 
Date:   Mon, 20 Apr 2020 11:50:22 +0530
Message-Id: <1587363626-20413-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable a couple of CAPS that qcom sd host controller supports.
Set a quirk for enabling support for auto cmd12.
And enable adma length mismatch error interrupt.

--
V1: https://lore.kernel.org/linux-arm-msm/1586706808-27337-1-git-send-email-vbadigan@codeaurora.org
Changes since V1:
	Squashed two caps related patches and appiled stable tag.
	
Veerabhadrarao Badiganti (3):
  mmc: sdhci-msm: Enable host capabilities pertains to R1b response
  mmc: sdhci-msm: Set SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12 quirk
  mmc: sdhci-msm: Enable ADMA length mismatch error interrupt

 drivers/mmc/host/sdhci-msm.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
