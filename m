Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA08662C8B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 20:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbiKPTGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 14:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233785AbiKPTGE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 14:06:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CFA60E88
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 11:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668625508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zifFICzNluq5jHamFRxX2dFP7lcv/f2gY2WAfhRupB4=;
        b=ZCeT7kHPUzLqnIQWmot48/eZYMKKgxPsrQEldVmzOGM4bt453FWuCNMCco3HVT4LOfSRQG
        ocyCtRtsKCP+8QTOs38+sL3Vj8FHcN34uhKZxydrVZsuIcfAbG/L/CDt/cuJ7r407KAeUd
        WGbq/bi6VVOFnWPrBES2XVEKaaMQFjE=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-8xXozlYkP6ey1g7c51FWSw-1; Wed, 16 Nov 2022 14:05:04 -0500
X-MC-Unique: 8xXozlYkP6ey1g7c51FWSw-1
Received: by mail-oo1-f70.google.com with SMTP id c25-20020a4a8199000000b0049d6d5934f6so6994745oog.23
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 11:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zifFICzNluq5jHamFRxX2dFP7lcv/f2gY2WAfhRupB4=;
        b=DIW9+673qLZYB7GTtdgB8Nc1TdUl6lAl08jnEBS8k70MZ/is2X/KjAm55jH9rXsxyD
         9iHwNzdvzqNLLGPSJvdZf4jYmz9mauuyKTuX3iDTjIZUS30pzc3LKIYaZg1HTPh5VKAu
         hbGfXPJ5hso4zg+ImgQV9QPbhXU10WKnzovji0N8y5qBp0lBypPk8bRbIXK4AMo5w20R
         gBrLHjyV9WNpa0MuqIu4+NqFdpcNQD57EOqvJCZY2qaqH6ti4iiNwz1inOyo/nFrxL96
         fxbMHFe7gTVGg4yxOTM/L/3JvEH79JFdSfoFowUzq6mtrOGkn6KppFqyUeimLGne4mV+
         kAyA==
X-Gm-Message-State: ANoB5pnx7MQdmlPoE1u55Ag/RQos2myTMJF5OXvCDKMYqQW5kEto+XCU
        xOsDzTmxpvQ8oQQ8vT7tiJoD0ksEnkK141PzYZBjVXghWbxF/Kb7fId5iCKXxG/bKqi7Ido4s7W
        4ssgacsfNfZsDrQPlX0EAMjj+5Q==
X-Received: by 2002:a05:6870:2a48:b0:13a:e87f:218b with SMTP id jd8-20020a0568702a4800b0013ae87f218bmr2596517oab.211.1668625503468;
        Wed, 16 Nov 2022 11:05:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5lRjLfsnJFKnXnF0SL6Dyy2GMMQ/DWV5Ouz8YarOyZS7mBruAaxTneOBVRUvR0bKSM7yc+iA==
X-Received: by 2002:a05:6870:2a48:b0:13a:e87f:218b with SMTP id jd8-20020a0568702a4800b0013ae87f218bmr2596498oab.211.1668625503227;
        Wed, 16 Nov 2022 11:05:03 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id t37-20020a056870f22500b0013d6d924995sm8463528oao.19.2022.11.16.11.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:05:02 -0800 (PST)
Date:   Wed, 16 Nov 2022 13:05:00 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Saravana Kannan <saravanak@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, John Stultz <jstultz@google.com>,
        Peter Robinson <pbrobinson@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] driver core: Add fw_devlink.timeout param to stop
 waiting for devlinks
Message-ID: <20221116190500.m4jyuimxo5tqhjdy@halaney-x13s>
References: <20221116115348.517599-1-javierm@redhat.com>
 <20221116120159.519908-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116120159.519908-1-javierm@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 16, 2022 at 01:01:59PM +0100, Javier Martinez Canillas wrote:
> Currently, the probe deferral timeout does two things:
> 
> 1) Call to fw_devlink_drivers_done() to relax the device dependencies and
>    allow drivers to be probed if these dependencies are optional.
> 
> 2) Disable the probe deferral mechanism so that drivers will fail to probe
>    if the required dependencies are not present, instead of adding them to
>    the deferred probe pending list.
> 
> But there is no need to couple these two, for example the probe deferral
> can be used even when the device links are disable (i.e: fw_devlink=off).
> 
> So let's add a separate fw_devlink.timeout command line parameter to allow
> relaxing the device links and prevent drivers to wait for these to probe.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

I like this idea and it looks good as far as I can tell.

Acked-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> 
> (no changes since v1)
> 
>  .../admin-guide/kernel-parameters.txt         |  7 ++++
>  drivers/base/dd.c                             | 38 ++++++++++++++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a465d5242774..38138a44d5ed 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1581,6 +1581,13 @@
>  			dependencies. This only applies for fw_devlink=on|rpm.
>  			Format: <bool>
>  
> +	fw_devlink.timeout=
> +			[KNL] Debugging option to set a timeout in seconds for
> +			drivers to give up waiting on dependencies and to probe
> +			these are optional. A timeout of 0 will timeout at the
> +			end of initcalls. If the time out hasn't expired, it'll
> +			be restarted by each successful driver registration.
> +
>  	gamecon.map[2|3]=
>  			[HW,JOY] Multisystem joystick and NES/SNES/PSX pad
>  			support via parallel port (up to 5 devices per port)
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 1e8f1afeac98..ea448df94d24 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -261,6 +261,7 @@ static int driver_deferred_probe_timeout = 10;
>  #else
>  static int driver_deferred_probe_timeout;
>  #endif
> +static int fw_devlink_timeout = -1;
>  
>  static int __init deferred_probe_timeout_setup(char *str)
>  {
> @@ -272,6 +273,16 @@ static int __init deferred_probe_timeout_setup(char *str)
>  }
>  __setup("deferred_probe_timeout=", deferred_probe_timeout_setup);
>  
> +static int __init fw_devlink_timeout_setup(char *str)
> +{
> +	int timeout;
> +
> +	if (!kstrtoint(str, 10, &timeout))
> +		fw_devlink_timeout = timeout;
> +	return 1;
> +}
> +__setup("fw_devlink.timeout=", fw_devlink_timeout_setup);
> +
>  /**
>   * driver_deferred_probe_check_state() - Check deferred probe state
>   * @dev: device to check
> @@ -318,6 +329,15 @@ static void deferred_probe_timeout_work_func(struct work_struct *work)
>  }
>  static DECLARE_DELAYED_WORK(deferred_probe_timeout_work, deferred_probe_timeout_work_func);
>  
> +static void fw_devlink_timeout_work_func(struct work_struct *work)
> +{
> +	fw_devlink_drivers_done();
> +
> +	driver_deferred_probe_trigger();
> +	flush_work(&deferred_probe_work);
> +}
> +static DECLARE_DELAYED_WORK(fw_devlink_timeout_work, fw_devlink_timeout_work_func);
> +
>  void deferred_probe_extend_timeout(void)
>  {
>  	/*
> @@ -330,6 +350,13 @@ void deferred_probe_extend_timeout(void)
>  		pr_debug("Extended deferred probe timeout by %d secs\n",
>  					driver_deferred_probe_timeout);
>  	}
> +
> +	if (cancel_delayed_work(&fw_devlink_timeout_work)) {
> +		schedule_delayed_work(&fw_devlink_timeout_work,
> +				      fw_devlink_timeout * HZ);
> +		pr_debug("Extended fw_devlink timeout by %d secs\n",
> +			 fw_devlink_timeout);
> +	}
>  }
>  
>  /**
> @@ -352,9 +379,12 @@ static int deferred_probe_initcall(void)
>  
>  	if (!IS_ENABLED(CONFIG_MODULES)) {
>  		driver_deferred_probe_timeout = 0;
> -		fw_devlink_drivers_done();
> +		fw_devlink_timeout = 0;
>  	}
>  
> +	if (!fw_devlink_timeout)
> +		fw_devlink_drivers_done();
> +
>  	/*
>  	 * Trigger deferred probe again, this time we won't defer anything
>  	 * that is optional
> @@ -366,6 +396,12 @@ static int deferred_probe_initcall(void)
>  		schedule_delayed_work(&deferred_probe_timeout_work,
>  			driver_deferred_probe_timeout * HZ);
>  	}
> +
> +	if (fw_devlink_timeout > 0) {
> +		schedule_delayed_work(&fw_devlink_timeout_work,
> +				      fw_devlink_timeout * HZ);
> +	}
> +
>  	return 0;
>  }
>  late_initcall(deferred_probe_initcall);
> -- 
> 2.38.1
> 

