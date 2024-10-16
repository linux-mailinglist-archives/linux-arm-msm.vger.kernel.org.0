Return-Path: <linux-arm-msm+bounces-34595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F09A0C9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A37031F246F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ED91547D4;
	Wed, 16 Oct 2024 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQVaVifu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6021442F6;
	Wed, 16 Oct 2024 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089021; cv=none; b=YOZJUz5cTnf87E+GxLZVBcxpauL99eb26xMIm6926L+LFKkyAJrAQGGYoTYTaob5AOjmYF1Y7dKPpiYkT7Z+ZEY+waeZSgBNuOrWp1uUl3YZ5kycZwqyys0MGsWSE5vtm+q7gwNnrBcyKtbIPYimxYiTbfd3wOt6m+N8rD2Sx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089021; c=relaxed/simple;
	bh=KnVunvwS+uXcWLqFxX8FcF9FRJdrasd7P5IR2KaMnJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUh5YEIszYSIuVAcTKWDLjUYv/0eBGVqRto1vnyPq/Ey5CjBkrrn4m7qYudez1u94bK8D/bOgFkwypcaOlsY9nIe4pPf7UTbIlj1szkmjbnCyvzXKvOwQwDP/406PREprJ5VOGoGAxj7wfUAiJZjf7V2+1s26X2THbRK59FKl04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQVaVifu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75AEC4CEC5;
	Wed, 16 Oct 2024 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729089020;
	bh=KnVunvwS+uXcWLqFxX8FcF9FRJdrasd7P5IR2KaMnJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQVaVifu41CieZ27rZIZt7YSV590QdSFLtvyCTD6JnAECkN4Po5vCMVcBLtJrb1Jo
	 DzDSr85iPejoqa1l8UCmgKQ94QQUYo+cKJ5168zGfPl/Hv5Z/Fhf3JYoLq7htqAlRK
	 MAXARHB99n9MNv04puxZ/n4oocsM/uozIeBu2ZRaNtM0rre9nr2IMj8SRnV9TlE3fY
	 Xh4VtItKJDPAZqN4lHGnyEFFmAxQpSivWc8TPFA+MMENaaJ6JG1MkqzxQ6pYsN8/NT
	 h4uFwe/nHKxfdi3e36uqHA/8LwAGH+fmCCsBEDYjtaG0QfcSVwJsxgW+XsxtPCSaci
	 RrN044f/nCFbg==
Date: Wed, 16 Oct 2024 09:30:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Xinqi Zhang <quic_xinqzhan@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_scmi: fix slab-use-after-free in
 scmi_bus_notifier()
Message-ID: <kzyrhxenfuc4aqvczxaevojfmau5nlyapdb4zivgfv5vbelv7d@raxpdqd2zgri>
References: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-fix-arm-scmi-slab-use-after-free-v2-1-1783685ef90d@quicinc.com>

On Wed, Oct 16, 2024 at 02:13:38PM GMT, Xinqi Zhang wrote:
> The scmi_dev->name is released prematurely in __scmi_device_destroy(),
> which causes slab-use-after-free when accessing scmi_dev->name in
> scmi_bus_notifier(). So move the release of scmi_dev->name to
> scmi_device_release() to avoid slab-use-after-free.
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in strncmp+0xe4/0xec
> Read of size 1 at addr ffffff80a482bcc0 by task swapper/0/1
> 
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.6.38-debug #1
> Hardware name: Qualcomm Technologies, Inc. SA8775P Ride (DT)
> Call trace:
>  dump_backtrace+0x94/0x114
>  show_stack+0x18/0x24
>  dump_stack_lvl+0x48/0x60
>  print_report+0xf4/0x5b0
>  kasan_report+0xa4/0xec
>  __asan_report_load1_noabort+0x20/0x2c
>  strncmp+0xe4/0xec
>  scmi_bus_notifier+0x5c/0x54c
>  notifier_call_chain+0xb4/0x31c
>  blocking_notifier_call_chain+0x68/0x9c
>  bus_notify+0x54/0x78
>  device_del+0x1bc/0x840
>  device_unregister+0x20/0xb4
>  __scmi_device_destroy+0xac/0x280
>  scmi_device_destroy+0x94/0xd0
>  scmi_chan_setup+0x524/0x750
>  scmi_probe+0x7fc/0x1508
>  platform_probe+0xc4/0x19c
>  really_probe+0x32c/0x99c
>  __driver_probe_device+0x15c/0x3c4
>  driver_probe_device+0x5c/0x170
>  __driver_attach+0x1c8/0x440
>  bus_for_each_dev+0xf4/0x178
>  driver_attach+0x3c/0x58
>  bus_add_driver+0x234/0x4d4
>  driver_register+0xf4/0x3c0
>  __platform_driver_register+0x60/0x88
>  scmi_driver_init+0xb0/0x104
>  do_one_initcall+0xb4/0x664
>  kernel_init_freeable+0x3c8/0x894
>  kernel_init+0x24/0x1e8
>  ret_from_fork+0x10/0x20
> 
> Allocated by task 1:
>  kasan_save_stack+0x2c/0x54
>  kasan_set_track+0x2c/0x40
>  kasan_save_alloc_info+0x24/0x34
>  __kasan_kmalloc+0xa0/0xb8
>  __kmalloc_node_track_caller+0x6c/0x104
>  kstrdup+0x48/0x84
>  kstrdup_const+0x34/0x40
>  __scmi_device_create.part.0+0x8c/0x408
>  scmi_device_create+0x104/0x370
>  scmi_chan_setup+0x2a0/0x750
>  scmi_probe+0x7fc/0x1508
>  platform_probe+0xc4/0x19c
>  really_probe+0x32c/0x99c
>  __driver_probe_device+0x15c/0x3c4
>  driver_probe_device+0x5c/0x170
>  __driver_attach+0x1c8/0x440
>  bus_for_each_dev+0xf4/0x178
>  driver_attach+0x3c/0x58
>  bus_add_driver+0x234/0x4d4
>  driver_register+0xf4/0x3c0
>  __platform_driver_register+0x60/0x88
>  scmi_driver_init+0xb0/0x104
>  do_one_initcall+0xb4/0x664
>  kernel_init_freeable+0x3c8/0x894
>  kernel_init+0x24/0x1e8
>  ret_from_fork+0x10/0x20
> 
> Freed by task 1:
>  kasan_save_stack+0x2c/0x54
>  kasan_set_track+0x2c/0x40
>  kasan_save_free_info+0x38/0x5c
>  __kasan_slab_free+0xe8/0x164
>  __kmem_cache_free+0x11c/0x230
>  kfree+0x70/0x130
>  kfree_const+0x20/0x40
>  __scmi_device_destroy+0x70/0x280
>  scmi_device_destroy+0x94/0xd0
>  scmi_chan_setup+0x524/0x750
>  scmi_probe+0x7fc/0x1508
>  platform_probe+0xc4/0x19c
>  really_probe+0x32c/0x99c
>  __driver_probe_device+0x15c/0x3c4
>  driver_probe_device+0x5c/0x170
>  __driver_attach+0x1c8/0x440
>  bus_for_each_dev+0xf4/0x178
>  driver_attach+0x3c/0x58
>  bus_add_driver+0x234/0x4d4
>  driver_register+0xf4/0x3c0
>  __platform_driver_register+0x60/0x88
>  scmi_driver_init+0xb0/0x104
>  do_one_initcall+0xb4/0x664
>  kernel_init_freeable+0x3c8/0x894
>  kernel_init+0x24/0x1e8
>  ret_from_fork+0x10/0x20
> 
> Fixes: ee7a9c9f67c5 ("firmware: arm_scmi: Add support for multiple device per protocol")
> Signed-off-by: Xinqi Zhang <quic_xinqzhan@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v2:
> - Standardize commit messages and add Fixes tags.
> - Link to v1: https://lore.kernel.org/r/20241015-fix-arm-scmi-slab-use-after-free-v1-1-b006eba9c8df@quicinc.com
> ---
>  drivers/firmware/arm_scmi/bus.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 96b2e5f9a8ef0386525f9d91d2925e7e6d48ac28..157172a5f2b577ce4f04425f967f548230c1ebed 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -325,7 +325,10 @@ EXPORT_SYMBOL_GPL(scmi_driver_unregister);
>  
>  static void scmi_device_release(struct device *dev)
>  {
> -	kfree(to_scmi_dev(dev));
> +	struct scmi_device *scmi_dev = to_scmi_dev(dev);
> +
> +	kfree_const(scmi_dev->name);
> +	kfree(scmi_dev);
>  }
>  
>  static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> @@ -338,7 +341,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
>  		atomic_set(&scmi_syspower_registered, 0);
>  
> -	kfree_const(scmi_dev->name);
>  	ida_free(&scmi_bus_id, scmi_dev->id);
>  	device_unregister(&scmi_dev->dev);
>  }
> @@ -410,7 +412,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  
>  	return scmi_dev;
>  put_dev:
> -	kfree_const(scmi_dev->name);
>  	put_device(&scmi_dev->dev);
>  	ida_free(&scmi_bus_id, id);
>  	return NULL;
> 
> ---
> base-commit: eca631b8fe808748d7585059c4307005ca5c5820
> change-id: 20241015-fix-arm-scmi-slab-use-after-free-74e358b3c90c
> 
> Best regards,
> -- 
> Xinqi Zhang <quic_xinqzhan@quicinc.com>
> 
> 

