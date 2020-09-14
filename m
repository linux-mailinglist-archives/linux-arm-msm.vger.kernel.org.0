Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53B692689CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 13:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgINLNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 07:13:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37979 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbgINLNe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 07:13:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600082014; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=/yMlfJNEm+xEntTDHJwxA8p6C+/uqgHLYnuIJrcUhJs=; b=RZ76RXeeT0B+rJ7UsWFAxTR0qD5RVqVw90In2gThIzptsZSHu/51M+Bz94R+V1fNe7sPm6Nb
 aF5JxizSUhtaV9FKgeD5IzHsGF/xqQXwxJam0xGLdpNU+VXnMTtFVYwZLUK9oQbbpsRx7njg
 BAG7w/Vw23svYbafsEu51UN/UhA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f5f5053252c522440f997b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 11:13:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75AEBC433C8; Mon, 14 Sep 2020 11:13:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C41FC433C8;
        Mon, 14 Sep 2020 11:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C41FC433C8
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
Subject: [PATCHv4 0/2] soc: qcom: llcc: Support chipsets that can write to llcc regs
Date:   Mon, 14 Sep 2020 16:42:58 +0530
Message-Id: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org>
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

Patch 1 is a cleanup to separate out llcc attribute configuration to
its own function.
Patch 2 adds support for chipsets capable of writing to llcc registers.

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
  soc: qcom: llcc: Move attribute config to its own function

 drivers/soc/qcom/llcc-qcom.c | 100 +++++++++++++++++++++++------------
 1 file changed, 65 insertions(+), 35 deletions(-)


base-commit: 75894849c81ab9a2e9df2e8cf2f9c52035cd22a0
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

