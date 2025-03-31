Return-Path: <linux-arm-msm+bounces-52854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFFDA75F36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07F0B7A3AF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 07:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFBD1A3BD7;
	Mon, 31 Mar 2025 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MWW4bfBS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EC816D4E6;
	Mon, 31 Mar 2025 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404824; cv=none; b=ZwFmnz7pEI33NyWl2e2A9Wz6u1fC/SNEjJaQTG8+xgac0Wlot3sTeTotgkGoH+7OH9jxCxQeElr0ZljajeBLvS86OhTFerAU+6JJQEWHu5Ubm7zJFw13HpwjFkhKUMda7oLkhbvfYXOOd1FmadREArmE5C9960woclDInzc4rGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404824; c=relaxed/simple;
	bh=L/bIiuR31JmWrffan0ULn1ZabMYljjs5pHQ5mMtdg4k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=sma8Cg9YK9qFaKtiLVtF0gpeEd9rBU0skSeQbFE425Bog25GWr4pYpnaL5Qft5M25OpQaWvdNwejGc/O0EPO6uzhEygUXJctlLCFzX+N3ZqokJRIMZQCh4Y/RMH7Byi9TUbNtOoQegVvhjZFB+Vo6NeXarXItxPsEvee/1m80IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MWW4bfBS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kcuv007217;
	Mon, 31 Mar 2025 07:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22pAVRsd8PHlcilVo6JsAJE+xEez+n8nCt5fo3b0y1I=; b=MWW4bfBS8I81dl3h
	2pyrdHy1KwMOOeTYXezh3vF593cuFazh1aTI3htoW4Pi9PqsMVbSv8xE4whtK3H9
	hciwpVVR6E6LiT/+Ubzj0MzyTNdfL2VXln9F+x2/QwkJ4AbbvMKH4A14lMQYMBDg
	Zx18lmOIa39I3jviqRWW0uqT/rxceROtCQADIBp3xKLJ9rs7uofIFIklRwU+DAZA
	CfN8QHQDQolI4O5vvDWWrVDpSql6e/9oIJXzdFkS/6c/0xzCzBQxEWO3AyioR0sI
	NnZSQJEdriYS3Lc4VCCBy9hUNJNBe9lgUh6O0QB6lG3dhft90YBCTqBmjxvvazcy
	gdnmkQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9893rnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:06:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52V76q7K015747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:06:52 GMT
Received: from [10.216.38.66] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 00:06:48 -0700
Message-ID: <336dc6ad-6e9e-439d-b7c4-7fea1c5cd8e9@quicinc.com>
Date: Mon, 31 Mar 2025 12:36:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
 <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
 <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
 <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
 <e997bd15-728c-4316-8050-d461f115fd9f@quicinc.com>
 <04945ad2-1372-4c73-beae-fc6449fb9a76@kernel.org>
 <838dfc8d-24c3-4f03-9c24-863259bb22b1@quicinc.com>
 <b68559e6-fc2b-493b-9f37-3125ff924a65@kernel.org>
 <c6370b99-efde-46ab-a1a4-65b979ca2dfa@quicinc.com>
Content-Language: en-US
In-Reply-To: <c6370b99-efde-46ab-a1a4-65b979ca2dfa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67ea3f0d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qDEyJHh0b9D76DOg5wAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sohM14mVqFSexODKJv_cmJzMVZqcEf-j
X-Proofpoint-ORIG-GUID: sohM14mVqFSexODKJv_cmJzMVZqcEf-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310049



On 3/31/2025 12:22 PM, Mukesh Kumar Savaliya wrote:
> Thanks Krzysztof  !
> 
> On 3/30/2025 3:12 PM, Krzysztof Kozlowski wrote:
>> On 29/03/2025 15:31, Mukesh Kumar Savaliya wrote:
>>> dt-binding file name: qcom,i3c-geni-qcom.yaml
>>
>> No. I already asked to use compatible as filename. Don't create your own
>> rules.
>>
> okay, no problem. I was trying to follow previous i2c,spi, serial uart.
> Let me make a cleanup patch for them also next as mentioned earlier.
> 
> For i3c, compatible will be "geni-i3c" as suggested by you , Rob.
> dt-binding filename  "qcom,i3c-geni.yaml" OR "qcom,geni-i3c.yaml" ?
>>> compatible = "qcom,geni-i3c";
Please Ignore previous ask. I will go with filename = qcom,geni-i3c.yaml

>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>
>>
>> Best regards,
>> Krzysztof
> 
> 


