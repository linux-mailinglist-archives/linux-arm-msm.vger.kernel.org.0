Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2881A1073F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 15:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfKVOSA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 09:18:00 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:40230
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbfKVOSA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 09:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574432279;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=8XfuQWbcY42hnXPs38p0Oavut24Cz7C+fYJw4Ril++Y=;
        b=LVdbrzDeuRkvH48vyv7TdhGbQWaL2Tquoygihbt1lAsljhMWLwNaOLFQ94hLBVHr
        3KgRlKp49S6HiGRgTeByblf7mh1rWSltjAQNs5m/rPv7h2ne9cfjOtCVsO3doxJ3XEa
        oAu6b+xpbTX9o5p2uV4hKwMCgynIoXWGKWQPWklE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574432279;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=8XfuQWbcY42hnXPs38p0Oavut24Cz7C+fYJw4Ril++Y=;
        b=Xr7o7le2wi6No64ag0e0Nl1blwH9f6/WvbhWB1m1IwFQa3vJBSIs4BUaEJB4X+FX
        fTEV5DUirby+FFEyWxhICK+MnHyUMWRI3vb3Qx3KPjgiacBVT49DhIzpYkQpoY50NSr
        zI8/iO4EBgqa2I7BSnRMgD4jTzNVBBlxY6nHshx8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FC08C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v6 0/5] Add wakeup support and move loopback to TIOCM_LOOP
Date:   Fri, 22 Nov 2019 14:17:59 +0000
Message-ID: <0101016e937a0ac1-9755c367-175c-4363-b642-19646a649b58-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.11.22-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds wakeup support over UART RX line and moves loopback
support to TIOCM_LOOP.
Patch 1 & 2 reverts the V2 changes for wakeup support on tty-next tip.
Patch 3 & 4 adds V6 changes for wakeup support.

Akash Asthana (5):
  Revert "tty: serial: qcom_geni_serial: Wakeup over UART RX"
  Revert "tty: serial: qcom_geni_serial: IRQ cleanup"
  tty: serial: qcom_geni_serial: IRQ cleanup
  tty: serial: qcom_geni_serial: Wakeup over UART RX
  tty: serial: qcom_geni_serial: Move loopback support to TIOCM_LOOP

 drivers/tty/serial/qcom_geni_serial.c | 124 ++++++++++++++--------------------
 1 file changed, 51 insertions(+), 73 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

