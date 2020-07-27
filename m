Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D6922E83F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 10:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgG0I4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 04:56:16 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:64921 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726269AbgG0I4O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 04:56:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595840173; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xPmKjdUK0acJr1A0bQShRP8M7cHV9/zPMfSfRXx1CNA=;
 b=BCCm1BYopGP0hpTFhuYg58IWdeDwHgv3ecUKk5az25RUgyOGcEJyCUENS3K2qyFpZ8oE5Aov
 hUHBeMd9EHz4nVZ6ANLwSryS3sJp4Ef6qod/8x03omGoJfi579+S52V9lZ+UWVoBM+DSEUU3
 HJtVmrOdwGtlZSuQcK3uqxnaIjc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f1e96a1845c4d05a35790d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 08:56:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3CEFC43395; Mon, 27 Jul 2020 08:56:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0AEF0C433C9;
        Mon, 27 Jul 2020 08:56:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Jul 2020 14:26:00 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org
Subject: Re: [PATCH] coresight: etm4x: Fix etm4_count race using atomic
 variable
In-Reply-To: <20200727060728.15027-1-saiprakash.ranjan@codeaurora.org>
References: <20200727060728.15027-1-saiprakash.ranjan@codeaurora.org>
Message-ID: <0541ded117bb2a63481de8c015282b11@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-27 11:37, Sai Prakash Ranjan wrote:
> etm4_count keeps track of number of ETMv4 registered and on some
> systems, a race is observed on etm4_count variable which can
> lead to multiple calls to cpuhp_setup_state_nocalls_cpuslocked().
> This function internally calls cpuhp_store_callbacks() which
> prevents multiple registrations of callbacks for a given state
> and due to this race, it returns -EBUSY leading to ETM probe
> failures like below.
> 
>  coresight-etm4x: probe of 7040000.etm failed with error -16
> 
> This race can easily be triggered with async probe by setting
> probe type as PROBE_PREFER_ASYNCHRONOUS and with ETM power
> management property "arm,coresight-loses-context-with-cpu".
> 
> Prevent this race by converting etm4_count variable to atomic.
> 
> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup
> in probe() function")
> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug
> state machine")
> Suggested-by: Mike Leach <mike.leach@linaro.org>
> (Mike: Rootcause and context for commit message)
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c
> b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 6d7d2169bfb2..f256ea744c51 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -49,7 +49,7 @@ MODULE_PARM_DESC(pm_save_enable,
>  	"Save/restore state on power down: 1 = never, 2 = self-hosted");
> 
>  /* The number of ETMv4 currently registered */
> -static int etm4_count;
> +static atomic_t etm4_count;
>  static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
>  static void etm4_set_default_config(struct etmv4_config *config);
>  static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
> @@ -1403,7 +1403,7 @@ static int etm4_pm_setup_cpuslocked(void)
>  {
>  	int ret;
> 
> -	if (etm4_count++)
> +	if (atomic_inc_return(&etm4_count))
>  		return 0;
> 

Sorry, I messed up here, will send a next version fixing this.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
