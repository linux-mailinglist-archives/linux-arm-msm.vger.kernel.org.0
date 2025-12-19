Return-Path: <linux-arm-msm+bounces-85836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26929CCF6F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B241F30049C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFB82FF144;
	Fri, 19 Dec 2025 10:42:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B566D2882A9;
	Fri, 19 Dec 2025 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140966; cv=none; b=O566JSuVhgLWjDz4OJ4fjRABtamhr/lx7avGfuWyRQTSsMUNr74MA6/nF3qjPo4RR1/ZNnRCy0wzRBxEH/VtF2Pa6RoKmeDzGcY9X9FismXPrCFymTQPYUdK4t4qYSVV39Y6ep3lw+Tpsuq51QBsOYvyM/xeChbJ3+LOtXauyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140966; c=relaxed/simple;
	bh=j80u/3tGqchMI0uX25fhG4G01nqVVbFk3nPN3+udHKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLoez0pvlDlf6BpQ8RAdBckv8Wnj5Q3USbn6vD/j12ZwFsFze30DpT6m8srSrNQUsoagEO2NkOlrCnG5Ph857xDBC5IKRkgcbORGnll1VH5JYLyUxwGJbsndTQEUvGqMMj0x0WzssqBATQcLWAxWI45sUCGcXVKJbUMpRTmS8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF2C106F;
	Fri, 19 Dec 2025 02:42:37 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE2FB3F5CA;
	Fri, 19 Dec 2025 02:42:43 -0800 (PST)
Date: Fri, 19 Dec 2025 10:42:41 +0000
From: Leo Yan <leo.yan@arm.com>
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
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
Message-ID: <20251219104241.GB9788@e132581.arm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218104027.GA1790402@e132581.arm.com>
 <927f15d5-da2a-4282-b80f-c1c7563a4367@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <927f15d5-da2a-4282-b80f-c1c7563a4367@oss.qualcomm.com>

On Fri, Dec 19, 2025 at 09:50:18AM +0800, yuanfang zhang wrote:

[...]

> It is due to the particular characteristics of the CPU cluster power domain.
> Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
> CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
> cluster.
> It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
> implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
> the upstream Kernel.

Just for easier understanding, let me give an example:

    funnel0: funnel@10000000 {
        compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
        reg = <0x10000000 0x1000>;

        clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
        clock-names = "apb_pclk", "atclk";
        power-domains = <&cluster0_pd>;
    }

If funnel0 is bound to cluster's power domain, kernel's genPD will
automatically enable cluster power domain before access registers.

My understanding is your driver or firmware fails to turn on a cluster
power domain without waking up a CPU (and without sending IPI).  It is
not a kernel issue or limitation, and no any incorrect in PSCI OSI.

As Suzuki said, you might directly reply Sudeep's questions.  We would
confirm if any flaw in common code.

> > P.s., currently you can use "taskset" as a temporary solution without
> > any code change, something like:
> > 
> >   taskset -c 0 echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> 
> This can address the runtime issue, but it does not resolve the problem during the probe phase.

Indeed.  If you insmod mode, you might can temporarily disable idle
states?

    exec 3<> /dev/cpu_dma_latency; echo 0 >&3
    insmod
    exec 3<>-

Thanks,
Leo

