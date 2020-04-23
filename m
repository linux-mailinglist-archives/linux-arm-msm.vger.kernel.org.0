Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86431B53CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 06:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgDWEsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 00:48:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:51468 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726038AbgDWEsi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 00:48:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587617318; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=flpEztTAvjXCoh3VqacaArYvF6G0oezbCFCoUfSVpec=; b=j5HNGP0gG2LfE/SP85GndUPb15sd6wMBwwcP4THr+0/4HLS3FKbKEk+2hFtmcEslfl99BmuY
 HRRFyFwKUN56gjH1nIvUBJB6pExJGH4qV6nqGNvRciIog0aNuMTAhia0X6sfNQbeAccrQtij
 nVHxlJ6JWJQV9xNlbsrY45b+rHU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea11e25.7f784ad28b20-smtp-out-n04;
 Thu, 23 Apr 2020 04:48:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4340C432C2; Thu, 23 Apr 2020 04:48:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.0.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6597BC433CB;
        Thu, 23 Apr 2020 04:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6597BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 2/5] soc: qcom: rpmh-rsc: We aren't notified of our own
 failure w/ NOTIFY_BAD
To:     Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, swboyd@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
 <20200422145408.v4.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <a41c50fe-d4d3-47bc-f5a1-9d9b346cdeb8@codeaurora.org>
Date:   Thu, 23 Apr 2020 10:18:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422145408.v4.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 4/23/2020 3:25 AM, Douglas Anderson wrote:
> When a PM Notifier returns NOTIFY_BAD it doesn't get called with
> CPU_PM_ENTER_FAILED.  It only get called for CPU_PM_ENTER_FAILED if
> someone else (further down the notifier chain) returns NOTIFY_BAD.
>
> Handle this case by taking our CPU out of the list of ones that have
> entered PM.  Without this it's possible we could detect that the last
> CPU went down (and we would flush) even if some CPU was alive.  That's
> not good since our flushing routines currently assume they're running
> on the last CPU for mutual exclusion.
>
> Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("...We aren't notified of our own failure...") split out for v4.
>
> Changes in v3: None
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 3571a99fc839..e540e49fd61c 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -823,6 +823,10 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>   		ret = NOTIFY_OK;
>   
>   exit:
> +	if (ret == NOTIFY_BAD)
> +		/* We won't be called w/ CPU_PM_ENTER_FAILED */
> +		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
> +
>   	spin_unlock(&drv->pm_lock);
>   	return ret;
>   }

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
