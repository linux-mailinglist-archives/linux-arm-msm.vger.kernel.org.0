Return-Path: <linux-arm-msm+bounces-53541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5674A80C49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E45678C77AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBA2282F1;
	Tue,  8 Apr 2025 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KLArECh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78021E4A9;
	Tue,  8 Apr 2025 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118564; cv=none; b=Mrxw7ic+t9c1JqlZSXCZISJIMJCYmiazeFcaQ7LQactRdGQT9hK0Odp6k0AngJ8fxIKVChAVup1NlBKIEVJz66dW3in6NHp07wg0FOiT0zTM/l+1A7eKj62x7UpuOw1/k6mcnCoPknoq8IyckrCAkBJTeQy068fPHg0/ZBbudU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118564; c=relaxed/simple;
	bh=vcqpD0DZQXuUtLCwTzDAFDZYSF2LBX98kts7jb3UtuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mB8E0I5vzvyjK5B7rj9lp5YvPxkrjE4W2bFgML0vt4jTuH0Kiy5SoYYDhAvwMUQ5cwWTlfZuVSvK8oj63ByqQ2SiJr+MgT2WV93AoMmsJUjgFthKjcc56/x4wOZeGHdBBPalHTHaln9YYYzTIRqVG4VxRsb5D1IpJFjs1a2nHoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KLArECh4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFt0F010566;
	Tue, 8 Apr 2025 13:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsuarZDN3Gs2nwMb5Xe3ixGpirzkURNjbyVrY3XQMtQ=; b=KLArECh4Qp7U8Xha
	Hopr8rQy/9IbnRe/lNaTsKANER1Dzjqw/qFdHECL5Fi0AsIvXYtYFz7yth50BdLX
	4x3pk1T0U0GFYaK6fY4kU4eLyS5sKtswOmKva7CAyuIpJKPQQbiH4/LWO4SxA3FC
	zfKGVBHODAgxsytZRKJlcADziP6Hn5zrXE77VRGyGCoJS8sC1B2egbDfrl46muyE
	Rx4LbOh2so/biy+KKygoBU5P6poIyDR0Pr1MmXBh4jVI5otU55jqhE8wK5uvFROb
	a3JyAarOdFZbnJdDcfRKe4hgxQsIdBIE2EHtMWJPxj6M3JxQJavMMTc6tR2wpBgL
	T/IisQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1frtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 13:22:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538DMTkn012507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 13:22:29 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 06:22:26 -0700
Message-ID: <8a2c74f4-fd5b-4714-859e-3138e6b01a6e@quicinc.com>
Date: Tue, 8 Apr 2025 18:52:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
 <20250404-rugged-terrestrial-foxhound-fcf36b@shite>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250404-rugged-terrestrial-foxhound-fcf36b@shite>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LPv9I2rrKRsgG0Q468Gqdainn9YIoOUE
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f52317 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VQQZ3mPWug7dUSpnJMIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: LPv9I2rrKRsgG0Q468Gqdainn9YIoOUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080094

Thanks Krzysztof  !

On 4/4/2025 3:56 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 03, 2025 at 07:16:42PM GMT, Mukesh Kumar Savaliya wrote:
>> +allOf:
>> +  - $ref: i3c.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    - qcom,geni-i3c
const: qcom,geni-i3c
is this fine to change ? Sorry but to avoid iteration asking here.
In future if we add anything new (*in case*)we can concert to enum.
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: se
> 
> Drop, not that useful.
Done
> 
> Best regards,
> Krzysztof
> 


