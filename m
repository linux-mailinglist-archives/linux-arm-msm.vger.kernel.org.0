Return-Path: <linux-arm-msm+bounces-85825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE4CCF5AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38B833003F68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF7A2FCBE1;
	Fri, 19 Dec 2025 10:21:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C993B2D4811;
	Fri, 19 Dec 2025 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139693; cv=none; b=ReK1GZHUcrNLMPgCcPpty7jrrYsC8hcJ1TO/iFrsjYpAFtcNxSXYTuo16J1exZiKjjMrPfFaRJRyHDHxxdtPJLPuPQGmMwTC26GAtBmJJVczo6s4h7wsRkr4qBKiAm/aL5LLndPPxu2NN2/2l1ZSb+DqMcxbp7zZi6ZyCCClXO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139693; c=relaxed/simple;
	bh=t+xSXD7qUcG4rC7yvLgvx4s12YsxgS5z5UgUNH8E0to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkOSg0aJMPq+79MosId8hsTvy+DIcyDT2Axrq6tD96L248UpBCCMyEcVtoSm4V2Prtdnx98cO9WxXR/hvbFUaQAxJdeHb+TjbrFWtTGQCoEJsGVou0whQ0virWxqEMv8oFRonYLCkpmfSv8pS7FM1pRpSPsgKlbVkIP7b7rrKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF53DFEC;
	Fri, 19 Dec 2025 02:21:23 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55BAD3F5CA;
	Fri, 19 Dec 2025 02:21:27 -0800 (PST)
Date: Fri, 19 Dec 2025 10:21:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster
 funnel/replicator/tmc support
Message-ID: <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
> 
> 
> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
> > On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
> >> This patch series adds support for CoreSight components local to CPU clusters,
> >> including funnel, replicator, and TMC, which reside within CPU cluster power
> >> domains. These components require special handling due to power domain
> >> constraints.
> >>
> > 
> > Could you clarify why PSCI-based power domains associated with clusters in
> > domain-idle-states cannot address these requirements, given that PSCI CPU-idle
> > OSI mode was originally intended to support them? My understanding of this
> > patch series is that OSI mode is unable to do so, which, if accurate, appears
> > to be a flaw that should be corrected.
> 
> It is due to the particular characteristics of the CPU cluster power
> domain.Runtime PM for CPU devices works little different, it is mostly used
> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
> framework to manage the last CPU handling in cluster.

That is indeed the intended design. Could you clarify which specific
characteristics differentiate it here?

> It doesn’t really send IPI to wakeup CPU device (It don’t have
> .power_on/.power_off) callback implemented which gets invoked from
> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
> 

I am quite lost here. Why is it necessary to wake up the CPU? If I understand
correctly, all of this complexity is meant to ensure that the cluster power
domain is enabled before any of the funnel registers are accessed. Is that
correct?

If so, and if the cluster domains are already defined as the power domains for
these funnel devices, then they should be requested to power on automatically
before any register access occurs. Is that not the case?

What am I missing in this reasoning?

The only explanation I can see is that the firmware does not properly honor
power-domain requests coming directly from the OS. I believe that may be the
case, but I would be glad to be proven wrong.

> > 
> >> Unlike system-level CoreSight devices, these components share the CPU cluster's
> >> power domain. When the cluster enters low-power mode (LPM), their registers
> >> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> >> out of LPM, making standard register access unreliable.
> >>
> > 
> > Are these devices the only ones on the system that are uniquely bound to
> > cluster-level power domains? If not, what additional devices share this
> > dependency so that we can understand how they are managed in comparison?
> > 
> 
> Yes, devices like ETM and TRBE also share this power domain and access constraint.
> Their drivers naturally handle enablement/disablement on the specific CPU they
> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).

I understand many things are possible to implement, but the key question
remains: why doesn’t the existing OSI mechanism - added specifically to cover
cases like this solve the problem today?

Especially on platforms with OSI enabled, what concrete limitation forces us
into this additional “wake-up” path instead of relying on OSI to manage the
dependency/power sequencing?

> >> To address this, the series introduces:
> >> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
> >>   device tree property.
> > 
> > Really, no please.
> > 
> 
> Our objective is to determine which CoreSight components are physically locate
> within the CPU cluster power domain.
>
> Would it be acceptable to derive this relationship from the existing
> power-domains binding?

In my opinion, this is not merely a possibility but an explicit expectation.

> For example, if a Funnel or Replicator node is linked to a power-domains
> entry that specifies a cpumask, the driver could recognize this shared
> dependency and automatically apply the appropriate cluster-aware behavior.
> 

Sure, but for the driver to use that information, we need clear explanation
for all the questions above. In short, why it is not working with the existing
PSCI domain idle support.

-- 
Regards,
Sudeep

