Return-Path: <linux-arm-msm+bounces-50814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA1A5922D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80423A7DA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D557225775;
	Mon, 10 Mar 2025 11:02:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA3C17A2E7;
	Mon, 10 Mar 2025 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741604575; cv=none; b=ltyMp4y1lL8j2UP92jzlu2k4fkOmmsGcBunCD8HrGH89SmM1Hxd47EoyvzB70+E4r3zAjRfCakLTzxjKELt8B6FLF8802iZu2kGiHbNzmUpeaIzpJFUpf+2nxHBTzcc6l+o2pswegJO6438DFJ5pc81t3UbaPPeJBzkvpQeMM6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741604575; c=relaxed/simple;
	bh=rYRUtRxNTgyVx21smtPWfTFqDSsI+ffJUJlTAxJz5vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv/tVtXrCAls0mqbdj6u1xxvNyFO3prDpxbyZTnjTOIJPZgSn5OSf2fGQ37zWsC/By/7vEVz5EoAKwXkxFoujFG7FwdVnuVPUMuVhodwYxi0KakZVEtuihxgTRbqBzHyhRTJS8uFbp/wAszHIjHUHwFDzVgCFtpjjYL6H+Gffcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6670D153B;
	Mon, 10 Mar 2025 04:03:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CA943F5A1;
	Mon, 10 Mar 2025 04:02:53 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:02:51 +0000
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
Subject: Re: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
Message-ID: <20250310110251.GC9682@e132581.arm.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
 <20250227113910.GA2157064@e132581.arm.com>
 <c0848f24-26c4-4282-9813-1842c2a50c1e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0848f24-26c4-4282-9813-1842c2a50c1e@quicinc.com>

On Thu, Mar 06, 2025 at 04:22:20PM +0800, Yuanfang Zhang wrote:

[...]

> >> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> >> +{
> >> +       int atid;
> >> +
> >> +       atid = coresight_trace_id_get_system_id();
> >> +       if (atid < 0)
> >> +               return atid;
> >> +
> >> +       drvdata->atid = atid;
> >> +
> >> +       drvdata->freq_type = FREQ_TS;
> > 
> > I don't see anywhere uses FREQ.  Please remove the unused definitions
> > and related code.
>
> it is used in trace_noc_enable_hw().

I understood some macros and definitions are used by seqential patches.

A good practice is code should be added only when they are used.  This
can allow every patch in neat way and easier for review.

Thanks,
Leo

> > 
> >> +       drvdata->flag_type = FLAG;
> > 
> > FLAG_TS is not used in the driver as well.  Remove it.
> it is used in trace_noc_enable_hw().

