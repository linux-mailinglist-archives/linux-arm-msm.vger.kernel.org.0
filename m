Return-Path: <linux-arm-msm+bounces-29170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795789593AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 06:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DE851C2146E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 04:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F66915852C;
	Wed, 21 Aug 2024 04:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SFlLuMoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395352595;
	Wed, 21 Aug 2024 04:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724215186; cv=none; b=fRXEwcrTGhL/ycm6n0pVb1CCZnrYOcoh1deq2+QJ7XYMcuRxC6kecc3ypMshLUwLMKbyAiYuLdxw++ZKyb+wOagpcxDlUYBGmxOWCReeWJO0USyq/QvUc6PXGSpkLon7pMtMZeo08tKsiqJIqVWqfZQra32s6afxDN4Z2sFJHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724215186; c=relaxed/simple;
	bh=iblUkJxanWGILUKaRtQu5idozKXjAqVYHifOo13K5MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gn783G+XGo+L7z5e3OIwY14AVzVOlNn9P0gBzV74IbT7b6tYhpLPAHJOfSvzl6e0bvcTzWpNcPaUtDR321ZeQClA/go3I8pAy3I9dfFO+eC/GmPF+2zQBz4lS1a2YxqQqYqgy1T0/DJdkzWG3voNBRWQQBn/pVO9JpQ9brdPNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SFlLuMoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KCq6FM012303;
	Wed, 21 Aug 2024 04:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhTx2fIZlXWfUT9RtsgapcfXkgnD78yN9Y4uwLvc6LY=; b=SFlLuMoIcMrN0B3+
	akbPCFU0vYc2TbEl69ZYJtoneCjrEWMM4IJkKZ2Ypcy3Mgw77JW0fG6elmpI22aa
	rF21luPBpps+ywo9mUeweJv7eKCG6ceOqIaFWywBUyqOrBMPviR5iq15+OMEIeld
	gw90UbCcX+gTNziAZ7ON8N5MqDY06JDIBOpelEw9tHwaR2Vl7/QrIk1VqRaNczsg
	GTrDpy4Mrvxd4sDmYJYFps+qQhBIfd6tR/5S8IgkWmH3bNW6o14A0W/FeMXCXfr0
	O97dV1QSI8od/+07aefqEDnw7K/upr4JTGvhii+NW8nzqfj5MxgjHz3hcqMTqjqF
	byoOvg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414uh8svm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 04:39:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47L4dcQo022094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 04:39:38 GMT
Received: from [10.216.8.12] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 21:39:33 -0700
Message-ID: <7ca8aec5-b330-4ece-a0b3-895f3a1f6ba2@quicinc.com>
Date: Wed, 21 Aug 2024 10:09:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for GCC on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com>
 <c1dd239f-7b07-4a98-a346-2b6b525dafc4@kernel.org>
 <5011eeb2-61e3-495a-85b3-e7c608340a82@quicinc.com>
 <c6t35o5pnqw25x6gho725qvpgyr6bl2xkpsurq4jtjgii2v5mq@mvdl64azwpz4>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <c6t35o5pnqw25x6gho725qvpgyr6bl2xkpsurq4jtjgii2v5mq@mvdl64azwpz4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oyLPIS4XooWMu4DNQKunDuYvxqga7tQC
X-Proofpoint-ORIG-GUID: oyLPIS4XooWMu4DNQKunDuYvxqga7tQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_04,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408210031



On 8/20/2024 4:32 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 03:38:39PM +0530, Imran Shaik wrote:
>>
>>
>> On 8/20/2024 3:27 PM, Krzysztof Kozlowski wrote:
>>> On 20/08/2024 11:36, Imran Shaik wrote:
>>>> This series adds the dt-bindings and driver support for GCC on QCS8300 platform.
>>>>
>>>> Please note that this series is dependent on [1] which adds support
>>>> for QCS8275/QCS8300 SoC ID.
>>>>
>>>> [1] https://lore.kernel.org/all/20240814072806.4107079-1-quic_jingyw@quicinc.com/
>>>
>>> How do the depend? What is exactly the dependency?
>>>
>>> If so this cannot be merged...
>>>
>>
>> They are not functionally dependent, but we want to ensure the base QCS8300
>> changes to merge first and then our GCC changes. Hence added the dependency.
> 
> This does not work like that, these are different trees, even if they go
> via Bjorn.
> 
> Why do you insist on some specific workflow, different than every
> upstreaming process? What is so special here?
> 
> If you keep insisting, I will keep disagreeing, because it is not
> justified and just complicates things unnecessarily.

My bad, there is no dependency for clock tree actually, just wanted to 
provide the info that these GCC changes are for the newly defined SoC in 
the given series link. I will drop the dependency tag in the next series.

Thanks,
Imran

