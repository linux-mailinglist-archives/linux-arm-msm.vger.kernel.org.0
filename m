Return-Path: <linux-arm-msm+bounces-50821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E13AA59300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CB53169793
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD37F220697;
	Mon, 10 Mar 2025 11:46:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD1E221579;
	Mon, 10 Mar 2025 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741607219; cv=none; b=P9ii1mjq5YEYa6X2iHh9q+ijaG7CJ+9XwU/ZCbqOwKAPF2FObVxr7tktTSA36vh7P8gS6a+MZ+mH2EHlV7fA0y6V1F3IsvrA5mG/koty4wmpINC7u0xEIcQ4my7KkKycP5Ft2Tn6BiOnOS2CNUxB3YuAmBXddMFPNR6CeKeoHEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741607219; c=relaxed/simple;
	bh=yf2cqzHBcdtuOPkuJYsk+j/uy92hemtTG5BduORTtLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssGUGVBVDqiQemGo5Xa3rTwPSKeIr+Odx0Fg0OA25Esz2omjfedSCS521VtAYKJfeQXZHYwjYWRjeRZObyxLkDUfJptaKOLrKCb7Ypag5MpJmXXNWF+pEohFoZ7Lrrn2ypTRmRXsNDO94WeoE+uECgcpKlsEp937GSDF4XI1tio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A643B1516;
	Mon, 10 Mar 2025 04:47:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEDD03F5A1;
	Mon, 10 Mar 2025 04:46:55 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:46:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] coresight-tnoc: add nodes to configure flush
Message-ID: <20250310114651.GD9682@e132581.arm.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-3-8afc6584afc5@quicinc.com>
 <20250227162349.GB2157064@e132581.arm.com>
 <7c702a81-fb6c-4399-8d7d-d8c4ad9a8c65@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c702a81-fb6c-4399-8d7d-d8c4ad9a8c65@quicinc.com>

On Thu, Mar 06, 2025 at 04:39:27PM +0800, Yuanfang Zhang wrote:

[...]

> >> +static ssize_t flush_req_store(struct device *dev,
> >> +                              struct device_attribute *attr,
> >> +                              const char *buf,
> >> +                              size_t size)
> >> +{

...

> >> +       reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> >> +       reg = reg | TRACE_NOC_CTRL_FLUSHREQ;
> >> +       writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);
> > 
> > How can userspace determine when to trigger a flush?
> It can be triggered under any circumstances.
> > 
> > Generally, a driver kicks off a flush operation for a hardware before
> > reading data from buffer or when disable a link path.  I don't know the
> > hardware mechanism of TNOC, but seems to me, it does not make sense to
> > let the userspace to trigger a hardware flush, given the userspace has
> > no knowledge for device's state.
>
> TNOC supports the aforementioned flush operation, and it also adds this
> flush functionality, allowing users to set the flush themselves.

I am still not convinced for providing knobs to allow userspace to
directly control hardware.

A low level driver should have sufficient information to know when and
how it triggers a flush.  E.g., CoreSight ETF (coresight-tmc-etf.c) can
act as a link, in this case, it calls the tmc_flush_and_stop() function
to flush its buffer when it is stopped.  A flushing is triggered when a
session is terminated (either is a perf session or a Sysfs session).

Why not TNOC driver do the flushing same as other drivers?  It can flush
the data before a hardware link is to be disabled.  I don't think flush
operations are required at any time.

Seems to me, exposing APIs to userspace for flushing operations also
will introduce potential security risk.  A malicious software might
attack system with triggering tons of flushing in short time.

> > Furthermore, based on my understanding for patch 02 and 03, the working
> > flow is also concerned me.  IIUC, you want to use the driver to create
> > a linkage and then use userspace program to poll state and trigger
> > flushing.  Could you explain why use this way for managing the device?
> > 
> TNOC support flush just like other links. This interface simply provides
> customers with an additional option to trigger the flush.

This is not true for Arm CoreSight components.  My understanding is Arm
CoreSight drivers never provides an API to userspace to manually trigger
flush operations.

Thanks,
Leo

