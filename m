Return-Path: <linux-arm-msm+bounces-89068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843FD2141D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 267D6300A345
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993B1311977;
	Wed, 14 Jan 2026 21:01:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E106E2D6E70;
	Wed, 14 Jan 2026 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424468; cv=none; b=IMcZnQUgEDFs0WFXbD2eS9zjLT4DWnge4nDDaGusTIGfogXwpeH/7AHl6WmsOccA1ek2icKvf4hJlrqO22UT9Z+mme3Bkc3s+5Ts5F06QKxQfq8lrEW/G60jyWq4XMwWs97+ULQQqUzSdRFzYTlbrgSAV544HBlXgUfyNCE1jDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424468; c=relaxed/simple;
	bh=WfFPw4TYyqlafML7l/PRZf1MtVjcn3JYWEk+AiuMKp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqFNq6MiqAHJ7EyS040RXSZJP2+/dhIuubbe0tr9hQSKjWHsqHtX6TdyPmVtJHmfr5Rk2441/16GjZHnRzA+gXmo1XVA84YpxpjTFd5lSjREsnfY8+W0R5sKxt82yCppFXKye+wbxrUS0QYZQvrGUqLIH8NmzkS+k6JZ2GcdMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08F741515;
	Wed, 14 Jan 2026 13:00:59 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4E53F59E;
	Wed, 14 Jan 2026 13:01:03 -0800 (PST)
Date: Wed, 14 Jan 2026 21:01:00 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgEDAlglnGrzdR4@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
> > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > 
> > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > 
> > Instead of relying on a vendor-specific SoC driver, we should consider
> > disabling it and using the OS-agnostic SoC information interface provided by
> > the firmware.
> Would like to add some history here. Vendor interface existed [1] even
> before
> SMCCC SMC ID was introduced [2]. And there are several user space entities
> which
> uses the soc0 interface already.

True, but that's not the main point.

> > The presence of this interface strongly suggests that the
> > firmware is designed to support multiple operating systems or software stacks
> > that already depend on it.
> That is correct. We started seeing the issue with user space when our
> firmware
> started implementing support for SMCCC SOC ID recently for non-Linux based
> product.
> As the firmware remain same across OSes, user space is broken on Linux.

What exactly do you mean by "firmware started implementing support for SMCCC
SOC ID recently for non-Linux based product" ? Does that really mean that
you can change the firmware for Linux based products ? I don't think so and
hence we are in this discussion.

1. Either it exists in which case deal with it by disabling vendor driver
   and/or fixing the userspace.

or

2. It doesn't exist which is not a problem.


> > Aligning the Linux kernel with this
> > firmware-defined, OS-agnostic mechanism would reduce vendor-specific
> > dependencies and improve portability. Any gaps can be addressed by enhancing
> > userspace to correctly parse and consume this information.
> Agree. Updating entire use space would need time and we are looking to see
> if vendor specific interface can be given priority over the standard
> interface.

That statement simply doesn't make sense at all. Your product took all the
effort to implement standards and then you don't want to use it at all.
As per your claims it is not even broken(in terms of data from the sysfs
files), so I don't know what to say here, sorry ?

> >   Given these
> > advantages, why would this approach not be the better long-term solution?
> As mentioned above, existing user space will be broken and fixing existing
> user space is going to take time. As the feature itself is "optional" from SMCCC
> specification, if we can't disable by default, we should at-least have a way
> to disable the feature by other means.
>

The data given to the userspace from the kernel is not broken. The userspace
tool seem to have made a wrong assumption and can't expect the kernel to
magically fix the issue here.

E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.

-- 
Regards,
Sudeep

