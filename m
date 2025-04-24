Return-Path: <linux-arm-msm+bounces-55449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A8A9B282
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 17:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E69234C0D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E22327F73A;
	Thu, 24 Apr 2025 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uPlvWy8m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5BE27F724
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508933; cv=none; b=db5M7/QGbB+vg/3Hb7cRtmvUTMNiYhPTT6HEMho5zAYY6xIEpXqgEWqUhXDNA9LFlqqQu5AEanA68YxxAt14uF/Si5gPqnaOJI7RsMjlbwqJQNH0/z8uVXAG2r5Y4Jl5/NvRr3mxHL83KgvACreuid0sBd8PyDxBiVQvoa7ncNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508933; c=relaxed/simple;
	bh=JnnJiDGwNig+VJDSU2cyGVNNE8jT8igWXXznUgHTtzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REN8InZpFkwT9pwzhtpJ22MSBnEpJoEagrUum2zu8vS+rfEUDUcqKS4VQjnAvSyl5J4TwWzS3/jrLZAAXfAJqb8/fnbpiDo6nHY/Ju5DXbpcQa7T25jpnr/zwseS0UAj9FYaF5IQk6hOq2EDTsEArgaqVw1cc98tqQZTHKhG3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uPlvWy8m; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 24 Apr 2025 08:34:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745508918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=56D9mlZ7M1G0UnSJJ2M8dPTg3+XAXsTfHIm3FcS4+KU=;
	b=uPlvWy8mqcGR38PBfc5+PqGpUgQvemUopmsCBqLVIoh839eUhODfU/26KLKzoSaLttPLvb
	gz7zKbif6GXHNzHYVSixNwTvM02m6fCFHtG9RXkVn/9kR5KcNgxYlVK2zrbq78l4qXykvi
	NmVcZf0rqKXbNPdrMCYklhj0ccawDR4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Karim Manaouil <karim.manaouil@linaro.org>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>, Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [RFC PATCH 00/34] Running Qualcomm's Gunyah Guests via KVM in EL1
Message-ID: <aApaGnFPhsWBZoQ2@linux.dev>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 24, 2025 at 03:13:07PM +0100, Karim Manaouil wrote:
> This series introduces the capability of running Gunyah guests via KVM on
> Qualcomm SoCs shipped with Gunyah hypervisor [1] (e.g. RB3 Gen2).
> 
> The goal of this work is to port the existing Gunyah hypervisor support from a
> standalone driver interface [2] to KVM, with the aim of leveraging as much of the
> existing KVM infrastructure as possible to reduce duplication of effort around
> memory management (e.g. guest_memfd), irqfd, and other core components.
> 
> In short, Gunyah is a Type-1 hypervisor, meaning that it runs independently of any
> high-level OS kernel such as Linux and runs in a higher CPU privilege level than VMs.
> Gunyah is shipped as firmware and guests typically talk with Gunyah via hypercalls.
> KVM is designed to run as Type-2 hypervisor. This port allows KVM to run in EL1 and
> serve as the interface for VM lifecycle management,while offloading virtualization
> to Gunyah.

If you're keen on running your own hypervisor then I'm sorry, you get to
deal with it soup to nuts. Other hypervisors (e.g. mshv) have their own
kernel drivers for managing the host / UAPI parts of driving VMs.

The KVM arch interface is *internal* to KVM, not something to be
(ab)used for cramming in a non-KVM hypervisor. KVM and other hypervisors
can still share other bits of truly common infrastructure, like
guest_memfd.

I understand the value in what you're trying to do, but if you want it
to smell like KVM you may as well just let the user run it at EL2.

Thanks,
Oliver

