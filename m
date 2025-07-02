Return-Path: <linux-arm-msm+bounces-63375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9888AF12E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 13:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D3621BC13DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C673F255F2D;
	Wed,  2 Jul 2025 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rdojvwqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283651DF27E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453979; cv=none; b=pNbksIXsBI98BiKLbPzLUmsfSUfmZx9EG0W9NDwxqJNCvBYvsdQZc+ydk7MLSddzXnu8upX2ipC4VQSinB8SLWtSXc1hqWIrDGsipWXVWkcqmYiq7IgfRuzNVygszpxfD22vFehwv2+whI4U1PpPzOf7U4OsF52DSguO0jBvn0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453979; c=relaxed/simple;
	bh=NL5WZDSJLjYMpx9TL2pLWNNh4OW2ead/Z6PIBLBEMx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3+9RxqAy4YKrXfmi13QgchYEh3Q17RgEpE2bldOBb3h1qypZM/mVpFlErX3bK9OFR5i0ORjJeIavt2VBm9YT85d3E3ReBXDtoELd+fwvRm3fvNm1WOc24uJnMo6KOaaJZKEv4OMkKbi+rdMdkFaEQreBP4bsy73ztp6TXOCVmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rdojvwqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625UJte024785
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5BDQVhLvHH8BVr+x4dUYqKfZubZmTAaympRKgXLXq8=; b=RdojvwqzC6iQee1r
	GD7vSCM9H6GkLsfK7wl3BdS/2dioV2w1ZDOyesTq4dVdFpeVPPpc9Gpa090LsgVB
	04NhtLyj6ucRrN+Qegm+DNG+zrUhE9zwdoH9tvF8eeiETQV8DaDQ/g67Cv7xohGU
	gwaKmdPlI1oCJDhMPe6oY+Y3CUVMdUdHd4k0wJdoalUDjnsJr4fPHGtUlxQRK+rY
	2oSBOxR120S+iMtR8CkKR8Oa+qP34YX8Xh9hnU4FTJJjnh/T1O0lg0jgiMHt14SA
	1YQOHhOVCf0Slb4E9eDqqviOOoO60WdHQo4tE0nbiyPKJBuLKGHg34EPay4UZoDo
	6xboag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9mc4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:59:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2365ab89b52so52602925ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453975; x=1752058775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5BDQVhLvHH8BVr+x4dUYqKfZubZmTAaympRKgXLXq8=;
        b=QBY6vYiy90uLR8gIE2wSCAuX5rf4jQgmGfX9ep5L9Dyq3N4INGaCj3zZjvLXDyRXI+
         2FGdcMg8k31xxNbcX7okiVRrW88eLxUCATHMY/l+mlrRYEYxbDKJRDGYfjgPG43nVOMW
         //PCQB8aZDsoLKKf/QyOi3kIBBWAdjIFPCZ+xvxpC8wSYVp9tyehlJnD1TyMOhKQNl68
         MgsAFi5lVuTbmzof1Covsa5p5Eta+QkdBYm0KZpiR37VQHq8//XfhAA5WLExYvHhfKdu
         rox93uxMUfMo3TfZFUsjpFAqPlyThZDiFmLwtsJhEojPy08zGJj0ll/xl0tkV24ag7qT
         4WYg==
X-Gm-Message-State: AOJu0Yx9IeS9Mp9EqiOgVcrVs9/UN3njkCBW0By/3Tr2YJW/Fwe0D77n
	HMIPucfPTBun/cF/wtNQ7LJ3GwMpmfsDLiv7FJksGBfItnqpaO9iTx9ZJ78SLQ27NPB5ez5rGSl
	NYuKcQ1urZMd+yuLd48TPdS9OF1XHsRNFvcetN+lOUEO32O2SUdBZveEhQU+W32hQXV187jHBr7
	9Z
X-Gm-Gg: ASbGncvLhdwm+q8AYe4R9yScF9yG3fgLZa7rBib/SwrnG0w7pgFBrqrcU0Mx0WR3eIS
	hDn1zQLrAQb3VLreftJGVqiJp9a0LcUvUROPHxqeEh9MPPnhqePk2gLOJeZ73WKH2WZSBLeS+6E
	1WhmgzLHB9aMyfio3fsZ0x6LfcPx9D+83fXfdYP0QHYuYzuV6/m/iYd8lvNWeM86Uqi9xbUNcLS
	FxKGWKRdnfBuinL9ZL5qJk8LZwI1ikKBNmWuwEs5kuygEqf+9Zr2S2K5cyeu0OVg1+5z3X9VL8K
	/zxrwQ/v7BLLbu1w6k7ZzwWLwEE9/time21q9mNvReegsnNbTND0vbg4OzvYR1U=
X-Received: by 2002:a17:902:c950:b0:234:f4da:7eed with SMTP id d9443c01a7336-23c6e61fd93mr42616185ad.44.1751453975066;
        Wed, 02 Jul 2025 03:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI1uiNa2DtkbC3czXuPd6JRMFL4J633cWnkq1CvMz4ROdmjIGLW4N8ll7TLtpVDulerN/hIA==
X-Received: by 2002:a17:902:c950:b0:234:f4da:7eed with SMTP id d9443c01a7336-23c6e61fd93mr42615765ad.44.1751453974652;
        Wed, 02 Jul 2025 03:59:34 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bbf9esm128223125ad.191.2025.07.02.03.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:59:33 -0700 (PDT)
Message-ID: <b5481363-ab6e-4b27-8a5c-d766f64e5169@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 16:29:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: sram: qcom,imem: Document Qualcomm IPQ
 SoC's IMEM compatibles
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-1-12d49b1ceff0@oss.qualcomm.com>
 <a68f46f0-8053-4d9f-96f7-55de33bb301f@kernel.org>
 <37695966-1d7c-46c3-9717-30da4e8d1930@oss.qualcomm.com>
 <e1424499-718a-41c8-b729-0ea96bb6a172@kernel.org>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <e1424499-718a-41c8-b729-0ea96bb6a172@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68651118 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-s9buvLw_tBRhafl9uwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lfzEkcDR6qwGqSwEp44TLAtdVBahzo_c
X-Proofpoint-GUID: lfzEkcDR6qwGqSwEp44TLAtdVBahzo_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OSBTYWx0ZWRfX/3w2ybze6kkL
 0hBcg406umABcSnIVgHc4lKSHnLopZtDS8UDmInEaSsXpLJN+Np2UkMChaL3GGoXcG7YZ+Bt9pW
 iK0TSfD/fp8a6jLsY6TRsj95ecDlJm5DsVfaH/oEaPoUsYPGC+VXxaZ04bzH1lLkhfgWzKSjuzz
 quz2o4oFUlVozE+kv8BROg31K6a3wk1Ls/m5zPwskBXf0gwtPTnKOhmdSnz78eL7tyNfcj85Lby
 hU5x9EfZOFJL/2b+tgT1RiLGp9GXWseR8GHQZ8XrYz9LnB1sKu7pZIkBC6nYik9eclXdsKAfk8h
 aAuQ/dzDBBFBCgpO2b2Uy+lylpi68wH2jCpbtQBd0pOmD0H1hj6+fojVhe63D+ox7k7c81VeYUC
 C/YS3dRitXEw+g7y2nCRSAy7ZrOv6DUO/atm2RgDTzWLZQoep1xZPhZHsmrC8lVVALgkYBgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020089


On 7/2/2025 4:18 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 12:46, Kathiravan Thirumoorthy wrote:
>> On 7/2/2025 3:49 PM, Krzysztof Kozlowski wrote:
>>> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>>>> IMEM is present in the Qualcomm's IPQ SoCs as well. Document the same.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>> Where is the changelog? This is not a v1.
>> This is the v1. The series[1] I pointed out describes only for the
>> IPQ5424 SoC. Since I have added few more SoCs, thought v1 is the
>> appropriate numbering.
>>
>> [1]
>> https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/
> But IPQ5424 is already there, so you reworked that patch.
Okay, so this should be V6?
>
>
>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> index 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 100644
>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> @@ -18,6 +18,12 @@ properties:
>>>>        items:
>>>>          - enum:
>>>>              - qcom,apq8064-imem
>>>> +          - qcom,ipq8074-imem
>>>> +          - qcom,ipq6018-imem
>>>> +          - qcom,ipq5018-imem
>>>> +          - qcom,ipq9574-imem
>>>> +          - qcom,ipq5332-imem
>>>> +          - qcom,ipq5424-imem
>>> Random order, no, follow existing style. This applies for every qcom
>>> binding and you received such feedbacks in the past.
>> Apologies — I arranged them based on the evolutionary order of SoCs.
> Where is such ordering documented? How is it expressed in your internal
> guideline for example?
I made the mistake unintentionally and apologized for the same!
>
> Best regards,
> Krzysztof

