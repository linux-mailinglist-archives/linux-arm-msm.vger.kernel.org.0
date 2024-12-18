Return-Path: <linux-arm-msm+bounces-42623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0E9F623B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 503E07A5A51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 09:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DE1198E61;
	Wed, 18 Dec 2024 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dfWDIOLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26108194A7C;
	Wed, 18 Dec 2024 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515850; cv=none; b=bZYBYZQJTuUFE+JnnX7kbutKCg8XGeIkBJWA7wepe6K77fFotFrsKNRu0q55SaGMOIXL3Offc/R/oCQek5oEZUnwPKkQzXwojhsm61jvoTIJQAwzrWyHttcU0NWqt9D7+odF6aM7gWDjG/xdt2UeLwUk79348AeiC4d2uaLgWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515850; c=relaxed/simple;
	bh=SJB4XpYcwUvwhO+PDEQcxCg/PzrDVOWD0ZL1d6j04CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qqg5Mu+Y7150vIbLHa3lQvGsykG8troN7S3FM6msmMdM+9ljIMQn5zmF9T7AtOZ7czYzeWY7KzsKI26QaxUOCCH5K91Jq4eaEtOF8wmpjg7xoUoZ0t7dNtZUYuNJfkWsXCIYJdhUM88v8Bx7R0u7tWxR87a+Yr3ayWcXFSF8DKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dfWDIOLf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6VflX024955;
	Wed, 18 Dec 2024 09:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nC1HOIkdi6xwcaM/XJadvuO2A+PrutWeTyG/uorTH7M=; b=dfWDIOLf+LX41vj7
	5MdXK/y9iMjTr5Ud4hWvhCjuXxo8xLnwxiyX7Xdhwyt5GULcUnrbTQU7fPE4IObO
	bbnSWU87F+M96eC+L4UbJfBJ6aHhxuTlT78UF5P0R7DlPVCLFrg00DwOkXQTQDXa
	w0MnRMI0QOzaPWlHWZyG9IL+xbfcrnthzLwpUY3oPcCcF6kzJv0ToAd4+pormFsS
	PFz65V6iJWxmShB0L0b1MCZtH1QW38NHPFcpvmy/R/2InQyzHGl0HSvrty6XKVvG
	24A9+YOSJyKkMJNwkimXaSLcvzWKQhr9Z/1wri0aMbcBNL7Ap8kRyiVMvFwkaIJh
	d+bvrg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ks6ygfqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:57:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI9vGK1023777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:57:16 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 01:57:13 -0800
Message-ID: <f1c6da16-fbfd-40aa-a158-36ab713ce541@quicinc.com>
Date: Wed, 18 Dec 2024 17:57:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-3-quic_jinlmao@quicinc.com>
 <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xpv7LOkE_7PWvzuYgjB8-KXfyPojJO-C
X-Proofpoint-GUID: xpv7LOkE_7PWvzuYgjB8-KXfyPojJO-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180080



On 2024/12/18 17:38, Suzuki K Poulose wrote:
> On 17/12/2024 06:33, Mao Jinlong wrote:
>> For some coresight components like CTI and TPDM, there could be
>> numerous of them. From the node name, we can only get the type and
>> register address of the component. We can't identify the HW or the
>> system the component belongs to. Add label sysfs node support for
>> showing the intuitive name of the device.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
>>   .../sysfs-bus-coresight-devices-funnel        |  6 ++++
>>   .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
>>   drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
>>   4 files changed, 50 insertions(+)
> 
> Do you think we need to name the devices using the label ? Or is this 
> enough ?
> 
> Suzuki
Hi Suzuki,

In my opinion, we should use label as the device name.

It will be easier to identify the component with the folder name in 
/sys/bus/coresight/devices/


Thanks
Jinlong Mao

> 
> 
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti 
>> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>> index bf2869c413e7..909670e0451a 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>> @@ -239,3 +239,9 @@ Date:        March 2020
>>   KernelVersion    5.7
>>   Contact:    Mike Leach or Mathieu Poirier
>>   Description:    (Write) Clear all channel / trigger programming.
>> +
>> +What:           /sys/bus/coresight/devices/<cti-name>/label
>> +Date:           Dec 2024
>> +KernelVersion   6.14
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>> index d75acda5e1b3..944aad879aeb 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>> @@ -10,3 +10,9 @@ Date:        November 2014
>>   KernelVersion:    3.19
>>   Contact:    Mathieu Poirier <mathieu.poirier@linaro.org>
>>   Description:    (RW) Defines input port priority order.
>> +
>> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
>> +Date:           Dec 2024
>> +KernelVersion   6.14
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>> index bf710ea6e0ef..309802246398 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>> @@ -257,3 +257,9 @@ Contact:    Jinlong Mao (QUIC) 
>> <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>>   Description:
>>           (RW) Set/Get the MSR(mux select register) for the CMB subunit
>>           TPDM.
>> +
>> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
>> +Date:           Dec 2024
>> +KernelVersion   6.14
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/ 
>> hwtracing/coresight/coresight-sysfs.c
>> index a01c9e54e2ed..4af40cd7d75a 100644
>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/device.h>
>>   #include <linux/idr.h>
>>   #include <linux/kernel.h>
>> +#include <linux/property.h>
>>   #include "coresight-priv.h"
>>   #include "coresight-trace-id.h"
>> @@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device 
>> *dev,
>>   }
>>   static DEVICE_ATTR_RW(enable_source);
>> +static ssize_t label_show(struct device *dev,
>> +        struct device_attribute *attr, char *buf)
>> +{
>> +
>> +    const char *str;
>> +    int ret = 0;
>> +
>> +    ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
>> +    if (ret == 0)
>> +        return scnprintf(buf, PAGE_SIZE, "%s\n", str);
>> +    else
>> +        return ret;
>> +}
>> +static DEVICE_ATTR_RO(label);
>> +
>>   static struct attribute *coresight_sink_attrs[] = {
>>       &dev_attr_enable_sink.attr,
>> +    &dev_attr_label.attr,
>>       NULL,
>>   };
>>   ATTRIBUTE_GROUPS(coresight_sink);
>>   static struct attribute *coresight_source_attrs[] = {
>>       &dev_attr_enable_source.attr,
>> +    &dev_attr_label.attr,
>>       NULL,
>>   };
>>   ATTRIBUTE_GROUPS(coresight_source);
>> +static struct attribute *coresight_link_attrs[] = {
>> +    &dev_attr_label.attr,
>> +    NULL,
>> +};
>> +ATTRIBUTE_GROUPS(coresight_link);
>> +
>> +static struct attribute *coresight_helper_attrs[] = {
>> +    &dev_attr_label.attr,
>> +    NULL,
>> +};
>> +ATTRIBUTE_GROUPS(coresight_helper);
>> +
>>   const struct device_type coresight_dev_type[] = {
>>       [CORESIGHT_DEV_TYPE_SINK] = {
>>           .name = "sink",
>> @@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] = {
>>       },
>>       [CORESIGHT_DEV_TYPE_LINK] = {
>>           .name = "link",
>> +        .groups = coresight_link_groups,
>>       },
>>       [CORESIGHT_DEV_TYPE_LINKSINK] = {
>>           .name = "linksink",
>> @@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] = {
>>       },
>>       [CORESIGHT_DEV_TYPE_HELPER] = {
>>           .name = "helper",
>> +        .groups = coresight_helper_groups,
>>       }
>>   };
>>   /* Ensure the enum matches the names and groups */
> 


