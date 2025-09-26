Return-Path: <linux-arm-msm+bounces-75279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2C2BA3063
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 10:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D523B7D94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF0E29A9F9;
	Fri, 26 Sep 2025 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xz6raaDi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521D7244661
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876920; cv=none; b=gCdHQVlAYsnpP9PRoySrjK+Bxa97XtM0KfFag3eEZCFwW+etO/w5XAChRLlc5cSANoc6lWPaCfCkThkukHOLS4Zcdb+OtN1MR+0tpb7qLd1LccwIkGDVfQ29Y3x0OxRwPxtF9OwCvk/HZ7iNRHir/4mCQXcrSSHQ6SvLMrDGwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876920; c=relaxed/simple;
	bh=H3oclPLZNC4FPP4H+RvI7lOCqvvODgPKvGIwZ8+Tfhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7XypNObw3wKL2pJzu/Jeeo0YW2PGVX22ARKufqPDgvc3JF6ghjDz+nF8qSlP9wS1yIAC7iO2jrZKf8e711ZMg3Y1pcRTA3XXRRTvwP3GP+pw20R1iD/h43TealNoy4kq5ICQuSG7GdqmwH310lpUO98GlLFT0g3OCr4fD0jQ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xz6raaDi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6iRH1008118
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZwahU0c/LPU8BcKe/dMgehNfskCJrh2bk5U3NX1qmk=; b=Xz6raaDiQz6E4hD/
	Xzj25pAphxef/808b8ckaykidndJvOY+tWWYQT3e7CIVN9czC2KvD8tvF2z2+9z3
	teIK/jMRH9Q60SU5kYvGxOoZhqP0BYoq0e+yUqsgZI0oBRDXwcAALyioEyPbfNpB
	PULoO8J8SMI/5b+fARKt6gsV0uGvxpTXNTvZUrL0MyF1Opq9nKvQ69yImBSd69EJ
	UgnL2qjhen3dxGQXYlS66YZlTi/OyJ7M2OpSGqFZkaug1SPgmApSvnTWbwoTGDOI
	iKdh20HrWzsKJADL7vtcjeaOwGUKe7W8AHSDEQJzT83XIX4bfzU2afSP5tt0YFQJ
	guYeuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0vt6hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:55:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-850dfe24644so82080285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 01:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876917; x=1759481717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZwahU0c/LPU8BcKe/dMgehNfskCJrh2bk5U3NX1qmk=;
        b=JeaHeRQ7o12MV3Xg9uBwbBfEa5VCIf0/6zJUBUl4YBu9PPfWmURK1t+cIkMHsHuPC4
         CP2btAkFWH0+vyVnT2MEdeFXmX2PxfyBt82EPtW9wektpFUul2ahFomGHnPyyOG6u8ib
         1rYtfYLjIndAcFfd/r53FyWPa07nyC/Zxws55Wl8MSFdPeyX/YODvUOglEMdvgxtUv3Q
         3ni47mq2bmbsXg+BObP5DUytXbJRcCRJ94fV5EQzZBWJkz5y5+7pNaJacas1dpWXj+QY
         f0ydw9NEdYRP+SketpfaiXIcbTUttjuNf1hEWj+PFCe/bvv6xk4XD6PqZv/uVxbiAzvf
         CB8g==
X-Forwarded-Encrypted: i=1; AJvYcCXc+HyagbkxfvVoVP87LevBvLqB6oRWvUfyFdlJ6y6xG5vBiBRhLpj+0eeYVf/DZ5Xu/zBRly295HzbpYKS@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXDKKO2bZAckAxUQLla8rOLohV7sMPcn/ZKL90Z5YR2v+NOm2
	QDlQ/CeNyyT8Px9Twp99xGTtLN6KTQWZkBsQrFu652WLnp0poGPdlCrrZDjaxwZ02Lol97C/ye1
	HTHHdtYr9qsnwWwo6vPeYvdnTn2eSX/SDmydR4qvYlUc7aU6uOpi6Wng6AkrMogr1jYNL
X-Gm-Gg: ASbGnctv+dVGC3bVHdcuAa8KjepkPQnFhoiOhpYYRU9wqkcFPxfJ4S8BScUruJNONa9
	hk6SMmsnwADjdBsiryhwZz4o97W2qo9uuw/S+VLTHqqRahGrf9xc1sH2EumQerw7pBfPOTBEoIB
	m+Ph+nasi7rrlHrQvvtZUXYYdQlwgidlxCrYHmYJQI8+2jC3cBf6qMMiv7dZWWBcSlknONOAdMT
	HKALVbRVob17MiY/XgRBjXUxhE7n8lzBhtrLAKLn9fyWYSbt+Fsu1pQBrSV487Rut6Cj9gnI8Z9
	jqrVUg9c2IQuqQRPkwmYXDVN49tzvU6SWXr0/yrWJ7HjurnAWLzlx7XggD0IQ3IPUBbyzyCdr4N
	I91lpShaz0PW4yGOP4rwNIQ==
X-Received: by 2002:a05:620a:4722:b0:856:6bcd:4adc with SMTP id af79cd13be357-85ae6d81b82mr523497185a.9.1758876917334;
        Fri, 26 Sep 2025 01:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRRY3Uq60Ht2WVCNKABn0E4Jb7bHcKPpmbGoeQFqat2Wl0O7Ko5BzeVbNeba66xZoL423QRA==
X-Received: by 2002:a05:620a:4722:b0:856:6bcd:4adc with SMTP id af79cd13be357-85ae6d81b82mr523495185a.9.1758876916746;
        Fri, 26 Sep 2025 01:55:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f7547sm324068866b.67.2025.09.26.01.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:55:16 -0700 (PDT)
Message-ID: <9fcf3835-a88e-4e0d-a970-064d696c62a2@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 10:55:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] arm64: dts: qcom: Update pmh0104 dtsi for Glymur
 CRD
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-13-8e1533a58d2d@oss.qualcomm.com>
 <CAJKOXPfCFS4UDbN_SejG=zJt1Dt_mtz_p_+MGAaEr5SpK3ydRw@mail.gmail.com>
 <7eb0af93-7cc6-4b1f-beea-d5663c1bbd59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7eb0af93-7cc6-4b1f-beea-d5663c1bbd59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yqa-xVvDNp0W5IRJwZOR0GuOPrqf9WJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX70CtGiXyR5AE
 hGAUPs51yNUsYOEXDYGK/VTB8gf7duIU4Apg1D8kGyOMPg5rjNeLkOTOLMIhP5QpXfmiZPmj6xB
 upWxq2L0m6tT/L1/axbbSwT0w6iLtR+dfZH168dhjRnpPA1arE/gaShbJeDO9tzJexVFsPs635B
 nZ/h+FULfXEMQEabtCTV0mLhcRtiaDgB+61sXKY9m7pcyA2vJrcBDdHW7DtpKE/m//9rqyA0B6w
 jJGOFjN9qBWTIKgMibmqp1ZUurIwOn0uZtqg3vy96e7BhHxGUX+l32B7k60DEuq6UAlwE4zoDBL
 BUVZtzARAhlh79mJIDNFEF5h3i8nLEUlz2aVoKa4x4T9wEQ3vACZIXacz8G5WsbsMVJWcjzAY6A
 nIphPsMvnXIvMT3oG2yi6BIft35nTg==
X-Authority-Analysis: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=68d654f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=SJhbF7H-XdBiwAQF7hIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Yqa-xVvDNp0W5IRJwZOR0GuOPrqf9WJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509250171

On 9/26/25 9:07 AM, Pankaj Patil wrote:
> On 9/25/2025 1:25 PM, Krzysztof Kozlowski wrote:
>> On Thu, 25 Sept 2025 at 15:29, Pankaj Patil
>> <pankaj.patil@oss.qualcomm.com> wrote:
>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>
>>> Update the pmh0104.dtsi to include multiple instances of PMH0104
>>> DT nodes, one for each SID assigned to this PMIC on the spmi_bus0
>>> and spmi_bus1 in Glymur CRD board.
>>>
>>> Take care to avoid compilation issue with the existing nodes by
>>> gaurding each PMH0104 nodes with `#ifdef` for its corresponding
>>> SID macro. So that only the nodes which have the their SID macro
>>> defined are the only ones picked for compilation.
>>>
>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/pmh0104.dtsi | 84 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 84 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>>> index f5393fdebe957ea0caf4bbc16117374b4759bda3..d3ea7486d842ec813a79268fc1466e1513426d78 100644
>>> --- a/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
>>> @@ -6,7 +6,63 @@
>>>  #include <dt-bindings/interrupt-controller/irq.h>
>>>  #include <dt-bindings/spmi/spmi.h>
>>>
>>> +&spmi_bus0 {
>>> +#ifdef PMH0104_I_E0_SID
>>
>> NAK
>>
>> I'm surprised you decided to ignore all existing discussions and my
>> clear point in this.
>>
>> This is neither readable, nor maintainable.
>>
>> Please join community in discussing this, instead of coming with
>> another invention which I already said is poor.
>>
>> Best regards,
>> Krzysztof
> Please ignore this series, it was sent by mistake as v2 prior to v1.
> I've replied to the cover letter mentioning the same.
> 
> I'll update the v1 and re-post with all the comments taken care off.

(Please make sure you mark it as v3 then to prevent confusing the
tooling)

Konrad

