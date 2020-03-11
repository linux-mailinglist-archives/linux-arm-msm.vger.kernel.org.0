Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC93181759
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 13:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgCKMCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 08:02:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:54204 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729102AbgCKMCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 08:02:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583928172; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EPwXWRLBatAS36UEQmnN9AxkJYR2loK0yjlgdQridsc=; b=d1Q6zVOUmnxKT98x0z8y0kEOqDwvq0hDwP5PoIAznGmQO8KubtmAYICGyKqUjqDdLU2vv6sG
 CRXORcGFq/OixDMJf9pi/u8MFRvj4r/vx8Ye5kjTKISdVgWTXqz32j5/1SIyYSFA+HvyhP1R
 kSXRP8SFcoDgQI8NsDqYgP+v1wI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e68d359.7fe690b577a0-smtp-out-n03;
 Wed, 11 Mar 2020 12:02:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D582C433CB; Wed, 11 Mar 2020 12:02:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FCAAC433BA;
        Wed, 11 Mar 2020 12:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3FCAAC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH 4/9] drivers: qcom: rpmh-rsc: Remove get_tcs_of_type()
 abstraction
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        evgreen@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306235951.214678-1-dianders@chromium.org>
 <20200306155707.RFT.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <95770b22-f681-9801-5c5e-67aa16071267@codeaurora.org>
Date:   Wed, 11 Mar 2020 17:32:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306155707.RFT.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/7/2020 5:29 AM, Douglas Anderson wrote:
> The get_tcs_of_type() function doesn't provide any value.  It's not
> conceptually difficult to access a value in an array, even if that
> value is in a structure and we want a pointer to the value.  Having
> the function in there makes me feel like it's doing something fancier
> like looping or searching.  Remove it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/soc/qcom/rpmh-rsc.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 099603bf14bf..a1298035bcd2 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -169,17 +169,10 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>  	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
>  }
>  
> -static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
> -{
> -	return &drv->tcs[type];
> -}
> -
>  static int tcs_invalidate(struct rsc_drv *drv, int type)
>  {
>  	int m;
> -	struct tcs_group *tcs;
> -
> -	tcs = get_tcs_of_type(drv, type);
> +	struct tcs_group *tcs = &drv->tcs[type];
>  
>  	spin_lock(&tcs->lock);
>  	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
> @@ -245,9 +238,9 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>  	 * dedicated AMC, and therefore would invalidate the sleep and wake
>  	 * TCSes before making an active state request.
>  	 */
> -	tcs = get_tcs_of_type(drv, type);
> +	tcs = &drv->tcs[type];
>  	if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs) {
> -		tcs = get_tcs_of_type(drv, WAKE_TCS);
> +		tcs = &drv->tcs[WAKE_TCS];
>  		if (tcs->num_tcs) {
>  			ret = rpmh_rsc_invalidate(drv);
>  			if (ret)
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
