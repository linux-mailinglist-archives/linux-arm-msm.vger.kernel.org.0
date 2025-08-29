Return-Path: <linux-arm-msm+bounces-71233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC576B3B5F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94DD0170D76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA7A29B8E2;
	Fri, 29 Aug 2025 08:24:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D02273811;
	Fri, 29 Aug 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455872; cv=none; b=dQcC5qJ0L8SSe44i8zxNx1qPjh6g36pkzdAhMb5DW8wN/b+goJRS8sVpKWWk3+vHlT8jlTIvgkds6bPzrtkLUJHANg8WaNdp/E+Bsgt/Ce3QIlipHqu7Qq/OPIJfba+jN1u6AtTt6N7WYiVR4Tmp7Y19QQlMA6fCyMmbQdVZnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455872; c=relaxed/simple;
	bh=0jJ6I3CScfKpbipsCLvpTP7q0OdeThjA7rqA/kz0p8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTG2H2l8VveJZIUoLrc7ijV7z6AiWFSbHB4MPqSZRs2/t7sjl70IVJe438iy4y7YqEJgJIHnB6cQeQI2/NDU4LHE5FyfSiwA8bE+Xo/jukpKdBlC3BgNLt1dj9W+uEptIncbeUQXUqB6GQmzzh5AjFqjRzmgGJLin4gpBGPg72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C4721BCB;
	Fri, 29 Aug 2025 01:24:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749083F694;
	Fri, 29 Aug 2025 01:24:29 -0700 (PDT)
Date: Fri, 29 Aug 2025 09:24:27 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] coresight-tnoc: add platform driver to support
 Interconnect TNOC
Message-ID: <20250829082427.GF745921@e132581.arm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
 <20250828-itnoc-v3-2-f1b55dea7a27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-itnoc-v3-2-f1b55dea7a27@oss.qualcomm.com>

On Thu, Aug 28, 2025 at 02:27:23AM -0700, Yuanfang Zhang wrote:

[...]

> @@ -51,12 +53,17 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>  {
>  	u32 val;
>  
> +	/* No valid ATID, simply enable the unit */
> +	if (drvdata->atid == -EOPNOTSUPP) {
> +		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
> +		return;
> +	}
> +
>  	/* Set ATID */
>  	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>  
>  	/* Set the data word count between 'SYNC' packets */
>  	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> -

Unintended change ?

>  	/* Set the Control register:
>  	 * - Set the FLAG packets to 'FLAG' packets
>  	 * - Set the FREQ packets to 'FREQ_TS' packets
> @@ -68,8 +75,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>  	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>  	val |= TRACE_NOC_CTRL_FREQTYPE;
>  	val |= TRACE_NOC_CTRL_PORTEN;
> -

Ditto.

>  	writel(val, drvdata->base + TRACE_NOC_CTRL);
> +

Ditto.

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

