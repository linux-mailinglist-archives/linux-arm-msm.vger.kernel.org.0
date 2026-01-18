Return-Path: <linux-arm-msm+bounces-89541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 87438D39729
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 15:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5D8C30021EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 14:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D525C32E739;
	Sun, 18 Jan 2026 14:31:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A3F3B2AA;
	Sun, 18 Jan 2026 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768746690; cv=none; b=FO+pgdr5jpQX53XIfvgEbB6Tw4NCwdc1lgoiuPvWMAd3V3LcGmCQfvsrq2AdAVLiG9pdM688Q7Qcpn8BaVoaECx1FXczh55w0Po1J15oBV83iw9qSS9LJ/X+5swRtuOsBX0HTkINij9+2jY2Tz/nOIQe63KGz811ANrWhmMIZ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768746690; c=relaxed/simple;
	bh=OclfGRtlHQXkKWMzwZ1Q/JncMvKyrLfwqFpy2l9ZkqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6xA5YFKc1D7gq+BK5WJda28Jl6tDFtuIyRBAWF5tM2YSEnWYsG9aXrASBRSSd+T2In4SFSz2fQW2WBHW7FjG7Jj7mvPqNcwS5rZ7/nxoJVLqnSSB7O6WPOnFVrU9fjOEdZk+iwwh7rKVVptGalR88puh9heQYwf0Z+TMFQOceA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A8E41517;
	Sun, 18 Jan 2026 06:31:21 -0800 (PST)
Received: from bogus (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A37B3F59E;
	Sun, 18 Jan 2026 06:31:25 -0800 (PST)
Date: Sun, 18 Jan 2026 14:31:23 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWzuuwQi_nsHoj_5@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>

On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> 
> I believe that point(s) we have not touched upon are following:
> 
> There will be thousands of Android applications using the native interfaces
> in the playstore in various regions like US and China and so on, which relies
> on getting the SOC_ID to understand the product and enable / disable some features.
> 
> For example, benchmarks like GeekBench or Antutu may also be reading these
> interfaces.
> 
> There are apps. in certain regions which are still not updated from "32-bit"
> to 64-bit on Android yet as an example and there may be no way to reach out
> to those developers to fix but apps. are still used by many users.  
> 

Fair enough, but apps get updated on Android phones every day. So sorry if I
don’t consider this as something impossible. I do understand many apps are not
actively developed, yet that is no reason to say the wrong assumptions made by
these apps are correct.

> If we need to move all of these third-party applications to this new interface
> then we have to "break them" before we fix them. Do we want to have such approach?
> 

Sorry, which new interface are you referring to?
Are we still talking about /sys/devices/socX/?
If so, are you suggesting that X=0 and X=1 represent two different interfaces?
If that’s the case, I honestly have no words.

> We should not have enabled this feature as "default y" in the first place and should
> have kept it as "tristate" or kept it disabled in my opinion.
> 

Sorry, but how do you envision this working with a single defconfig? Please
consider the issues on platforms beyond the ones you’re focused on as well.

-- 
Regards,
Sudeep

