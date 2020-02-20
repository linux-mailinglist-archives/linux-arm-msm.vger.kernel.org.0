Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA1361654D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 03:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgBTCME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 21:12:04 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:29724 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727280AbgBTCMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 21:12:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582164723; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=krljadlfWUlVstbceTJH6Iska/S9qoO8kda4t3UJPeQ=; b=J3k/adXH/sBhvIiVkbrTS64wFLfrs7G33j2fUEKqS9ndpG2BR0Q/qzgcpBzF3AOWB4X0X0qd
 p1/0DPcqHKq5jodXO0n+2BkiCObSbpmkK9OM3vgJChMx0L4Ip7A48+CwCdn3KUtNOaRPcmIr
 fHVb9VGdw1drvECuHKFdM0QPkS8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4deaf1.7f4a24e26ed8-smtp-out-n03;
 Thu, 20 Feb 2020 02:12:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A08BC4479C; Thu, 20 Feb 2020 02:12:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B788AC43383;
        Thu, 20 Feb 2020 02:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B788AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: [PATCH 0/2] remoteproc: core: Add core functionality to the remoteproc framework
Date:   Wed, 19 Feb 2020 18:11:51 -0800
Message-Id: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds core functionality to the remoteproc framework.

Patch 1 adds a new API to the framework which allows kernel clients to update
        the firmware name for the specified remoteproc.
Patch 2 intends to improve the user experience by preventing the system from
        going to sleep while the remoteproc is recovering from a crash.

Siddharth Gupta (2):
  remoteproc: core: Add an API for booting with firmware name
  remoteproc: core: Prevent sleep when rproc crashes

 drivers/remoteproc/remoteproc_core.c | 38 ++++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 2 files changed, 39 insertions(+)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
