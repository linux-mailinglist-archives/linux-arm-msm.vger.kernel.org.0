Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03528286D78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 06:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgJHEJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 00:09:17 -0400
Received: from z5.mailgun.us ([104.130.96.5]:26175 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgJHEJR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 00:09:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602130156; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=/Nl4eTAk46crd/XKiTMXEvUgxbuvDfI0Kio+bbBaoxs=; b=Q98yOJigK827FPdQxI26DzhFuOA2x4GFeRqmoGan4q5Vu1zPDK+WSI5rMiL3rUh+nGEyaPd6
 UXQuQvgkdAD7FB+roXmOqoiVcKznPPnB/yKikuEjqjwN9pVDLa4ui/yXQQEpI+D88KQlPYp6
 3qYS26I1Az3jdCobASAaAHlp2HU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f7e90ec83370fa1c166b992 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 04:09:16
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14D06C433CB; Thu,  8 Oct 2020 04:09:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC06AC433CA;
        Thu,  8 Oct 2020 04:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC06AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        John Stultz <john.stultz@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] soc: qcom: Kconfig: make RPMH match Command DB setting
Date:   Wed,  7 Oct 2020 22:09:07 -0600
Message-Id: <20201008040907.7036-1-ilina@codeaurora.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPMH and drivers that use RPMH APIs need Command DB API to find the
dynamic resource information. Let's match the RPMH to match the Command
DB configuration.

This should fix undefined symbol references reported by CI :

   aarch64-linux-ld: drivers/clk/qcom/clk-rpmh.o: in function `clk_rpmh_probe':
>> clk-rpmh.c:(.text+0xac): undefined reference to `cmd_db_read_addr'
>> aarch64-linux-ld: clk-rpmh.c:(.text+0xc0): undefined reference to `cmd_db_read_aux_data'
   aarch64-linux-ld: drivers/soc/qcom/rpmh-rsc.o: in function `rpmh_rsc_probe':
>> rpmh-rsc.c:(.text+0x42c): undefined reference to `cmd_db_ready'
   aarch64-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_probe':
>> qcom-rpmh-regulator.c:(.text+0x3e0): undefined reference to `cmd_db_read_addr'

Cc: Todd Kjos <tkjos@google.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index e2b8427af84c..49875cd25a12 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -94,6 +94,7 @@ config QCOM_RMTFS_MEM
 config QCOM_RPMH
 	bool "Qualcomm RPM-Hardened (RPMH) Communication"
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on (QCOM_COMMAND_DB || !QCOM_COMMAND_DB)
 	help
 	  Support for communication with the hardened-RPM blocks in
 	  Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

