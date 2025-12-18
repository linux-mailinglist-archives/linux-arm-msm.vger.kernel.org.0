Return-Path: <linux-arm-msm+bounces-85674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF6CCB738
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 669F0300796B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 10:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9EA3321D1;
	Thu, 18 Dec 2025 10:40:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BECC32F755;
	Thu, 18 Dec 2025 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054434; cv=none; b=DFGFgrIOzIDWpO+3elzX2fbiOiv+ytjcmHYRnYVoTKk8Bh3W05mzuOs4wgLmLV1C5zhXOImbRrMowPI/yNAE85g21jPwzG48Qp7KFmaupIq8zeT+3Xdn2DCc4MFL1Xyk31nqPMbInUkEUSFuLOXVF1htOmoRERdQMgYk/JSTqGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054434; c=relaxed/simple;
	bh=ShR/4WJQwz/x8TvenQiL57KaayFm16gNh3rFme1Re+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ci0BxL3+i2qpUsNd+f993l3pqF9cMaw/qr3OLp/5Nd0si+9wXZ1+im3jNNW2eTnOVO+jVTYSgM7CqxL4Kqu6kpxwZAwYUJJQwhYJT7ZxaBVwR2r6KyMRhI3kIh+JYB1YmcolH4+T4U8AfReo6yC9Qwq96D7YY3pa1EMCr/aijgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BBCFEC;
	Thu, 18 Dec 2025 02:40:22 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99EC63F73F;
	Thu, 18 Dec 2025 02:40:29 -0800 (PST)
Date: Thu, 18 Dec 2025 10:40:27 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <20251218104027.GA1790402@e132581.arm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>

Hi,

On Thu, Dec 18, 2025 at 12:09:40AM -0800, Coresight ML wrote:

[...]

> - Utilizing `smp_call_function_single()` to ensure register accesses
>   (initialization, enablement, sysfs reads) are always executed on a
>   powered CPU within the target cluster.

This is concerned as Mike suggested earlier.

Let me convert to a common question: how does the Linux kernel manage
a power domain shared by multiple hardware modules?

A general solution is to bind a power domain (let's say PD1) to both
module A (MOD_A) and module B (MOD_B).  Each time before accessing MOD_A
or MOD_B, PD1 must be powered on first via the pm_runtime APIs, with
its refcount increased accordingly.

My understanding is the problem in your case is that the driver fails to
create a relationship between the funnel/replicator modules and the
cluster power domain.  Instead, you are trying to use the CPUs in the
same cluster as a delegate for power operations - when you want to
access MOD_B, your wake up MOD_A which sharing the same power domain,
only to turn on the PD_A in order to access MOD_B.

Have you discussed with the firmware and hardware engineers whether it
is feasible to provide explicit power and clock control interfaces for
the funnel and replicator modules?  I can imagine the cluster power
domain's design might differ from other device power domains, but
should not the hardware provide a sane design that allows software to
control power for the access logic within it?

General speaking, using smp_call_function_single() makes sense if only
when accessing logics within the CPU boundary.

P.s., currently you can use "taskset" as a temporary solution without
any code change, something like:

  taskset -c 0 echo 1 > /sys/bus/coresight/devices/etm0/enable_source

Thanks,
Leo

