Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBEF46C1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 23:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfFNVr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 17:47:56 -0400
Received: from merlin.infradead.org ([205.233.59.134]:44734 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfFNVr4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 17:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wzC8vZgSSQGb7hN6P1xIMe6bYH9lHcYisu8r8AFK2H8=; b=GLuFpb0BZX74mB1qgZFze5uUYQ
        3P8Du3lWi/2YkIOnz2jLM1PhWDDThgyCfbZCBTrIwj4W5wwp3xpyme/BPDgRAUuk+Ifmi2KYbzQHR
        abY1CjdU2lhhmdaUMVvIMujYE3Y2W9DABEs1YysMaOjiLvNEU2sITk0nceFSoLVO5uJ9Gs9dxwGIR
        zLkkNMVFYmHRAcuhK4EXNfEDi+Jifq/dcKtMwqUeTn2b/f7SH1tsAY88np4aVK6HCXuvNgMhALdyN
        PkClyOQ8Oez3rHrfOSR2uJFB4OBBwBXWlhQpAMuNVejBsNjblJ/tWPSfSWmnnbVgR07pe9wg0ubWv
        xRZjSAVw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hbu35-0004Jy-1t; Fri, 14 Jun 2019 21:47:51 +0000
To:     LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@sonymobile.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] soc: qcom: fix QCOM_AOSS_QMP dependency and build
 errors
Message-ID: <6d97f8dc-f980-7825-4aa6-27f56b25bc3a@infradead.org>
Date:   Fri, 14 Jun 2019 14:47:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix Kconfig warning and subsequent build errors that are caused
when PM_GENERIC_DOMAINS=y but CONFIG_PM is not set/enabled.

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
  Depends on [n]: PM [=n]
  Selected by [m]:
  - QCOM_AOSS_QMP [=m] && (ARCH_QCOM || COMPILE_TEST [=y]) && MAILBOX [=y] && COMMON_CLK [=y]

Fixes these build errors:

../drivers/base/power/domain.c: In function ‘genpd_queue_power_off_work’:
../drivers/base/power/domain.c:485:13: error: ‘pm_wq’ undeclared (first use in this function)
  queue_work(pm_wq, &genpd->power_off_work);
../drivers/base/power/domain.c:485:13: note: each undeclared identifier is reported only once for each function it appears in
../drivers/base/power/domain.c: In function ‘genpd_dev_pm_qos_notifier’:
../drivers/base/power/domain.c:675:25: error: ‘struct dev_pm_info’ has no member named ‘ignore_children’
   if (!dev || dev->power.ignore_children)
../drivers/base/power/domain.c: In function ‘rtpm_status_str’:
../drivers/base/power/domain.c:2754:16: error: ‘struct dev_pm_info’ has no member named ‘runtime_error’
  if (dev->power.runtime_error)
../drivers/base/power/domain.c:2756:21: error: ‘struct dev_pm_info’ has no member named ‘disable_depth’
  else if (dev->power.disable_depth)
../drivers/base/power/domain.c:2758:21: error: ‘struct dev_pm_info’ has no member named ‘runtime_status’
  else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
../drivers/base/power/domain.c:2759:31: error: ‘struct dev_pm_info’ has no member named ‘runtime_status’
   p = status_lookup[dev->power.runtime_status];
../drivers/base/power/domain_governor.c: In function ‘default_suspend_ok’:
../drivers/base/power/domain_governor.c:82:17: error: ‘struct dev_pm_info’ has no member named ‘ignore_children’

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>
---
 drivers/soc/qcom/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20190614.orig/drivers/soc/qcom/Kconfig
+++ linux-next-20190614/drivers/soc/qcom/Kconfig
@@ -8,7 +8,7 @@ config QCOM_AOSS_QMP
 	tristate "Qualcomm AOSS Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on MAILBOX
-	depends on COMMON_CLK
+	depends on COMMON_CLK && PM
 	select PM_GENERIC_DOMAINS
 	help
 	  This driver provides the means of communicating with and controlling


