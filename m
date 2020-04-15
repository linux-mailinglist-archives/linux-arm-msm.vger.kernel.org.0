Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182AC1AAF4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 19:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416512AbgDORQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 13:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1416508AbgDORQY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 13:16:24 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672ADC061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:16:24 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g32so215315pgb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Izg8ue8YhxY7H2kruJlEEdGPr0daRyfDG5yf987D9nU=;
        b=vTyEIRCFkbm/7cTNcpVWop+cR+0/QClCSDkUDVPtYAu7XEXkE2QPRNxHxymFQZR2Nj
         EKtN6f2MwtzpKVWkII8qfFECUdlvef4AtBgQbIx+cw1AFwa0hxhBN/Ckhipus8m1r0y0
         PaDtt5Ep1oV8ZTtV9liF/XKuf+IuBz9xw/1OaShQJUJgYNcgZmpkRQ9z3MfzdKp8pUFA
         CzIul5KZNqOShlWKg7nCWkAaK0nzehFlLHH4ZJ2j+3kjaeBKqiOryjcuyOIPTR5WuaAH
         +G1FYIft7HFjwx1EHCPl+YG7c+MqiVSo6sIKmtckJSVtzNh/8LRxxcj9nLSpNQIjWBfs
         PLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Izg8ue8YhxY7H2kruJlEEdGPr0daRyfDG5yf987D9nU=;
        b=c/wrYXWcgq7fmZukxJNIS/+wzaIJZYHm19NQba7Tsd/Ww206v7+qsvWp9NJ4s5UGIG
         99iwBYpbd8HMNYHSwYGSCWgx7fQU3BZyGDCMri/2JAy7sLs3qccHF6UjwUEq6aL5+gkV
         /hT8aZk0Gn2Re/1a/7b4Uxemwf7IhVu0CMgg6B7i4T6o49MzBzXP39xLzxMCIpIuuz/Q
         oBAo5Tkq6Zqx7PRPUUE7odwGH6IfN+UsHh4PSj49DQexxMSVwFzn6CfawsYH8stCxbM1
         eHRelMznxZjvVVLFnvtB6O19St3V7HVFJwfnGLIHi32Z69x5ly/R0CWXHN37q0CNI0p4
         06Cw==
X-Gm-Message-State: AGi0PubjxqAU9S7ak5IDI70zzqkKg9m+oBmPelkFONOUiFBb6VuhkE3D
        f75Rtu5pwNJLKbGmuPotI5SFPg==
X-Google-Smtp-Source: APiQypIp+tAuF/KpVGiXjJ/mXx6QMkfcSDg3akdI4diIPizZMvKY5qs0xrcxJMuI9kMP22k4IMHCKA==
X-Received: by 2002:a63:2057:: with SMTP id r23mr28157163pgm.232.1586970983425;
        Wed, 15 Apr 2020 10:16:23 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x27sm14559225pfj.74.2020.04.15.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 10:16:22 -0700 (PDT)
Date:   Wed, 15 Apr 2020 11:16:20 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 3/6] remoteproc: sysmon: Inform current rproc about
 all active rprocs
Message-ID: <20200415171620.GC16583@xps15>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-4-git-send-email-sidgup@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 08, 2020 at 04:36:40PM -0700, Siddharth Gupta wrote:
> Clients/services running on a remoteproc that booted up might need to be
> aware of the state of already running remoteprocs. When a remoteproc boots
> up (fresh or after recovery) it is not aware of the remoteprocs that booted
> before it, i.e., the system state is incomplete. So to keep track of it we
> send sysmon on behalf of all 'ONLINE' remoteprocs.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 851664e..8d8996d 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -453,10 +453,20 @@ static int sysmon_prepare(struct rproc_subdev *subdev)
>  	return 0;
>  }
>  
> +/**
> + * sysmon_start() - start callback for the sysmon remoteproc subdevice
> + * @subdev:	instance of the sysmon subdevice
> + *
> + * Inform all the listners of sysmon notifications that the rproc associated
> + * to @subdev has booted up. The rproc that booted up also needs to know
> + * which rprocs are already up and running, so send start notifications
> + * on behalf of all the online rprocs.
> + */
>  static int sysmon_start(struct rproc_subdev *subdev)
>  {
>  	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
>  						  subdev);
> +	struct qcom_sysmon *target;
>  	struct sysmon_event event = {
>  		.subsys_name = sysmon->name,
>  		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
> @@ -464,6 +474,21 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  
>  	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
>  
> +	mutex_lock(&sysmon_lock);
> +	list_for_each_entry(target, &sysmon_list, node) {
> +		if (target == sysmon ||
> +		    target->rproc->state != RPROC_RUNNING)
> +			continue;
> +
> +		event.subsys_name = target->name;
> +
> +		if (sysmon->ssctl_version == 2)
> +			ssctl_send_event(sysmon, &event);
> +		else if (sysmon->ept)
> +			sysmon_send_event(sysmon, &event);
> +	}
> +	mutex_unlock(&sysmon_lock);
> +

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	return 0;
>  }
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
