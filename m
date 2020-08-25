Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD9C251765
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 13:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgHYLWN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 07:22:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44923 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729980AbgHYLWK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 07:22:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598354525; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QzJW5IGi7tUidzegrhSxBUwlnb7Le2r6WQY991VeXds=; b=mr5PLg4u1WWRqKfVdXaI8EwTFje8Iu+BeaTFqMMFmV6Sx7tRA/J3ev7D8O7Nql6/KSRoiZAh
 huBk4RzMuOpCMJDLP0vhoYpWQm5ZRNoQpwvZx4KOTR6gmpgaS9raBnNMdbaImDjAnQCw8mRE
 SX1OXBBklwKLjm/MTIm45PAJC0k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f44f44a4413b7d5db47501a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 11:21:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C499C43395; Tue, 25 Aug 2020 11:21:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70F04C43387;
        Tue, 25 Aug 2020 11:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70F04C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, swboyd@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2 1/2] Revert "drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh"
Date:   Tue, 25 Aug 2020 16:51:21 +0530
Message-Id: <1598354482-15491-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598354482-15491-1-git-send-email-mkshah@codeaurora.org>
References: <1598354482-15491-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit efde2659b0fe ("drivers: qcom: rpmh-rsc: Use rcuidle tracepoints
for rpmh") was written to fix a bug seen in an unmerged series that
implemented a struct generic_pm_domain::power_off() callback calling
rpmh_flush(). See stack trace below.

     Call trace:
      dump_backtrace+0x0/0x174
      show_stack+0x20/0x2c
      dump_stack+0xc8/0x124
      lockdep_rcu_suspicious+0xe4/0x104
      __tcs_buffer_write+0x230/0x2d0
      rpmh_rsc_write_ctrl_data+0x210/0x270
      rpmh_flush+0x84/0x24c
      rpmh_domain_power_off+0x78/0x98
      _genpd_power_off+0x40/0xc0
      genpd_power_off+0x168/0x208

Later the final merged solution is to use CPU PM notification to invoke
rpmh_flush() and power_off() callback of genpd is not implemented in the
driver.

CPU PM notifiers are run with RCU enabled/watching (see cpu_pm_notify()
and how it calls rcu_irq_enter_irqson() before calling the notifiers).

Remove this change since RCU will not be idle during CPU PM notifications
hence not required to use _rcuidle tracepoint. Using _rcuidle tracepoint
prevented rpmh driver to be loadable module as these are not exported
symbols.

This reverts commit efde2659b0fe835732047357b2902cca14f054d9.

Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index ae66757..fabe390d 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -495,7 +495,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 		write_tcs_cmd(drv, RSC_DRV_CMD_MSGID, tcs_id, j, msgid);
 		write_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j, cmd->addr);
 		write_tcs_cmd(drv, RSC_DRV_CMD_DATA, tcs_id, j, cmd->data);
-		trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
+		trace_rpmh_send_msg(drv, tcs_id, j, msgid, cmd);
 	}
 
 	write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

