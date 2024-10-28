Return-Path: <linux-arm-msm+bounces-36130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3679B2A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7400FB21813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B743193404;
	Mon, 28 Oct 2024 08:30:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F21318C91F;
	Mon, 28 Oct 2024 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104258; cv=none; b=AOFtemi0fjGST7q18+z58V18cd+g3Ed3GvX/zr2ZNKx9z17Pwb1D5G9uwP4jXlLIMYwkmyh1p5yeeZYBhYgw3fgQGjApz8STBNvFjgiABM/dW5mM7khgJY2wf8N5qdBSKcJHKJWOqgzK9vglKIUy/9R2akVNHJ8jSBZA7w83rR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104258; c=relaxed/simple;
	bh=SxDNqWvehQAVfw/KbkPlHcInjBtTVKFEJ8TH0qIR6rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj/S+eYFd6cdfJ6GdZssFv32SlH1dJJo60EpIQd+hGG3veS7ZeHcreqZnI89aS/HogOUw+z8MC1Rtc+3IGELr4IZJpbo9sobCGlodl06xTBYZX0OrJ+NTX5Yyl4uvOscNWnqG5TJHg7jFIKT+OlWy1M6orgcAnkaDWUD/F+Qh0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECFA7497;
	Mon, 28 Oct 2024 01:31:23 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E64A3F66E;
	Mon, 28 Oct 2024 01:30:51 -0700 (PDT)
Date: Mon, 28 Oct 2024 08:30:44 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <Zx9LtHqjGEytU5kA@pluto>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>

On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
> 
> 

Hi Sibi,

one more thing down below...

> On 10/7/24 23:27, Dmitry Baryshkov wrote:
> > On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> > > Introduce a client driver that uses the memlat algorithm string
> > > hosted on QCOM SCMI Generic Extension Protocol to detect memory
> > > latency workloads and control frequency/level of the various
> > > memory buses (DDR/LLCC/DDR_QOS).

[snip]

> > > +		}
> > > +		info->memory[info->memory_cnt++] = memory;
> > > +
> > > +		do {
> > > +			snprintf(name, sizeof(name), "monitor-%d", memory->monitor_cnt);
> > > +			struct device_node *monitor_np __free(device_node) =
> > > +				of_get_child_by_name(memory_np, name);
> > > +
> > > +			if (!monitor_np)
> > > +				break;
> > > +
> > > +			if (memory->monitor_cnt >= MAX_MONITOR_CNT)
> > 
> > Why do you need to limit it? Is it a protocol limitation or an
> > artificial driver limitation? Can monitors be allocated dynamically?
> 
> Yeah, they are limited to a max of 5 in firmware.

Similarly as I already commented elsewhere, in an SCMI-based platform
this is something you should be able to discover at run-time with a
query command of some kind (or using some bits of the existing cmds)
....so that you dont have this dependency on constants defined and
built into the platform fw....what if your fw evolves to allow more
monitors ?

Thanks,
Cristian

