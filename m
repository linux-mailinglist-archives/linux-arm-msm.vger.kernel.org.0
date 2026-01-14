Return-Path: <linux-arm-msm+bounces-89070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAEAD21441
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 839AE30533BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239A5356A38;
	Wed, 14 Jan 2026 21:06:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86FA357A34;
	Wed, 14 Jan 2026 21:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424774; cv=none; b=HTTQKBIF0qWkA5IjzAjvWmF9XfB6WJVO+bcUovgyI3uuWoxzyDmTPmK6DUDbEZ3Bychah5UX6j1Ct8jlcJm9xXM0B/tzPkH7EaqGlOUd9hpcgjiZJb2bW78PkpNU+limYttCv5hTDdjl65+MtcF6MBV1neXoifB1sukVQ9XXdoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424774; c=relaxed/simple;
	bh=/olI7K1iCiuQwD+KYfd9LVc59nvrvfvQwRL9Amhn/no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAUY56ZnhPAfuPKQJjnMy0Hxoqt00+mJ+TniGdlZeXEJveS+UnIApEApQ0aHf2xFmb+gSiIAuy3VHJKa2emR9VKBaUmUFgmyooLoQVuMWCplZfGA7bf9OwPm+qMpPfJGjoovfV2QeLIu6Ay7+ZUOjfrmS9ta7ZLJ9aL6vmshax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B0951515;
	Wed, 14 Jan 2026 13:06:05 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 172B23F59E;
	Wed, 14 Jan 2026 13:06:09 -0800 (PST)
Date: Wed, 14 Jan 2026 21:06:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgFPuyVRNLPH3J0@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>

On Wed, Jan 14, 2026 at 06:12:29PM +0100, Neil Armstrong wrote:
> On 1/13/26 07:24, Satya Durga Srinivasu Prabhala wrote:
> > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > 
> > On platforms where a vendor SoC driver already exposes widely-consumed
> > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > 
> > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > prefer SMCCC over a vendor driver can explicitly enable it.
> > 
> > This avoids unexpected format changes and keeps the generic SoC sysfs
> > stable on systems that rely on vendor-specific identification.
> > 
> > [1]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> > 
> > Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> > ---
> >   drivers/firmware/smccc/Kconfig | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> > index 15e7466179a6..f830d11ebdca 100644
> > --- a/drivers/firmware/smccc/Kconfig
> > +++ b/drivers/firmware/smccc/Kconfig
> > @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
> >   config ARM_SMCCC_SOC_ID
> >   	bool "SoC bus device for the ARM SMCCC SOC_ID"
> >   	depends on HAVE_ARM_SMCCC_DISCOVERY
> > -	default y
> > +	default n
> >   	select SOC_BUS
> >   	help
> >   	  Include support for the SoC bus on the ARM SMCCC firmware based
> >   	  platforms providing some sysfs information about the SoC variant.
> > +	  Note: Several vendor platforms provide their own SoC information
> > +	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
> > +	  formats in /sys/devices/socX/*, this driver defaults to disabled.
> > 
> > ---
> > base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> > change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
> > 
> > Best regards,
> 
> Disabling it by default impacts other platforms, the arm64 kernel is designed
> to be generic and run on any platform with defconfig and from the same build,
> please don't forget that.
> 
> If you want to ship an arm64 kernel tailored for Qualcomm platforms, you're
> allowed, and you're also allowed to disable ARM_SMCCC_SOC_ID.
> 

Exactly!

> The soc sysfs interface is designed to support multiple source of information,
> from vendor (like qcom socinfo) and smccc ID. And this is well documented,
> and pretty obvious...
> 

Indeed, otherwise soc_device_register() would have failed for more than one
calls to it if that was the design/intention.

-- 
Regards,
Sudeep

