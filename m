Return-Path: <linux-arm-msm+bounces-65339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B5B0832F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 05:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC51C7A7C82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 03:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C400B1DACA1;
	Thu, 17 Jul 2025 03:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T/p9XIm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4071A254E;
	Thu, 17 Jul 2025 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752721451; cv=none; b=DsRH4hd5W6LNxUxO0xrwI+mMq5jUCJ/8GPq6RFDFfGb2sN0rev0us68gb9o1ng1oCHB1VRhBBL8JCj0X2UlTJaXiP1HN7qHQ072r5fXEBVY/uAHPv5YL5d7wR2SJBunW98naX+xOBsmqaPcYmOksgZyC0LHAgNeDSArxKhcJ+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752721451; c=relaxed/simple;
	bh=EK70Sc4fwHFs2hGjDGfIE3VhSwftfnPt0Nv7VPHVa8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pIqUTsEercJ7NHq2WiGpeLycr/ptwDgMFL/li8APO17h2vZkErNS7+e7yfzu2mxZQkZOWHp1/RYI5cCRlbzoixXvCaSlh9cov/ymWvcuyb8ipdeE//qm1xc7a47IhAnIMDrFiTOhGlZ+YndL66/dy+rbW4ro14LuOuyy/kgG4uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T/p9XIm+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDY6b015664;
	Thu, 17 Jul 2025 03:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl9WiInfw+XrjWyYXlry8+JNjMfLk8gIbN0qzqtc8Bo=; b=T/p9XIm+xYThRzY+
	lVfT5U3UTkKi8I3H5Zqv6Qd8s+Hd3EL+tM3HnsGBmO4MJ0jTOVn64ITZeOZr9Qkc
	MJygOO51Vwf8n8gXj7pxD3sg7nFBb7YEF40HIoH92g39x/jpoWmCc8/m6gZL08gW
	is6xe9rH1o3FyocB573VIjplWUpmMcsnzVTKBupuSrHw7XI2iKOYps7QFk821h87
	Lb0kx2u2/dVgeOqbV6XdBeDsiEVMIFZNjaiu7VxKutBgrOTvpsZPAQGeTzmGeITb
	r0en7wWy4fAkfhoZZ5ve/0xw99WNDQ29usvRFosoEaH3F5BhXnm4q13FiNbU6RD0
	9xNAMg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dys1gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 03:03:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H33w2i017033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 03:03:58 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 20:03:55 -0700
Message-ID: <eed04042-ce69-491f-b42e-7c173afdb234@quicinc.com>
Date: Thu, 17 Jul 2025 11:03:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] coresight: Add label sysfs node support
To: Mike Leach <mike.leach@linaro.org>
CC: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
 <20250703130453.4265-3-quic_jinlmao@quicinc.com>
 <20250703141905.GE1039028@e132581.arm.com>
 <0e7ae7d1-4877-4e8a-a0fb-0fda5cc03cf2@quicinc.com>
 <CAJ9a7ViQ2A9FQV=fxzhu1DkZEBdiAvAijb6OjOeJriNio1nX6w@mail.gmail.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7ViQ2A9FQV=fxzhu1DkZEBdiAvAijb6OjOeJriNio1nX6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L_YyO-VRz5U42y7Nvyj6bm9BrLvwwg2a
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6878681f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=aWtVbIlNkpBLB9TuODAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAyNyBTYWx0ZWRfX6ZJOOEuStCmU
 AI7Q4nskWrxM/oQKaAOixiOMMk9zwsatd8TK2NvW4NkhzAGIKukar7/zufXQbmlwg0FJWPAO+HZ
 kPqe+7mbn9UMeW2tWG8XZxs9Y/0XpdUaoIsTsvEFKMK/Bo/epHVSWZU9p8NqbGgfADkRGyfGcrm
 cti7SAZRsviRlYV2v1xP+WFRSQEj7lo9yZ0psiwB7xN9NhWpuQTdhvhQO2qewNDbmQhP3pPUuYG
 m7aaFEAAOFuiH8s1xGkUMxM/jKy8qCmMA8a6EntkDj1LALODvIdzYBzgzAdk4uiqjW4fBwiZQuo
 nzgvLnOf18BT9c8oy9pFQl0qVfLLc+KK/5ErhAWzeYE3hcSPpoL6XlEdKEy+Y33/OFhi5hBFEjs
 d76++/Dt76Z+XaiY0muKjCM5Un3ZEVfvSndOLQmpFiTYUEqTjux+zEoyIgt+rbdb4X1CtxCH
X-Proofpoint-GUID: L_YyO-VRz5U42y7Nvyj6bm9BrLvwwg2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170027



On 2025/7/16 18:45, Mike Leach wrote:
> Hi,
> 
> On Wed, 16 Jul 2025 at 03:43, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>>
>>
>>
>> On 2025/7/3 22:19, Leo Yan wrote:
>>> On Thu, Jul 03, 2025 at 09:04:53PM +0800, Mao Jinlong wrote:
>>>
>>> [...]
>>>
>>>> +static ssize_t label_show(struct device *dev,
>>>> +            struct device_attribute *attr, char *buf)
>>>> +{
>>>> +
>>>> +    const char *str;
>>>> +    int ret = 0;
>>>
>>> No need to init ret to 0.
>>>
>>>> +    ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
>>>> +    if (ret == 0)
>>>> +            return scnprintf(buf, PAGE_SIZE, "%s\n", str);
>>>> +    else
>>>> +            return ret;
>>>> +}
>>>> +static DEVICE_ATTR_RO(label);
>>>> +
>>>>    static struct attribute *coresight_sink_attrs[] = {
>>>>       &dev_attr_enable_sink.attr,
>>>> +    &dev_attr_label.attr,
>>>>       NULL,
>>>>    };
>>>>    ATTRIBUTE_GROUPS(coresight_sink);
>>>>
>>>>    static struct attribute *coresight_source_attrs[] = {
>>>>       &dev_attr_enable_source.attr,
>>>> +    &dev_attr_label.attr,
>>>>       NULL,
>>>>    };
>>>>    ATTRIBUTE_GROUPS(coresight_source);
>>>>
>>>> +static struct attribute *coresight_link_attrs[] = {
>>>> +    &dev_attr_label.attr,
>>>> +    NULL,
>>>> +};
>>>> +ATTRIBUTE_GROUPS(coresight_link);
>>>> +
>>>> +static struct attribute *coresight_helper_attrs[] = {
>>>> +    &dev_attr_label.attr,
>>>> +    NULL,
>>>> +};
>>>> +ATTRIBUTE_GROUPS(coresight_helper);
>>>> +
>>>
>>> This change adds a 'label' entry for source, link, helper, and sink
>>> components, but the documentation has only updated for three components:
>>> CTI, funnel, and TPDM.
>>>
>>> Should we also update the documentation for all relevant components,
>>> such as ETM, ETR, etc.?
>>>
>>> Additionally, patch 01 is missing the update to the ETM yaml file for
>>> the new property. I checked patch v4 [1], which includes a change to
>>> etm.yaml, but this change was dropped since v5. I briefly read the
>>> v4 discussion thread and didn't see any mention of removing the ETM
>>> related change. Did you see any particular issue when add label for
>>> ETM devices?
>>>
>>> Overall, this series is fine for me. Just please ensure that all
>>> relevant components are covered for completeness.
>>>
>>> Thanks,
>>> Leo
>>>
>>
>> I will update all coresight docs.
>>
>> Thanks
>> Jinlong Mao
>>
>>> [1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/
>>>
>>>>    const struct device_type coresight_dev_type[] = {
>>>>       [CORESIGHT_DEV_TYPE_SINK] = {
>>>>               .name = "sink",
>>>> @@ -390,6 +420,7 @@ const struct device_type coresight_dev_type[] = {
>>>>       },
>>>>       [CORESIGHT_DEV_TYPE_LINK] = {
>>>>               .name = "link",
>>>> +            .groups = coresight_link_groups,
>>>>       },
>>>>       [CORESIGHT_DEV_TYPE_LINKSINK] = {
>>>>               .name = "linksink",
>>>> @@ -401,6 +432,7 @@ const struct device_type coresight_dev_type[] = {
>>>>       },
>>>>       [CORESIGHT_DEV_TYPE_HELPER] = {
>>>>               .name = "helper",
>>>> +            .groups = coresight_helper_groups,
>>>>       }
>>>>    };
>>>>    /* Ensure the enum matches the names and groups */
>>>> --
>>>> 2.17.1
>>>>
>>>> _______________________________________________
>>>> CoreSight mailing list -- coresight@lists.linaro.org
>>>> To unsubscribe send an email to coresight-leave@lists.linaro.org
>>
> 
> Revisiting this - the label DT attribute is purely optional, and
> provides context for the hardware instance.
> This code as written appears to add a "label" file to all devices,
> irrespective of if the label is set in the DT.or not, with blank
> labels where  the attribute is not present.
> The visibility of the sysfs attribute should be controlled so that it
> only appears if label is present in the DT.
> 
I will follow this.

Thanks
Jinlong Mao
> Mike
> 


