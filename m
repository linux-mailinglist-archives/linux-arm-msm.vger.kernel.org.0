Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303FB40F25C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbhIQGee (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:34:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60418 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbhIQGee (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631860392; x=1663396392;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=vaJo/3lQdjAPiKiQNJktpgWEtr6D4ST2XKIiQTG6noY=;
  b=dtuHXMhMtUgzqaanhuLq96JihYwtjytkuYOzj1u8GIFj+4D+EZPSpvDD
   4vAWXga/1kyyreK96zDLaXlitfhqZ7Lb8VAvceANvOWAu+D46ikjF08DE
   ing8i/kxMjVnWOLQFrdOSX8m7PwKO2GlIiwZF0ONxUOoKQBlTBBdBVvIn
   Q=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2021 23:33:12 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 23:33:12 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 16 Sep 2021 23:33:09 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [RESEND PATCH v1 0/9] A bunch of fix and optimization patches in spmi-pmic-arb.c
Date:   Fri, 17 Sep 2021 14:32:55 +0800
Message-ID: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Just want to resend the series of the changes again and see if anyone can
help to review them and give any comments. Thanks!

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
2.7.4

