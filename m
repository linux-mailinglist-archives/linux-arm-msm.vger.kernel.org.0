Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545131B53C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 06:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgDWEpR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 00:45:17 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:36601 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725863AbgDWEpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 00:45:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587617116; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vh9IJdgT9/A9ldq1KMRZu9hcfpyIPJCDLUN3HH4MeW4=; b=oceqVTfNwvmQ5gMMGggaiKlyEhZCtjUXXoCaDK5/Tg7c3DlUnJPxs/iXhF8e5knzpu0lCWcu
 dThKpKU+40HjPE8DiT6va1vF57l4d9dEKBhobvnQkGROU0xkR9XHNLPIctBye/Ejc4IZm7MB
 BcOkOp1r+Yl2Sr/tnT4jSvF+XWY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea11d59.7f7df0fc6ea0-smtp-out-n05;
 Thu, 23 Apr 2020 04:45:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22C4CC43636; Thu, 23 Apr 2020 04:45:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.0.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4BDAC433CB;
        Thu, 23 Apr 2020 04:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4BDAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 1/5] soc: qcom: rpmh-rsc: Corrently ignore
 CPU_CLUSTER_PM notifications
To:     Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, swboyd@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <7e060977-611e-abf5-af76-1cc91660a8ba@codeaurora.org>
Date:   Thu, 23 Apr 2020 10:15:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

there is a typo in subject, Corrently to correctly.
Other than this, fix seems good to me.

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 4/23/2020 3:24 AM, Douglas Anderson wrote:
> Our switch statement doesn't have entries for CPU_CLUSTER_PM_ENTER,
> CPU_CLUSTER_PM_ENTER_FAILED, and CPU_CLUSTER_PM_EXIT and doesn't have
> a default.  This means that we'll try to do a flush in those cases but
> we won't necessarily be the last CPU down.  That's not so ideal since
> our (lack of) locking assumes we're on the last CPU.
>
> Luckily this isn't as big a problem as you'd think since (at least on
> the SoC I tested) we don't get these notifications except on full
> system suspend.  ...and on full system suspend we get them on the last
> CPU down.  That means that the worst problem we hit is flushing twice.
> Still, it's good to make it correct.
>
> Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("...Corrently ignore CPU_CLUSTER_PM notifications") split out for v4.
>
> Changes in v3: None
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index a9e15699f55f..3571a99fc839 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -806,6 +806,8 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>   	case CPU_PM_EXIT:
>   		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
>   		goto exit;
> +	default:
> +		return NOTIFY_DONE;
>   	}
>   
>   	ret = rpmh_rsc_ctrlr_is_busy(drv);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
