Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572841E9FB3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 10:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgFAICl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 04:02:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63795 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726056AbgFAICl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 04:02:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590998560; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=QypYSAs8Ta9l+Bx4xqnzKMKsvyZ+pwykAsRMDRfZK+A=; b=j/9UfkfLV/QucgdAlnKBmbENpnxzmk2iCXEagieodD70HW5oGUvD182RdInuzxeJ2cfn7heC
 6s2t6CVhRvJ0kJjuV7FTDFuL5Fa0oiy/JO+9TTm4w+apaIO9dKq9UXk3KopRGf7sfOoKaUoM
 TZ4lWD9IhLnJxT6afuEOI+2sdtg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ed4b61f2c549984755ee8e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Jun 2020 08:02:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A51B9C433A1; Mon,  1 Jun 2020 08:02:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 620CEC43387;
        Mon,  1 Jun 2020 08:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 620CEC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
Date:   Mon,  1 Jun 2020 13:32:24 +0530
Message-Id: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds a shutdown callback to TMC ETR/ETF to ensure that
it is properly shutdown in reboot/shutdown path. This is required
for ETR/ETF which has SMMU address translation enabled like on SC7180
SoC and few others. If the hardware is still accessing memory after
SMMU translation is disabled as part of SMMU shutdown callback in
system reboot or shutdown path, then IOVAs(I/O virtual address)
which it was using will go on the bus as the physical addresses which
might result in unknown crashes (NoC/interconnect errors). So we make
sure from this shutdown callback that the ETR/ETF is shutdown before
SMMU translation is disabled and device_link in SMMU driver will take
care of ordering of shutdown callbacks such that SMMU shutdown callback
is not called before any of its consumer shutdown callbacks.

Sai Prakash Ranjan (2):
  coresight: tmc: Add enable flag to indicate the status of ETR/ETF
  coresight: tmc: Add shutdown callback for TMC ETR/ETF

 .../hwtracing/coresight/coresight-tmc-etf.c   |  4 +--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  2 +-
 drivers/hwtracing/coresight/coresight-tmc.c   | 31 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  5 +++
 4 files changed, 39 insertions(+), 3 deletions(-)


base-commit: 059e38815950dbec65beafe03757bce9436e89a4
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

