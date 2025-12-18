Return-Path: <linux-arm-msm+bounces-85681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16DCCBA3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CF5B3008A2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 11:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0125931771B;
	Thu, 18 Dec 2025 11:37:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFC23128A2;
	Thu, 18 Dec 2025 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057838; cv=none; b=fyDgvh7R2VsJMTVp/G1Gu/LXTVfP+9juq/iONa2wQo8kQPmI0lvKhpEwNk6vA0Bxu5jgknc7zRCzE3bV6psRw5K3Ga6ByEAzt4OaVPDymlVCghaLzFNLKD3jOmTpJzqy2YRmqokxbBmIN4iBjBHitsIcd6DNQTeHSaOlCS+fqnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057838; c=relaxed/simple;
	bh=dYtgYHJEGzGHGfnhn9iHhaOK+NpGSV9e37nJQdyXUk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZCcqHCoycMlhyLb0lwTBJ+x8dSGAzWozyYJ42ecMTbL/ESzgoM5xbnvSw+pceGKrMe194OTVOe8j+F43lwT5VNwvBmbQlhW6MfiUFVEkv2WavxEnUOJ4V8ocRPIVirqZ7L7ndzmkEJrB1w+mgq80MKiK0NAJ/jP+5FgxwALh98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B0F3FEC;
	Thu, 18 Dec 2025 03:37:09 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 890373F73F;
	Thu, 18 Dec 2025 03:37:13 -0800 (PST)
Date: Thu, 18 Dec 2025 11:37:10 +0000
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
	linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com
Subject: Re: [PATCH v2 01/12] dt-bindings: arm: coresight: Add
 'qcom,cpu-bound-components' property
Message-ID: <20251218-silky-skylark-of-purring-20faa5@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-cpu_cluster_component_pm-v2-1-2335a6ae62a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-1-2335a6ae62a0@oss.qualcomm.com>

On Thu, Dec 18, 2025 at 12:09:41AM -0800, Yuanfang Zhang wrote:
> Introduce the `qcom,cpu-bound-components` boolean property for CoreSight
> components (TMC, Funnel, and Replicator).
> 
> This property indicates that the component is physically located within a
> CPU cluster power domain. Such components share the power state of the
> cluster and may require special handling (e.g., cross-CPU register
> access) compared to system-wide components.
> 

NACK, and the rationale expressed as a question:

If unique compatibles were required to determine the power domains to which
devices belong, we would have accumulated numerous additional compatibles for
every IP block used on new systems with even slightly different power-domain
configurations—a scenario that occurs frequently. Why, then, is such a
requirement considered necessary in this case?

-- 
Regards,
Sudeep

