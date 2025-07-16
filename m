Return-Path: <linux-arm-msm+bounces-65119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DAAB06BCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 04:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725634A0E86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE99274B30;
	Wed, 16 Jul 2025 02:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G09AqviZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E5134BD;
	Wed, 16 Jul 2025 02:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752633791; cv=none; b=FxoMIcdTXKUDNrD2jFuF8popQDPip1QWMStemivNnSRAb3xJ/3Xm95SGgwasqrFzG2TTB9QvBcvcog4LZOnclJ/34dBFeBENlxk0TvIgIWUv55SS3Q9CdD+jlbzqXY5rLjl6Iswc6ibrqUH4tXddzGPxXkEkLLZS78L52Suw914=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752633791; c=relaxed/simple;
	bh=G9iS+WY2MzMXQUsNozkhjY1pTfnmBg4CHeDKcyBzd1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lAtuk8tp8W8FVGZiCGh2a5lZSt5aG/T8S6zO6ArL3B2ylKUgEUjJvBaxGBcPwrVLsCmSSYgnkJNEXYTL2mVYmkbHCzr/kt9AfssEPuddwzyse47oyky2LP3o2rZd3/BqnuX0O6EReRsR0kte2VyBrQc86Zr1WQkoZsaDqrjb6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G09AqviZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDE2a024502;
	Wed, 16 Jul 2025 02:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lS5WELhkTJFHx/D90OsST2R2TOJPD1ztPrKBsgFiv1s=; b=G09AqviZWK0iDaI3
	KMXt7YK5+txK6CxTbsGg5BwmvEQpa6UZloP5zQqqHI5n/kE45LUNhoXPz+mXHj0M
	HqHOLZmW/FKAh2HBepHpY50ptONcW/eGAMvfC2wUkHhZZWQ814pvRh53gR5zyhF8
	GkwN6pOo6TGcOef6e4qawegCXa6/hedOr9gO5rc4Tmwnk9cNP0ijEANyaLdEN3c+
	KZkdSWdRq7LVw0QuurTHDcwFTrY9U3xvdtnJaqLZWSSWnHpFxg1gZvp+BimiP+N0
	T8K5eH/uwWAQmbaCJnGMxMjINwx8FN3niq9XmkfbQ9NfVMVv5f9kZL88vgVyONqf
	uPQsTQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpd5mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 02:42:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G2gvqi014800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 02:42:57 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 19:42:54 -0700
Message-ID: <0e7ae7d1-4877-4e8a-a0fb-0fda5cc03cf2@quicinc.com>
Date: Wed, 16 Jul 2025 10:42:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] coresight: Add label sysfs node support
To: Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
 <20250703130453.4265-3-quic_jinlmao@quicinc.com>
 <20250703141905.GE1039028@e132581.arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20250703141905.GE1039028@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAyMyBTYWx0ZWRfX0jxODwosWt9u
 m7zgTP9LzZjYsHKSXw2vo7u3GczgQ56Hs3ash/KV4E6yVPS8mPj5C7qIcIXtMXDwpmQooSQJpR0
 ERa/jXs3aMf2OmZq0EghIwmypY0HnG46vOhwacNXoX53gfRYEPL9LeP6hdvyR6knLJjLg9wDr8P
 zJnP8hS8ubd+rF87pVoFrrBpLQY5LoG2uOKFHRjEyUo8lXnHQU5S49DMu3vuvEEOgloFih9kUiv
 FEAazczUpmfM53aHmhczUHQPccQN0PhHaCp8XL7MmtcZJy6w8/wtBSdmcepCpo0ATnHc3FOYJj0
 LkBZ64Gw+74O+7mV2UpHZrcW+22ba65HIO0M0iTbrgwjP/RzmSvxKPJndhwWrevY8m7RidWAAiO
 0xEpXdiZOKN3bwYAPprGx8aBRlFLhu0RJ3l+DIZ5XAVUCHsnfIE81kRw10MqJ2T+i8+4t4by
X-Proofpoint-GUID: A7GTv4g83rHadCvpUp3EZt54Th64gB2b
X-Proofpoint-ORIG-GUID: A7GTv4g83rHadCvpUp3EZt54Th64gB2b
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687711b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=7DyI6OxBC52R2nxcTEgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160023



On 2025/7/3 22:19, Leo Yan wrote:
> On Thu, Jul 03, 2025 at 09:04:53PM +0800, Mao Jinlong wrote:
> 
> [...]
> 
>> +static ssize_t label_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +
>> +	const char *str;
>> +	int ret = 0;
> 
> No need to init ret to 0.
> 
>> +	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
>> +	if (ret == 0)
>> +		return scnprintf(buf, PAGE_SIZE, "%s\n", str);
>> +	else
>> +		return ret;
>> +}
>> +static DEVICE_ATTR_RO(label);
>> +
>>   static struct attribute *coresight_sink_attrs[] = {
>>   	&dev_attr_enable_sink.attr,
>> +	&dev_attr_label.attr,
>>   	NULL,
>>   };
>>   ATTRIBUTE_GROUPS(coresight_sink);
>>   
>>   static struct attribute *coresight_source_attrs[] = {
>>   	&dev_attr_enable_source.attr,
>> +	&dev_attr_label.attr,
>>   	NULL,
>>   };
>>   ATTRIBUTE_GROUPS(coresight_source);
>>   
>> +static struct attribute *coresight_link_attrs[] = {
>> +	&dev_attr_label.attr,
>> +	NULL,
>> +};
>> +ATTRIBUTE_GROUPS(coresight_link);
>> +
>> +static struct attribute *coresight_helper_attrs[] = {
>> +	&dev_attr_label.attr,
>> +	NULL,
>> +};
>> +ATTRIBUTE_GROUPS(coresight_helper);
>> +
> 
> This change adds a 'label' entry for source, link, helper, and sink
> components, but the documentation has only updated for three components:
> CTI, funnel, and TPDM.
> 
> Should we also update the documentation for all relevant components,
> such as ETM, ETR, etc.?
> 
> Additionally, patch 01 is missing the update to the ETM yaml file for
> the new property. I checked patch v4 [1], which includes a change to
> etm.yaml, but this change was dropped since v5. I briefly read the
> v4 discussion thread and didn't see any mention of removing the ETM
> related change. Did you see any particular issue when add label for
> ETM devices?
> 
> Overall, this series is fine for me. Just please ensure that all
> relevant components are covered for completeness.
> 
> Thanks,
> Leo
> 

I will update all coresight docs.

Thanks
Jinlong Mao

> [1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/
> 
>>   const struct device_type coresight_dev_type[] = {
>>   	[CORESIGHT_DEV_TYPE_SINK] = {
>>   		.name = "sink",
>> @@ -390,6 +420,7 @@ const struct device_type coresight_dev_type[] = {
>>   	},
>>   	[CORESIGHT_DEV_TYPE_LINK] = {
>>   		.name = "link",
>> +		.groups = coresight_link_groups,
>>   	},
>>   	[CORESIGHT_DEV_TYPE_LINKSINK] = {
>>   		.name = "linksink",
>> @@ -401,6 +432,7 @@ const struct device_type coresight_dev_type[] = {
>>   	},
>>   	[CORESIGHT_DEV_TYPE_HELPER] = {
>>   		.name = "helper",
>> +		.groups = coresight_helper_groups,
>>   	}
>>   };
>>   /* Ensure the enum matches the names and groups */
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


