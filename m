Return-Path: <linux-arm-msm+bounces-42694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 801249F6CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 19:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CD567A3719
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 18:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1691D1F2395;
	Wed, 18 Dec 2024 18:16:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DFF85C5E;
	Wed, 18 Dec 2024 18:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734545813; cv=none; b=ttyAmvcHG+FZCcqVHLIVkk1HJQ9kFPqLdtnhmkJ4YNcr7YLP1k/M1NpMBatuNWUFRQ4M9JyNSOfCoi0HGkBtm5zCE0kqxi1L1p6D91vvSn3No8eqNliX1/PdB/Yn4n6TgxHS+xRFoY5ylk5HARN9tiP/PL0IfSb4YuURJpPutM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734545813; c=relaxed/simple;
	bh=H3YxSj0UPKl17MY8c3fzDropAq2uHPLB2CEYh56DFlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JX0KfoGM+/cIKdPMV8KZ3nej6PUsclEoZDmD3ARWIS+5tTWrdhN6/0X82MwK1Z+ZBWW7mrLWCg/6coYkDhNqkH2u2R/AqDw97bKlh+qEjTiQHS2FPRqk17kqGqKrw+04TkAs6LYZ1HYtw06VylY/L1H7HMmqZX2rrkvUwayT4wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 450DF1063;
	Wed, 18 Dec 2024 10:17:17 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E8903F7B4;
	Wed, 18 Dec 2024 10:16:47 -0800 (PST)
Message-ID: <53354e84-73c0-403b-bbc0-af619196596d@arm.com>
Date: Wed, 18 Dec 2024 18:16:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
Content-Language: en-GB
To: Mike Leach <Mike.Leach@arm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <James.Clark@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-3-quic_jinlmao@quicinc.com>
 <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
 <PAVPR08MB967401DC65384CBA26B6829C8C052@PAVPR08MB9674.eurprd08.prod.outlook.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <PAVPR08MB967401DC65384CBA26B6829C8C052@PAVPR08MB9674.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mike

On 18/12/2024 09:56, Mike Leach wrote:
> Hi
> 
>> -----Original Message-----
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Sent: Wednesday, December 18, 2024 9:38 AM
>> To: Mao Jinlong <quic_jinlmao@quicinc.com>; Mike Leach
>> <mike.leach@linaro.org>; James Clark <James.Clark@arm.com>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Bjorn
>> Andersson <andersson@kernel.org>; Konrad Dybcio
>> <konradybcio@kernel.org>
>> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>> msm@vger.kernel.org
>> Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
>>
>> On 17/12/2024 06:33, Mao Jinlong wrote:
>>> For some coresight components like CTI and TPDM, there could be
>>> numerous of them. From the node name, we can only get the type and
>>> register address of the component. We can't identify the HW or the
>>> system the component belongs to. Add label sysfs node support for
>>> showing the intuitive name of the device.
>>>
>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>> ---
>>>    .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
>>>    .../sysfs-bus-coresight-devices-funnel        |  6 ++++
>>>    .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
>>>    drivers/hwtracing/coresight/coresight-sysfs.c | 32
>> +++++++++++++++++++
>>>    4 files changed, 50 insertions(+)
>>
>> Do you think we need to name the devices using the label ?
>>
> 
> No - absolutely not. If we use label to name devices then we have to validate that the string is a correctly formed device name and that it has not been previously used.

Anything that doesn't contain '/' can be a device name ? And it is very 
easy to find if the device name has been used in the coresight bus, 
after all these devices only appear there.

It is as good as :

bus_find_device_by_name(coresight_bus_type, NULL, name) == NULL

Of course with coresight_mutex() held.

Suzuki


> 
> Using the canonical driver selected names works best as we are guaranteed a unique name and the information label can be used to provide flexible context information that best matches the users requirements.
> 
> Mike
> 
>> Or is this enough ?
> 
>> Suzuki
>>
>>
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>> index bf2869c413e7..909670e0451a 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>>> @@ -239,3 +239,9 @@ Date:		March 2020
>>>    KernelVersion	5.7
>>>    Contact:	Mike Leach or Mathieu Poirier
>>>    Description:	(Write) Clear all channel / trigger programming.
>>> +
>>> +What:           /sys/bus/coresight/devices/<cti-name>/label
>>> +Date:           Dec 2024
>>> +KernelVersion   6.14
>>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>>> +Description:    (Read) Show hardware context information of device.
>>> diff --git
>>> a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>> index d75acda5e1b3..944aad879aeb 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>>> @@ -10,3 +10,9 @@ Date:		November 2014
>>>    KernelVersion:	3.19
>>>    Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
>>>    Description:	(RW) Defines input port priority order.
>>> +
>>> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
>>> +Date:           Dec 2024
>>> +KernelVersion   6.14
>>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>>> +Description:    (Read) Show hardware context information of device.
>>> diff --git
>>> a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>> index bf710ea6e0ef..309802246398 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>>> @@ -257,3 +257,9 @@ Contact:	Jinlong Mao (QUIC)
>> <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>>>    Description:
>>>    		(RW) Set/Get the MSR(mux select register) for the CMB
>> subunit
>>>    		TPDM.
>>> +
>>> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
>>> +Date:           Dec 2024
>>> +KernelVersion   6.14
>>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>>> +Description:    (Read) Show hardware context information of device.
>>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c
>>> b/drivers/hwtracing/coresight/coresight-sysfs.c
>>> index a01c9e54e2ed..4af40cd7d75a 100644
>>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>>> @@ -7,6 +7,7 @@
>>>    #include <linux/device.h>
>>>    #include <linux/idr.h>
>>>    #include <linux/kernel.h>
>>> +#include <linux/property.h>
>>>
>>>    #include "coresight-priv.h"
>>>    #include "coresight-trace-id.h"
>>> @@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device
>> *dev,
>>>    }
>>>    static DEVICE_ATTR_RW(enable_source);
>>>
>>> +static ssize_t label_show(struct device *dev,
>>> +		struct device_attribute *attr, char *buf) {
>>> +
>>> +	const char *str;
>>> +	int ret = 0;
>>> +
>>> +	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
>>> +	if (ret == 0)
>>> +		return scnprintf(buf, PAGE_SIZE, "%s\n", str);
>>> +	else
>>> +		return ret;
>>> +}
>>> +static DEVICE_ATTR_RO(label);
>>> +
>>>    static struct attribute *coresight_sink_attrs[] = {
>>>    	&dev_attr_enable_sink.attr,
>>> +	&dev_attr_label.attr,
>>>    	NULL,
>>>    };
>>>    ATTRIBUTE_GROUPS(coresight_sink);
>>>
>>>    static struct attribute *coresight_source_attrs[] = {
>>>    	&dev_attr_enable_source.attr,
>>> +	&dev_attr_label.attr,
>>>    	NULL,
>>>    };
>>>    ATTRIBUTE_GROUPS(coresight_source);
>>>
>>> +static struct attribute *coresight_link_attrs[] = {
>>> +	&dev_attr_label.attr,
>>> +	NULL,
>>> +};
>>> +ATTRIBUTE_GROUPS(coresight_link);
>>> +
>>> +static struct attribute *coresight_helper_attrs[] = {
>>> +	&dev_attr_label.attr,
>>> +	NULL,
>>> +};
>>> +ATTRIBUTE_GROUPS(coresight_helper);
>>> +
>>>    const struct device_type coresight_dev_type[] = {
>>>    	[CORESIGHT_DEV_TYPE_SINK] = {
>>>    		.name = "sink",
>>> @@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] = {
>>>    	},
>>>    	[CORESIGHT_DEV_TYPE_LINK] = {
>>>    		.name = "link",
>>> +		.groups = coresight_link_groups,
>>>    	},
>>>    	[CORESIGHT_DEV_TYPE_LINKSINK] = {
>>>    		.name = "linksink",
>>> @@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] = {
>>>    	},
>>>    	[CORESIGHT_DEV_TYPE_HELPER] = {
>>>    		.name = "helper",
>>> +		.groups = coresight_helper_groups,
>>>    	}
>>>    };
>>>    /* Ensure the enum matches the names and groups */
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org To unsubscribe send an
>> email to coresight-leave@lists.linaro.org


