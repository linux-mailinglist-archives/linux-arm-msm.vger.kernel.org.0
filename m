Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0D191813AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 09:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgCKIr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 04:47:28 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23537 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728739AbgCKIr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 04:47:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583916447; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MBQ+jlRvZ46PUuF3vZJLmcG/4ub7oJ8ztLPGjJOuYXc=; b=HCOv1w5LUshSDgBK9BUS3VWlBh/8eQ8K/30f2fUjP4f7yJDWlTh5mnYJeCmxJczghKao37aa
 W4Jw9JPIFjaG4H+9axeDOxJAAsjtyN9UcxH+9yb0Ohi8uT4yvTC84ksT+7RTC6RB2MPL1S/g
 fMAjVZdw5GVrBOSs7quPr5+XJRc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e68a59d.7fde56402c38-smtp-out-n05;
 Wed, 11 Mar 2020 08:47:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C906CC4478F; Wed, 11 Mar 2020 08:47:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0539CC433D2;
        Wed, 11 Mar 2020 08:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0539CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH 1/9] drivers: qcom: rpmh-rsc: Clean code
 reading/writing regs/cmds
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306235951.214678-1-dianders@chromium.org>
 <20200306155707.RFT.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <85758e97-8c0c-5c4e-24ad-d3e8b2b01d3c@codeaurora.org>
Date:   Wed, 11 Mar 2020 14:17:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306155707.RFT.1.I1b754137e8089e46cf33fc2ea270734ec3847ec4@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> This patch makes two changes, both of which should be no-ops:
>
> 1. Make read_tcs_reg() / read_tcs_cmd() symmetric to write_tcs_reg() /
>    write_tcs_cmd().

i agree that there are two different write function doing same thing except last addition (RSC_DRV_CMD_OFFSET * cmd_id)

can you please rename write_tcs_cmd() to write_tcs_reg(), add above operation in it, and then remove existing write_tcs_reg().
this way we have only one read and one write function.

so at the end we will two function as,

static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
{
        return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
                             RSC_DRV_CMD_OFFSET * cmd_id);
}

static void write_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id,
                          u32 data)
{
        writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
                       RSC_DRV_CMD_OFFSET * cmd_id);
}

>
> 2. Change the order of operations in the above functions to make it
>    more obvious to me what the math is doing.  Specifically first you
>    want to find the right TCS, then the right register, and then
>    multiply by the command ID if necessary.
With above change, i don't think you need to re-order this.
specifically from tcs->base, we find right "reg" first and if it happens to be tcs then intended tcs, and then cmd inside tcs.

Thanks,
Maulik

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/soc/qcom/rpmh-rsc.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index e278fc11fe5c..5c88b8cd5bf8 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -61,28 +61,33 @@
>  #define CMD_STATUS_ISSUED		BIT(8)
>  #define CMD_STATUS_COMPL		BIT(16)
>  
> -static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
> +static u32 read_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>  {
> -	return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> +	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
>  			     RSC_DRV_CMD_OFFSET * cmd_id);
>  }
>  
> +static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id)
> +{
> +	return readl_relaxed(drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
> +}
> +
>  static void write_tcs_cmd(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id,
>  			  u32 data)
>  {
> -	writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> +	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg +
>  		       RSC_DRV_CMD_OFFSET * cmd_id);
>  }
>  
>  static void write_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, u32 data)
>  {
> -	writel_relaxed(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id);
> +	writel_relaxed(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
>  }
>  
>  static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>  			       u32 data)
>  {
> -	writel(data, drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id);
> +	writel(data, drv->tcs_base + RSC_DRV_TCS_OFFSET * tcs_id + reg);
>  	for (;;) {
>  		if (data == readl(drv->tcs_base + reg +
>  				  RSC_DRV_TCS_OFFSET * tcs_id))
> @@ -94,7 +99,7 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>  static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>  {
>  	return !test_bit(tcs_id, drv->tcs_in_use) &&
> -	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id, 0);
> +	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
>  }
>  
>  static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
> @@ -212,7 +217,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>  	const struct tcs_request *req;
>  	struct tcs_cmd *cmd;
>  
> -	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0, 0);
> +	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
>  
>  	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
>  		req = get_req_from_tcs(drv, i);
> @@ -226,7 +231,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>  			u32 sts;
>  
>  			cmd = &req->cmds[j];
> -			sts = read_tcs_reg(drv, RSC_DRV_CMD_STATUS, i, j);
> +			sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
>  			if (!(sts & CMD_STATUS_ISSUED) ||
>  			   ((req->wait_for_compl || cmd->wait) &&
>  			   !(sts & CMD_STATUS_COMPL))) {
> @@ -265,7 +270,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
>  	cmd_msgid |= CMD_MSGID_WRITE;
>  
> -	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
> +	cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
>  
>  	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
>  		cmd = &msg->cmds[i];
> @@ -281,7 +286,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  	}
>  
>  	write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
> -	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
> +	cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
>  	write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
>  }
>  
> @@ -294,7 +299,7 @@ static void __tcs_trigger(struct rsc_drv *drv, int tcs_id)
>  	 * While clearing ensure that the AMC mode trigger is cleared
>  	 * and then the mode enable is cleared.
>  	 */
> -	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id, 0);
> +	enable = read_tcs_reg(drv, RSC_DRV_CONTROL, tcs_id);
>  	enable &= ~TCS_AMC_MODE_TRIGGER;
>  	write_tcs_reg_sync(drv, RSC_DRV_CONTROL, tcs_id, enable);
>  	enable &= ~TCS_AMC_MODE_ENABLE;
> @@ -319,10 +324,10 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>  		if (tcs_is_free(drv, tcs_id))
>  			continue;
>  
> -		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, 0);
> +		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
>  
>  		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
> -			addr = read_tcs_reg(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
> +			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
>  			for (k = 0; k < msg->num_cmds; k++) {
>  				if (addr == msg->cmds[k].addr)
>  					return -EBUSY;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
