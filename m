Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE8B11313F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 15:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgAFOpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 09:45:32 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:14166 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726437AbgAFOpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 09:45:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578321931; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x8gONy2C4+fbyz/VyW30XZNbdmrWofZ8pKSWlob8XCQ=; b=DQ/P4EnVCQCtzdJW+mo9g/Ud8xbtQUktzCnwHv+ioPmmAwUtLGozh7VeMjPRzkxu/KZWynAb
 7NS848SfsSv5UgJAtyTe5q2cxCTXZA5raMIHsHg3+wRt6HZxa2NGZFnmJsCgrjtzLeUA0WM8
 7lzkIbJUNN0RkLXZtL/Tx6QRcOg=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e134806.7f5f2625d1b8-smtp-out-n03;
 Mon, 06 Jan 2020 14:45:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1FB85C447AA; Mon,  6 Jan 2020 14:45:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC507C447A1;
        Mon,  6 Jan 2020 14:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC507C447A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V8 0/2] Cleanup wakeup IRQ and move loopback to TIOCM_LOOP
Date:   Mon,  6 Jan 2020 20:15:03 +0530
Message-Id: <1578321905-25843-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v8:
 - Resending v7 patches after rebasing it to tty-next tip.

Changes in v7:
 - Updates cover letter subject.
 - As per stephen's comment fix wakeup patches that are already merged to
   tty-next instead on reverting them.

Patch v6 link:
 - https://patchwork.kernel.org/cover/11258043/

Akash Asthana (2):
  tty: serial: qcom_geni_serial: Wakeup IRQ cleanup
  tty: serial: qcom_geni_serial: Move loopback support to TIOCM_LOOP

 drivers/tty/serial/qcom_geni_serial.c | 123 ++++++++++++++--------------------
 1 file changed, 50 insertions(+), 73 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
