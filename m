Return-Path: <linux-arm-msm+bounces-59185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251EAC1F00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69F591BC36DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA8B1B0435;
	Fri, 23 May 2025 08:57:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF9F130A73;
	Fri, 23 May 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990623; cv=none; b=VJZiTA1lUARV/uOgG8C2kxRg/ERAjDL77S9Bf+mN8fLnhsLUoQxWer6CyDXQKufSHckLrEb5WZ7h4RwHNew4GxW6oMKqqIxjjJaE3jj+cGqzR+e+TwGC1iqdGYtkxQXP4pO6KXQYEpheq5AndexLzhowgnCJl/TTJfzr+H+Dovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990623; c=relaxed/simple;
	bh=2wMx3Q7Wvu1cfxZ2dDyBBjq1bdLpmI9aZZqIl69oznI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEZ5WubzqdlPcS4jjjhn3/aQok0PsFga0fAn0inu8Qreni8ckHQrHS32t7b9VTC2uDuE3+C0jhUsZu5wota7MqChdYBVrCgzbncxp8/b5oz8w2gkiAabUH0MzBhCwxRFE2kytrmTs37KNCZqJrAz7Iih+0KrdcUFVCr01TAuMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00CFB1758;
	Fri, 23 May 2025 01:56:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10B213F5A1;
	Fri, 23 May 2025 01:56:59 -0700 (PDT)
Date: Fri, 23 May 2025 09:56:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <20250523085655.GD2566836@e132581.arm.com>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>

On Fri, May 23, 2025 at 04:08:58PM +0800, Yuanfang Zhang wrote:

[...]

> >> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> >> +{
> >> +    int atid;
> >> +
> >> +    atid = coresight_trace_id_get_system_id();
> >> +    if (atid < 0)
> >> +        return atid;
> >> +
> >> +    drvdata->atid = atid;
> > 
> > Do you need to expose this via sysfs ? Otherwise, how can you map
> > a trace to a TNOC at decoding ?
> 
> yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
> this TNOC. so dont expose it on this driver.

If so, why the ID is not maintained in coresight_path::trace_id?

A source device allocates ID and maintains in coresight path, then
this ID is passed (when enabling the link) to TNOC driver to consume it.

Thanks,
Leo

