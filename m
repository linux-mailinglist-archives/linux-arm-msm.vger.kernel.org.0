Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76555227EED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 13:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgGULaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 07:30:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27595 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729826AbgGULaV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 07:30:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595331021; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=rKKlxqT2ko2tBZKpFrGAz2gxJrje2QjuLJxXdPndRiY=; b=i/qTbQpTwIpkvoHgwOsFLQ8hdouCN9srjmuuXypd9AaGhziU1Rmy8HJPL60n3KXIGceUAjGc
 StLhXpcKOdSiHv4TTTaz1Qfe3SE8+gH/1I0eGBt6B3ZIhGMiymXFBk4U1o25eLKwIRicfTEe
 hMkEFqhPqb/bUwmhMfgGkpWngys=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f16d1b17c8ca473a8872a35 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 11:29:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2713C433CB; Tue, 21 Jul 2020 11:29:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33061C433C6;
        Tue, 21 Jul 2020 11:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33061C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Add modem debug features
Date:   Tue, 21 Jul 2020 16:59:33 +0530
Message-Id: <20200721112935.25716-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds support for the following modem debug features:
 * Modem debug policy which enables coredumps/live debug on secure devices
 * MBA text logs extraction on SC7180 SoCs

V2:
 * Use request_firmware_direct [Bjorn]
 * Use Bjorn's template to show if debug policy is present
 * Add size check to prevent memcpy out of bounds [Bjorn]
 * Don't dump logs in mba_reclaim path [Bjorn]
 * Move has_mba_logs check to q6v5_dump_mba_logs [Bjorn]
 * SDM845 mss was incorrectly marked to support mba logs
 * Drop patch 3 where mba text logs are added to imem for now

Sibi Sankar (2):
  remoteproc: qcom_q6v5_mss: Add modem debug policy support
  remoteproc: qcom_q6v5_mss: Add MBA log extraction support

 drivers/remoteproc/qcom_q6v5_mss.c | 54 ++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

