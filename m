Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 665221A21DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 14:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgDHMYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 08:24:03 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:10777 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbgDHMYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 08:24:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586348642; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ed/fp/OEHGrFKGF/ofrkc+iPty4lEi3+oMIU9BzxMsY=; b=Vqhls2h1jIdmpmrVNcfPOjFglsYM5tSegTBkH0OdgoCs8IPoQMS2LWJF3AtxsGQD5l2fi2cq
 BfkaPF9mp3+MaR4BEzwm3hzsuatz4utXoXzQP6jFyT9Bmms9XxEimhcEEnnxpK+Azf3q6weJ
 iYn8dUgk+eLvU/ar8iJ5yy6FAM4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dc261.7f5405670ea0-smtp-out-n04;
 Wed, 08 Apr 2020 12:24:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CBD5BC44788; Wed,  8 Apr 2020 12:24:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD0CEC433D2;
        Wed,  8 Apr 2020 12:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BD0CEC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 08/10] drivers: qcom: rpmh-rsc: Don't double-check rpmh
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.8.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b61a5b31-d614-93f2-7fdd-ec372fba3080@codeaurora.org>
Date:   Wed, 8 Apr 2020 17:53:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407164915.v3.8.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

In rpmh.c, rpmh_write_async() and rpmh_write_batch() uses 
__fill_rpmh_msg() which already checks for below payload conditions.

so i am ok to remove duplicate checks from rpmh-rsc.c

can you please add payload at the end of subject.

drivers: qcom: rpmh-rsc: Don't double-check rpmh payload

Other than this.

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Note:

rpmh_write() is not using __fill_rpmh_msg() and have replica as below, 
probably since it was declares message on stack instead of using malloc()

         if (!cmd || !n || n > MAX_RPMH_PAYLOAD)
                 return -EINVAL;

         memcpy(rpm_msg.cmd, cmd, n * sizeof(*cmd));
         rpm_msg.msg.num_cmds = n;

Making a note to remove above if check and start using __fill_rpmh_msg() 
here as well to do memcpy() and num_cmds initilization.

Although it may end up writing msg.state and msg.cmd twice (once during 
defining msg on stack and then during fill rpmh msg) but it should be ok.

Below two lines from __rpmh_write() can be removed as well.

         rpm_msg->msg.state = state;

DEFINE_RPMH_MSG_ONSTACK() and __fill_rpmh_msg() seems taking care of 
initializing msg.state already, so we should be good.

if you are spinning a new version and want to include above change as 
well, i am ok.

if not, i can push separate patch to update this as well once my series 
to invoke rpmh_flush() gets picked up.

Thanks,
Maulik

On 4/8/2020 5:20 AM, Douglas Anderson wrote:
> The calls rpmh_rsc_write_ctrl_data() and rpmh_rsc_send_data() are only
> ever called from rpmh.c.  We know that rpmh.c already error checked
> the message.  There's no reason to do it again in rpmh-rsc.
>
> Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - ("Don't double-check rpmh") replaces ("Warning if tcs_write...")
>
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 9502e7ea96be..10c026b2e1bc 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -633,7 +633,7 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>   }
>   
>   /**
> - * rpmh_rsc_send_data() - Validate the incoming message + write to TCS block.
> + * rpmh_rsc_send_data() - Write / trigger active-only message.
>    * @drv: The controller.
>    * @msg: The data to be sent.
>    *
> @@ -658,12 +658,6 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   {
>   	int ret;
>   
> -	if (!msg || !msg->cmds || !msg->num_cmds ||
> -	    msg->num_cmds > MAX_RPMH_PAYLOAD) {
> -		WARN_ON(1);
> -		return -EINVAL;
> -	}
> -
>   	do {
>   		ret = tcs_write(drv, msg);
>   		if (ret == -EBUSY) {
> @@ -734,16 +728,6 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   	unsigned long flags;
>   	int ret;
>   
> -	if (!msg || !msg->cmds || !msg->num_cmds ||
> -	    msg->num_cmds > MAX_RPMH_PAYLOAD) {
> -		pr_err("Payload error\n");
> -		return -EINVAL;
> -	}
> -
> -	/* Data sent to this API will not be sent immediately */
> -	if (msg->state == RPMH_ACTIVE_ONLY_STATE)
> -		return -EINVAL;
> -
>   	tcs = get_tcs_for_msg(drv, msg);
>   	if (IS_ERR(tcs))
>   		return PTR_ERR(tcs);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
