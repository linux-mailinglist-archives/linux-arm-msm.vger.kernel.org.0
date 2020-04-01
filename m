Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8DB19ABDB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 14:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732444AbgDAMk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 08:40:28 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23962 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732348AbgDAMk2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 08:40:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585744827; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=okh+F3uuRWsQcBuPF9wQiYLctrs6AGc2NTsoVj41CDM=; b=hnLy+qNEyLx/da6TpZnk9Yx0M0gRXOeGgFnawGJ0lEFZZaecYUx/8+y61RoF2i+wYRRjbNMO
 7iC+HZ3zJqXDMNmqgSkEfs1FaNp2zNRWF1+ZH1vPEhpIL4QI5VGJIbosDuMlBJ5PcN1G6YWa
 DakQpw+BrJJCEB0JNAF69M+z/uU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e848bba.7f09b4cc17a0-smtp-out-n02;
 Wed, 01 Apr 2020 12:40:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07CCDC433F2; Wed,  1 Apr 2020 12:40:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.15.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67440C433F2;
        Wed,  1 Apr 2020 12:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67440C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH v2 07/10] drivers: qcom: rpmh-rsc: Warning if
 tcs_write() used for non-active
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.7.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <339a7a7b-af4e-d6a9-4b48-2a603ea10172@codeaurora.org>
Date:   Wed, 1 Apr 2020 18:10:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311161104.RFT.v2.7.I8e187cdfb7a31f5bb7724f1f937f2862ee464a35@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/12/2020 4:43 AM, Douglas Anderson wrote:
> tcs_write() is documented to only be useful for writing
> RPMH_ACTIVE_ONLY_STATE.  Let's be loud if someone messes up.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 93f5d1fb71ca..ba489d18c20e 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -573,6 +573,12 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>   	unsigned long flags;
>   	int ret;
>   
> +	/*
> +	 * It only makes sense to grab a whole TCS for ourselves if we're
> +	 * triggering right away, which we only do for ACTIVE_ONLY.
> +	 */
> +	WARN_ON(msg->state != RPMH_ACTIVE_ONLY_STATE);
> +

Unnecessary check, we will never hit this warning. Lets not add such check.

Saying that you can modify this change to drop below check  from 
rpmh_rsc_write_ctrl_data() as that never hit.

         /* Data sent to this API will not be sent immediately */
         if (msg->state == RPMH_ACTIVE_ONLY_STATE)
                 return -EINVAL;

we always call rpmh_rsc_write_ctrl_data() for RPMH_SLEEP_STATE and 
RPMH_WAKE_ONLY_STATE.

Thanks,
Maulik
>   	/* TODO: get_tcs_for_msg() can return -EAGAIN and nobody handles */
>   	tcs = get_tcs_for_msg(drv, msg);
>   	if (IS_ERR(tcs))

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
