Return-Path: <linux-arm-msm+bounces-85680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E3CCBAA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 808A930FDB52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE43325494;
	Thu, 18 Dec 2025 11:33:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918F43254AC;
	Thu, 18 Dec 2025 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057594; cv=none; b=rUCbCTD6X//0Qh9pKA8pZiyD1dcnsUqIGHb4oDQOmIe1UNWjkSXo/cGhJkO/bV0uEZA1B8TIAYK0zNf5Hnd5y88Ul2Gr8b5MTf8OEOkO1wlaghaOnMNg2Dp7iS9FAq22YZO9otXOyi9gYfGnM6vvPV5puxKmW7I6thvYPZrLZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057594; c=relaxed/simple;
	bh=1Lm1DOK8kCFTz9wO0VWshn6tNd2aPG8zFjlZeKo1r7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwexKdwhAJV7OLip3wkWB7dvvW94lwCk55BwojU+C8ewcOL1Vx2NPueLRjkXBiDQII+fNQW/9yBm3cjcm4H8FlEHHAbN7R7TXJjsQHuqGyhO3KuGTw6GZpZJ2ffNfXDc5OnchoRI3JoDGzZ8ScO9BVhovgVOP+ECN9QW+2awiqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D30C8FEC;
	Thu, 18 Dec 2025 03:33:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BAF13F73F;
	Thu, 18 Dec 2025 03:33:08 -0800 (PST)
Date: Thu, 18 Dec 2025 11:33:05 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
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
Message-ID: <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
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

On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
> This patch series adds support for CoreSight components local to CPU clusters,
> including funnel, replicator, and TMC, which reside within CPU cluster power
> domains. These components require special handling due to power domain
> constraints.
> 

Could you clarify why PSCI-based power domains associated with clusters in
domain-idle-states cannot address these requirements, given that PSCI CPU-idle
OSI mode was originally intended to support them? My understanding of this
patch series is that OSI mode is unable to do so, which, if accurate, appears
to be a flaw that should be corrected.

> Unlike system-level CoreSight devices, these components share the CPU cluster's
> power domain. When the cluster enters low-power mode (LPM), their registers
> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> out of LPM, making standard register access unreliable.
> 

Are these devices the only ones on the system that are uniquely bound to
cluster-level power domains? If not, what additional devices share this
dependency so that we can understand how they are managed in comparison?

> To address this, the series introduces:
> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>   device tree property.

Really, no please.

-- 
Regards,
Sudeep

