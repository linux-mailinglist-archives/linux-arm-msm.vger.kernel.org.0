Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71763D9AE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 03:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbhG2BNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 21:13:44 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:56844 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233067AbhG2BNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 21:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1627521222; x=1659057222;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=tKayTa4Fur8gXkrlZH2QDOGstOTksSbXKUYa8mjJuFg=;
  b=wtTSliOVQwVMGc7Wd3oeQkyoaTsEu9QFioBMBSA+CDZPdOgaef6wOWC/
   wSLe4Fbz8cZ54UJ9Koc0YgFVtqBy3yl+p8CEjPfYXgFL9DE0kPn303RXL
   0lUp3EZNwatlKzhToitH3IHXboG/xyWSZcphM/YTsA8UDGb4dMTwRkiSr
   4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Jul 2021 18:13:42 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Jul 2021 18:13:42 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 28 Jul 2021 18:13:40 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [PATCH V1 0/9] A bunch of fix and optimization patches in spmi-pmic-arb.c
Date:   Thu, 29 Jul 2021 09:12:38 +0800
Message-ID: <1627521167-18848-1-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change series includes some fixes and optimizations in spmi-pmic-arb.c.
Please see change detail and description in each of the patch. Thanks!

Abhijeet Dharmapurikar (1):
  spmi: pmic-arb: add a print in cleanup_irq

Ashay Jaiswal (1):
  spmi: pmic-arb: add support to dispatch interrupt based on IRQ status

David Collins (5):
  spmi: pmic-arb: check apid against limits before calling irq handler
  spmi: pmic-arb: correct duplicate APID to PPID mapping logic
  spmi: pmic-arb: block access for invalid PMIC arbiter v5 SPMI writes
  spmi: pmic-arb: make interrupt support optional
  spmi: pmic-arb: increase SPMI transaction timeout delay

Subbaraman Narayanamurthy (1):
  spmi: pmic-arb: do not ack and clear peripheral interrupts in
    cleanup_irq

Yimin Peng (1):
  spmi: pmic-arb: support updating interrupt type flags

 drivers/spmi/spmi-pmic-arb.c | 127 +++++++++++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 36 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

