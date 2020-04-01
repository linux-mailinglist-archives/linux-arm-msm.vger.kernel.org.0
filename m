Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845A919A707
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 10:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731861AbgDAISo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 04:18:44 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48510 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731729AbgDAISo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 04:18:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585729123; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7PsHfH50Qa4x11/cHlqtR7JN55Rk0n8ciHDiIs770ho=; b=r+SI05HpyHyBVqzmVeNwAxs5t8ijB1saGrHe4IUwc30/LEZKBJPm5Jn5xfN4IkNbbeY2Z4z8
 N8W3OYw5a2pra1aSOmPTxPXL4sEsp+3/1dCpxwXJ8lwNDdl2ssXs2/NSoHA9qvyg6e3er7HT
 PQFo58OgFsnUsxsRvxe4NqYG5cU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e844e63.7f9b87da01b8-smtp-out-n02;
 Wed, 01 Apr 2020 08:18:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49461C4478C; Wed,  1 Apr 2020 08:18:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.199.127])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4056AC433D2;
        Wed,  1 Apr 2020 08:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4056AC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH v2 04/10] drivers: qcom: rpmh-rsc: Remove
 get_tcs_of_type() abstraction
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <24620fdc-4ac7-b54a-45aa-906da3dc3fa9@codeaurora.org>
Date:   Wed, 1 Apr 2020 13:48:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311161104.RFT.v2.4.Ia348ade7c6ed1d0d952ff2245bc854e5834c8d9a@changeid>
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
> The get_tcs_of_type() function doesn't provide any value.  It's not
> conceptually difficult to access a value in an array, even if that
> value is in a structure and we want a pointer to the value.  Having
> the function in there makes me feel like it's doing something fancier
> like looping or searching.  Remove it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 799847b08038..c9f29cbd5ee5 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -170,17 +170,10 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>   	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
>   }
>   
> -static struct tcs_group *get_tcs_of_type(struct rsc_drv *drv, int type)
> -{
> -	return &drv->tcs[type];
> -}
> -
>   static int tcs_invalidate(struct rsc_drv *drv, int type)
>   {
>   	int m;
> -	struct tcs_group *tcs;
> -
> -	tcs = get_tcs_of_type(drv, type);
> +	struct tcs_group *tcs = &drv->tcs[type];
>   
>   	spin_lock(&tcs->lock);
>   	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
> @@ -246,9 +239,9 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>   	 * dedicated AMC, and therefore would invalidate the sleep and wake
>   	 * TCSes before making an active state request.
>   	 */
> -	tcs = get_tcs_of_type(drv, type);
> +	tcs = &drv->tcs[type];
>   	if (msg->state == RPMH_ACTIVE_ONLY_STATE && !tcs->num_tcs) {
> -		tcs = get_tcs_of_type(drv, WAKE_TCS);
> +		tcs = &drv->tcs[WAKE_TCS];
>   		if (tcs->num_tcs) {
>   			ret = rpmh_rsc_invalidate(drv);
>   			if (ret)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
