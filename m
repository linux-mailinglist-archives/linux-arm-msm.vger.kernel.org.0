Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC451D8AB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 00:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgERWYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 18:24:04 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:35927 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728281AbgERWYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 18:24:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589840643; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=l2AiwPoRUWb12iTjkfgbugtmaZ2GIkyi5/CVey8i4vc=; b=nMx7NOMN90yR3Q+M5Yv1q99TsRu8xcE6A6WoanpadeYWnuo4qy5KkWN4aD+rdz9+Gy8Cux6K
 NEkd53u5MFl1bEdgLijEIjcmTdlsNcnaYJiwi/9Ad5DJx74HH1hW1FvFFIOhARS2LQaN5aGs
 3vvUly81oBfcvNJB2UAnnFMSZcs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec30af5057563ff398a8355 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 May 2020 22:23:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0ABBC4478C; Mon, 18 May 2020 22:23:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1D6BC433F2;
        Mon, 18 May 2020 22:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1D6BC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 0/3] user space client interface driver
Date:   Mon, 18 May 2020 15:23:36 -0700
Message-Id: <1589840619-18520-1-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI based uci driver is for transferring data between host and
device using standard file operations from user space. Open, read,
write, and close operations are supported by this driver. Currently
LOOPBACK channel is supported.

Hemant Kumar (3):
  bus: mhi: core: Add helper API to return number of free TREs
  bus: mhi: core: Move MHI_MAX_MTU to external header file
  bus: mhi: clients: Add user space client interface driver

 drivers/bus/mhi/Kconfig          |   2 +
 drivers/bus/mhi/Makefile         |   1 +
 drivers/bus/mhi/clients/Kconfig  |  16 +
 drivers/bus/mhi/clients/Makefile |   3 +
 drivers/bus/mhi/clients/uci.c    | 653 +++++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/internal.h  |   1 -
 drivers/bus/mhi/core/main.c      |  12 +
 include/linux/mhi.h              |  12 +
 8 files changed, 699 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bus/mhi/clients/Kconfig
 create mode 100644 drivers/bus/mhi/clients/Makefile
 create mode 100644 drivers/bus/mhi/clients/uci.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

