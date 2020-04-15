Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B321AAAE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 16:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371017AbgDOOvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 10:51:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:26998 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S371013AbgDOOvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 10:51:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586962296; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=QRBPrK4+I/ZGGr7woOaqts44CO0Or0LnpyTflypw/WQ=; b=qdEadQwGt98N/G1mhvkkL9hAA4XXWFu90y8vjkcbFrNLYPK5+NxxBgF1Ol/Hrozc6EMlBQ/x
 pxpCjOfv0aBUFsWsrxVwMiiHTvRVbhA8hcqTJBavpnRCFLdhwMzdeV2U8dvubapZ8eU0tAHD
 LODXfx1Z9TFE3kOP7RQ1LjTJHUA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e971f71.7fac36418960-smtp-out-n04;
 Wed, 15 Apr 2020 14:51:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACC62C433BA; Wed, 15 Apr 2020 14:51:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 274E6C433CB;
        Wed, 15 Apr 2020 14:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 274E6C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/2] Drop all accesses to MPSS PERPH register space
Date:   Wed, 15 Apr 2020 20:21:08 +0530
Message-Id: <20200415145110.20624-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

7C retail devices using MSA based boot will result in a fuse combination
which will prevent accesses to MSS PERPH register space where the mpss
clocks and halt-nav reside. Hence requesting a halt-nav as part of the
SSR sequence will result in a NoC error. Issuing HALT NAV request and
turning on the mss clocks as part of SSR will no longer be required
since the modem firmware will have the necessary fixes to ensure that
there are no pending NAV DMA transactions thereby ensuring a smooth
SSR.

Sibi Sankar (2):
  dt-bindings: remoteproc: qcom: Replace halt-nav with spare-regs
  remoteproc: qcom_q6v5_mss: Drop accesses to MPSS PERPH register space

 .../bindings/remoteproc/qcom,q6v5.txt         |  14 +--
 drivers/remoteproc/qcom_q6v5_mss.c            | 102 ++++--------------
 2 files changed, 23 insertions(+), 93 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
