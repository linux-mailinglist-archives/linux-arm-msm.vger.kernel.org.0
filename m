Return-Path: <linux-arm-msm+bounces-59251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D4AC2965
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 20:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBA651C0471F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 18:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D1E226CE5;
	Fri, 23 May 2025 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/pjEece"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD42298CC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024192; cv=none; b=p4qXe+NdUVLap7yVvNKa9JN90vQ7S+hqRV8Mg7EghqUKpD6A1yji+2HJB9RY4JqSDS4Cl0qGycHYQH6qsmzrXAsIojSaS0O7v2atBXDRA/hI+Pq8VZupCL+wqebVhfnZUlqrLJTpsVRCIk0X5Z5pJ1QesJPNCa3atR8DFEG0QA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024192; c=relaxed/simple;
	bh=AoLJkqZsq5uG5046rJ0/zN4bd7EWkUTOqm2DlhMuH94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIJcrLYBprFEEgtqxaV1WeVyIRa8IsAFm4NMHvBR0OB7BfzLqe68YzvwQXomw39S44M/XqzsRHwxucdghllJPhdLojJNSlNuTaBce7yT6C9bpLwP/u4VTnKv6HaIYaPuyrsa6wsqVA6/ss+7zCjurQ2pTfHIo5B2uD6mDgm3Wc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/pjEece; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NEUbZW019394
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ywgBAXOkOYbHHKdEyT+EsdQ0pIR0wBE1gOJ71wdz5Y=; b=T/pjEecePLaEpPhp
	KZb2TDjsBd9cD+AwOu7Y7XQfZkyER0KHL2p2xT1ZngK5dfA7P5WNWe2YnM1DMJPB
	AsDH7rQWhcIOO0fGPL10BO1X02x1z+AeW8mOqPEe0mM0fa7MV+7CPGRSP3TZ20b1
	DtPtduEcyyPJRO/bUZCeb76yII/gSB2S4z7+haGXmm3srbP9irifBtHMe9R45DYy
	aNjyAboRJ3rSBR3+CtSoDbwwm8EnBsvOY6J5cDEveleWw4wBZi3t8+nkEuw7OqQV
	FeRBcCmEe+d2UzHVXUux0JgMamnZqPFjLUqZ2ZnSrvThI34/FLU1VYIJzKQNcEjI
	NumUOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbaqn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 18:16:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8c263ba30so221016d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 11:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024189; x=1748628989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ywgBAXOkOYbHHKdEyT+EsdQ0pIR0wBE1gOJ71wdz5Y=;
        b=U4zAExLTZeCQ0YmZ/SoY2ptVnem+DvBaoz3D6NHBkhcVYIWAeatGZ3bA7JhwEKr3Zo
         lsQEtvos5G+w8DzBd/NEBlT9v0IoQysVtcOFGU5RlSXEeZixJf8DQso5U2tfYKokh0Px
         FiFHAsaqw+2HukldziuNQRwqTsCsN+3fuit50/uMWHxyFNhdk9TBU9eSPfiwescJzVRF
         W4XJhLXu/U8R8PCSDL9J6W5qsMEQWk5M61Jq6vXELL4leucR4BWqE7H9ruwYsdxCkC3f
         xeuZH0CHY0eh748zncw9LjNE/YqDjx/7yeSBqAvEasTNiikb+nsi41lgiKjg6AT2BWzH
         o+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEqYVRQNc6c28TEbGFM5ExNFabyPG+GEvTeejqpqlHTJGn9T23wC2phTf97fr6y29mNidfkbN6Bqb/VHo7@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiFmFigxhZ/bkKXd3IXwuEuT+tnrVqYBW3sv81Y182tNqjZ2e
	q0cOrYCaaJjFOvjV/+O8RKblzi5dTMHiFHtgeutoDYwrpwz2A7AFLAUVAWsiKYKp+xBECA/MqHS
	B4Ivu8tosbmDLU9hI4zfhpeJs1Uqxy4d0gppTWUdSJZDikQD2YojFuu4cVmh9lT+dXezA
X-Gm-Gg: ASbGncvqf2rg6kI2bU3bJW6PNJ0Esm/o85KyNdBIXhD5btRgettQ+48Dvts36QAiUtm
	LxD4Mz7ZVQBC5ysjEUjOICTuAzmp5uVn7EgyIYzB6/b6Cj/C62Qc4oSLZcToT5pRJ828Z5hMFu0
	UtbVjkZqxpChsbW+6ZemGqoN6cCnYfKELANQp+ezsVbQA8pdidgOX8u0YlBcxMD5DUPjVydjE6j
	0YsS91XHNLfVhdEbLwenmh0P+16XwcT8fHrUYuHofq0x1Y4W93fA872jUuCJkOKAOXP9I66Bzfi
	8UfNUfexCU3LS05fPIoskmmtjxyHE+GnQX4TbKev2xsVa2Q4dkLmtSAh/s3M6GL5AQ==
X-Received: by 2002:a05:6214:20c1:b0:6f8:c23c:526b with SMTP id 6a1803df08f44-6fa9ce42c34mr3062826d6.0.1748024188633;
        Fri, 23 May 2025 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsNA2DnPdEjRLVO+yqAXpSZSax7H9Q3S9aSImMU03Zgx6k5+e97rYhPOTC4edA5uBZBYNrAA==
X-Received: by 2002:a05:6214:20c1:b0:6f8:c23c:526b with SMTP id 6a1803df08f44-6fa9ce42c34mr3062636d6.0.1748024188206;
        Fri, 23 May 2025 11:16:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4381d5sm1290113766b.99.2025.05.23.11.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:16:27 -0700 (PDT)
Message-ID: <d0b2f237-b4a6-4ce0-95ea-4bf5f3be10e0@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:16:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
To: Simon Horman <horms@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Marijn Suijten
 <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
 <20250523131744.GU365796@horms.kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523131744.GU365796@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qs2zFNhawja83hl0YzeHC15nJZxlnlnH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NSBTYWx0ZWRfX+aFNGSmg7ucS
 6QcR0QA5whzlb2674VHmOW4BW3rgyeUbxSz7MRQ6gBe96KKG2tMvOjxtEtVd/9Xuwir9Ar2kZKi
 GfR62Ewrl58NFKJcUaqoR7/oyFYhlbvbMFwzK+RIJBGuYIBHXysKfaChov6CGBIRz4w3r+BjNa1
 HIYaGt0xnFFBF1ZIBhp4WfgvFswm4iJJCGu4OFTcFHfiKNBRA9fXMdNPB+fx/Twvvrmf4pLNguz
 /6B5BW7etPK7KCBPQ1SymHUgUeUWp2OVz4bymPjs251i+4Nx24o8i0LZ+sQhT0fg5v3VdjNhmH1
 eO0S/gm9oMFwg6h/7hyFarx/FNDH/slkexXAAnjcaESBAr11H8kIJl0jB92w+XmiW9TNiZY3BAa
 0MFm9pkEZoCqzIzZIdwK57G9zf6r91yxvElgCZA/WVS2GDptgyif2KeTiCkjo40CPRzt/tyQ
X-Proofpoint-GUID: qs2zFNhawja83hl0YzeHC15nJZxlnlnH
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830bb7d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=SHaX676KDxSdYVKYG_wA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230165

On 5/23/25 3:17 PM, Simon Horman wrote:
> On Fri, May 23, 2025 at 01:08:34AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This is a detail that differ per chip, and not per IPA version (and
>> there are cases of the same IPA versions being implemented across very
>> very very different SoCs).
>>
>> This region isn't actually used by the driver, but we most definitely
>> want to iommu-map it, so that IPA can poke at the data within.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It looks like these patches are for net-next. For future reference,
> it's best to note that in the subject.
> 
>   Subject: [PATCH net-next 3/3 v2] ...
> 
>> ---

ah, the networking guys and their customs ;)

[...]

>>  	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
> 
> I think you also need to update this line to use the local
> variables imem_addr and imem_size.

I paid great attention to validate that the data I got was good and printed
the value inside the first if branch.. but failed to change it here. Thanks
for catching it!

Konrad

