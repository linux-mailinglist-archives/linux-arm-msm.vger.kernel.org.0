Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9C7B19AAEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 13:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgDALjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 07:39:00 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:30598 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726612AbgDALjA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 07:39:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585741139; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YW8/FHeYpX+Df6fQ7ygxakP05TUdeSDU0PChvj0MqWI=; b=mKjNhn911uhJMuEB2ana0MxgxdRf918hiTxmtHKIMy5ipINfc0Qd9Q+/TfL3RnEAPoXDWjbI
 1AQRMeIzlmmiiFhc4BlMScdK9vNFG3BzJjs7ZnDMuSuUMF7C8tEaiD9OZKjPuBgjL5ROtL1t
 sRzU51uGhs34DqAXEgO4p6QNFRI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e847d43.7f2bb0d2b068-smtp-out-n01;
 Wed, 01 Apr 2020 11:38:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 566A0C43637; Wed,  1 Apr 2020 11:38:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.15.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61562C433F2;
        Wed,  1 Apr 2020 11:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61562C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH v2 06/10] drivers: qcom: rpmh-rsc: Comment
 tcs_is_free() + warn if state mismatch
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        evgreen@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.6.Icf2213131ea652087f100129359052c83601f8b0@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <7a6edff1-3916-e802-0441-25b31989619f@codeaurora.org>
Date:   Wed, 1 Apr 2020 17:08:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200311161104.RFT.v2.6.Icf2213131ea652087f100129359052c83601f8b0@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/12/2020 4:43 AM, Douglas Anderson wrote:
> tcs_is_free() had two checks in it: does the software think that the
> TCS is free and does the hardware think that the TCS is free.  Let's
> comment this and also add a warning in the case that software and
> hardware disagree, at least for ACTIVE_ONLY TCS.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Comment tcs_is_free() new for v2; replaces old patch 6.
>
>   drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 9d2669cbd994..93f5d1fb71ca 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -181,8 +181,27 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>    */
>   static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>   {
> -	return !test_bit(tcs_id, drv->tcs_in_use) &&
> -	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
> +	/* If software thinks it's in use then it's definitely in use */
> +	if (test_bit(tcs_id, drv->tcs_in_use))
> +		return false;
> +
> +	/* If hardware agrees it's free then it's definitely free */
> +	if (read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id) != 0)
> +		return true;
> +
> +	/*
> +	 * If we're here then software and hardware disagree about whether
> +	 * the TCS is free.  Software thinks it is free and hardware thinks
> +	 * it is not.
> +	 *
> +	 * Maybe this should be a warning in all cases, but it's almost
> +	 * certainly a warning for the ACTIVE_TCS where nobody else should
> +	 * be doing anything else behind our backs.  For now we'll just
> +	 * warn there and then still return that we're in use.
> +	 */
> +	WARN(drv->tcs[tcs_id].type == ACTIVE_TCS,
> +	     "Driver thought TCS was free but HW reported busy\n");
This warning can come for borrowed WAKE_TCS as well.
> +	return false;
>   }

We have a patch on downstream variant to optimize this by only checking 
tcs_in_use flag (SW check) and HW check is removed.

  static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
  {
-       return !test_bit(tcs_id, drv->tcs_in_use) &&
-              read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id, 0);
+       return !test_bit(tcs_id, drv->tcs_in_use);
  }

With this we are good and don't require to put above warning as well.

if you want me to upload, i can post it and then you can drop this 
change from your series.

Or if you want to modify it as above and keep in this series i am ok.

Thanks,
Maulik

>   
>   /**

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
