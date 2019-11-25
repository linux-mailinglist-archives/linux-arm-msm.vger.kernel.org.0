Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B59261090BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 16:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfKYPIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 10:08:46 -0500
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185]:45394
        "EHLO a27-185.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727758AbfKYPIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 10:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574694525;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=xv/TNlWmA2y2SPcHyiu3rDDxey8UutaDYWd3GUnSU00=;
        b=RajgzaqdJQFVoy6ofuvndtXnXvB3/SRiyIGSC5na+CTtDDLLrKXLDEVdyqcSpwig
        lHLGhnTB7OskrRkJaeCJIuAJd2jDuT1kidspQ0tHoOTQatksc4d2FyBi88/sedKorLU
        Odd7rmyqZ5SvwsBBnmkgoYU0jBR9j1kt09OW3pLQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574694525;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=xv/TNlWmA2y2SPcHyiu3rDDxey8UutaDYWd3GUnSU00=;
        b=bmpoPVPou2JRYqX/mqtCUP3enlgU6WZC+WplssbncIXZsZDXBzN7d6yeY46MdOCe
        4Xyg+yHJiRsTfazu6s7toTWi6m4MJlbaSYdnp9nG9mhIQnn6W97uL40t32x75Tusd4h
        DBHrasIFTgxessSTG4m9x6QMQxe0M9Po+zAzzqc0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2D86C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V7 0/2] Cleanup wakeup IRQ and move loopback to TIOCM_LOOP
Date:   Mon, 25 Nov 2019 15:08:45 +0000
Message-ID: <0101016ea31b99f6-80b8f04b-0d23-4801-a67c-b4f7641d16ca-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.11.25-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

