Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F6B1C3228
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 07:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgEDFTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 01:19:41 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:10996 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726351AbgEDFTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 01:19:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588569580; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=MxVD4lIGNr5TTM6n/CVOQaK8MEvwp2IKXE3ld2sTRzw=; b=Uo7ustRJ36D6tqnG/u4jL1I53gPCCQ16jmlBFJsxKYFsidugIz2xtUyFBjZoqxstUj3e20ZX
 hTcX43uNwuNbvohQcyKgs0w4PeKZO7SQmhQJWXh35SihjJCgO0n788DMr6SZe8EzhvYNA0Fb
 j8bTZ5yRi2XLk10/ONF2tGP8mYk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eafa5e5.7efd188171f0-smtp-out-n02;
 Mon, 04 May 2020 05:19:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64BB9C433D2; Mon,  4 May 2020 05:19:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.157.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 825AAC433CB;
        Mon,  4 May 2020 05:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 825AAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 1/5] soc: qcom: rpmh-rsc: Correctly ignore
 CPU_CLUSTER_PM notifications
To:     Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, mka@chromium.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e8310c51-d7b1-ac88-cd6b-0965804eb754@codeaurora.org>
Date:   Mon, 4 May 2020 10:49:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424094610.v5.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/24/2020 10:16 PM, Douglas Anderson wrote:
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
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v5:
> - Corrently => Correctly
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

I noticed a bug here,

Either need to unlock and return here.

+	default:
+               ret = NOTIFY_DONE;
+		goto exit;

Or

If you move this patch at the end of series, it should will work fine as is.
Since in patch 5 of this series,  pm_lock is removed, so return 
NOTIFY_DONE; do not any unlock.

When i pulled in only first two changes in this series i got spinlock 
recursion during suspend-resume.
Back when i pull in entire series for validation, the issue do not come 
because last patch removes pm_lock.

Thanks,
Maulik
>   	}
>   
>   	ret = rpmh_rsc_ctrlr_is_busy(drv);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
