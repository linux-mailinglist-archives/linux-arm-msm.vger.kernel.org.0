Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19A6E13102B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 11:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgAFKS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 05:18:57 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:49177 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726173AbgAFKS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 05:18:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578305936; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rFGBZ87fosedu6QgWERjhftd9fNtWdiGCpLSWREmmQs=; b=N/mg2diVH3Sr0Xd2gvtxqiResyj7yefjfVH8VCqgzWnTOn/jk46rCvB2+LNhvIRFpXviRZgQ
 WlYFjwepWEVf2/ZSeYBN+xEXkwQxCT9K6N97sxcCYoptEIe6V5PMjJvtMvJLWTD9MdtQBGSF
 Mreb9klnf8xgeuVfNVIus2F+xPw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e130990.7f3279e67dc0-smtp-out-n03;
 Mon, 06 Jan 2020 10:18:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CD687C4479C; Mon,  6 Jan 2020 10:18:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B8BFC43383;
        Mon,  6 Jan 2020 10:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B8BFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/2] Add support for IPA clock for SC7180
Date:   Mon,  6 Jan 2020 15:48:41 +0530
Message-Id: <1578305923-29125-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[v2]
 * After register clk_hw::init is NULL, save off the name before registering.

[v1]
 * Support IPA clock for SC7180 and also handle undefined clock registration
   in clk-rpmh driver.

Taniya Das (2):
  clk: qcom: rpmh: skip undefined clocks when registering
  clk: qcom: rpmh: Add IPA clock for SC7180

 drivers/clk/qcom/clk-rpmh.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
