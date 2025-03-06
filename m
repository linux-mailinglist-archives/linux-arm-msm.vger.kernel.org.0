Return-Path: <linux-arm-msm+bounces-50456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EBBA54515
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E614B18840AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1F7207A05;
	Thu,  6 Mar 2025 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gWafXzhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEEE1A725A;
	Thu,  6 Mar 2025 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741250390; cv=none; b=epAn9zBmpAiPsVE7GOO5fxl2UudVjtsIY12XzKrV+FarZyHRCHe6qz8LOV2iHKYJHTtqtBW+OQLYsRduR3z8OfG+z9rbp7I6fM83YYkjE+3ok/EOzukqZOJpWp/b88h7HGkeDZwN1P+rMZ3Fl6ho4fMGR271OZVPCKw67cUi7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741250390; c=relaxed/simple;
	bh=GaIXE2k3U88KxXuww8F2fopU946NOIvfTG/pLOpXD7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mHxBXFfIEte9aGqCs33n9dH+UDUGzlxcocbfyG0enVzctyprr8XZsQkm2qMoU2P5Gnt8NImyTXaRjjmLrkYpnO8Mms9c7Nhh8Ax/V5cyioaO+hHFtYeRGAlwo9tIe1JVvd35LwvGAKA8wAbhT/p4AWTTzSVj4cjvKJmoAyn13oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gWafXzhh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267mMfb005490;
	Thu, 6 Mar 2025 08:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6UvJ+1JmZo8VlXWPT14cPudFRqzt3cpJOHCBheUtjk=; b=gWafXzhhInKMRMT+
	CwbGsjN+fFw1KfJ0x6+7zQdyY/+JANnxFw0DcSWq5Nn6WQTtNR4+BHQIDfA37B9o
	dhx16MCKDyxeKnsMErADEuT3/VS5Qp2LuX6k0LZN5tl4qzCC8Jsy7MJtz5GkKzcP
	U4nvkjActoBUNsk1rSu1MsSge56AhTTv50kXUCFkTJa7aObASipg817eW7E+kR5J
	2rH4ecV6OcuLdgf35KI91s5wbprJbEqOWnF1o49q53JYIscCzJpJCVMV1XVis0UF
	P4nF1Juf/FvW1sASowjiZUeyYSwxNCi29bt4meK1k2EVrY/QYGK13BgXtCvJ0uWn
	IiHAnA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx84ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:39:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268daBx000978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:39:36 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:39:30 -0800
Message-ID: <7c702a81-fb6c-4399-8d7d-d8c4ad9a8c65@quicinc.com>
Date: Thu, 6 Mar 2025 16:39:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] coresight-tnoc: add nodes to configure flush
To: Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-3-8afc6584afc5@quicinc.com>
 <20250227162349.GB2157064@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250227162349.GB2157064@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QRLqa4920E4y2cbs84gFza1SbRHm6_IA
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c95f49 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=TTx7VNbxHRw4qo8MNLMA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QRLqa4920E4y2cbs84gFza1SbRHm6_IA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060064



On 2/28/2025 12:23 AM, Leo Yan wrote:
> On Wed, Feb 26, 2025 at 07:05:52PM +0800, Yuanfang Zhang wrote:
>>
>> Two nodes for configure flush are added here:
>> 1. flush_req: write 1 to initiates a flush sequence.
>>
>> 2. flush_state: read this node to get flush status. 0: sequence in
>> progress; 1: sequence has been completed.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 73 ++++++++++++++++++++++++++++
>>  drivers/hwtracing/coresight/coresight-tnoc.h |  4 ++
>>  2 files changed, 77 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index fad8e61f05ef25989aba1be342c547f835e8953a..20231f28ddcb6a60d9b3c1ca3e0ca4d731dac39c 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -16,6 +16,78 @@
>>  #include "coresight-tnoc.h"
>>  #include "coresight-trace-id.h"
>>
>> +static ssize_t flush_req_store(struct device *dev,
>> +                              struct device_attribute *attr,
>> +                              const char *buf,
>> +                              size_t size)
>> +{
>> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       struct coresight_device *csdev = drvdata->csdev;
>> +       unsigned long val;
>> +       u32 reg;
>> +
>> +       if (kstrtoul(buf, 10, &val))
>> +               return -EINVAL;
>> +
>> +       if (val != 1)
>> +               return -EINVAL;
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +       if (csdev->refcnt == 0) {
>> +               spin_unlock(&drvdata->spinlock);
>> +               return -EPERM;
>> +       }
>> +
>> +       reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +       reg = reg | TRACE_NOC_CTRL_FLUSHREQ;
>> +       writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);
> 
> How can userspace determine when to trigger a flush?
It can be triggered under any circumstances.
> 
> Generally, a driver kicks off a flush operation for a hardware before
> reading data from buffer or when disable a link path.  I don't know the
> hardware mechanism of TNOC, but seems to me, it does not make sense to
> let the userspace to trigger a hardware flush, given the userspace has
> no knowledge for device's state.
TNOC supports the aforementioned flush operation, and it also adds this
flush functionality, allowing users to set the flush themselves.
> 
> Furthermore, based on my understanding for patch 02 and 03, the working
> flow is also concerned me.  IIUC, you want to use the driver to create
> a linkage and then use userspace program to poll state and trigger
> flushing.  Could you explain why use this way for managing the device?
> 
TNOC support flush just like other links. This interface simply provides
customers with an additional option to trigger the flush.

> Thanks,
> Leo
> 
>> +
>> +       spin_unlock(&drvdata->spinlock);
>> +
>> +       return size;
>> +}
>> +static DEVICE_ATTR_WO(flush_req);
>> +
>> +/*
>> + * flush-sequence status:
>> + * value 0: sequence in progress;
>> + * value 1: sequence has been completed.
>> + */
>> +static ssize_t flush_status_show(struct device *dev,
>> +                                struct device_attribute *attr,
>> +                                char *buf)
>> +{
>> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       struct coresight_device *csdev = drvdata->csdev;
>> +       u32 val;
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +       if (csdev->refcnt == 0) {
>> +               spin_unlock(&drvdata->spinlock);
>> +               return -EPERM;
>> +       }
>> +
>> +       val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +       spin_unlock(&drvdata->spinlock);
>> +       return sysfs_emit(buf, "%lu\n", BMVAL(val, 2, 2));
>> +}
>> +static DEVICE_ATTR_RO(flush_status);
>> +
>> +static struct attribute *trace_noc_attrs[] = {
>> +       &dev_attr_flush_req.attr,
>> +       &dev_attr_flush_status.attr,
>> +       NULL,
>> +};
>> +
>> +static struct attribute_group trace_noc_attr_grp = {
>> +       .attrs = trace_noc_attrs,
>> +};
>> +
>> +static const struct attribute_group *trace_noc_attr_grps[] = {
>> +       &trace_noc_attr_grp,
>> +       NULL,
>> +};
>> +
>>  static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>>  {
>>         u32 val;
>> @@ -142,6 +214,7 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>>                 return ret;
>>
>>         desc.ops = &trace_noc_cs_ops;
>> +       desc.groups = trace_noc_attr_grps;
>>         desc.type = CORESIGHT_DEV_TYPE_LINK;
>>         desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>>         desc.pdata = adev->dev.platform_data;
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
>> index b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8..d0fe8f52709ff4147d66dbf90987595012cfaa4e 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
>> @@ -10,6 +10,10 @@
>>
>>  /* Enable generation of output ATB traffic.*/
>>  #define TRACE_NOC_CTRL_PORTEN  BIT(0)
>> +/* Writing 1 to initiate a flush sequence.*/
>> +#define TRACE_NOC_CTRL_FLUSHREQ        BIT(1)
>> +/* 0: sequence in progress; 1: sequence has been completed.*/
>> +#define TRACE_NOC_CTRL_FLUSHSTATUS     BIT(2)
>>  /* Writing 1 to issue a FREQ or FREQ_TS packet*/
>>  #define TRACE_NOC_CTRL_FREQTSREQ       BIT(5)
>>  /* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
>>
>> --
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


