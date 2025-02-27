Return-Path: <linux-arm-msm+bounces-49739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048CA484C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E27087A22ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799EB1B85E4;
	Thu, 27 Feb 2025 16:23:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21291B4F0A;
	Thu, 27 Feb 2025 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673437; cv=none; b=nF6TEAm85z8R5vQ3RGrc0Hjvjrpwc8RmgPfvftButKctC5vhphYXyJqpyiI7Qg2a3hHISuk43DXPBnZVgtKlqfFH2HPVmhx/2kg03uiv9DOc5/TkG1qVn3d1mYi4ez2BgSk5TJ0tBzVsV3Puf+pjHFy+hJ/myiY8LMQ83X0oCtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673437; c=relaxed/simple;
	bh=Kli9Zrxx4tniLHZRafKhSWOIsjFG4RSiHz0gzAbi3IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Szom/wiCl7e5qa5yikQka+t+iXrgDmuwxsXRWzjMJ0D+KL/LrlPlvzHHPm0wy+fYfNfs73wtd41suwL2hu442p0wyhz/yWK7Cb3pQhJVuEZzrQm109G/KkEoG1dloEODNiJLTlo9xR64ypgO07mto7Wd02wTopTrpi/qyhgU0Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 997C91516;
	Thu, 27 Feb 2025 08:24:09 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC1373F673;
	Thu, 27 Feb 2025 08:23:53 -0800 (PST)
Date: Thu, 27 Feb 2025 16:23:49 +0000
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
Message-ID: <20250227162349.GB2157064@e132581.arm.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-3-8afc6584afc5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-trace-noc-driver-v2-3-8afc6584afc5@quicinc.com>

On Wed, Feb 26, 2025 at 07:05:52PM +0800, Yuanfang Zhang wrote:
> 
> Two nodes for configure flush are added here:
> 1. flush_req: write 1 to initiates a flush sequence.
> 
> 2. flush_state: read this node to get flush status. 0: sequence in
> progress; 1: sequence has been completed.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 73 ++++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.h |  4 ++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index fad8e61f05ef25989aba1be342c547f835e8953a..20231f28ddcb6a60d9b3c1ca3e0ca4d731dac39c 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -16,6 +16,78 @@
>  #include "coresight-tnoc.h"
>  #include "coresight-trace-id.h"
> 
> +static ssize_t flush_req_store(struct device *dev,
> +                              struct device_attribute *attr,
> +                              const char *buf,
> +                              size_t size)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       struct coresight_device *csdev = drvdata->csdev;
> +       unsigned long val;
> +       u32 reg;
> +
> +       if (kstrtoul(buf, 10, &val))
> +               return -EINVAL;
> +
> +       if (val != 1)
> +               return -EINVAL;
> +
> +       spin_lock(&drvdata->spinlock);
> +       if (csdev->refcnt == 0) {
> +               spin_unlock(&drvdata->spinlock);
> +               return -EPERM;
> +       }
> +
> +       reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +       reg = reg | TRACE_NOC_CTRL_FLUSHREQ;
> +       writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);

How can userspace determine when to trigger a flush?

Generally, a driver kicks off a flush operation for a hardware before
reading data from buffer or when disable a link path.  I don't know the
hardware mechanism of TNOC, but seems to me, it does not make sense to
let the userspace to trigger a hardware flush, given the userspace has
no knowledge for device's state.

Furthermore, based on my understanding for patch 02 and 03, the working
flow is also concerned me.  IIUC, you want to use the driver to create
a linkage and then use userspace program to poll state and trigger
flushing.  Could you explain why use this way for managing the device?

Thanks,
Leo

> +
> +       spin_unlock(&drvdata->spinlock);
> +
> +       return size;
> +}
> +static DEVICE_ATTR_WO(flush_req);
> +
> +/*
> + * flush-sequence status:
> + * value 0: sequence in progress;
> + * value 1: sequence has been completed.
> + */
> +static ssize_t flush_status_show(struct device *dev,
> +                                struct device_attribute *attr,
> +                                char *buf)
> +{
> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       struct coresight_device *csdev = drvdata->csdev;
> +       u32 val;
> +
> +       spin_lock(&drvdata->spinlock);
> +       if (csdev->refcnt == 0) {
> +               spin_unlock(&drvdata->spinlock);
> +               return -EPERM;
> +       }
> +
> +       val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +       spin_unlock(&drvdata->spinlock);
> +       return sysfs_emit(buf, "%lu\n", BMVAL(val, 2, 2));
> +}
> +static DEVICE_ATTR_RO(flush_status);
> +
> +static struct attribute *trace_noc_attrs[] = {
> +       &dev_attr_flush_req.attr,
> +       &dev_attr_flush_status.attr,
> +       NULL,
> +};
> +
> +static struct attribute_group trace_noc_attr_grp = {
> +       .attrs = trace_noc_attrs,
> +};
> +
> +static const struct attribute_group *trace_noc_attr_grps[] = {
> +       &trace_noc_attr_grp,
> +       NULL,
> +};
> +
>  static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>  {
>         u32 val;
> @@ -142,6 +214,7 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>                 return ret;
> 
>         desc.ops = &trace_noc_cs_ops;
> +       desc.groups = trace_noc_attr_grps;
>         desc.type = CORESIGHT_DEV_TYPE_LINK;
>         desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>         desc.pdata = adev->dev.platform_data;
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
> index b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8..d0fe8f52709ff4147d66dbf90987595012cfaa4e 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.h
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
> @@ -10,6 +10,10 @@
> 
>  /* Enable generation of output ATB traffic.*/
>  #define TRACE_NOC_CTRL_PORTEN  BIT(0)
> +/* Writing 1 to initiate a flush sequence.*/
> +#define TRACE_NOC_CTRL_FLUSHREQ        BIT(1)
> +/* 0: sequence in progress; 1: sequence has been completed.*/
> +#define TRACE_NOC_CTRL_FLUSHSTATUS     BIT(2)
>  /* Writing 1 to issue a FREQ or FREQ_TS packet*/
>  #define TRACE_NOC_CTRL_FREQTSREQ       BIT(5)
>  /* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
> 
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

