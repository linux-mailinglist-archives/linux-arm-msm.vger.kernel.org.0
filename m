Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3247F51340E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 14:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346507AbiD1MsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 08:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346535AbiD1MsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 08:48:23 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C855B140D0;
        Thu, 28 Apr 2022 05:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651149905; x=1682685905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ccRVKSGd3DwHAGLmQIoh3WD07iqHMOorja7gB3Ael2c=;
  b=fAUEPejboyQWBanvvy+afEENMTANnQD3ZcTHEF7/niIph57wj2IE98z8
   jsWGQ5gGyilQCPt7RI1/s4owlRVt17FZB10ptieMUpWGT9h4ltOKx/kth
   nbu/8OPEpkA8BSToP8uM/aag9JuZFBJnmQVuQHMV3hc+Egu0cVck3P78b
   I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 28 Apr 2022 05:45:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 05:45:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Apr 2022 05:45:04 -0700
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Apr 2022 05:45:00 -0700
From:   Sai Prakash Ranjan <quic_saipraka@quicinc.com>
To:     <arnd@arndb.de>, <catalin.marinas@arm.com>,
        <gregkh@linuxfoundation.org>, <rostedt@goodmis.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, <quic_psodagud@quicinc.com>,
        <quic_tsoni@quicinc.com>, <will@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCHv13 2/9] coresight: etm4x: Use asm-generic IO memory barriers
Date:   Thu, 28 Apr 2022 18:14:05 +0530
Message-ID: <0d76de0ecc0aa7cb01fd8b8863a8e567abd4410b.1651149615.git.quic_saipraka@quicinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1651149615.git.quic_saipraka@quicinc.com>
References: <cover.1651149615.git.quic_saipraka@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per discussion in [1], it was decided to move to using architecture
independent/asm-generic IO memory barriers to have just one set of
them and deprecate use of arm64 specific IO memory barriers in driver
code. So replace current usage of __io_rmb()/__iowmb() in drivers to
__io_ar()/__io_bw().

[1] https://lore.kernel.org/lkml/CAK8P3a0L2tLeF1Q0+0ijUxhGNaw+Z0fyPC1oW6_ELQfn0=i4iw@mail.gmail.com/

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 8 ++++----
 drivers/hwtracing/coresight/coresight-etm4x.h      | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7f416a12000e..81c0faf45b28 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -98,7 +98,7 @@ u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
 	}
 
 	if (!_relaxed)
-		__iormb(res);	/* Imitate the !relaxed I/O helpers */
+		__io_ar(res);	/* Imitate the !relaxed I/O helpers */
 
 	return res;
 }
@@ -106,7 +106,7 @@ u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
 void etm4x_sysreg_write(u64 val, u32 offset, bool _relaxed, bool _64bit)
 {
 	if (!_relaxed)
-		__iowmb();	/* Imitate the !relaxed I/O helpers */
+		__io_bw();	/* Imitate the !relaxed I/O helpers */
 	if (!_64bit)
 		val &= GENMASK(31, 0);
 
@@ -130,7 +130,7 @@ static u64 ete_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
 	}
 
 	if (!_relaxed)
-		__iormb(res);	/* Imitate the !relaxed I/O helpers */
+		__io_ar(res);	/* Imitate the !relaxed I/O helpers */
 
 	return res;
 }
@@ -138,7 +138,7 @@ static u64 ete_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
 static void ete_sysreg_write(u64 val, u32 offset, bool _relaxed, bool _64bit)
 {
 	if (!_relaxed)
-		__iowmb();	/* Imitate the !relaxed I/O helpers */
+		__io_bw();	/* Imitate the !relaxed I/O helpers */
 	if (!_64bit)
 		val &= GENMASK(31, 0);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 3c4d69b096ca..f54698731582 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -448,14 +448,14 @@
 #define etm4x_read32(csa, offset)					\
 	({								\
 		u32 __val = etm4x_relaxed_read32((csa), (offset));	\
-		__iormb(__val);						\
+		__io_ar(__val);						\
 		__val;							\
 	 })
 
 #define etm4x_read64(csa, offset)					\
 	({								\
 		u64 __val = etm4x_relaxed_read64((csa), (offset));	\
-		__iormb(__val);						\
+		__io_ar(__val);						\
 		__val;							\
 	 })
 
@@ -479,13 +479,13 @@
 
 #define etm4x_write32(csa, val, offset)					\
 	do {								\
-		__iowmb();						\
+		__io_bw();						\
 		etm4x_relaxed_write32((csa), (val), (offset));		\
 	} while (0)
 
 #define etm4x_write64(csa, val, offset)					\
 	do {								\
-		__iowmb();						\
+		__io_bw();						\
 		etm4x_relaxed_write64((csa), (val), (offset));		\
 	} while (0)
 
-- 
2.33.1

