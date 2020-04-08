Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 139F91A234F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgDHNrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:47:15 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45503 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728923AbgDHNrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:47:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353634; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1Y++K4WB/kF2UdizTkmAe3UA5V4faKWJYUH64ZBkay8=; b=LLRv/4aDP0RgAqUSKxfTv3yq4OXeA7d1aLpXztxpJvMpd2bX/eeh5fxuFk/kSQ0NV6DlJ5K3
 MfhSm3eAcpIdQOf9X6jY8IU9mRCC5IpYBtlU6r9c/FwDASU2r6kRO5w/eQP/7u5zYWH7GJZs
 AW0DxHm/WnbrUHAyG0snL0Qkjf8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd5e2.7fe1d98df2d0-smtp-out-n04;
 Wed, 08 Apr 2020 13:47:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5010C433D2; Wed,  8 Apr 2020 13:47:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EFB2C43637;
        Wed,  8 Apr 2020 13:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0EFB2C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 01/21] opp: Manage empty OPP tables with clk handle
Date:   Wed,  8 Apr 2020 19:16:27 +0530
Message-Id: <1586353607-32222-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With OPP core now supporting DVFS for IO devices, we have instances of
IO devices (same IP block) which require an OPP on some platforms/SoCs
while just needing to scale the clock on some others.

In order to avoid conditional code in every driver which supports such
devices (to check for availability of OPPs and then deciding to do
either dev_pm_opp_set_rate() or clk_set_rate()) add support to manage
empty OPP tables with a clk handle.

This makes dev_pm_opp_set_rate() equivalent of a clk_set_rate() for
devices with just a clk and no OPPs specified, and makes
dev_pm_opp_set_rate(0) bail out without throwing an error.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/opp/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index ba43e6a..e4f01e7 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -819,6 +819,8 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
 	if (unlikely(!target_freq)) {
 		if (opp_table->required_opp_tables) {
 			ret = _set_required_opps(dev, opp_table, NULL);
+		} else if (!_get_opp_count(opp_table)) {
+			return 0;
 		} else {
 			dev_err(dev, "target frequency can't be 0\n");
 			ret = -EINVAL;
@@ -849,6 +851,18 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
 		goto put_opp_table;
 	}
 
+	/*
+	 * For IO devices which require an OPP on some platforms/SoCs
+	 * while just needing to scale the clock on some others
+	 * we look for empty OPP tables with just a clock handle and
+	 * scale only the clk. This makes dev_pm_opp_set_rate()
+	 * equivalent to a clk_set_rate()
+	 */
+	if (!_get_opp_count(opp_table)) {
+		ret = _generic_set_opp_clk_only(dev, clk, freq);
+		goto put_opp_table;
+	}
+
 	temp_freq = old_freq;
 	old_opp = _find_freq_ceil(opp_table, &temp_freq);
 	if (IS_ERR(old_opp)) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
