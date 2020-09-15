Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13079269EEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 08:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgIOG4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 02:56:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52487 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbgIOG4A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 02:56:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600152960; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=389wbN9HcBWxwm7AiWQdM+sHYOyRlMF7VLcCREjszLQ=; b=ENLhaJmgsJd4fT9yaUBim/1TPVe/4LrVFnorGn+Fyg6JSkjt6bXpGfCsu3Jf5rYqpNZsjEBX
 hkXCvvKiQ8w21ZZ5snGl6VmkCAX65tlR3NXSbT5np+BamtgLq+dGeeMhpD3zMpEnylydsund
 5uINS50q6z5Gg7nishp+k6QJGNE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f606568947f606f7ec7816c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 06:55:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D5459C433FE; Tue, 15 Sep 2020 06:55:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFE0AC433C8;
        Tue, 15 Sep 2020 06:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFE0AC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv5 0/2] soc: qcom: llcc: Support chipsets that can write to llcc regs
Date:   Tue, 15 Sep 2020 12:25:24 +0530
Message-Id: <cover.1600151951.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Older chipsets may not be allowed to configure certain LLCC registers
as that is handled by the secure side software. However, this is not
the case for newer chipsets and they must configure these registers
according to the contents of the SCT table, while keeping in mind that
older targets may not have these capabilities. So add support to allow
such configuration of registers to enable capacity based allocation
and power collapse retention for capable chipsets.

Reason for choosing capacity based allocation rather than the default
way based allocation is because capacity based allocation allows more
finer grain partition and provides more flexibility in configuration.
As for the retention through power collapse, it has an advantage where
the cache hits are more when we wake up from power collapse although
it does burn more power but the exact power numbers are not known at
the moment.

Patch 1 is a cleanup to separate out llcc configuration to its own function.
Patch 2 adds support for chipsets capable of writing to llcc registers.

Changes in v5:
 * Move all config from qcom_llcc_cfg_program() (Stephen)
 * Minor code adjustments (Stephen)

Changes in v4:
 * Separate out llcc attribute config to its own function (Stephen)
 * Pass qcom_llcc_config instead of a new llcc_drvdata property (Doug)

Changes in v3:
 * Drop separate table and use existing qcom_llcc_config (Doug)
 * More descriptive commit msg (Doug)
 * Directly set the config instead of '|=' (Doug)

Changes in v2:
 * Fix build errors reported by kernel test robot.

Isaac J. Manjarres (1):
  soc: qcom: llcc: Support chipsets that can write to llcc

Sai Prakash Ranjan (1):
  soc: qcom: llcc: Move llcc configuration to its own function

 drivers/soc/qcom/llcc-qcom.c | 115 +++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 40 deletions(-)


base-commit: a1fb300d3fe5b038f5c436265c7265009016d234
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

