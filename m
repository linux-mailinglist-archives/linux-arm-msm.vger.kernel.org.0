Return-Path: <linux-arm-msm+bounces-85811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B47E9CCF4AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1CD130088AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31092D061D;
	Fri, 19 Dec 2025 10:07:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7367C23314B;
	Fri, 19 Dec 2025 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138822; cv=none; b=aGCJom1BmZpjZbJF6gp6ORxl8qubfubq6Sa3PEMMyYlpVfWfLaxs7JlqfOOLJqzcAFSj8qATxG0H9/Jd/gxDZ2KStpgzHpx6HwjgdVJS+MFI6ec1LTReG96ywRWaB8XNDzV0pP+lJQ9kk1Dp0D4aCwmBPH4ssXuvuUHwmwf6Au8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138822; c=relaxed/simple;
	bh=dRG7vzSwAtkDVME2xU1nSOs00iPddJEGzCF6EtLj7V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTveL60oY2TxDXTHXXrUeIow47COdg9td2EfyPOdH+l8ZDZ57jh1lAsbxY8/AxejGYN+PqNvOl9e7yHgf9xZpzlxHIYCxDUGOX2pI5Vd3fDcD7vUrCAdRkVdbr0a8t7DptLDgzZWPF6hYCLstPWyYQ8RtK3X4b07MkeHvgFzGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44F8CFEC;
	Fri, 19 Dec 2025 02:06:52 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F7E3F5CA;
	Fri, 19 Dec 2025 02:06:55 -0800 (PST)
Date: Fri, 19 Dec 2025 10:06:52 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, <kernel@oss.qualcomm.com>,
	<coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <maulik.shah@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster
 funnel/replicator/tmc support
Message-ID: <20251219-rugged-hamster-of-force-63bdc6@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <47191600-260a-46aa-9af8-dff2b08dc2e8@arm.com>
 <8cb8fad9-c54e-43a3-a769-5452119cc2a1@oss.qualcomm.com>
 <3d4dd3d0-fca0-45ac-a833-e8f7f5d1aa95@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d4dd3d0-fca0-45ac-a833-e8f7f5d1aa95@arm.com>

On Thu, Dec 18, 2025 at 05:04:07PM +0000, Suzuki K Poulose wrote:
> On 18/12/2025 16:18, yuanfang zhang wrote:
> > 
> > On 12/18/2025 5:32 PM, Suzuki K Poulose wrote:
> > > Cc: Sudeep
> > > 
> > > On 18/12/2025 08:09, Yuanfang Zhang wrote:
> > > > This patch series adds support for CoreSight components local to CPU clusters,
> > > > including funnel, replicator, and TMC, which reside within CPU cluster power
> > > > domains. These components require special handling due to power domain
> > > > constraints.
> > > > 
> > > > Unlike system-level CoreSight devices, these components share the CPU cluster's
> > > > power domain. When the cluster enters low-power mode (LPM), their registers
> > > > become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> > > > out of LPM, making standard register access unreliable.
> > > 
> > > Why ? AFAIU, we have ways to tie the power-domain to that of the cluster
> > > and that can auto-magically keep the cluster power ON as long as you
> > > want to use them.
> > > 
> > > Suzuki
> > > 
> > Hi Suzuki
> > 
> > Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
> > CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
> > cluster.
> > It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
> > implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
> > the upstream Kernel.
> 
> Why does it need to wake up the CPU ? The firmware can power up the
> cluster right? Anyways, to me this all looks like working around a
> firmware issue. I will let you sort this out with Sudeep's response
> , as I am not an expert on the cluster powermanagement and standards.
> 

Indeed smells like a some workaround, will respond in another email in the
thread to capture other points as well.

-- 
Regards,
Sudeep

