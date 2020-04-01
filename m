Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46F019A700
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 10:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731705AbgDAISV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 04:18:21 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48510 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726536AbgDAISV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 04:18:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585729100; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SKNU/5JuA0idnU/jM/1z9VAiodpO0TKAOVp9ofIqYlI=; b=R9cq5Fkle3UBJjpJw+9BIoGSLs9WBhMsagDIww6nO6NAaosH103BWKWOPYu5Xu1l/ZgNAlxT
 c9czcCF363us+tTjUuDoPRDMAeeoiANX0vxT+K68y/vrCuavWurY3+Xwf2y2bPxTlNN0YN2z
 tnLMgece0UIxl8QmQZMNO/gtwio=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e844e3a.7f736bcd60d8-smtp-out-n04;
 Wed, 01 Apr 2020 08:18:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4396C433BA; Wed,  1 Apr 2020 08:18:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.199.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A545AC433D2;
        Wed,  1 Apr 2020 08:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A545AC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH v2 03/10] drivers: qcom: rpmh-rsc: Fold
 tcs_ctrl_write() into its single caller
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.3.Ie88ce5ccfc0c6055903ccca5286ae28ed3b85ed3@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <09d34360-c471-6c6f-7417-63bc36ff6e6a@codeaurora.org>
Date:   Wed, 1 Apr 2020 13:47:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311161104.RFT.v2.3.Ie88ce5ccfc0c6055903ccca5286ae28ed3b85ed3@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 3/12/2020 4:43 AM, Douglas Anderson wrote:
> I was trying to write documentation for the functions in rpmh-rsc and
> I got to tcs_ctrl_write().  The documentation for the function would
> have been: "This is the core of rpmh_rsc_write_ctrl_data(); all the
> caller does is error-check and then call this".
>
> Having the error checks in a separate function doesn't help for
> anything since:
> - There are no other callers that need to bypass the error checks.
> - It's less documenting.  When I read tcs_ctrl_write() I kept
>    wondering if I need to handle cases other than ACTIVE_ONLY or cases
>    with more commands than could fit in a TCS.  This is obvious when
>    the error checks and code are together.
> - The function just isn't that long, so there's no problem
>    understanding the combined function.
>
> Things were even more confusing because the two functions names didn't
> make obvious (at least to me) their relationship.
>
> Simplify by folding one function into the other.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 39 ++++++++++++++++---------------------
>   1 file changed, 17 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 02c8e0ffbbe4..799847b08038 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -550,27 +550,6 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
>   	return 0;
>   }
>   
> -static int tcs_ctrl_write(struct rsc_drv *drv, const struct tcs_request *msg)
> -{
> -	struct tcs_group *tcs;
> -	int tcs_id = 0, cmd_id = 0;
> -	unsigned long flags;
> -	int ret;
> -
> -	tcs = get_tcs_for_msg(drv, msg);
> -	if (IS_ERR(tcs))
> -		return PTR_ERR(tcs);
> -
> -	spin_lock_irqsave(&tcs->lock, flags);
> -	/* find the TCS id and the command in the TCS to write to */
> -	ret = find_slots(tcs, msg, &tcs_id, &cmd_id);
> -	if (!ret)
> -		__tcs_buffer_write(drv, tcs_id, cmd_id, msg);
> -	spin_unlock_irqrestore(&tcs->lock, flags);
> -
> -	return ret;
> -}
> -
>   /**
>    * rpmh_rsc_write_ctrl_data: Write request to the controller
>    *
> @@ -581,6 +560,11 @@ static int tcs_ctrl_write(struct rsc_drv *drv, const struct tcs_request *msg)
>    */
>   int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   {
> +	struct tcs_group *tcs;
> +	int tcs_id = 0, cmd_id = 0;
> +	unsigned long flags;
> +	int ret;
> +
>   	if (!msg || !msg->cmds || !msg->num_cmds ||
>   	    msg->num_cmds > MAX_RPMH_PAYLOAD) {
>   		pr_err("Payload error\n");
> @@ -591,7 +575,18 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   	if (msg->state == RPMH_ACTIVE_ONLY_STATE)
>   		return -EINVAL;
>   
> -	return tcs_ctrl_write(drv, msg);
> +	tcs = get_tcs_for_msg(drv, msg);
> +	if (IS_ERR(tcs))
> +		return PTR_ERR(tcs);
> +
> +	spin_lock_irqsave(&tcs->lock, flags);
> +	/* find the TCS id and the command in the TCS to write to */
> +	ret = find_slots(tcs, msg, &tcs_id, &cmd_id);
> +	if (!ret)
> +		__tcs_buffer_write(drv, tcs_id, cmd_id, msg);
> +	spin_unlock_irqrestore(&tcs->lock, flags);
> +
> +	return ret;
>   }
>   
>   static int rpmh_probe_tcs_config(struct platform_device *pdev,

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
