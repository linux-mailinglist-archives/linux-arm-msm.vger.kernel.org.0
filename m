Return-Path: <linux-arm-msm+bounces-69594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E94B2AADA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 16:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 207F37B0F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7681FF7BC;
	Mon, 18 Aug 2025 14:30:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519651624C5;
	Mon, 18 Aug 2025 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527419; cv=none; b=tWlarf8Aja8EgFwUmzPbG8WDFnLa4+Flf+T5Wsl7JrffpbqEuWpY4s5f5+Naw/+ZkXj6cEVMuxSSWt4WU5Gxs15pBU5XK9c7nI0+2hJjzanEXffZljuLEzevVRs1l+0pzOe+A67bCAAk2Vp6ueoD/+1b5GFComOrcQOpqrx3z3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527419; c=relaxed/simple;
	bh=k+W6ZWMIkn25jUyNMFtX6rNmrziEa+B3M/eWxufJOlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZbjgxLrO2CtXjupGVQn/XSw5QwUtdw8kHNsMc/gQiXARY0Ko/C2qYRpOwP9+pyAz3obnPu8KRISARloAeiWCQ89GmIhU3L6SajNRhxVEnV2rYtBujkqhwfL7GaZzm7nuXQKc/tTY+4n4YpnfXF/BHC0VlKbicjhyCDosY31hHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C0571596;
	Mon, 18 Aug 2025 07:30:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37D7D3F63F;
	Mon, 18 Aug 2025 07:30:13 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:30:11 +0100
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
Subject: Re: [PATCH 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
Message-ID: <20250818143011.GB8071@e132581.arm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-itnoc-v1-3-62c8e4f7ad32@oss.qualcomm.com>

On Fri, Aug 15, 2025 at 06:18:14AM -0700, Yuanfang Zhang wrote:
> This patch adds runtime power management support for platform-based
> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
> resume callbacks to manage the APB clock (`pclk`) during device runtime
> transitions.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index aa6f48d838c00d71eff22c18e34e00b93755fd82..f12a1698824bc678545319a3f482fd27e67a7352 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -270,6 +270,31 @@ static void itnoc_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> +#ifdef CONFIG_PM
> +static int itnoc_runtime_suspend(struct device *dev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(drvdata->pclk);
> +
> +	return 0;
> +}
> +
> +static int itnoc_runtime_resume(struct device *dev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(drvdata->pclk);
> +
> +	return ret;

Here can be simplified:

    return clk_prepare_enable(drvdata->pclk);

> +}
> +#endif
> +
> +static const struct dev_pm_ops itnoc_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id itnoc_of_match[] = {
>  	{ .compatible = "qcom,coresight-itnoc" },
>  	{}
> @@ -282,6 +307,7 @@ static struct platform_driver itnoc_driver = {
>  	.driver = {
>  		.name = "coresight-itnoc",
>  		.of_match_table = itnoc_of_match,
> +		.pm = &itnoc_dev_pm_ops,
>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

