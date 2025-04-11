Return-Path: <linux-arm-msm+bounces-53924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D29A851BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 04:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AC1A7A9216
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 02:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F06827BF94;
	Fri, 11 Apr 2025 02:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FouJLVrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6052147F5;
	Fri, 11 Apr 2025 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744339907; cv=none; b=tzISls20FWPfwEcN75bhstgoGilwa0f7EBQd3aOA393f1s0L0lP+rAIo5pNlWyPTy/QFnsU5FTWi2blNGWxFgGknwIZ2a78cdtq2pLV9F58OY7tBOJQ7nejhBHSPxNJnjepZLMjE7r6APnb19gkPdFbIqq55ejeQRk//1NthjeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744339907; c=relaxed/simple;
	bh=QGmAWk8YW54uZtf6oYIyPCnnrkMMqHu+DmUgJe2uWVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SyEOjQwXqHXOiUWOncTfxKkuAGW7k70QyzXIEEWFhJfBIIbE3u7rwcBfcxc+37R7tHSQoYNK8VlUT/ynY9X2qSWLVabDey313setEGBRtRM1y19cHzkeJC8O9xMQlJB0zbxTxmvT3ik89tA19it4gjRq1rALvvcXx76hKlC/efg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FouJLVrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B21LgN007233;
	Fri, 11 Apr 2025 02:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54+weeQ0kRcPU5YNIxAUX0uPK9WSQdfhUffh6J44FZo=; b=FouJLVrrEvwqi8kP
	U3d+nXa3Ol1gUQ7c3EQyhF1pky5nlkQfeKHeLqkjV/zY2rjBVLVlwNVjwYm1zm4H
	sx4abW3elBnO5MZq3WJ2kJXi3MfgNDEAo3c6Erpd4ZTm5Zv6jPgBHM7kY7RcwNSF
	7cuTKddQtp5s7xB2uc0L4Wl0ytFd5CT8JG1gpZuDverb/FAKC/+D2ko9/JTbVM40
	bWiTZylSkRGIH0+x2uXWs9TtW1ihKKw+z4Xdr3VI8aak/vCDpr4Ss5EFpQGpP9ka
	Fd8HFsXzw1vTU71KWZwptVKBMTDeOKjKuLuAK8HI92iWfWLTHH8+uDyxVED7w/uR
	pG44dA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3hy84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 02:51:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B2pU2w001014
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 02:51:30 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 19:51:27 -0700
Message-ID: <808b2ae5-5286-487c-8f52-03936c3686ef@quicinc.com>
Date: Fri, 11 Apr 2025 10:51:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] coresight-tgu: add reset node to initialize
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Songwei Chai
	<quic_songchai@quicinc.com>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
 <20250227092640.2666894-8-quic_songchai@quicinc.com>
 <CAJ9a7Vh4OTZdbEygtwc7BxRJSLgkALoaNRPEiQLJQgZvFtnTtw@mail.gmail.com>
Content-Language: en-US
From: songchai <quic_songchai@quicinc.com>
In-Reply-To: <CAJ9a7Vh4OTZdbEygtwc7BxRJSLgkALoaNRPEiQLJQgZvFtnTtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f883b4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=vmeuUHBbrc6izfGtevMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: M3FgirXRwWiVEtVfkR1R1N9M31nazOhl
X-Proofpoint-ORIG-GUID: M3FgirXRwWiVEtVfkR1R1N9M31nazOhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110020


On 3/7/2025 9:33 PM, Mike Leach wrote:
> Hi,
>
> On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>> From: Songwei Chai <quic_songchai@quicinc.com>
>>
>> Add reset node to initialize the value of
>> priority/condition_decode/condition_select/timer/counter nodes
>>
>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>> Signed-off-by: songchai <quic_songchai@quicinc.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
>>   drivers/hwtracing/coresight/coresight-tgu.c   | 79 +++++++++++++++++++
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> index d88d05fbff43..8fb5afd7c655 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
>> @@ -42,3 +42,10 @@ KernelVersion   6.15
>>   Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>>   Description:
>>                   (RW) Set/Get the counter value with specific step for TGU.
>> +
>> +What:           /sys/bus/coresight/devices/<tgu-name>/reset_tgu
>> +Date:           February 2025
>> +KernelVersion   6.15
>> +Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>> +Description:
>> +                (Write) Reset the dataset for TGU.
> Document the value needed to initiate the reset.
Done.
>
>> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
>> index 693d632fb079..b36ced761c0d 100644
>> --- a/drivers/hwtracing/coresight/coresight-tgu.c
>> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
>> @@ -343,6 +343,84 @@ static ssize_t enable_tgu_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RW(enable_tgu);
>>
>> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
>> +static ssize_t reset_tgu_store(struct device *dev,
>> +                              struct device_attribute *attr, const char *buf,
>> +                              size_t size)
>> +{
>> +       unsigned long value;
>> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       int i, j, ret;
>> +
>> +       if (kstrtoul(buf, 0, &value))
>> +               return -EINVAL;
>> +
> Check "value" here and bail out with an error code if 0.
Done.
>
>> +       if (!drvdata->enable) {
>> +               ret = pm_runtime_get_sync(drvdata->dev);
>> +               if (ret < 0) {
>> +                       pm_runtime_put(drvdata->dev);
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +       CS_UNLOCK(drvdata->base);
>> +
>> +       if (value) {
> drop this line
Done.
>
>> +               tgu_writel(drvdata, 0, TGU_CONTROL);
>> +
>> +               if (drvdata->value_table->priority)
>> +                       memset(drvdata->value_table->priority, 0,
>> +                              MAX_PRIORITY * drvdata->max_step *
>> +                                      drvdata->max_reg * sizeof(unsigned int));
>> +
>> +               if (drvdata->value_table->condition_decode)
>> +                       memset(drvdata->value_table->condition_decode, 0,
>> +                              drvdata->max_condition_decode * drvdata->max_step *
>> +                                      sizeof(unsigned int));
>> +
>> +               /* Initialize all condition registers to NOT(value=0x1000000) */
>> +               for (i = 0; i < drvdata->max_step; i++) {
>> +                       for (j = 0; j < drvdata->max_condition_decode; j++) {
>> +                               drvdata->value_table
>> +                                       ->condition_decode[calculate_array_location(
>> +                                               drvdata, i, TGU_CONDITION_DECODE, j)] =
>> +                                       0x1000000;
>> +                       }
>> +               }
>> +
>> +               if (drvdata->value_table->condition_select)
>> +                       memset(drvdata->value_table->condition_select, 0,
>> +                              drvdata->max_condition_select * drvdata->max_step *
>> +                                      sizeof(unsigned int));
>> +
>> +               if (drvdata->value_table->timer)
>> +                       memset(drvdata->value_table->timer, 0,
>> +                              (drvdata->max_step) *
>> +                                      (drvdata->max_timer_counter) *
>> +                                      sizeof(unsigned int));
>> +
>> +               if (drvdata->value_table->counter)
>> +                       memset(drvdata->value_table->counter, 0,
>> +                              (drvdata->max_step) *
>> +                                      (drvdata->max_timer_counter) *
>> +                                      sizeof(unsigned int));
>> +
>> +               dev_dbg(dev, "Coresight-TGU reset complete\n");
>> +       } else {
>> +               dev_dbg(dev, "Coresight-TGU invalid input\n");
> not needed if early exit on input errror
Done.
>
>> +       }
>> +
>> +       CS_LOCK(drvdata->base);
>> +
>> +       drvdata->enable = false;
>> +       spin_unlock(&drvdata->spinlock);
>> +       pm_runtime_put(drvdata->dev);
>> +
>> +       return size;
>> +}
>> +static DEVICE_ATTR_WO(reset_tgu);
>> +
>>   static const struct coresight_ops_helper tgu_helper_ops = {
>>          .enable = tgu_enable,
>>          .disable = tgu_disable,
>> @@ -354,6 +432,7 @@ static const struct coresight_ops tgu_ops = {
>>
>>   static struct attribute *tgu_common_attrs[] = {
>>          &dev_attr_enable_tgu.attr,
>> +       &dev_attr_reset_tgu.attr,
>>          NULL,
>>   };
>>
>>
>
> Regards
>
> Mike
>

