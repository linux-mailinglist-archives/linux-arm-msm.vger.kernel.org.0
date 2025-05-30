Return-Path: <linux-arm-msm+bounces-59888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109FAC8FAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 591363AE13E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DE422FDE8;
	Fri, 30 May 2025 12:59:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F8F22B8AA;
	Fri, 30 May 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609997; cv=none; b=OulHC5J92NTTnlIdVNKTaDdIi3sKeJGrTBAT2VQxCcl+lyiSR+1AEko/c0zjnyfDnuz5naLnBt3jgE9Iu0ErD/0Jcd9eu4V4ok4OU9JqS3EYhcVEiWGZsbo87uLslq/DONqb3lNPnwpE9GUoipPZXjuL35nfp3Vl7zSrgPq0cEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609997; c=relaxed/simple;
	bh=3uEBu0h1X6/ueTrPJOrXvYkPpAgODaeIK24/k0rHMnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfnPlW23oIEyyzHGqn5TWbFPjQbOyGvBSlpAZEnynLOQQ3IeMJhtUNbaDjZPq98jzPO9tP8fH03IZKwbff2IIu5YJOk6LgVHDWmxw5adECQjKkjtbz+Rzyw/4O/twZFe4mF8OjTJr5XLfgSmF3y0Ft4BwS/EUnVTPrI8ksyCqEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76FF216F2;
	Fri, 30 May 2025 05:59:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A0F73F5A1;
	Fri, 30 May 2025 05:59:53 -0700 (PDT)
Date: Fri, 30 May 2025 13:59:44 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
Message-ID: <20250530125944.GB666854@e132581.arm.com>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
 <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>

On Fri, May 30, 2025 at 12:32:23PM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > > 2) How does the source driver know the TraceID for exposing via sysfs ?
> > > Does it expose its own traceid ?
> > No, sources connecting to TNOC don't have their own traceid, it expose the ATID which allocated in TNOC.
> > TNOC will maintain the ID in coresight_path:: trace_id, when enable source, the source can get it from path.
> > 
> > Here is the patch to expose id in source:
> > https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com/
> 
> Please don't do that. We don't have to fake a traceid for all sources.
> It is only of use to the decoder, with manual input from the user. So,
> someone using the TNOC based system must be aware of how to collect the
> traceid and as such expose it from the TNOC and not all the other
> sources connected to it.
> 
> Simply expose it on the TNOC device node

[...]

> > > Good question, since we have the "path" maintaining the TraceID, we
> > > should use that here for the TNOC. But the other question is, can there be multiple sources connected to a single TNOC ? (I am guessing, yes!. And thus it may not work with what you are proposing.
> > > 
> > yes, there can be multiple sources connected to one TNOC, and these sources share one Trace ID which allocate in TNOC.
> > To decode the scenario relay on TraceID + Inport number, TraceID identifies the TNOC, the decoder maintains a table that maps each TNOC inport to its corresponding source.

If the Trace ID is only used to identify a TNOC, I am just wandering
if can use self-contained method.

For example, you can generate a ID number based on the register base
address, something like:

   /* TNOC physical address */
   drvdata->paddr = res->start;

   if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
       drvdata->atid = (drvdata->paddr >> 32) ^ (drvdata->paddr & 0xffffffffUL);
   else
       drvdata->atid = drvdata->paddr;

Then, you can get a unique ID for each TNOC in the system, and the
ID is determined by the pyshical address and can be calculated
directly by decoder.

Leo

