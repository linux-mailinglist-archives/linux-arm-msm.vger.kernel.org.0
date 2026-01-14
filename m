Return-Path: <linux-arm-msm+bounces-89072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99303D2148C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1383530155F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AFC35E551;
	Wed, 14 Jan 2026 21:13:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C76035E545;
	Wed, 14 Jan 2026 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425207; cv=none; b=jFCGuZoyNqxo62EpsoN3xbmqQ1qPIpIwWNXWlwtVIODzADTN71XvU5677nxzEiVgUKc9O6G2tCgMF/9CAyGs//jru1MHu9TDzD2gWS0UvpgT7sCLJd/4DQ5uJgIXDGZYJmyHabXhJqGu3TcMEkmwq/sBiqzKRC8OaQUNilFJ4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425207; c=relaxed/simple;
	bh=CiL5cgEZmE++Q3W0wii27vSM3FkEWgWli18793F0T0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzNVuT4kaIPNdqWhr3EzmDKSZrV4jmokcqS0QtPTEkpqKZvAsktWEX9QeuvggxNnRkpBprfJtzR+vKwrdrNB11JO8X0U4Z1jdl4TqdOQE6CkoMQWn4mR1TOT3nPY8NSKpiVgftDUYHYxagFsDBhNKD6ay7rTFXJDmLc8tqVX5KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 798151515;
	Wed, 14 Jan 2026 13:13:19 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC7353F59E;
	Wed, 14 Jan 2026 13:13:23 -0800 (PST)
Date: Wed, 14 Jan 2026 21:13:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgG8EbNgn_wXPjh@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWYk_qGvA9Kn0xGe@willie-the-truck>
 <6e674553-d0e5-449a-a49f-84f5d32cec94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e674553-d0e5-449a-a49f-84f5d32cec94@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 08:58:01AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Will,
> 
> On 1/13/2026 2:57 AM, Will Deacon wrote:
> > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > 
> > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > Isn't the fundamental issue here that you have multiple callers of
> > soc_device_register() and your userspace is only looking at soc0?
> Yes, that is right. The issue is we have several products which already
> uses the soc0 interface as vendor interface [1] existed even before the
> SMCCC SCM ID [2]. Also, per SMCCC specification, SOC ID is an optional
> feature.

Yes it is optional and that means kernel won't complain if it is not
implemented in the firmware.

> So, vendor specific implementation can take precedence over
> standard implementation or a way to disable SMCCC SOC ID could help.
> 

Yet this vendor specific implementation chose to implement the optional
feature when it needed the vendor specific implementation can take precedence
over this. It had the choice and when it implemented it, it choose and
it can't expect the generic OS to ignore firmware standard interface
just because it has vendor specific implementation else where.

And one of the reasons some of the vendors needed this SOC_ID in the
SMCCC is o avoid or have precedence over any other interface(like DT/ACPI)
that can override or provide other information.

-- 
Regards,
Sudeep

