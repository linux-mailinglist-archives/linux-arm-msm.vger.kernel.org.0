Return-Path: <linux-arm-msm+bounces-21472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED1A8D7FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4E11F22F85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B515A823A6;
	Mon,  3 Jun 2024 10:08:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C507177A1E;
	Mon,  3 Jun 2024 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409284; cv=none; b=UMAhA1Pb020xISq8ecoZQF1WoYXsc6jjjYRPlCC/PxavAcoMcQ5ItcGIaz+JFuo/4WHPN6Ys1bBBmKc8v+YI7BxR6qlWSPtuKl89nN/8QF0sPVGaVv0YKk3qjOHzMG7UmLJu/pFe79k15bGn9m9cCrHxbcO1cblMGT6PBP7Diz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409284; c=relaxed/simple;
	bh=8qBYXdJrDRJA+p+7GoU2rvppnvWsbbP8MLHmqvz8jA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPqpo8hE8oKRfayW5eYkxhBixzmaGRf0EMT+Gu+UryHG/rYalEhoMQMtsrHwSzEejGUjjxsGN01szUf4p06EQwMxhNx18vdvx3rYAGfbfznjWvWmszDtblyDtDpGPU879FYKln4P5Yf39gmioMRGYBwCExbVQvDjisuEc5mxPIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FB711042;
	Mon,  3 Jun 2024 03:08:26 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CCB23F792;
	Mon,  3 Jun 2024 03:08:00 -0700 (PDT)
Message-ID: <1802b338-e2e5-4b9b-b914-869651fa886c@arm.com>
Date: Mon, 3 Jun 2024 11:07:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: dummy: Add reserve atid support for
 dummy source
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20240603094354.2348-1-quic_jinlmao@quicinc.com>
 <20240603094354.2348-4-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240603094354.2348-4-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03/06/2024 10:43, Mao Jinlong wrote:
> Some dummy source has static trace id configured in HW and it cannot
> be changed via software programming. Configure the trace id in device
> tree and reserve the id when device probe.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
>  drivers/hwtracing/coresight/coresight-dummy.c | 58 +++++++++++++++++--
>  2 files changed, 69 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> new file mode 100644
> index 000000000000..d93c198115c9
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> @@ -0,0 +1,15 @@
> +What:		/sys/bus/coresight/devices/dummy_source<N>/enable_source
> +Date:		June 2024
> +KernelVersion:	6.9
> +Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:	(RW) Enable/disable tracing of dummy source. A sink should be activated
> +		before enabling the source. The path of coresight components linking
> +		the source to the sink is configured and managed automatically by the
> +		coresight framework.
> +
> +What:		/sys/bus/coresight/devices/dummy_source<N>/traceid
> +Date:		June 2024
> +KernelVersion:	6.9
> +Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:	(R) Show the trace ID that will appear in the trace stream
> +		coming from this trace entity.
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index ac70c0b491be..1f7133ac2c0b 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -11,10 +11,12 @@
>  #include <linux/pm_runtime.h>
>  
>  #include "coresight-priv.h"
> +#include "coresight-trace-id.h"
>  
>  struct dummy_drvdata {
>  	struct device			*dev;
>  	struct coresight_device		*csdev;
> +	u8				traceid;
>  };
>  
>  DEFINE_CORESIGHT_DEVLIST(source_devs, "dummy_source");
> @@ -67,6 +69,32 @@ static const struct coresight_ops dummy_sink_cs_ops = {
>  	.sink_ops = &dummy_sink_ops,
>  };
>  
> +/* User can get the trace id of dummy source from this node. */
> +static ssize_t traceid_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct dummy_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	val = drvdata->traceid;
> +	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
> +static struct attribute *coresight_dummy_attrs[] = {
> +	&dev_attr_traceid.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group coresight_dummy_group = {
> +	.attrs = coresight_dummy_attrs,
> +};
> +
> +static const struct attribute_group *coresight_dummy_groups[] = {
> +	&coresight_dummy_group,
> +	NULL,
> +};
> +
>  static int dummy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -74,6 +102,11 @@ static int dummy_probe(struct platform_device *pdev)
>  	struct coresight_platform_data *pdata;
>  	struct dummy_drvdata *drvdata;
>  	struct coresight_desc desc = { 0 };
> +	int ret, trace_id;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
>  
>  	if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
>  
> @@ -85,6 +118,24 @@ static int dummy_probe(struct platform_device *pdev)
>  		desc.subtype.source_subtype =
>  					CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
>  		desc.ops = &dummy_source_cs_ops;
> +		desc.groups = coresight_dummy_groups;
> +
> +		ret = coresight_get_source_traceid(dev, &trace_id);
> +		if (!ret) {
> +			ret = coresight_trace_id_get_system_id(trace_id);
> +			if (ret < 0)
> +				return ret;
> +
> +			drvdata->traceid = ret;
> +		} else {
> +			trace_id = coresight_trace_id_get_system_id(0);
> +			if (trace_id < 0) {
> +				ret = trace_id;
> +				return ret;
> +			}
> +			drvdata->traceid = (u8)trace_id;
> +		}
> +

It's a bit weird to use ret in one version and trace_id in the other.
And one casts to (u8) but the other doesn't. I'm sure it all compiles to
the same in the end but it would be a bit more readable if it was more
consistent.

>  	} else if (of_device_is_compatible(node, "arm,coresight-dummy-sink")) {
>  		desc.name = coresight_alloc_device_name(&sink_devs, dev);
>  		if (!desc.name)
> @@ -103,10 +154,6 @@ static int dummy_probe(struct platform_device *pdev)
>  		return PTR_ERR(pdata);
>  	pdev->dev.platform_data = pdata;
>  
> -	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
>  	drvdata->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, drvdata);
>  
> @@ -126,7 +173,10 @@ static void dummy_remove(struct platform_device *pdev)
>  {
>  	struct dummy_drvdata *drvdata = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
>  
> +	if (of_device_is_compatible(node, "arm,coresight-dummy-source"))
> +		coresight_trace_id_put_system_id(drvdata->traceid);
>  	pm_runtime_disable(dev);
>  	coresight_unregister(drvdata->csdev);
>  }

