Return-Path: <linux-arm-msm+bounces-70906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19033B36CF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381371C23106
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 14:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93261CD215;
	Tue, 26 Aug 2025 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VYeg6DiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F654673;
	Tue, 26 Aug 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220070; cv=none; b=mlzCjxAd5mIQXBR/Dm1FXoaFlhzXMMdssG4eliCAA524CeyFAKV2GXRZ/oGC9PgdJe4hbj0OrAz8zSKyg4YiLMZO9SNbnjz1SDXpb1nNManMZfaU2NazXc0Fbd60KDNf+QNCZymSXpMTxpTf98xwN45W89cR9yBl8UkPxAYMBRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220070; c=relaxed/simple;
	bh=AvTkTEsUS4atiHfPFe9HkSoYzdHhduZ4akizPJoUm3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pckjiTwBg8XP11Ben1J++jeJdh/3F+FaCRYhK3MMqa9YdWcEEPFV7exkS4jQ7ED7DoJ7Il7dUC2/P5liy1Ng/LInaCELJXmKY1wyrNO4PUS/YJJfCAK65sGnMop3cZiAcSj4kZkNdVUwdPE3DBeY6dTHNQz3l7CF/5YKrSXN7lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VYeg6DiZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QC41ot005706;
	Tue, 26 Aug 2025 14:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znZtrvetIyq+Q6s4F4lq+XGO6d7jwBorMr9nvs8JST8=; b=VYeg6DiZ4X7CCTYm
	CJATlAUF/UDFB4cZZcF4mnXyC+9vdnnbosWNt0IAkk0w9j3Aue7MW/a40PAHbEYC
	gHmrHEObSJiqJWbUFftHTzxT9AtSrV8RizIVm3Uj0LDPTGHNvcYDBfK9RHN0T3nw
	jgTMRGTkJjVAQoJP3H8tNyNMfTGgfi3X5xn10ttaMTLETouR7CvLRvwABJPq5ZFc
	qcQs11uc7kdv6s+VVrvVYjJa78gMfS2rc7nRwcUveipNw/aVgYrzHREULQApQhjt
	ruCanWINscZU7nC0aNjK7eZgV8i9ikMSPxrHc4pQNDm5U5zBCf67yU9tUAMU70d/
	uY5J3Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpeujuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 14:54:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QEs50x032706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 14:54:05 GMT
Received: from [10.218.4.141] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 26 Aug
 2025 07:54:00 -0700
Message-ID: <df2aa27f-0130-4b03-8a9b-e21067ea4f92@quicinc.com>
Date: Tue, 26 Aug 2025 20:23:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
 <20250821101609.20235-2-quic_rdwivedi@quicinc.com>
 <20250824-elated-granite-leopard-5633c7@kuoka>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250824-elated-granite-leopard-5633c7@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e5fNgGd2uNj12_ruvldzzz2E-kG2jDDa
X-Proofpoint-ORIG-GUID: e5fNgGd2uNj12_ruvldzzz2E-kG2jDDa
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68adca8f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=4-s1saB21lP-Jc6nyYAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX27E76dB0Ucvk
 Uh6HFbRFzJdBNxDI9FWU1sNDoBtpfR37KFqsCo7XWClzmC0bKT6BaPmHpSvOuouuGI+NMzd1i5s
 qPS2Zl1Bx2P20FjteZUAJGeauYR73J5HY/7iOFNXc67iwl5KB0wSeTMYU5c4wu/r7/HwGkv2XAA
 cbc+m9Ur8oLSE1o1/gHQ+J1dXxUJ9d0D+dnOyOMm5nIThtPnKKY8MKWVB2Bmxw6ish68KEy88yq
 Yx1r/RIUI1zb6pVB969nydd/a6L2uIgctQH+I/OwWepXT0zcfSWOeE/Sg/3BOG5x5WbscpeNM9D
 /49owC+k4rnfWnss7IclheDIG/3bQRjxmmex0llUj8tXoHCJ2goB+0hR543lRKH0qhVMVigabyk
 6hV53Z/s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142



On 24-Aug-25 2:59 PM, Krzysztof Kozlowski wrote:
> On Thu, Aug 21, 2025 at 03:46:06PM +0530, Ram Kumar Dwivedi wrote:
>> +  limit-hs-gear:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    maximum: 5
> 
> default:

Hi Krzysztof,

I will add it in next patchset

Thanks,
Ram.

> 
>> +    description:
>> +      Restricts the maximum HS gear used in both TX and RX directions,
>> +      typically for hardware or power constraints in automotive use cases.
>> +
>> +  limit-rate:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2]
> 
> default:

I will add it in next patchset

Thanks,
Ram.> 
>> +    description:
>> +      Restricts the UFS controller to Rate A (1) or Rate B (2) for both
> 
> Is 1 and 2 known in UFS spec? Feels like you wanted here string for 'a'
> and 'b'.


Yes, 1 and 2 is mentioned in MIPI Unipro(UFS Interconnect layer) spec.

Thanks,
Ram.

> 
> Best regards,
> Krzysztof
> 


