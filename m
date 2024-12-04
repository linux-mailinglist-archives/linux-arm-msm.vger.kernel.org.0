Return-Path: <linux-arm-msm+bounces-40160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA749E3074
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 01:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3636166ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 00:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A95328E7;
	Wed,  4 Dec 2024 00:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AS4W69/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452142500AC;
	Wed,  4 Dec 2024 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733273134; cv=none; b=eE9nVD1rCgB1OwnL3SjQuDTXdF1KXir6frAldLp4PpREYexurPMZIj6JnJ/A7K8TrX01HpN3U13HnPhFj7ekDNZZSugt8Syn0MZV12HDeWJOrlayS/k1vNjaFLWczo2CghYbf2/loaJqm+puG/MiTQdyBk9cA8Z/D36/UCsmOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733273134; c=relaxed/simple;
	bh=KwpksROF8MIl17VHFw2GUEgj6nQPUlGTObzL6xopRRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lW0nAszP44OOpSHZi/sbviEo4kSSxODsUMSKyeVxtZTL6rUsLm+87u3iah/pZ35NJe1ipmw+BXOSY7UIqnaDfLBzf4XqFRwjKpd8MRhYQoT1CzsRX9ny6fh6JZlTEQ2jCGm4NEQc0HDRfa7J3sJQ1i7Y4xNf3S6baOp9ccagZ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AS4W69/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3GaDOc024054;
	Wed, 4 Dec 2024 00:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9+QcQG+ya2i4p6PSZQryV4ua7A0gAjw7d9g+kWUA7w=; b=AS4W69/C75Ne5Bh3
	Wq8fkSZmg6Syn3IaOYloxq4TSAbdS5rTM6+7909Pad2LKnrAPqWdhsvFsJcUwsOw
	yhYUNML2cFVoDWfYlWomwhY83sOuRIvoioedwcB7dWtQ5kGB+W7J+7KCFp0JVtZb
	TTD0xlNtO9iEneihahEJ0yiwxExaVVe93nh/WLL2M6sQtPO9OCGDFcnTdgxo6nt2
	xoE/CgDnw2vizk1HqQM1k0JB9S9qyU3VxSCRyu85t12Y0xxc+yQXw6AZgOal5s7P
	pNKU47T9e5OhAnGwjm9w3DUUmheIalNexInBtL59p7k7KbHvmkA5H2hv+LcCA9FF
	IrsWyQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnytm2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 00:45:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B40jM5v005563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 00:45:22 GMT
Received: from [10.4.85.39] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 16:45:19 -0800
Message-ID: <873da5ca-c18a-4f31-a4a5-53903e14950f@quicinc.com>
Date: Wed, 4 Dec 2024 11:45:17 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <518ee3f1-b871-4349-ba85-3b3fc835a4ca@quicinc.com>
 <0df58435-94e7-4b81-b688-ec0e1c49c0e0@quicinc.com>
 <gtfm7paylpcobucmwmapgdxva2wnvn5skkakaalzpx4ip7x2h2@lphbinkzaw7k>
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <gtfm7paylpcobucmwmapgdxva2wnvn5skkakaalzpx4ip7x2h2@lphbinkzaw7k>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8y4aOpmRfA2PO1Qffh1I4_FYMo2mbQwd
X-Proofpoint-GUID: 8y4aOpmRfA2PO1Qffh1I4_FYMo2mbQwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=947 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040005



On 12/4/2024 10:43 AM, Dmitry Baryshkov wrote:
> On Wed, Dec 04, 2024 at 09:13:43AM +1100, Amirreza Zarrabi wrote:
>> Based on our discussions, we implemented significant changes. We essentially
>> rewrote most of the files and altered the overall direction, except for a
>> couple of files. The changelog entry would have been extensive.
> 
> At least some changelog should be provided, even if tells "reworked to
> use TEE framework, made it jump over the head and tie the shoelaces".
> 

Sure, I'll provide some changelog.

> Also please don't top-post, this style is frowned upon in the mailing
> list discussions, it breaks the logic of reading.
> 

;) Oops, that shouldn't have been sent out like this. My apologies.
I'll ensure it doesn't happen again..

- Amir

>>
>> - Amir
>>
>> On 12/3/2024 5:06 PM, Trilok Soni wrote:
>>> On 12/2/2024 8:19 PM, Amirreza Zarrabi wrote:
>>>> This patch series introduces a Trusted Execution Environment (TEE)
>>>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>>>> and services to run securely. It uses an object-based interface, where
>>>> each service is an object with sets of operations. Clients can invoke
>>>> these operations on objects, which can generate results, including other
>>>> objects. For example, an object can load a TA and return another object
>>>> that represents the loaded TA, allowing access to its services.
>>>
>>> The first patch series was RFC and now you had removed the RFC. Can you please
>>> provide the reasons?
>>>
>>> https://lwn.net/ml/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com/
>>>
>>> I understand that you have now changed to tee framework but I want to check
>>> if we should continue with the version and increment here or start from [00]?
>>>
> 

