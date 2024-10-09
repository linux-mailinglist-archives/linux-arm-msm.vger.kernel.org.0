Return-Path: <linux-arm-msm+bounces-33671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CC996626
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88A71C24CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DEE18D658;
	Wed,  9 Oct 2024 09:54:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5177218BB9E;
	Wed,  9 Oct 2024 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467694; cv=none; b=aVNFz1eR9OvSGUKEutgMvobDA9cDW4fPDP5HBoMG+xi/jo3ahhXFHRkgB9pjAokVrk6/IUkaO+Y1MWOvXLiQmcomFdvDfdhhD0Wms+c06/4N1x2r7o4s/IUUiGaCOMJvvv6XcbY7pccEhmJGKo8Gsrqxfbbpc1R7/UC7FQo/92I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467694; c=relaxed/simple;
	bh=HcBWktRVj7yOa0Q3x+sfHF6i79Q77mvz/xLNMXrAngk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MS7bD+/Ej9Ntlu1ZKxEzHKUkt0ooEU/FxVJxalrquasCOLwTdiQTQMMuo/0ieEU+eeN7BwrWTCps3lj9g3l9zJAiKKg4hW/k9HBH6JXq4z3nU3og8n4qs+vlYQ+QoBuaMYQ6veRhwM9VgDAhODhom44DFvfLqypsGIlwlyNEvuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 320A8FEC;
	Wed,  9 Oct 2024 02:55:21 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C36353F64C;
	Wed,  9 Oct 2024 02:54:49 -0700 (PDT)
Message-ID: <bc94a937-0b61-4f96-87e4-80af544d6453@arm.com>
Date: Wed, 9 Oct 2024 10:54:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 3/3] coresight: dummy: Add static trace id
 support for dummy source
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
 <20240910100127.8948-4-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240910100127.8948-4-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2024 11:01, Mao Jinlong wrote:
> Some dummy source has static trace id configured in HW and it cannot
> be changed via software programming. Configure the trace id in device
> tree and reserve the id when device probe.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
>   drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
>   2 files changed, 70 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> new file mode 100644
> index 000000000000..db770bc972d9
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> @@ -0,0 +1,15 @@
> +What:		/sys/bus/coresight/devices/dummy_source<N>/enable_source
> +Date:		July 2024

Update the date please

> +KernelVersion:	6.9

6.13

Similarly for the ones below.


> +Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:	(RW) Enable/disable tracing of dummy source. A sink should be activated
> +		before enabling the source. The path of coresight components linking
> +		the source to the sink is configured and managed automatically by the
> +		coresight framework.
> +
> +What:		/sys/bus/coresight/devices/dummy_source<N>/traceid
> +Date:		July 2024
> +KernelVersion:	6.9
> +Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:	(R) Show the trace ID that will appear in the trace stream
> +		coming from this trace entity.
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index ac70c0b491be..3bf5437cbfb1 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -11,10 +11,12 @@
>   #include <linux/pm_runtime.h>
>   
>   #include "coresight-priv.h"
> +#include "coresight-trace-id.h"
>   
>   struct dummy_drvdata {
>   	struct device			*dev;
>   	struct coresight_device		*csdev;
> +	u8				traceid;
>   };
>   
>   DEFINE_CORESIGHT_DEVLIST(source_devs, "dummy_source");
> @@ -67,6 +69,32 @@ static const struct coresight_ops dummy_sink_cs_ops = {
>   	.sink_ops = &dummy_sink_ops,
>   };
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
>   static int dummy_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -74,6 +102,11 @@ static int dummy_probe(struct platform_device *pdev)
>   	struct coresight_platform_data *pdata;
>   	struct dummy_drvdata *drvdata;
>   	struct coresight_desc desc = { 0 };
> +	int ret, trace_id;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
>   
>   	if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
>   
> @@ -85,6 +118,25 @@ static int dummy_probe(struct platform_device *pdev)
>   		desc.subtype.source_subtype =
>   					CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
>   		desc.ops = &dummy_source_cs_ops;
> +		desc.groups = coresight_dummy_groups;
> +
> +		ret = coresight_get_static_trace_id(dev, &trace_id);
> +		if (!ret) {
> +			/* Get the static id if id is set in device tree. */
> +			ret = coresight_trace_id_get_static_system_id(trace_id);
> +			if (ret < 0)
> +				return ret;
> +
> +		} else {
> +			/* Get next available id if id is not set in device tree. */
> +			trace_id = coresight_trace_id_get_system_id();
> +			if (trace_id < 0) {
> +				ret = trace_id;
> +				return ret;
> +			}
> +		}
> +		drvdata->traceid = (u8)trace_id;
> +
>   	} else if (of_device_is_compatible(node, "arm,coresight-dummy-sink")) {
>   		desc.name = coresight_alloc_device_name(&sink_devs, dev);
>   		if (!desc.name)
> @@ -103,10 +155,6 @@ static int dummy_probe(struct platform_device *pdev)
>   		return PTR_ERR(pdata);
>   	pdev->dev.platform_data = pdata;
>   
> -	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata)
> -		return -ENOMEM;
> -
>   	drvdata->dev = &pdev->dev;
>   	platform_set_drvdata(pdev, drvdata);
>   
> @@ -126,7 +174,10 @@ static void dummy_remove(struct platform_device *pdev)
>   {
>   	struct dummy_drvdata *drvdata = platform_get_drvdata(pdev);
>   	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
>   
> +	if (of_device_is_compatible(node, "arm,coresight-dummy-source"))

	if (drvdata->traceid) ?

Or even

	if (IS_VALID_CS_TRACE_ID(drvdata->traceid))

> +		coresight_trace_id_put_system_id(drvdata->traceid);
>   	pm_runtime_disable(dev);
>   	coresight_unregister(drvdata->csdev);
>   }



Rest looks fine.

Suzuki

