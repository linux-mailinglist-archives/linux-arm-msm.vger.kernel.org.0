Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32AF397DD4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 03:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhFBBCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 21:02:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2937 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbhFBBCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 21:02:38 -0400
Received: from dggeme759-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FvrH83b6jz68yt;
        Wed,  2 Jun 2021 08:57:56 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:00:53 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <will@kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mark.rutland@arm.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH 0/2] move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 2 Jun 2021 09:00:40 +0800
Message-ID: <1622595642-61678-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

patch #1 and #2 both use IRQF_NO_AUTOEN instead of
irq_set_status_flags(irq, IRQ_NOAUTOEN). this change is just to simplify
the code, no actual functional changes.

Tian Tao (2):
  arm_pmu: move to use request_irq by IRQF_NO_AUTOEN flag
  perf: qcom_l2_pmu: move to use request_irq by IRQF_NO_AUTOEN flag

 drivers/perf/arm_pmu.c     | 4 +---
 drivers/perf/qcom_l2_pmu.c | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.7.4

