Return-Path: <linux-arm-msm+bounces-101176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIb0N8FLzGkRSQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 00:33:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCD3726AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 00:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7D373017C1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70F845BD78;
	Tue, 31 Mar 2026 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPJLo7hB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D02AD0C;
	Tue, 31 Mar 2026 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774996383; cv=none; b=NO4M8Ul7GeFvJkUiEiQ3pEhkQGE4+wZWqlblRjPvy9fvDxmXqPS2IvmoCT4We0niODRSeyQFerrZIoYH6PduoCGxQydN2PTpNPQqunQKWeiSu4Iy9kbLOtAzOGvCSDGUsCF7qA4REfmwi+WKF+somqJSMquPXEWsPJBAHyhfMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774996383; c=relaxed/simple;
	bh=LkMbAeNrKXrVLWtbFWfSKgqsM55HOGlNN/2+zvY35zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sf+5sJuglHYWjEVSOWupjPWZcdmEE1daO8j9muSNaLcVq3j9OvrVqafARBmRrsLu+OaEXOQg528Zfuvv5bE/uyHy3W1MBdzAjU+pPZqRlsfxXJqxZZUDnN6DizmZUve8ZqHClaAO5gY24G3yqHrGU9xm/cVb9D38GHUzpFdlV/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPJLo7hB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08140C19423;
	Tue, 31 Mar 2026 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774996383;
	bh=LkMbAeNrKXrVLWtbFWfSKgqsM55HOGlNN/2+zvY35zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPJLo7hBkoErMGbSATr3OJJHLcUOfduOG/dUVHzbmjmq2L6sb1WXqF5ty7S8v3O9T
	 Jurah+oiFniMibb2xoKM8BrP7RUog7qTv3dgtbEasXrEDDMUUZdDDH3jmHB1FpghzG
	 53TkY8Mm1e+GPWrkCP6MQLLvYLcfB4//4tcUDhZXWtM3P9uagKbgrRAbLcBZgCdtrv
	 y/FCWoY3ona9Ib3IkDcHl9ZB9epaelx5e2Tx9NPSSJqO5XTou0dGxak+Ueacv6tLYz
	 QFuo2LwRyjXSxqYlSKxr/QsOm1wRfZLMRH3++X554fDaEdj0MYHOIFO24ijEZb0Upv
	 0U0XyxEf+psdQ==
Date: Tue, 31 Mar 2026 17:32:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Tj <tj.iam.tj@proton.me>
Cc: bjorn.andersson@oss.qualcomm.com, gregkh@linuxfoundation.org, 
	krzk@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, srini@kernel.org, stable@vger.kernel.org, vkoul@kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver
 registration
Message-ID: <acxH3-eTkh2bR_OE@baldur>
References: <2e06ae01-6af9-4de7-be27-e439dc365d9b@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e06ae01-6af9-4de7-be27-e439dc365d9b@proton.me>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101176-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[171c0000:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50DCD3726AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:36:54PM +0000, Tj wrote:
> Following up on the registration problems on recommendation of Konrad 
> Dybcio.
> 
> I previously reported a hang during driver registration due to lock 
> contention. Konrad pointed me to this thread. Earlier, I had fixed the 
> issue myself and whilst doing it saw that order of registration is 
> important - ctrl must be last otherwise it causes:
> 

I've not seen that issue in my testing, but in the event that
qcom_slim_ngd_ctrl_probe() is being called before qcom_slim_ngd_driver
is registered we might complete the qcom_slim_ngd_ctrl_probe() with an
incomplete ngd instance - as qcom_slim_ngd_probe() has yet to execute.

I can flip the two platform_driver_register() calls around just to
remove/reduce the likelyhood for this to happen.


I think the correct solution here is to not have a separate
platform_driver for the inner device. I did some more work towards that,
but think it would be good to land this portion first.

> qcom,slim-ngd-ctrl 171c0000.slim-ngd: Failed to create device link 
> (0x180) with supplier 34000000.pinctrl for 
> /soc@0/slim-ngd@171c0000/slim@1/codec@1,0
> 

I don't think I've seen this in my testing.

> so I'd be surprised if Patch 1 works (not had chance to test the patch 
> series as yet).

It works on my machine<tm>, but the rest of the series is required as
well.

Regards,
Bjorn

> 
> With my local patch the result is:
> 
> qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM SAT: Rcvd master capability
> qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM controller Registered
> 
> ---
>      slimbus: ngd: fix lock hang on probe
> 
>      Module contains two platform_drivers. The initial probe calls
>      platform_register_driver() with the second struct platform_driver.
> 
>      This caused a hung task due to mutex lock in __driver_attach():
> 
>      INFO: task swapper/0:1 blocked for more than 1232 seconds.
>                 Not tainted 7.0.0.-rc2-sdm845 #89
>      task:swapper/0    state:D pid:1 tgid:1 ppid:0 task_flags:0x0140 
> flags:0x00000010
>      Call trace:
>      __switch_to_0x104/0x1c8 (T)
>      __schedule+0x438/0x1168
>      schedule+0x3c/0x120
>      schedule_preempt_disabled+0x2c/0x50
>      __mutex_lock.constprop.0+0x3d0/0x938
>      __mutex_lock_slowpath+0x1c/0x30
>      __driver_attach+0x38/0x280
>      bus_for_each_dev+0x80/0xc8
>      driver_attach+0x2c/0x40
>      bus_add_driver+0x128/0x258
>      driver_register+0x68/0x138
>      __platform_driver_register+0x2c/0x40
>      qcom_slim_ngd_ctrl_probe+0x1f4/0x400
>      platform_probe+0x64/0xa8
>      really_probe+0xc8/0x3f0
>      __driver_probe_device+0x88/0x190
>      driver_probe_device+0x44/0x120
>      __driver_attach+0x138/0x280
>      bus_for_each_dev+0x80/0xc8
>      driver_attach+0x2c/0x40
>      bus_add_driver+0x128/0x258
>      driver_register+0x68/0x138
>      __platform_driver_register+0x2c/0x40
>      qcom_slim_ngd_ctrl_driver_init+0x24/0x38
>      do_one_initcall+0x60/0x450
>      kernel_init_freeable+0x23c/0x630
>      kernel_init+0x2c/0x1f8
>      ret_from_fork+0x10/0x20
>      INFO: task swapper/0:1 is blocked on a mutex likely owned by task
>      swapper/0:1.
> 
>      Showing all locks held in the system:
>      2 locks held by swapper/0/1:
>       #0: ffff000080ff80f8 (&dev->mutex){....}-{4:4}, at:
>           __driver_attach+0x19c/0x2c0
>       #1: ffff000080ff80f8 (&dev->mutex){....}-{4:4}, at:
>           __driver_attach+0x38/0x2c0
>      1 lock held by khungtaskd/73:
>       #0: ffffbc5dfc38f1d8 (rcu_read_lock){....}-{1:3}, at:
>           debug_show_all_locks+0x18/0x1f0
> 
>      After this fix:
> 
>      qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM SAT: Rcvd master capability
>      qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM controller Registered
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c 
> b/drivers/slimbus/qcom-ngd-ctrl.c
> index 9aa7218b4e8d2..abdd4ad57f2d2 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1664,7 +1664,6 @@ static int qcom_slim_ngd_ctrl_probe(struct 
> platform_device *pdev)
>                  goto err_pdr_lookup;
>          }
> 
> -       platform_driver_register(&qcom_slim_ngd_driver);
>          return of_qcom_slim_ngd_register(dev, ctrl);
> 
>   err_pdr_alloc:
> @@ -1754,6 +1753,23 @@ static struct platform_driver 
> qcom_slim_ngd_driver = {
>          },
>   };
> 
> -module_platform_driver(qcom_slim_ngd_ctrl_driver);
> +static struct platform_driver * const qcom_slim_ngd_drivers[] = {
> +       /* Order here is important; ctrl last */
> +       &qcom_slim_ngd_driver,
> +       &qcom_slim_ngd_ctrl_driver,
> +};
> +
> +static int __init qcom_slim_ngd_init(void)
> +{
> +       return platform_register_drivers(qcom_slim_ngd_drivers, 
> ARRAY_SIZE(qcom_slim_ngd_drivers));
> +}
> +module_init(qcom_slim_ngd_init);
> +
> +static void __exit qcom_slim_ngd_exit(void)
> +{
> +       return platform_unregister_drivers(qcom_slim_ngd_drivers, 
> ARRAY_SIZE(qcom_slim_ngd_drivers));
> +}
> +module_exit(qcom_slim_ngd_exit);
> +
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("Qualcomm SLIMBus NGD controller");
> 
> 

