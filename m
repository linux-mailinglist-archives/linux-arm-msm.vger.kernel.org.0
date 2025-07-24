Return-Path: <linux-arm-msm+bounces-66424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E62B10203
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBD15587630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F6C2580CA;
	Thu, 24 Jul 2025 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cWzsA12f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C88229B02;
	Thu, 24 Jul 2025 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753342598; cv=none; b=LOJRCrAG5WIsgSx3rYuj25fEqByjPFr8rEcyrOcFULCi7MdT+fr5todzl2qdWts/Y2Iu2ppGi3bSrVehbbSYET7Qf5jr7d2YG3im9QUUJL27sB3+nJt2PWgUG1MWX6Ww52h09AWFPgCAbuG3f8RlkuRqs/es8e+KaviV/Q39Wo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753342598; c=relaxed/simple;
	bh=8hArgnR3Xspo67UySiPkrkARt/FHZ3ZDNi6yM3UJwBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l+nZTu7cXsZuhpr1BZsRWRoiufHDvyn2Q6mHEI6vdLPThLD0V8BdqU/vKXnrHamwHRzwPbViuaF8UKXFdXNTBM5CPYLjnvpxHCtVH72CHXLMO1llsA4Yp2l+TIgxyWZ+j512Wqj/vMNUjQLH6SNQBshSfwPQPeQNJ9Cf87hgs3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cWzsA12f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXHl5028529;
	Thu, 24 Jul 2025 07:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8Usl2QLEW7pbqprF9FBNGE5XVt4zJMfMv4iaDCg0eU=; b=cWzsA12fSHbaqZ0N
	O/iepvBZYKMOypdBVEOtc9/oxoBamUK2Kn74aXjn/yd6H5g3HEZBUTEKKFMVsOyd
	5Ru0UHqAKEsjs+IM7Gar/8hVeBlmBYXV6e1KW45OgLEoTQgGTBcxIDq4S2bhHNzf
	KbH3LuKdA3Brp4h4+P1Hq1SghLLURrDXBhd4fQ+mI2h1c+SyF584L1vaSz9jyMzn
	moM5uGl/kpsb05DOm8nbN4To9ZHwZL8br1mGfISBFSwioR/RipTyFxrFBYFcuifE
	ycakhYR1M6F0Et9PP+6AFQ3vUbet8XxK3cD+82fu3BPoTCodzJERr74oRoRwVz1E
	HArr5g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1f5n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:36:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56O7aON5008187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 07:36:24 GMT
Received: from [10.216.5.39] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Jul
 2025 00:36:17 -0700
Message-ID: <cbe1f27d-44ad-41d2-9bc7-fa9211d52a30@quicinc.com>
Date: Thu, 24 Jul 2025 13:06:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: ufs: qcom: Document HS gear and rate
 limit properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
 <6yhnlwyuimkrlifmmdihcsuhws6qkdjzmjxdupu6cevu24nmi6@f4vk5dffjie2>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <6yhnlwyuimkrlifmmdihcsuhws6qkdjzmjxdupu6cevu24nmi6@f4vk5dffjie2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c7a6Av9_1Pu_u_55MsmnK7KIQ_op3NXn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA1MyBTYWx0ZWRfX+kkKcKhxiYgp
 MhAxojmH96+eSuh5q/K5ySTPk2dZdwpLvNTR5ONN8t2NPb/JqBAQEBpbz6xBHqE1BDEo7OvANC5
 m/a6p+bMPj0CP9IGSWGPT/4dtJJtEujZFHKYCf3uBiZ+F1rMfE/s6q55CnVsb+JDFEv9/gZnmhp
 pnJHQlh3l7du3zZsyM7hablsZ3+dRWhuYEF5mUwCdePQWH0atBCuKXR1RDEHkBwIGILpMFqVL84
 fXRdoo3R4LJ+mw6uMA+s6Bcc66iYoAi4FWN7EpgKbFTf4OQu8X/V3rxyqcLFV9rd3xxskh/dbhR
 jANCbDH0srIvP9YuIz9RI+I71uvW8dKD5Uq0RCSjPVuxVQ4lH+3e4D2UWHiUxgo9JuDQqM8JNOt
 3I0z+/fQCrBtde12O24j0WvHMF9WlaMi/QNYeTLq7ByaQ6EQzbH1O48QXUGc9s9FfKSfECKb
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6881e279 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=id758TG4R-jbu1JBe3wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c7a6Av9_1Pu_u_55MsmnK7KIQ_op3NXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240053



On 23-Jul-25 12:32 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 09:41:03PM +0530, Ram Kumar Dwivedi wrote:
>> Add documentation for two new optional properties:
>>   - limit-hs-gear
>>   - limit-rate
>>
>> These properties allow platforms to restrict the maximum high-speed
>> gear and rate used by the UFS controller. This is required for
>> certain automotive platforms with hardware constraints.
> 
> Please reformat other way around: describe the actual problem (which
> platforms, which constraints, what breaks, etc). Then describe your
> solution.
> 
Hi Dmitry,

I have addressed this in latest patchset.

Thanks,
Ram.


>>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> index 6c6043d9809e..9dedd09df9e0 100644
>> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> @@ -111,6 +111,16 @@ properties:
>>      description:
>>        GPIO connected to the RESET pin of the UFS memory device.
>>  
>> +  limit-hs-gear:
> 
> If the properties are generic, they should go to the ufs-common.yaml. If
> not (but why?), then they should be prefixed with 'qcom,' prefix, as
> usual.

Hi Dmitry,

I have added qcom prefix in latest patchset.

Thanks,
Ram.


> 
>> +    maxItems: 1
>> +    description:
>> +      Limit max phy hs gear
>> +
>> +  limit-rate:
>> +    maxItems: 1
>> +    description:
>> +      Limit max phy hs rate
>> +
>>  required:
>>    - compatible
>>    - reg
>> -- 
>> 2.50.1
>>
> 


