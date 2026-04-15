Return-Path: <linux-arm-msm+bounces-103284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKF4MEx332ljTQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:32:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60019403D43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97CC6312468F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF39537B025;
	Wed, 15 Apr 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCAYjK64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8855437AA8B;
	Wed, 15 Apr 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252349; cv=none; b=U7kvIE76/hKoHtcfDAjOF8TcXloiw2EMPn1CLYNEQ+luqr+TdPr+fK6S1nbHFy+wUI+g0/13JCr4CwblAHMskD9HUMwBEJgU3xAi81h3sScrtrk4vxvnTTICqeFwIfgFPgs2/BwTjLNgFA0fSvb95vwjBt+IK8iQ1JchhOXVJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252349; c=relaxed/simple;
	bh=0QeTyvtoCnNRRXFdte6x9ln64i4XnIZGxAh5AfOrhe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZK6Mc/A+OtsYcjcatC9GvmubWAhEn5sYacbuoIwvmu55N8AsiHaiPH6+nQmMZZkq4GMoInFhNtIyIPjcnTXeQa8izCGWMgX1Ka4JelW0YPl1I0goZdmehxCntXw+iNhMi0lZrG1nU5UxO6ZVT/BBah6JxOPHimdxzRuPQ2hAsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCAYjK64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCE5C4AF0B;
	Wed, 15 Apr 2026 11:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776252348;
	bh=0QeTyvtoCnNRRXFdte6x9ln64i4XnIZGxAh5AfOrhe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iCAYjK64Tfl1KN4kuqKnRr1MIBS5wxGrxzU+t139D3rX/u+TVTfifIuxn0wR4MCOy
	 m1ymSKiAZkz0H3CzmR3j99AJO5uHnDJ84JPBk6Acz72isVtPZR9VUsvB7utW8cHYN4
	 Jxopp7ZZDs/eNPylxgRy0DIaPaJfGX7AkpBPIA+fTEs/NYA0upwL7c9t/3Zb5Tr+sM
	 PX0qfejWJhoy/vMZyCRG1kiFN45Wx5HqMta5cUBqosUzz6untmsafrmQ1e6TXCfTj2
	 stKImHB1seIa0VzekRBD6hLS+ZHwOUtpTab1y1V5kSbSbY6CWeR7vHsccGWHaFSd/e
	 rFl/xcOEOFgwQ==
Message-ID: <02f3c112-21a5-4eff-b23a-c11390604ce0@kernel.org>
Date: Wed, 15 Apr 2026 11:25:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drivers: base: Add generic context device bus
To: ekansh.gupta@oss.qualcomm.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linuxfoundation.org,kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103284-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60019403D43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/26 4:31 PM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Introduce a new generic bus type for synthetic context bank devices
> that require IOMMU context isolation. This bus provides a shared
> infrastructure for accelerator and GPU drivers that create virtual
> devices representing IOMMU context banks.
> 
> Currently, drivers like host1x implement their own bus types for
> context devices. This generic implementation allows multiple drivers
> to share the same bus infrastructure, simplifying the IOMMU subsystem
> integration and reducing code duplication.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/base/Kconfig        |  3 +++
>  drivers/base/Makefile       |  1 +
>  drivers/base/context_bus.c  | 24 ++++++++++++++++++++++++
>  include/linux/context_bus.h | 15 +++++++++++++++

This patch as it is does not add any details on how the iommu will be
binded to this bus, Please consider adding the iommu changes to this
patch so that its easy to understand and for completeness.


Also naming it as context bus is bit generic, I think the whole purpose
of this is bus is to add this as another supported bus in the iommu.

may be iommu_context bus or something on those lines would be much clear.


>  4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index f7d385cbd3ba..479bc4bb442b 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -4,6 +4,9 @@ menu "Generic Driver Options"
>  config AUXILIARY_BUS
>  	bool
>  
> +config CONTEXT_DEVICE_BUS
> +	bool
> +
>  config UEVENT_HELPER
>  	bool "Support for uevent helper"
>  	help
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 8074a10183dc..ab9a0b2dc73b 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -8,6 +8,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
>  			   topology.o container.o property.o cacheinfo.o \
>  			   swnode.o faux.o
>  obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
> +obj-$(CONFIG_CONTEXT_DEVICE_BUS) += context_bus.o
>  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>  obj-y			+= power/
>  obj-$(CONFIG_ISA_BUS_API)	+= isa.o
> diff --git a/drivers/base/context_bus.c b/drivers/base/context_bus.c
> new file mode 100644
> index 000000000000..6ddb6c27bf69
> --- /dev/null
> +++ b/drivers/base/context_bus.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Some credits to the inspiring code would be nice.

> +
> +#include <linux/context_bus.h>
> +#include <linux/init.h>
> +
> +const struct bus_type context_device_bus_type = {
> +	.name = "context-device",
> +};
> +EXPORT_SYMBOL_GPL(context_device_bus_type);
> +
> +static int __init context_device_bus_init(void)
> +{
> +	int err;
> +
> +	err = bus_register(&context_device_bus_type);
> +	if (err < 0) {
> +		pr_err("context-device bus registration failed: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}

So is the consumer drivers are expected to do the device management for
this bus, this certainly is not correct and every consumer would be
duplicating it.

Did you consider faux bus?

> +postcore_initcall(context_device_bus_init);
> diff --git a/include/linux/context_bus.h b/include/linux/context_bus.h
> new file mode 100644
> index 000000000000..0cd44cb5b147
> --- /dev/null
> +++ b/include/linux/context_bus.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __LINUX_CONTEXT_BUS_H
> +#define __LINUX_CONTEXT_BUS_H
> +
> +#include <linux/device.h>
> +
> +#ifdef CONFIG_CONTEXT_DEVICE_BUS
> +extern const struct bus_type context_device_bus_type;
> +#endif
> +
> +#endif /* __LINUX_CONTEXT_BUS_H */
> 


