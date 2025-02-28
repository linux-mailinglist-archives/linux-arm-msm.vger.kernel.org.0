Return-Path: <linux-arm-msm+bounces-49822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C087A49260
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC10E189394D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 07:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146FF1D5CE8;
	Fri, 28 Feb 2025 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QJqtmSoc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557891D47B5;
	Fri, 28 Feb 2025 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728706; cv=none; b=qk3PP/WunktEBSRUgThTQNUbJa88Ke8naeQsWnkZHdcwK/6tHKs0xJCest07YPCY1nUiQN848rh4zOycSEbAsd7pr7BvAa8qn9rBPhc60xrqYbRYJpZBaRD+CIpHOGpe0Ezqi89QKQ7VvC8XLEeQW3yJ0SJTdSdXEMIcBTDoxDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728706; c=relaxed/simple;
	bh=5ag7gsXAZxgxgilgQ2+lunikPzAiBcdUV14v4mT/YNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jwMh0PEGhsWP5tD1TCZwDNm05Y2/PUhO2oMoZ/7F6ImFDNItJZkiv9nC6bGq+bHs4j8jZQkLBVRWHIci3Sx2DubNLWA9jgkaZqaxWHnMXLcEh4zaQ3N7R/88T0F0IZtOYCK8YnxfU6GNmxG0z5AgBqkxrMXcwLfiFYgpMMGqY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QJqtmSoc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RL65d4030047;
	Fri, 28 Feb 2025 07:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6O06nCues7TjS3vEUr8Hzch/RGBixqkLvbgwaXBhdM=; b=QJqtmSocELidA9nF
	1ETFYpiplNR8b4rlg7TT84Aka2XKbuAf8ziVRm+4gpDtuJZwC0B28bBS9cC3sT73
	EVFY97ub2LQZTAeT1aKXlQtnpz5PtMUrEOcS8RDG2CaKb/4YRP0wW1Le47f8WnJz
	mUFXNpwosPcSqHhduQXM3I6ADepLS7Ilp5b9ZF8RLFRp44fJZtZdhFdG5188rZ9p
	ZgUACHxuCx0++2+IvYgkHzT1FG2/0cSh0mGl8V4kCr3gwH2yKKazE81qozDI/KVf
	aKZLG0HqQN3jWF1g3eLqWuXy23YnCsMzM6+4vwvyBx9GXtIzCU7cCm4Lok7ZaSZx
	zl+S5g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452ynwsc3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:44:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S7ipLu002399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:44:51 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 23:44:45 -0800
Message-ID: <36f63775-cee8-46e0-a5bf-5e44ff0e582e@quicinc.com>
Date: Fri, 28 Feb 2025 15:44:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] coresight-tnoc: add node to configure flag type
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-4-0a23fc643217@quicinc.com>
 <d9eff439-27ae-4555-a0c5-21acdf60d321@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <d9eff439-27ae-4555-a0c5-21acdf60d321@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8kWV_iwHsAArISmsCcAxWvAsf4HTuX20
X-Proofpoint-GUID: 8kWV_iwHsAArISmsCcAxWvAsf4HTuX20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_01,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280054



On 2/22/2025 6:55 PM, Krzysztof Kozlowski wrote:
> On 21/02/2025 08:40, Yuanfang Zhang wrote:
>> +
>> +static ssize_t flag_type_show(struct device *dev,
>> +			      struct device_attribute *attr,
>> +			      char *buf)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +	return sysfs_emit(buf, "%u\n", drvdata->flag_type);
>> +}
>> +static DEVICE_ATTR_RW(flag_type);
>> +
>>  static struct attribute *trace_noc_attrs[] = {
>>  	&dev_attr_flush_req.attr,
>>  	&dev_attr_flush_status.attr,
>> +	&dev_attr_flag_type.attr,
> 
> Where is the ABI documentation?
will update in V3.
> 
> Best regards,
> Krzysztof


