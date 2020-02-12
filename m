Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6487C15A724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 11:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgBLK4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 05:56:39 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:45597 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbgBLK4j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 05:56:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581504998; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=lK9PFYk/scyg7TDWLnox0Xo/iQOLjUX1Z2HtBw6jrpI=; b=SjOnV/Qny3iq0ge72mzCYG/FVZClj9LoDKt9k+frABRHpmOt3cLG1w8oZwJknkk83nw78LWC
 avo8pT2y9v4p/zDZH6YNcfJTkcAIWGSqZ2iIn9aF3E2N0ovF6FYJxRzgHlh8WaJUjgFniLR/
 DYHVXBWkBXwEAb/X2OKNBrEJJQ8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e43d9e6.7efb943c91f0-smtp-out-n02;
 Wed, 12 Feb 2020 10:56:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74597C4479F; Wed, 12 Feb 2020 10:56:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 522FDC43383;
        Wed, 12 Feb 2020 10:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 522FDC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 0/2] Output debug information from RSC
Date:   Wed, 12 Feb 2020 16:26:10 +0530
Message-Id: <1581504972-22632-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently we get only warning for timeouts. There is no
information available on what is leading to timeouts.

This series add changes to print debug information for TCSes
which are currently in use, commands in the TCSes and its status.
Also include interrupt pending status at GIC and completion status.

Lina Iyer (1):
  soc: qcom: rpmh-rsc: Log interrupt status when TCS is busy

Raju P.L.S.S.S.N (1):
  soc: qcom: rpmh-rsc: Output debug information from RSC

 drivers/soc/qcom/rpmh-internal.h |   3 +
 drivers/soc/qcom/rpmh-rsc.c      | 125 ++++++++++++++++++++++++++++++++++++++-
 drivers/soc/qcom/rpmh.c          |  11 +++-
 3 files changed, 134 insertions(+), 5 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
