Return-Path: <linux-arm-msm+bounces-89071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF090D21447
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C67D30223FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CEA34F27F;
	Wed, 14 Jan 2026 21:07:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE9C3559DF;
	Wed, 14 Jan 2026 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424836; cv=none; b=d3KbS4nwn38VMRtxssm1BKeCRyWV4wUbf5G5P7VmXf8wZZRTNUVACktxen9oz3d+5MRDACbJ8yKZj7lJtyB9gG5WPxRkc0cR7DFS5W4qinQ6ShKHn7ShwCfDwSU01kA4250l7vYc9Opa31/oiwMQirXAEqEJVscdjZbYCanaAU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424836; c=relaxed/simple;
	bh=mUY3veB0TfxSOCFJXpHQd7rsdDSlrf7xU1ZqflxlXmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4H1sLc7u06qnRpKGMdrjCgBwPPV0vXbpzhlECnEtMNXluvMxhcM4MLNuhiYLEz/+ogFq4oRrhsZ0n92pvXnxoswnQmbqCvf6taYW7pi6/JeeN9MBPH40rNKu9ojdeg+bnGAZJn7xROyyxtuBSzgfwz+b/hUhRNDA6Ncn1KpErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D51DB1515;
	Wed, 14 Jan 2026 13:07:07 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E3B03F59E;
	Wed, 14 Jan 2026 13:07:12 -0800 (PST)
Date: Wed, 14 Jan 2026 21:07:09 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgFfUug5nVY5rQQ@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <20260113080405.jr7ky4ypnewojiij@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113080405.jr7ky4ypnewojiij@hu-mojha-hyd.qualcomm.com>

On Tue, Jan 13, 2026 at 01:34:05PM +0530, Mukesh Ojha wrote:
> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
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
> 
> Fixes tag ??
> 

Sorry which commit is broken ?

-- 
Regards,
Sudeep

