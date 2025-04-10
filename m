Return-Path: <linux-arm-msm+bounces-53761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE4A8388D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF4477AF4B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FD81F0E56;
	Thu, 10 Apr 2025 05:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RUBiN5iM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF11372;
	Thu, 10 Apr 2025 05:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263874; cv=none; b=Aj3lIf2aMAjs4Rj3OhqP/3xBmM9tvIoolf0Eg1N5NCQmNJ4t5gRoaN/tWthQ9j/Y2f9wAnl3iXw2FAwhJrec8TMb5X9c5MoY93wF5kgNO/8XXrhbbL9QMmYyVd4x3TXgqIgDKCLVmBUUuJTmGQQA6lVUTqB5eRW/9Pm7V6r0zLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263874; c=relaxed/simple;
	bh=r69O2F5+oB+9LcYghlqiwW9rK1kooGlrzpPsN0m+L3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SeUyD4uV1CYmUIEge+FSF14NxFp+flWvdQcp52rdeCX+tTGiUz019We+Ae59BlGEWWWOCmX9zEOGNP7uSknmPvk+eoL8bgMbzPcb0MCIur/NFqdhsQxY1zbiOLnt7m5iAhoADylpnIGcf9U6P8h/M7/PZXhRF6A62xJI5b8ur1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RUBiN5iM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5UAp1028359;
	Thu, 10 Apr 2025 05:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWNtJkthP9gQERriQujvm3tvkbdEqFgEPFp1EUvEVXY=; b=RUBiN5iMCMjf7X00
	NIHyMuG3H6RKXkfTnMU8MjqSqE5hzLMIUOEyhLD6na3J5om0Nhxz5mJvIJ/md4x9
	JGfqVk1nKQBnEfIsblbWtrh8TNHZKJorhFk2Q864bkYt/g3cGEMnCrEOdq3rktCE
	JswhjDZ9NNzaGgu9KkLfUKnIY76YNhTR/QkhzYaoxg1Kj8zrUK/rQVZay7HXdbAW
	bsL5aDqJSYokWEyN0XUJI/BPUvZxhdC7Ijw7E3XrJ8Y6GpSOSQfgOC2klA+I6WfJ
	aoAg0PeaVSIW5KyYfUwyX6yK+YUPQCNjwIEkJH5urshOxQ/T/BECtsfri/zrxj0V
	pKy7TA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedtnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 05:44:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A5iJI1009235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 05:44:19 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 22:44:16 -0700
Message-ID: <148b684e-b32f-4159-8163-5e360bc36ed3@quicinc.com>
Date: Thu, 10 Apr 2025 13:44:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] coresight-tgu: Add signal priority support
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-4-quic_songchai@quicinc.com>
 <CAJ9a7Vi9CWGKGYe6jBELFN_X6dSG4EfQQd5moju5ekbrLWxi2g@mail.gmail.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <CAJ9a7Vi9CWGKGYe6jBELFN_X6dSG4EfQQd5moju5ekbrLWxi2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CUzB17DBfGJbvxn8NHKEWHZKuVELxMDr
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f75ab4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EzDcxT4PO7vT97YCUL0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CUzB17DBfGJbvxn8NHKEWHZKuVELxMDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100042


On 3/7/2025 8:17 PM, Mike Leach wrote:
> Hi
>
> On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>> From: Songwei Chai <quic_songchai@quicinc.com>
>>
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>> Signed-off-by: songchai <quic_songchai@quicinc.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tgu   |   7 +
>>   drivers/hwtracing/coresight/coresight-tgu.c   | 139 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tgu.h   | 110 ++++++++++++++
>>   3 files changed, 256 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> index 741bc9fd9df5..af7332153833 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> @@ -7,3 +7,10 @@ Description:
>>                  Accepts only one of the 2 values -  0 or 1.
>>                  0 : disable TGU.
>>                  1 : enable TGU.
>> +
>> +What:           /sys/bus/coresight/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
>> +Date:           February 2025
>> +KernelVersion   6.15
>> +Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>> +Description:
>> +                (RW) Set/Get the sensed siganal with specific step and priority for TGU.
> sp/siganal/signal
Done.
>
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
>> index da4c04ac1097..f28761619ebe 100644
>> --- a/drivers/hwtracing/coresight/coresight-tgu.c
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
>> @@ -17,9 +17,92 @@
>>
>>   DEFINE_CORESIGHT_DEVLIST(tgu_devs, "tgu");
>>
>> +static int calculate_array_location(struct tgu_drvdata *drvdata, int step_index,
>> +                         int operation_index, int reg_index)
>> +{
>> +       int ret = -EINVAL;
>> +
>> +       ret = operation_index * (drvdata->max_step) *
>> +                     (drvdata->max_reg) + step_index * (drvdata->max_reg)
>> +                               + reg_index;
>> +
>> +       return ret;
>> +}
>> +
>> +static ssize_t tgu_dataset_show(struct device *dev,
>> +                               struct device_attribute *attr, char *buf)
>> +{
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       struct tgu_attribute *tgu_attr =
>> +               container_of(attr, struct tgu_attribute, attr);
>> +
>> +       return sysfs_emit(buf, "0x%x\n",
>> +                         drvdata->value_table->priority[calculate_array_location(
>> +                                 drvdata, tgu_attr->step_index,
>> +                                 tgu_attr->operation_index, tgu_attr->reg_num)]);
>> +
>> +}
>> +
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +                                struct device_attribute *attr, const char *buf,
>> +                                size_t size)
>> +{
>> +       unsigned long val;
>> +       ssize_t ret = -EINVAL;
>> +
>> +       struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev->parent);
>> +       struct tgu_attribute *tgu_attr =
>> +               container_of(attr, struct tgu_attribute, attr);
>> +
>> +       if (kstrtoul(buf, 0, &val))
>> +               return ret;
>> +
>> +       guard(spinlock)(&tgu_drvdata->spinlock);
>> +       tgu_drvdata->value_table->priority[calculate_array_location(
>> +               tgu_drvdata, tgu_attr->step_index, tgu_attr->operation_index,
>> +               tgu_attr->reg_num)] = val;
>> +       ret = size;
>> +
>> +       return ret;
> ret is unneeded - directly return either size or -EINVAL.
Done.
>
>> +}
>> +
>> +static umode_t tgu_node_visible(struct kobject *kobject, struct attribute *attr,
>> +                               int n)
>> +{
>> +       struct device *dev = kobj_to_dev(kobject);
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       int ret = 0;
>> +
>> +       struct device_attribute *dev_attr =
>> +               container_of(attr, struct device_attribute, attr);
>> +       struct tgu_attribute *tgu_attr =
>> +               container_of(dev_attr, struct tgu_attribute, attr);
>> +
>> +       if (tgu_attr->step_index < drvdata->max_step) {
>> +               ret = (tgu_attr->reg_num < drvdata->max_reg) ?
>> +                                           attr->mode : 0;
>> +               return ret;
>> +       }
>> +       return SYSFS_GROUP_INVISIBLE;
>> +}
> default ret as SYSFS_GROUP_INVISIBLE, and returnret at end
Done.
>
>> +
>>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>   {
>> +       int i, j, k;
>> +
>>          CS_UNLOCK(drvdata->base);
>> +
>> +       for (i = 0; i < drvdata->max_step; i++) {
>> +               for (j = 0; j < MAX_PRIORITY; j++) {
>> +                       for (k = 0; k < drvdata->max_reg; k++) {
>> +                               tgu_writel(drvdata,
>> +                                          drvdata->value_table->priority
>> +                                                  [calculate_array_location(drvdata, i, j, k)],
>> +                                          PRIORITY_REG_STEP(i, j, k));
>> +                       }
>> +               }
>> +       }
>> +
>>          /* Enable TGU to program the triggers */
>>          tgu_writel(drvdata, 1, TGU_CONTROL);
>>          CS_LOCK(drvdata->base);
>> @@ -130,6 +213,38 @@ static const struct attribute_group tgu_common_grp = {
>>
>>   static const struct attribute_group *tgu_attr_groups[] = {
>>          &tgu_common_grp,
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>> +       PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>>          NULL,
>>   };
>>
>> @@ -164,6 +279,30 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>>
>>          spin_lock_init(&drvdata->spinlock);
>>
>> +       ret = of_property_read_u32(adev->dev.of_node, "tgu-regs",
>> +                                  &drvdata->max_reg);
>> +       if (ret)
>> +               return -EINVAL;
>> +
>> +       ret = of_property_read_u32(adev->dev.of_node, "tgu-steps",
>> +                                  &drvdata->max_step);
>> +       if (ret)
>> +               return -EINVAL;
>> +
>> +       drvdata->value_table =
>> +               devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>> +       if (!drvdata->value_table)
>> +               return -ENOMEM;
>> +
>> +       drvdata->value_table->priority = devm_kzalloc(
>> +               dev,
>> +               MAX_PRIORITY * drvdata->max_reg * drvdata->max_step *
>> +                       sizeof(*(drvdata->value_table->priority)),
>> +               GFP_KERNEL);
>> +
>> +       if (!drvdata->value_table->priority)
>> +               return -ENOMEM;
>> +
>>          drvdata->enable = false;
>>          desc.type = CORESIGHT_DEV_TYPE_HELPER;
>>          desc.pdata = adev->dev.platform_data;
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
>> index 380686f94130..6e5d465117df 100644
>> --- a/drivers/hwtracing/coresight/coresight-tgu.h
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
>> @@ -13,6 +13,110 @@
>>   #define tgu_writel(drvdata, val, off) __raw_writel((val), drvdata->base + off)
>>   #define tgu_readl(drvdata, off) __raw_readl(drvdata->base + off)
>>
>> +/*
>> + *  TGU configuration space                              Step configuration
>> + *  offset table                                         space layout
>> + * x-------------------------x$                          x-------------x$
>> + * |                         |$                          |             |$
>> + * |                         |                           |   reserve   |$
>> + * |                         |                           |             |$
>> + * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
>> + * |     registe             |                     |---> |prioroty[3]  |$
>> + * |                         |                     |     |-------------|base+n*0x1D8+0x194$
>> + * |                         |                     |     |prioroty[2]  |$
>> + * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
>> + * |                         |                     |     |prioroty[1]  |$
>> + * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
>> + * |-------------------------|->base+0x40+7*0x1D8  |     |prioroty[0]  |$
>> + * |                         |                     |     |-------------|base+n*0x1D8+0x74$
>> + * |         ...             |                     |     |  condition  |$
>> + * |                         |                     |     |   select    |$
>> + * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
>> + * |                         |                     |     |  condition  |$
>> + * |         step[0]         |-------------------->      |   decode    |$
>> + * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
>> + * |                         |                           |             |$
>> + * | Control and status space|                           |Timer/Counter|$
>> + * |        space            |                           |             |$
>> + * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
>> + *
>> + */
>> +
>> +/* Calculate compare step addresses */
>> +#define PRIORITY_REG_STEP(step, priority, reg)\
>> +       (0x0074 + 0x60 * priority + 0x4 * reg + 0x1D8 * step)
>> +
> use #defines + explanation instead of arbitrary magic numbers
Done.
>
>> +#define tgu_dataset_ro(name, step_index, type, reg_num)     \
>> +       (&((struct tgu_attribute[]){ {                      \
>> +               __ATTR(name, 0444, tgu_dataset_show, NULL), \
>> +               step_index,                                 \
>> +               type,                                       \
>> +               reg_num,                                    \
>> +       } })[0].attr.attr)
>> +
>
> This define unused in this patch, Drop till it is used.
Done.
>
>> +#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>> +       (&((struct tgu_attribute[]){ {                                   \
>> +               __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>> +               step_index,                                              \
>> +               type,                                                    \
>> +               reg_num,                                                 \
>> +       } })[0].attr.attr)
>> +
>> +#define STEP_PRIORITY(step_index, reg_num, priority)                     \
>> +       tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>> +                      reg_num)
>> +
>> +#define STEP_PRIORITY_LIST(step_index, priority)  \
>> +       {STEP_PRIORITY(step_index, 0, priority),  \
>> +        STEP_PRIORITY(step_index, 1, priority),  \
>> +        STEP_PRIORITY(step_index, 2, priority),  \
>> +        STEP_PRIORITY(step_index, 3, priority),  \
>> +        STEP_PRIORITY(step_index, 4, priority),  \
>> +        STEP_PRIORITY(step_index, 5, priority),  \
>> +        STEP_PRIORITY(step_index, 6, priority),  \
>> +        STEP_PRIORITY(step_index, 7, priority),  \
>> +        STEP_PRIORITY(step_index, 8, priority),  \
>> +        STEP_PRIORITY(step_index, 9, priority),  \
>> +        STEP_PRIORITY(step_index, 10, priority), \
>> +        STEP_PRIORITY(step_index, 11, priority), \
>> +        STEP_PRIORITY(step_index, 12, priority), \
>> +        STEP_PRIORITY(step_index, 13, priority), \
>> +        STEP_PRIORITY(step_index, 14, priority), \
>> +        STEP_PRIORITY(step_index, 15, priority), \
>> +        STEP_PRIORITY(step_index, 16, priority), \
>> +        STEP_PRIORITY(step_index, 17, priority), \
>> +        NULL                   \
>> +       }
>> +
>> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>> +       (&(const struct attribute_group){\
>> +               .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
>> +               .is_visible = tgu_node_visible,\
>> +               .name = "step" #step "_priority" #priority \
>> +       })
>> +
>> +enum operation_index {
>> +       TGU_PRIORITY0,
>> +       TGU_PRIORITY1,
>> +       TGU_PRIORITY2,
>> +       TGU_PRIORITY3
>> +
>> +};
>> +
>> +/* Maximum priority that TGU supports */
>> +#define MAX_PRIORITY 4
>> +
>> +struct tgu_attribute {
>> +       struct device_attribute attr;
>> +       u32 step_index;
>> +       enum operation_index operation_index;
>> +       u32 reg_num;
>> +};
>> +
>> +struct value_table {
>> +       unsigned int *priority;
>> +};
>> +
>>   /**
>>    * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit) device
>>    * @base: Memory-mapped base address of the TGU device
>> @@ -20,6 +124,9 @@
>>    * @csdev: Pointer to the associated coresight device
>>    * @spinlock: Spinlock for handling concurrent access
>>    * @enable: Flag indicating whether the TGU device is enabled
>> + * @value_table: Store given value based on relevant parameters.
>> + * @max_reg: Maximum number of registers
>> + * @max_step: Maximum step size
>>    *
>>    * This structure defines the data associated with a TGU device, including its base
>>    * address, device pointers, clock, spinlock for synchronization, trigger data pointers,
>> @@ -31,6 +138,9 @@ struct tgu_drvdata {
>>          struct coresight_device *csdev;
>>          spinlock_t spinlock;
>>          bool enable;
>> +       struct value_table *value_table;
>> +       int max_reg;
>> +       int max_step;
>>   };
>>
>>   #endif
> Regards
>
> Mike
>

