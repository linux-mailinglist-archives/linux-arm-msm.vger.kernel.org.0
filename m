Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9431E1BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 09:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731406AbgEZHHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 03:07:16 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21723 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728172AbgEZHHP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 03:07:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590476834; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=O6QvaVi3YfaFHLoCHa9DEncvz1BtpP9wyBrbMVGNqGk=; b=G6AZHxhG4U1eP0BDrH4AXwoVG07QAKvjEU82FO3++aG/X0t2hFZZiB05J6k+7rJRmU65e9N2
 AVPqiXslMcU4FaTBHQfG+/U53AcnfZje0hajjvJTYGPAP2V3GUdAW2Jkse4+DncXZTdot/wy
 3b7GgdsAY6mAGsBww0ZTCrjTk8c=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5eccc0212dd9e15ae3969aa1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 May 2020 07:07:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B48AEC433C6; Tue, 26 May 2020 07:07:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.171.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89482C433C9;
        Tue, 26 May 2020 07:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89482C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCHv3/RESEND 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free()
 API
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
References: <20200521060425.24285-1-swboyd@chromium.org>
 <20200521060425.24285-2-swboyd@chromium.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <aa0d22f3-1885-4937-7410-c6c467008c7a@codeaurora.org>
Date:   Tue, 26 May 2020 12:37:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521060425.24285-2-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 5/21/2020 11:34 AM, Stephen Boyd wrote:
> This API does very little. Let's replace all the callsites with the
> normal operations that would be done on top of the bitmap that
> tcs_in_use is. This simplifies and reduces the code size.
>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/soc/qcom/rpmh-rsc.c | 59 +++++++++++++------------------------
>   1 file changed, 20 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 076fd27f3081..60fc56987659 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -184,22 +184,6 @@ static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
>   		       data, tcs_id, reg);
>   }
>   
> -/**
> - * tcs_is_free() - Return if a TCS is totally free.
> - * @drv:    The RSC controller.
> - * @tcs_id: The global ID of this TCS.
> - *
> - * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
> - *
> - * Context: Must be called with the drv->lock held.
> - *
> - * Return: true if the given TCS is free.
> - */
> -static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
> -{
> -	return !test_bit(tcs_id, drv->tcs_in_use);
> -}
> -
>   /**
>    * tcs_invalidate() - Invalidate all TCSes of the given type (sleep or wake).
>    * @drv:  The RSC controller.
> @@ -512,7 +496,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>    *
>    * Return: 0 if nothing in flight or -EBUSY if we should try again later.
>    *         The caller must re-enable interrupts between tries since that's
> - *         the only way tcs_is_free() will ever return true and the only way
> + *         the only way tcs_in_use will ever be updated and the only way
>    *         RSC_DRV_CMD_ENABLE will ever be cleared.
>    */
>   static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
> @@ -520,17 +504,14 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>   {
>   	unsigned long curr_enabled;
>   	u32 addr;
> -	int i, j, k;
> -	int tcs_id = tcs->offset;
> +	int j, k;
> +	int i = tcs->offset;
>   
> -	for (i = 0; i < tcs->num_tcs; i++, tcs_id++) {
> -		if (tcs_is_free(drv, tcs_id))
> -			continue;
> -
> -		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
> +	for_each_set_bit_from(i, drv->tcs_in_use, tcs->offset + tcs->num_tcs) {
> +		curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i);
>   
>   		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
> -			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
> +			addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, i, j);
>   			for (k = 0; k < msg->num_cmds; k++) {
>   				if (addr == msg->cmds[k].addr)
>   					return -EBUSY;
> @@ -548,18 +529,19 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>    *
>    * Must be called with the drv->lock held since that protects tcs_in_use.
>    *
> - * Return: The first tcs that's free.
> + * Return: The first tcs that's free or -EBUSY if all in use.
>    */
>   static int find_free_tcs(struct tcs_group *tcs)
>   {
> -	int i;
> +	const struct rsc_drv *drv = tcs->drv;
> +	unsigned long i;
> +	unsigned long max = tcs->offset + tcs->num_tcs;
>   
> -	for (i = 0; i < tcs->num_tcs; i++) {
> -		if (tcs_is_free(tcs->drv, tcs->offset + i))
> -			return tcs->offset + i;
> -	}
> +	i = find_next_zero_bit(drv->tcs_in_use, max, tcs->offset);
> +	if (i >= max)
> +		return -EBUSY;
>   
> -	return -EBUSY;
> +	return i;
>   }
>   
>   /**
> @@ -757,8 +739,9 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>    */
>   static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
>   {
> -	int m;
> -	struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
> +	unsigned long set;
> +	const struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
> +	unsigned long max;
>   
>   	/*
>   	 * If we made an active request on a RSC that does not have a
> @@ -769,12 +752,10 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
>   	if (!tcs->num_tcs)
>   		tcs = &drv->tcs[WAKE_TCS];
>   
> -	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
> -		if (!tcs_is_free(drv, m))
> -			return true;
> -	}
> +	max = tcs->offset + tcs->num_tcs;
> +	set = find_next_bit(drv->tcs_in_use, max, tcs->offset);
>   
> -	return false;
> +	return set < max;
>   }
>   
>   /**

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

