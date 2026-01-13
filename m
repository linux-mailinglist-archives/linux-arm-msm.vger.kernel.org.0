Return-Path: <linux-arm-msm+bounces-88773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B18D18B5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2685F3007F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC76138A9BF;
	Tue, 13 Jan 2026 12:29:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2558A387561;
	Tue, 13 Jan 2026 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307352; cv=none; b=cwCvNZQJXxfRU3W5J/vwyC+DkmD30tt0xmK07O/Rf0vP9rgZL8ty1vBmIrtcDuhORrxf1s9O0AcBzosIMp6rPTaf0cbiNRImCj/P36Q+P7+sT9WRH/E0u9bScLWcRF7KAXGlcDmgf//GoKRh1K+NZko00dujfDU5TNJJPyQPQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307352; c=relaxed/simple;
	bh=fm0AP5e7qZ3lz37Yzy3vu/dHVWToxdG6wdbxg2F0g0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfICZaPY3Clk61cnfIwjq9jxwjw8epLBOPZVh8azLZv3nWo6ahZHmc5C+q0weKOJALKXtbPvpIqoFv+WPDAz7JA/6E3w2FaRdyquKpPrVi4nwg0WEt1pfVGdO7mJHPEh4mMA5SeVNmA33VuKcKrOhvLTEnVqsVZViCqzXPqWNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84F8497;
	Tue, 13 Jan 2026 04:29:03 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38F33F59E;
	Tue, 13 Jan 2026 04:29:09 -0800 (PST)
Date: Tue, 13 Jan 2026 12:29:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWY6kx8Bwa_2azIl@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 

Instead of relying on a vendor-specific SoC driver, we should consider
disabling it and using the OS-agnostic SoC information interface provided by
the firmware. The presence of this interface strongly suggests that the
firmware is designed to support multiple operating systems or software stacks
that already depend on it. Aligning the Linux kernel with this
firmware-defined, OS-agnostic mechanism would reduce vendor-specific
dependencies and improve portability. Any gaps can be addressed by enhancing
userspace to correctly parse and consume this information. Given these
advantages, why would this approach not be the better long-term solution?

-- 
Regards,
Sudeep

