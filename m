Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C9C29CB0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 22:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373704AbgJ0VQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 17:16:33 -0400
Received: from z5.mailgun.us ([104.130.96.5]:36296 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S373557AbgJ0VQc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 17:16:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603833392; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=1IAAZO+JxIM064yeTBlbAYAX6R/5t+b3oS0O5W5n3sw=; b=GWYOMsggKu61zeLXu5dKKS+cXUFAcOVO6WEXrot6tSBAUxKq4lXtFrGQKVO7s6t5o8fYS0YJ
 AZFoP+bm4IfJwv+OSoY2jhZcOPRwX/5a5Ut0Zaqa+wHkF9LBwzfDave4l6PSRXlPsB95FKuG
 WMHsLefxHNgcCEBauFsM0ZmIYgk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f988dfa807e82a153ea9f02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 21:15:38
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CAAAC433F0; Tue, 27 Oct 2020 21:15:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87251C433CB;
        Tue, 27 Oct 2020 21:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87251C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 27 Oct 2020 15:15:36 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mkshah@codeaurora.org
Subject: Re: [PATCH] soc: qcom: QCOM_RPMH fix build with modular QCOM_RPMH
Message-ID: <20201027211536.GB19979@codeaurora.org>
References: <20201027111422.4008114-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201027111422.4008114-1-anders.roxell@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Anders,

On Tue, Oct 27 2020 at 05:14 -0600, Anders Roxell wrote:
>When building allmodconfig leading to the following link error with
>CONFIG_QCOM_RPMH=y and CONFIG_QCOM_COMMAND_DB=m:
>
>aarch64-linux-gnu-ld: drivers/clk/qcom/clk-rpmh.o: in function `clk_rpmh_probe':
>  drivers/clk/qcom/clk-rpmh.c:474: undefined reference to `cmd_db_read_addr'
>  drivers/clk/qcom/clk-rpmh.c:474:(.text+0x254): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `cmd_db_read_addr'
>
>Fix this by adding a Kconfig depenency and forcing QCOM_RPMH to be a
>module when QCOM_COMMAND_DB is a module. Also removing the dependency on
>'ARCH_QCOM || COMPILE_TEST' since that is already a dependency for
>QCOM_COMMAND_DB.
>
>Fixes: 778279f4f5e4 ("soc: qcom: cmd-db: allow loading as a module")
>Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>---
> drivers/soc/qcom/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>index 9b4ae9c16ba7..3bdd1604f78f 100644
>--- a/drivers/soc/qcom/Kconfig
>+++ b/drivers/soc/qcom/Kconfig
>@@ -109,7 +109,7 @@ config QCOM_RMTFS_MEM
>
> config QCOM_RPMH
> 	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
>-	depends on ARCH_QCOM || COMPILE_TEST
>+	depends on QCOM_COMMAND_DB
A solution was posted in the mailing list alredy -
https://lore.kernel.org/linux-arm-msm/20201008040907.7036-1-ilina@codeaurora.org/

If you get a chance, please give that a shot to see if that works for
you.

Thanks,
Lina

> 	help
> 	  Support for communication with the hardened-RPM blocks in
> 	  Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
>-- 
>2.28.0
>
