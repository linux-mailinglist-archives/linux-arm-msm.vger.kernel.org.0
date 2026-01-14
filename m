Return-Path: <linux-arm-msm+bounces-89069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF683D21426
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FDA6300DB10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AC4333452;
	Wed, 14 Jan 2026 21:03:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814882ED873;
	Wed, 14 Jan 2026 21:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424614; cv=none; b=LxMm7ACFWisXezBuerV/B+9z5QdkuiQOyxUVoxXQ/97MsjOFaeE/Z3av50UnYuS6mMceISr7UoQErTNKwa3mKBDk0MpvB+9lMvcGYBxhpuADtdrBJrW8L7GWVLLp7dTasAfcNagENHwaz83GJP6zOXI5wCtSOksuZkTgdIh+X5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424614; c=relaxed/simple;
	bh=t7fS7jAETl4yQw4T8QbXSfYyfT9p7F1MToPqX8bFqiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isgD+T1RYxKHcZFenKZY65T2UOsk3kXbOwvSmbQfarfqGuru1Z6BW+HGEG+XJbKytwQ5h9JQb1HuHeq3h6t1J/6KaIDCgiQ8U3rYRo29LzwFDHjh9pCsieTo8M+CjZkw5uhWMyaOCq8j7zeQzdVnMIoSCgkE3QV3GR7y8TKCiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4375B1515;
	Wed, 14 Jan 2026 13:03:26 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0B893F59E;
	Wed, 14 Jan 2026 13:03:30 -0800 (PST)
Date: Wed, 14 Jan 2026 21:03:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgEn4GmKwUOjNPe@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
 <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
 <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>

On Wed, Jan 14, 2026 at 09:37:24PM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:04:21AM -0800, Satya Durga Srinivasu Prabhala wrote:
> > Hello Dmitry,
> > 
> > On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
> > > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > > 
> > > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > > 
> > > > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > > > prefer SMCCC over a vendor driver can explicitly enable it.
> > > NAK, the userspace should not depend on the exact kernel configuration.
> > > Consider working with distribution kernels, which would enable this
> > > driver anyway.
> > As I mentioned in the other replies, vendor interface exists before the
> > standard
> > interface and user space heavily relies on soc0 already. If not disabling
> > the
> > SMCCC SOC ID by default. I believe, we should  at-least have a way to make
> > sure vendors can disable SMCCC SOC ID by some means or have vendor
> > interface takes precedence.
> 
> Please correct me if I'm wrong, what do you observe? SMCCC device on
> soc0 and qcom_socinfo at soc1?
> 
> In such a case the ABI file, Documentation/ABI/testing/sysfs-devices-soc clearly
> defines that there might be several different SoC devices (identified by
> different drivers, etc). If the userspace depends on qcom_socinfo device
> being soc0, then the userspace is broken.
> 
> Last, but not least, the soc_id format is documented in the ABI
> document. It is clearly allowed to have jep106 format in the soc_id. So,
> I think, you have two options: disable SMCCC 1.2+ in the firmware or
> adapt the userspace. You can't control e.g. the kernel that will be
> running on your platform (it very well can be a standard distro kernel
> from Debian, Ubuntu or Fedora, which obviously will have that driver
> enabled).
> 

Completely agree to all the points made here.

-- 
Regards,
Sudeep

