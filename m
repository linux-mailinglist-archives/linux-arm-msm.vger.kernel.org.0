Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE66165A06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 10:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgBTJVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 04:21:36 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:54024 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726799AbgBTJVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 04:21:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582190493; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=dhe4B0dkTt3o0wEmiBXq3W/0qsFNC1MylHSP57FFsW0=; b=CNL7p2Q8eSw72Sud90V6OWbDnu3IYuXJUFt+Vb/U7fG/Biq5kdEQuzCgS6gl7pT2BYDBEByt
 NHeDQ6BC44Vz2ARlNexPxqza9WDZYQ3hIBedO1bcedI9rCVGeaYakT1lDWcNF8lPWQ50feQX
 xhZ4EziyHWMvW4dAzL8o9NVsekc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4e4f9c.7f138f12c148-smtp-out-n03;
 Thu, 20 Feb 2020 09:21:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F113BC447A0; Thu, 20 Feb 2020 09:21:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sayalil-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sayalil)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF827C43383;
        Thu, 20 Feb 2020 09:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CF827C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sayalil@codeaurora.org
From:   Sayali Lokhande <sayalil@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        ppvk@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Sayali Lokhande <sayalil@codeaurora.org>
Subject: [PATCH RFC] Toggle fifo write clk after ungating sdcc clk
Date:   Thu, 20 Feb 2020 14:50:45 +0530
Message-Id: <1582190446-4778-1-git-send-email-sayalil@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During GCC level clock gating of MCLK, the async FIFO
gets into some hang condition, such that for the next
transfer after MCLK ungating, first bit of CMD response
doesn't get written in to the FIFO. This cause the CPSM
to hang eventually leading to SW timeout.

To fix the issue, toggle the FIFO write clock after
MCLK ungated to get the FIFO pointers and flags to
valid states.

Ram Prakash Gupta (1):
  mmc: sdhci-msm: Toggle fifo write clk after ungating sdcc clk

 drivers/mmc/host/sdhci-msm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
