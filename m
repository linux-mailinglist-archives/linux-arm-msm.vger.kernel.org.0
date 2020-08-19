Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B709F2499D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 12:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgHSKIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 06:08:41 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:24424 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726782AbgHSKIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 06:08:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597831720; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=62a6fpIGjEYW5C+HhwDJTu6m6o0orHTEC1RoLTgLTbg=; b=typuU3XNG2tx5bdMw8fu99hzhBjSV9xPyK8q0Yt6G3Axn80o6LoWs+cv/Jv8oAEI52pbZxE7
 uydjlbb8q/2+6CLFWZPOW13Q/WZH1h58l3K1wrrF7dXf1zv97MG49MLPAR1p/MBGowq0M6uK
 lPdH5b2KGcPcc6sT365BbI7I9r8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f3cfa2703528d40241c2688 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 Aug 2020 10:08:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73539C43391; Wed, 19 Aug 2020 10:08:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6162C433CA;
        Wed, 19 Aug 2020 10:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B6162C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, swboyd@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/2] Revert "drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh"
Date:   Wed, 19 Aug 2020 15:37:49 +0530
Message-Id: <1597831670-17401-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org>
References: <1597831670-17401-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change was done based on an test results of unmerged series of
adding RSC power domain and using .power_off callback of genpd to
invoke rpmh_flush().

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
rpmh_flush() and .power_off callback of genpd is not implemented in the
driver.

Remove this change since RCU will not be idle during CPU PM notifications
hence not required to use _rcuidle tracepoint. Using _rcuidle tracepoint
prevented rpmh driver to be loadable module as these are not exported
symbols.

This reverts commit efde2659b0fe835732047357b2902cca14f054d9.

Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
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

