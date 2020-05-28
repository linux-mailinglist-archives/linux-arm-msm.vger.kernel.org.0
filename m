Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFED1E5E99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 13:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388450AbgE1Lor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 07:44:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53931 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388427AbgE1Loq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 07:44:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590666285; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JYWh63enojmkl0ZbDpI0xeE7+snpo5O8ecFvr5K/Ll0=; b=M0ODtWxzmiOIp0wxHTSe9gioXaEJ1z85eKFQ/0CsCloTMPtDOvqGTG6Rll4W+5uz+bQOiXRI
 Kd6u3mWb6sO8RmuIYKLqHTRibdxTdiPew8UnAE/AXNORKYSHaurDi9ipJxwV44yQx/i7DtoF
 gd4HDrXQ7OGLUSKxpxnBmhM604s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ecfa42ccb04586933eae81c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 11:44:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E7E1FC43387; Thu, 28 May 2020 11:44:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.4.139])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 77B07C433C9;
        Thu, 28 May 2020 11:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77B07C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 2/2] soc: qcom: rpmh-rsc: Timeout after 1 second in
 write_tcs_reg_sync()
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, joe@perches.com, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200415095953.v3.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
 <20200415095953.v3.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <ff140959-98f9-7a67-e3de-f543e4ff3ac0@codeaurora.org>
Date:   Thu, 28 May 2020 17:14:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200415095953.v3.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

During suspend-resume with this change on sc7180 using latest 
linux-next, below warning was reported.

WARNING: CPU: 0 PID: 5324 at kernel/time/timekeeping.c:754 
ktime_get+0x94/0x9c
  ktime_get+0x94/0x9c
  write_tcs_reg_sync+0x4c/0x130
  tcs_invalidate+0x64/0xa4
  rpmh_rsc_invalidate+0x20/0x38
  rpmh_flush+0x58/0x1ec
  rpmh_rsc_cpu_pm_callback+0xe4/0x144
  notifier_call_chain+0x58/0x90
  __atomic_notifier_call_chain+0x48/
  cpu_pm_notify+0x40/0x6c
  cpu_pm_enter+0x34/0x7c
  cpu_pm_suspend+0x10/0x20
  syscore_suspend+0x128/0x2a4
  suspend_devices_and_enter+0x5e0/0x8a0

This seems to be because timekeeping is already suspend by this time.

Thanks,
Maulik

On 4/15/2020 10:30 PM, Douglas Anderson wrote:
> If our data still isn't there after 1 second, shout and give up.
>
> Reported-by: Joe Perches <joe@perches.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v3:
> - The register should be hex.
>
> Changes in v2:
> - Patch ("Timeout after 1 second") new for v2.
>
>   drivers/soc/qcom/rpmh-rsc.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index ce39d8399312..e09d1ada0cd2 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -10,6 +10,7 @@
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/iopoll.h>
>   #include <linux/kernel.h>
>   #include <linux/list.h>
>   #include <linux/module.h>
> @@ -175,12 +176,13 @@ static void write_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id,
>   static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
>   			       u32 data)
>   {
> +	u32 new_data;
> +
>   	writel(data, tcs_reg_addr(drv, reg, tcs_id));
> -	for (;;) {
> -		if (data == readl(tcs_reg_addr(drv, reg, tcs_id)))
> -			break;
> -		udelay(1);
> -	}
> +	if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id), new_data,
> +				      new_data == data, 1, USEC_PER_SEC))
> +		pr_err("%s: error writing %#x to %d:%#x\n", drv->name,
> +		       data, tcs_id, reg);
>   }
>   
>   /**

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

