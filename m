Return-Path: <linux-arm-msm+bounces-49606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB5DA473FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D08188A4DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47021D934B;
	Thu, 27 Feb 2025 04:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fh6fRU0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B71D6DA8;
	Thu, 27 Feb 2025 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629519; cv=none; b=j/1e8AUvH0BPC1UL1UL8/ScMZpXU00Ud7sUYCP/3F7KedoUMFHz+x+J8+Evuh3OWxNFQlRU/CXtEkaKPjtdQq3IfAK66YlSXHPbQej/qh61Ka7SqncYjQZ+wDFp7jg8jkXmY+Kt300w9hUlhiiVYasmDS3FPL1/bGaiy+TjRA8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629519; c=relaxed/simple;
	bh=sONm4BN0IfviQvUhWnVOT80ube+RfPJgnGmwi3cDfV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=otUeyFnrX9SNz5FnHqTzSUYnFZG2URLzfcGS00vJaZngliTIGOL2fANAbgnh61Fc53Cf6oYi6K8iVKdkivVRvob7RixvzFA29HgE0Dh4FkJQUP2GrRvwpBnYcAA8mna9/vkKTqlQKJe48S5RHfagI6Ti0Pcefl/Hi8IsRq/uO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fh6fRU0/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKGEYK011761;
	Thu, 27 Feb 2025 04:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvNw71+p2forC6KnrngR+sRYsLprV+8mfZkCOqFyuPM=; b=Fh6fRU0/bFHzDi1n
	1pyk9RD106EcMY+C4efCYI67gLKwfZnpVC/z6ltowocFwiYMxsprLlUwNhyBSCJV
	B/A16RrUmNV87iHE3VcbPV3D6dPnIZsOQojaKzlUIvXj9yZDvf3cdWLuewYBsKeb
	oMP3OcCTHqrZlDLKsg7JpFYf23rpWianPSmppTLdpwNPazP19+MYdhV6xq52hpz7
	T2qDapMsHa+Ru2GwCY/uO/rLsXxJBrh4uGMc+e3Q5onMtht3fgsDDD6jc9rOQVve
	XDvKNX0rq/Y4RMIN/HdozUNOW8l7C8EOorRWWZ18dc9oQzpPgkN1ncHNdeysb7ox
	4e1yuQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmm7ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:11:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R4BrEn027814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 04:11:53 GMT
Received: from [10.217.216.53] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 20:11:48 -0800
Message-ID: <6e48c69a-973c-48ef-892e-f84de6c17673@quicinc.com>
Date: Thu, 27 Feb 2025 09:41:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
 <502e002d-f5a1-4b78-9a9c-4b227623e5b6@quicinc.com>
 <5e46f261-94e4-441b-a0be-fbf54c34a5f6@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <5e46f261-94e4-441b-a0be-fbf54c34a5f6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pg4deYmP1blW63BYwFZVgPATqe09Fddz
X-Proofpoint-GUID: Pg4deYmP1blW63BYwFZVgPATqe09Fddz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=458 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270029



On 2/26/2025 11:25 PM, Konrad Dybcio wrote:
> On 26.02.2025 6:01 AM, Trilok Soni wrote:
>> On 2/25/2025 8:42 PM, Bjorn Andersson wrote:
>>> On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
>>>> Certain clocks are not accessible on QCM6490-IDP board,
>>>> thus mark them as protected.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>> Mark few clocks as protected on IDP of QCM6490.
>>>>
>>>> This patchset is separated out from the series[1] to remove dependency from
>>>> the LPASS reset.
>>>> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
>>>
>>> I merged the patch adding this board in November 2023, are you saying
>>> that for the last 15 months no one has actually booted it!?
>>
>> Should we just delete these boards? I prefer to not have platforms which 
>> are not maintained.
> 
> I think there's enough RB3Gen2s in the wild now to get rid of this one..
> Unless anyone has a real use for it, but it doesn't seem like that's the
> case given the lack of activity
> 

At least there were requests for me to get this board boot up and that
is where this patch comes. I agree if they are not supported, should be
removed.

> Konrad


