Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA512909B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 18:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410819AbgJPQbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 12:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410817AbgJPQbD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 12:31:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423B3C061755
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 09:31:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o7so1757384pgv.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2020 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ngWRzHXgFHPy5i53Ui/ywmmjGuNtNloCNac1FIdeRAQ=;
        b=B37qAKhlAWHbfyc7bJHH4NB7PG7hWjfgg2r7HF8pl2x9mcbe0N3kd9ohbS/Yr53sJB
         XN4TqAOuJwRx10ZUi6sVqKGyBbR81Pb5GBHR3rZCqE0ppUKKK2cjKFhnWO2UEMeRFRNs
         VakhFnf+GkAlFEHBzqofhpavg1HVPLvU46OuzXHCXQMm28d++AtiQbgAN4CgXKzPhe0e
         yLGTMiLeXVtDjSPXgO7QSB3pLstp8MV5PmcjUX2MZAajSefUcPFCAddWe8HlSApXbpRq
         +Q3NaL4W4MjC8GvN3lambFerIYVOFfKe0Dk0s7SnSOPu/DLEjOxyoaZUhodWPtI43aHX
         +dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ngWRzHXgFHPy5i53Ui/ywmmjGuNtNloCNac1FIdeRAQ=;
        b=aHk9p6wZtNlRa8GkbFgm7+xYdOOZPxneEyOjtjXatlEIq+Cf41NJg3yX5aslfnkR6G
         jCv01pXFvbZuw7A53hlVafJ8NYH1+v3XCczERZbzGUxwpdTlTPa+fiTRElE/hjGmludH
         fpD9hXEoqEdj5pgoEKlomEYCu4gHwaBsA3WEXUV7H5ddrFz7EtGTV5jXY7zBBxL9rtfF
         WtmNpjcBSJ77pthJsnY/uzVUD0ApGpRQWNUdfjQii4L/eXS+rN2Ahhq3jccdbqmIVDKe
         TrzyyVYsVKQy123dbxyGIlBrGhcpnomtXxoEfCRksvMeO6U/qfEj4wsS9sErxwDaXjW/
         T3zA==
X-Gm-Message-State: AOAM533YlHPHqb4gdC6GgO4ded4NM5NTWrvYwhfiVak/w06JCmbFVvVw
        fWUvcRP4XSCjXeKEnIjV4tjEmg==
X-Google-Smtp-Source: ABdhPJx8hiTqCuwIz4lbKvJ5Fw1msi/JR77+ht9hPaB0QMoE48DBqyO1UyUGdczGEQelTvD+mdH4tQ==
X-Received: by 2002:a63:140e:: with SMTP id u14mr3644528pgl.91.1602865863679;
        Fri, 16 Oct 2020 09:31:03 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 131sm3314753pfy.5.2020.10.16.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 09:31:03 -0700 (PDT)
Date:   Fri, 16 Oct 2020 10:31:01 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>, denik@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: etm4x: Skip setting LPOVERRIDE bit for
 qcom,skip-power-up
Message-ID: <20201016163101.GA3885@xps15>
References: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 16, 2020 at 03:40:25PM +0530, Sai Prakash Ranjan wrote:
> There is a bug on the systems supporting to skip power up
> (qcom,skip-power-up) where setting LPOVERRIDE bit(low-power
> state override behaviour) will result in CPU hangs/lockups
> even on the implementations which supports it. So skip
> setting the LPOVERRIDE bit for such platforms.
> 
> Fixes: 02510a5aa78d ("coresight: etm4x: Add support to skip trace unit power up")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index abd706b216ac..6096d7abf80d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -779,7 +779,7 @@ static void etm4_init_arch_data(void *info)
>  	 * LPOVERRIDE, bit[23] implementation supports
>  	 * low-power state override
>  	 */
> -	if (BMVAL(etmidr5, 23, 23))
> +	if (BMVAL(etmidr5, 23, 23) && (!drvdata->skip_power_up))
>  		drvdata->lpoverride = true;
>  	else
>  		drvdata->lpoverride = false;
>

I have applied your patch.

Thanks,
Mathieu
 
> base-commit: 3477326277451000bc667dfcc4fd0774c039184c
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
