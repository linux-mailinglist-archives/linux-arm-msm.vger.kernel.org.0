Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967624D567
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 19:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfFTRnM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 13:43:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42743 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfFTRnL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 13:43:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay6so1664867plb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1KJ0e9ekOabFfxqwKvIk2A6/zmASWNljaHVvnXYUQxY=;
        b=NhbZE295vHsBmR1o4reSr3vcb9K8QjxL6emGCch81QYlNOzn7tv09NGjCC4euADxnF
         kQ9KHGtlQFK1CrMuPhar8/Gj18tnyoWZvwEwjjoeZ2Y8SXMRT0ZyVfD+LvYgGCWATUny
         i8Lyu2TMQ2OIPveZZ4LNrdJYrwqd0pP0sMzbjmZjiJMHYCcIrzLZQIWHl1FFlesbP1ox
         NNsDRkkjMXOQfhrCxZSpHUhVEU3i+VRqLDAwl1jKSZ+erU61VvXj4/vDVX52htPpCiYG
         gAm41dgBnAfhpb1fsukKduPkNOHXyGnyxvX6uxP9MRSJlzwV52XRAveCMA5b4uhZ74Vl
         U+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1KJ0e9ekOabFfxqwKvIk2A6/zmASWNljaHVvnXYUQxY=;
        b=GQu0HvwdeyrYcFd/OphRu9pfqARYfyMfxBKMK7X3VZdGLcS+s37hvNVy/PliFAHXEC
         dEXkBWxSFC9e7D+++jlHJqjVXdpGFH1PpSfIWPvl+Z6+auG8w0GYIGqjd9/ciUeE0Gyc
         XENSo+9OmkJVWmqhbyU/MfOlet0lSrV516XvqIX2Kn5PdOUcMkYfBbYhmw+d8BJz1FzG
         2I0gxeNqznLjYpzs/Z4JGuhNvmS26kTNk0HCydfmtv7EREMKBvCeDlY/XOUPs/vBJX10
         qzq0lw2AXKxNziE23r1FmSxBYbH1hOOpzGsiPYPkeTxiQBsCDuE1MszyLydny3sXU/2/
         OmSg==
X-Gm-Message-State: APjAAAX0Z8sRMkveJpgC3YebkzCVIcyHzKV0SipOxcd8KQEf/yUPb5Tw
        zDrPhYUkgBBN+3Owb66kju0hY0/qVkDrKw==
X-Google-Smtp-Source: APXvYqyrJ3P57l2hXzKwykASSM4m8XDMhpVpPOdFDF+6NySV8L9SKNqqSA+NS5K7Rf8cf9mtKD7jIQ==
X-Received: by 2002:a17:902:2aa8:: with SMTP id j37mr82097915plb.316.1561052591240;
        Thu, 20 Jun 2019 10:43:11 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id y185sm95763pfy.110.2019.06.20.10.43.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 10:43:10 -0700 (PDT)
Date:   Thu, 20 Jun 2019 11:43:08 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] coresight: Abort probe for missing CPU phandle
Message-ID: <20190620174308.GB5581@xps15>
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <d93e28fc80227f9a385130a766a24f8f39a1dcf0.1561037262.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d93e28fc80227f9a385130a766a24f8f39a1dcf0.1561037262.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 07:15:47PM +0530, Sai Prakash Ranjan wrote:
> Currently the coresight etm and cpu-debug drivers
> assume the affinity to CPU0 returned by coresight
> platform and continue the probe in case of missing
> CPU phandle. This is not true and leads to crash
> in some cases, so abort the probe in case of missing
> CPU phandle.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-cpu-debug.c | 3 +++
>  drivers/hwtracing/coresight/coresight-etm3x.c     | 3 +++
>  drivers/hwtracing/coresight/coresight-etm4x.c     | 3 +++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 07a1367c733f..43f32fa71ff9 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -579,6 +579,9 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
>  		return -ENOMEM;
>  
>  	drvdata->cpu = coresight_get_cpu(dev);
> +	if (drvdata->cpu == -ENODEV)
> +		return -ENODEV;

As Suzuki pointed out, simply return the error message conveyed by
coresight_get_cpu().

Also please merge both patches together to avoid bisect nightmare.

Thank you for the contribution,
Mathieu

> +
>  	if (per_cpu(debug_drvdata, drvdata->cpu)) {
>  		dev_err(dev, "CPU%d drvdata has already been initialized\n",
>  			drvdata->cpu);
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x.c b/drivers/hwtracing/coresight/coresight-etm3x.c
> index 225c2982e4fe..882e2751746c 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x.c
> @@ -816,6 +816,9 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
>  	}
>  
>  	drvdata->cpu = coresight_get_cpu(dev);
> +	if (drvdata->cpu == -ENODEV)
> +		return -ENODEV;
> +
>  	desc.name  = devm_kasprintf(dev, GFP_KERNEL, "etm%d", drvdata->cpu);
>  	if (!desc.name)
>  		return -ENOMEM;
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 7fe266194ab5..97d71dbbeb19 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -1101,6 +1101,9 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
>  	spin_lock_init(&drvdata->spinlock);
>  
>  	drvdata->cpu = coresight_get_cpu(dev);
> +	if (drvdata->cpu == -ENODEV)
> +		return -ENODEV;
> +
>  	desc.name = devm_kasprintf(dev, GFP_KERNEL, "etm%d", drvdata->cpu);
>  	if (!desc.name)
>  		return -ENOMEM;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
