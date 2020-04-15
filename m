Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18AAB1AAF0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 19:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410654AbgDORD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 13:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410641AbgDORDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 13:03:55 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09376C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:03:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n16so191212pgb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TXmBTmjlGDdkYJ5YaS9MFQANC5ZQIcUdQZgB+/qVJcg=;
        b=FaDHsxJ/Bsq5/mrz/KAm6LRhZzJ4oycH4qGHGQN9l033vBRXCFWhhDAHZx0+xkwcn6
         3d9mqYrLsMXHMiqUyBOvrSZgysqBewL5VEDFgtVWtZ5r5R4iKx0idNL1JXlvFWZkTJG1
         z4/YrF5Wga+eRnhDgvfXrFjJEwsFIlqlBzlRcSojTuj2fo9hu1Gco/ImeqCdmYAyEG7h
         ladEsxtLlmQSyVLOdLCdz9Y6RtEjYQKZnB+Ofr1ZjLsx6jSBvrP7LBYE5Itxoaazm7tz
         FI4TPa2wRScdEcGxXCnlV1c5PskOclAIjNWYYB/RjLot4De6rh4OvuWVsPpy2MGobT+R
         vnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TXmBTmjlGDdkYJ5YaS9MFQANC5ZQIcUdQZgB+/qVJcg=;
        b=MgXsrWN7dbWiXk+1zkdqnyGg7246uTT3U89XL497oYvvhStg2nwRvqR2msGa4Xdi7A
         WQTeRozHervfrRuBHUIn3fYzoVdJZ4EYgtSY65h5PCQFKl6706UpiNCweJ7GAAsRchlJ
         zaLvwi3O9ceh30VEt0EvcPAqW8He3gSq98KZvkXbgTULIoWTi6/EX0Ky9/EHoXIgIdDr
         0+PYqytpqyhSz7NhTRXG6aioxnE2QPQhVZ1B9MgGenONEialdRa03V7eZAXdRsz331mm
         jzZ/hMd1mEZ7u3CZmfD1cYtQtjm0ZI9R1+nDqoQTWyReygxdJzPaV2VKt52JX0coPU9T
         DCPg==
X-Gm-Message-State: AGi0Puas2VWXSyaldVMzJFe+i4By3ajGlSuAc3FrSVSCdQNFBee4JGZk
        n1xnWPom18jrorfNpTt+uJwP8Q==
X-Google-Smtp-Source: APiQypKxA2s9Ixhh/x4lzTu9wFMre6vgaWEw6jKo5l4u/n/V4C6g53A2/FTS+wGYaVfEJGJ7TqgWsQ==
X-Received: by 2002:a62:2506:: with SMTP id l6mr24888469pfl.184.1586970234265;
        Wed, 15 Apr 2020 10:03:54 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i124sm14308027pfg.14.2020.04.15.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:03:53 -0700 (PDT)
Date:   Wed, 15 Apr 2020 11:03:51 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 2/6] remoteproc: sysmon: Add notifications for events
Message-ID: <20200415170351.GB16583@xps15>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-3-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 08, 2020 at 04:36:39PM -0700, Siddharth Gupta wrote:
> Add notification for other stages of remoteproc boot and shutdown. This
> includes adding callback functions for the prepare and unprepare events,
> and fleshing out the callback function for start.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/qcom_sysmon.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 1366050..851664e 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -439,8 +439,31 @@ static const struct qmi_ops ssctl_ops = {
>  	.del_server = ssctl_del_server,
>  };
>  
> +static int sysmon_prepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +
> +	return 0;
> +}
> +
>  static int sysmon_start(struct rproc_subdev *subdev)
>  {
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +
>  	return 0;
>  }
>  
> @@ -464,6 +487,18 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
>  		sysmon_request_shutdown(sysmon);
>  }
>  
> +static void sysmon_unprepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +}
> +
>  /**
>   * sysmon_notify() - notify sysmon target of another's SSR
>   * @nb:		notifier_block associated with sysmon instance
> @@ -563,8 +598,10 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  
>  	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
>  
> +	sysmon->subdev.prepare = sysmon_prepare;
>  	sysmon->subdev.start = sysmon_start;
>  	sysmon->subdev.stop = sysmon_stop;
> +	sysmon->subdev.unprepare = sysmon_unprepare;
>  
>  	rproc_add_subdev(rproc, &sysmon->subdev);
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
