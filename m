Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5538319A6E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 10:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgDAINZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 04:13:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32417 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728374AbgDAINY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 04:13:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585728803; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=Y7tN8F7lpeUt9pwgtqEIWCkC0CCUG+AA20Dj2Z1HeKA=;
 b=czIQ1duJ+6fBq8Ifn+3Q/+U/ZGIZGlQJ9qw/ujjtbjE7s99UroqK22KKmh5BXGKS7Qejvz0b
 TvjV+qzGlxm3ynvO9zSG6iGdlJb3mMnfi32oiQNBSGIpXT+HZtbV8N8Du3XKUTf0Efrv/X9B
 OQAQWbzJfuH8T63QZGgPWly4Paw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e844d08.7f87da9b5500-smtp-out-n05;
 Wed, 01 Apr 2020 08:12:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EBFEFC43637; Wed,  1 Apr 2020 08:12:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.199.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 100FEC433F2;
        Wed,  1 Apr 2020 08:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 100FEC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [RFT PATCH v2 01/10] drivers: qcom: rpmh-rsc: Clean code
 reading/writing regs/cmds
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
Message-ID: <6327932f-2f77-f671-69e0-6576873fd399@codeaurora.org>
Date:   Wed, 1 Apr 2020 13:42:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311161104.RFT.v2.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

nit: can you please change as below, to mention its for TCS
drivers: qcom: rpmh-rsc: Clean code reading/writing TCS regs/cmds

Reviewed and tested.

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 3/12/2020 4:43 AM, Douglas Anderson wrote:
> This patch makes two changes, both of which should be no-ops:
>
> 1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg() /
>     write_tcs_cmd().
>
> 2. Change the order of operations in the above functions to make it
>     more obvious to me what the math is doing.  Specifically first you
>     want to find the right TCS, then the right register, and then
>     multiply by the command ID if necessary.
>
> Signed-off-by: Douglas Anderson<dianders@chromium.org>
> ---
>
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index b71822131f59..b87b79f0347d 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -61,28 +61,33 @@
>   #define CMD_STATUS_ISSUED		BIT(8)
>   #define CMD_STATUS_COMPL		BIT(16)
>   
> -static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
> +static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>   {
> -	return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> +	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
>   			     RSC_DRV_CMD_OFFSET * cmd_id);
>   }
>   
> +static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id)
> +{
> +	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
> +}
> +
>   static void write_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id,
>   			  u32 data)
>   {
> -	writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> +	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
>   		       RSC_DRV_CMD_OFFSET * cmd_id);
>   }
>   
>   static void write_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, u32 data)
>   {
> -	writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id);
> +	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
>   }
>   
>   static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>   			       u32 data)
>   {
> -	writel(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id);
> +	writel(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
>   	for (;;) {
>   		if (data == readl(drv->tcs_base + reg +
>   				  RSC_DRV_TCS_OFFSET * tcs_id))
> @@ -94,7 +99,7 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>   static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>   {
>   	return !test_bit(tcs_id, drv->tcs_in_use) &&
> -	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id, 0);
> +	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
>   }
>   
>   static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
> @@ -212,7 +217,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>   	const struct tcs_request *req;
>   	struct tcs_cmd *cmd;
>   
> -	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0, 0);
> +	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
>   
>   	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
>   		req = get_req_from_tcs(drv, i);
> @@ -226,7 +231,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>   			u32 sts;
>   
>   			cmd = &req->cmds[j];
> -			sts = read_tcs_reg(drv, RSC_DRV_CMD_STATUS, i, j);
> +			sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
>   			if (!(sts & CMD_STATUS_ISSUED) ||
>   			   ((req->wait_for_compl || cmd->wait) &&
>   			   !(sts & CMD_STATUS_COMPL))) {
> @@ -265,7 +270,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
>   	cmd_msgid |= CMD_MSGID_WRITE;
>   
> -	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
> +	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
>   
>   	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
>   		cmd = &msg->cmds[i];
> @@ -281,7 +286,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   	}
>   
>   	write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
> -	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
> +	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
>   	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
>   }
>   
> @@ -294,7 +299,7 @@ static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
>   	 * While clearing ensure that the AMC mode trigger is cleared
>   	 * and then the mode enable is cleared.
>   	 */
> -	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, 0);
> +	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id);
>   	enable &= ~TCS_AMC_MODE_TRIGGER;
>   	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
>   	enable &= ~TCS_AMC_MODE_ENABLE;
> @@ -319,10 +324,10 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>   		if (tcs_is_free(drv, tcs_id))
>   			continue;
>   
> -		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
> +		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
>   
>   		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
> -			addr = read_tcs_reg(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
> +			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
>   			for (k = 0; k < msg->num_cmds; k++) {
>   				if (addr == msg->cmds[k].addr)
>   					return -EBUSY;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
