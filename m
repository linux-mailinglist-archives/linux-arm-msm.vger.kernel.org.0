Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6161D97E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 15:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgESNgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 09:36:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45155 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726504AbgESNgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 09:36:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589895380; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=nOar5s8Y31oO1reXLuX2JVK+mSTXhf2iwsgGtLUlKiU=; b=hJ2+oI5M40jiqd648OpVQCcoGpbDKmveEMOTyRLkdpRE9Rvc8Ya/fdKIMnWw0dOreujIVN2n
 hKgcTv6iLVeZQCx1hmL7mH++4YmVS7dY8kH/boqli7L9BACE7rwqBl0QcWPZkBRKTSBr+TN1
 XBzMy+KWQQcQa/n/sBVakETb3kg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec3e0d4e9d18cd52e5bc1dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 May 2020 13:36:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6CF5FC432C2; Tue, 19 May 2020 13:36:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02DD7C433D2;
        Tue, 19 May 2020 13:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02DD7C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 0/4] Add support for replicators which loses context on clock removal
Date:   Tue, 19 May 2020 19:05:59 +0530
Message-Id: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is mainly to add support for replicators
which lose context on removing AMBA clock like on SC7180
SoC where replicator in AOSS domain loses context.

Patch 1 and 2 are minor cleanups to use macros.
Patch 3 and 4 adds support for replicators which loses
context on removing AMBA clock.

Previous version is here - https://lore.kernel.org/patchwork/patch/1239923/
More discussion is found here - https://lore.kernel.org/patchwork/patch/1231182/
There were no patch 1 and patch 2 in v1.

Sai Prakash Ranjan (4):
  coresight: replicator: Use CS_AMBA_ID macro for id table
  coresight: catu: Use CS_AMBA_ID macro for id table
  coresight: replicator: Reset replicator if context is lost
  dt-bindings: arm: coresight: Add optional property to replicators

 .../devicetree/bindings/arm/coresight.txt     |  6 ++
 drivers/hwtracing/coresight/coresight-catu.c  |  5 +-
 .../coresight/coresight-replicator.c          | 66 +++++++++++--------
 3 files changed, 46 insertions(+), 31 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

