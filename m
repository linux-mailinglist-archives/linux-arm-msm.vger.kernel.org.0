Return-Path: <linux-arm-msm+bounces-65652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F2EB0A2B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7244A8137E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E77D29993E;
	Fri, 18 Jul 2025 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORdx3lTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000AC1DED49
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752839142; cv=none; b=CnYhH6F/BNTyf1K0FQGw1rBh/1/bauAyoFuZiJ/Rvmlsq+Jq7FU2oCtlM0/l3z02A9xouv3fZHY+iJorEsgySJJyPsoaVDK3oKc5Tipi6T3xZZZd1MAlVK7acDutDfWkqk6IAgMtFd3yKNTFB5Kgn0raJmsb0ashm0lvpplprIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752839142; c=relaxed/simple;
	bh=/0TgAXFrJ3G9JZVLfywNJKFXbMtIAldNf+h11vvIcww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mya7eHV6e/K8OhAdeHGytH4YtnQCK4Tjf51i/TQeLES+E7ypALmegHlaIGzgs6WTTbgth8eyehCSDRydTX4AjvcwcIVJCvDpNpkJ5Q0QqKb3SacPT+fXzsmNQgLestkHHEKgVyV4HhWjPF6aJSUABZKF3mWPXEPV5gKu8jNYPRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORdx3lTF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7eMTk032308
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUaV1HqBuNNURcq0v8sid0UGGjZ9IBb7QqFSuycdBC0=; b=ORdx3lTF8ULYQ2Ii
	uZ50eu9M/vGD7pOjMCUm7rWUdDEoVWCiRwtj7JKqxLvjKSZ7EcKUOTHiTP9qDf9p
	cXS74Yj1UjtzIECpy/xpWGrvKb9vvlCRvrhL+hVanPvaBhjyUzoIoEd+YbxWdkGb
	tMjsikc2hltx3584R6G06+x6XxsLmbZeTs9ueqRPJT904hP31CuVNdXDW579ih+2
	ByxlRGH9Ac6SdenkyQY4zlvuvOu0bcYIz4J3Nh71Hr2+1P6eVwa84XRzl7ukp8f7
	7mGakrAyeXUfTUY6v/XAObj6gDu4zxomX3s/q77pmTttAAR2+4p+jZRSa0DexNLp
	B9GiDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38bgue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:45:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab3bd0f8d5so2773741cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 04:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752839139; x=1753443939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUaV1HqBuNNURcq0v8sid0UGGjZ9IBb7QqFSuycdBC0=;
        b=eANIeTE8t5URTXRllTikmUebuVqoLT6Om8RK/B2vQt1mNFjyR6GN3iTe4vI3vLxVyU
         yaty4+BSlskHJ6xdOWwDP9uaVUexRiHfssuDlSl+9QdZUeoRrI2F+NgOScmIpgvt4nIB
         C9EScpQnCLe8IUXGnTr1fT7paPnam8pBK82D/3VQsQch8su2Zg6FUVx1fIRGOyKuapYX
         cvtbSd7/dIJ8iq+0nbcNAEXuYEUkkPUNHAi6/o5XOy1jvQmcNho0llm37/pJwI7EJsbV
         qLzgZlTji8KTMBLo53d1vTlCVUeZxqJN0e1I8PpOYCG5VJDIwYpeQmoosfD+SAa/cVu0
         8xaQ==
X-Gm-Message-State: AOJu0Yx+OrQmiOp1i3EgMfUA/k7w0pMJVnD72s6wFUdP177yIk5NMAw8
	JRBjp4DCCY6r7i+KcOFTuDudQrBodit/AnXWVb3mxf72pHN2WpLS6BRxORJZoEzfJveKZ/ks6m3
	TF1rdOSXy0gjrHWT2RlmkMlhmU5QfibpQMroKzUTFp83cy2LAOu5KPcWeV7SwHXtvZyCT
X-Gm-Gg: ASbGncvKUrpXLOPIEV4edrTt5sQLe1jLkkeYteoY6MTUX33Ff+Zs7jNAeaE3gkNHn8X
	DmD7P4ykBc4XPnV8AJoM2scbrDcR+hkoZjb0INAOKQJcTRB9zlGyCHj5NmGZKo0YCt4T+Z/moIr
	U5YlvXecJWGeay3ck9wiNJJeFn89/kFWaPCxLPVuptCipH/In28fnkMPFAKoG+uD6h7gLrDfTnb
	3Ssz2Icc4o3UgCRLtBx/w5Tr1rdurq2J0pN4rFc8qRYHv6EK34nhLRTvvgPt+7yGn+z8CokyGRM
	T6EjWdHqLQ6Td+Ppmh3252EO6Faf/z00v1wZSkZw5wyjcujMefj8mB/TrJ7QbDchcDcfy6R2cGm
	pvaIqIwqOMNXE8pDRGhE3
X-Received: by 2002:ac8:59d4:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4ab90abeff7mr67167911cf.7.1752839138680;
        Fri, 18 Jul 2025 04:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeVattD6J0aqEqPEisHXQsvCa04VOP4L7XrZDnR309zipodefZf5SE1uSb44GBWau8neunmw==
X-Received: by 2002:ac8:59d4:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4ab90abeff7mr67167661cf.7.1752839138049;
        Fri, 18 Jul 2025 04:45:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a0basm108012266b.19.2025.07.18.04.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 04:45:37 -0700 (PDT)
Message-ID: <d7729017-104f-4808-a4d2-da0eaf50a8df@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 13:45:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: ipq6018: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-3-692eb92b228e@oss.qualcomm.com>
 <bdb5e19c-dbab-4ea3-9a6d-a4ac795fb43a@oss.qualcomm.com>
 <dd2fab47-d451-43d2-b2d5-36d957c5aa46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dd2fab47-d451-43d2-b2d5-36d957c5aa46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5MiBTYWx0ZWRfX4AosHNh+mudt
 e9g2u33g7R17TJsH4COMTlD96D9oRZ5+LzxKnc5zJuq/Q2ZtLHHScYOiF9PR+hgGTOo1BJupCCc
 fmRUGuskIs1Fvpx5dYGLePEwR6bY+p5H3SmfnYKgvrYYEr167RW7gMDjFnn/X5u5gYiDHf+w9d7
 Zr+kYLzc5WOZA0ylY9v3Q+6ZCdTS8Kj0TnLvjlcWNrao1JBHSqQK019hY0qGlnC1q6peaSrxd7E
 4jRduVnUhiraAocE9Q9RBgxAPU9vJuYKm0U4z9VJeS6n1WKJ0fW2pRHM0JIlT+i6qfcXxS7r+/V
 ckTkQ02Ig8hVSyOSJo7V4BTRHS692cutguoB8+mYtmmdpQ6AKqm++6qHcMtmF7yQVQoTGZjNzxG
 08791XlcRT7f994HwhFtOafA0qkBVHoQVr/JM5y/GKHMnXQ/DgLo1wzYx72yV6fjI75XbArR
X-Proofpoint-GUID: a7EgkR9LZIxV7tYoQHWyaMfyQqxzaICm
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687a33e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IiJQ3bnfW8p6AAHgo9AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: a7EgkR9LZIxV7tYoQHWyaMfyQqxzaICm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=972 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180092

On 7/9/25 6:28 AM, Kathiravan Thirumoorthy wrote:
> 
> On 7/8/2025 7:49 PM, Konrad Dybcio wrote:
>> On 7/8/25 7:39 AM, Kathiravan Thirumoorthy wrote:
>>> Add the IMEM node to the device tree to extract debugging information
>>> like system restart reason, which is populated via IMEM. Define the
>>> IMEM region to enable this functionality.
>>>
>>> As described, overall IMEM region is 32KB but only initial 4KB is
>>> accessible by all masters in the SoC.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Rounded off the size to 0x8000 (Konrad)
>>> - Represent the reg's address space in hexadecimal format (Krzysztof)
>>> ---
>>> In 'ranges' property 0 is used instead of 0x0 to align with the existing
>>> format.
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> index bfe59b0208415902c69fd0c0c7565d97997d4207..3b9e40045906b26b94e2d2510b0570d3eaf084ce 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> @@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
>>>               status = "disabled";
>>>           };
>>>   +        sram@8600000 {
>>> +            compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
>>> +            reg = <0x0 0x08600000 0x0 0x8000>;
>>> +            ranges = <0 0 0x08600000 0x8000>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <1>;
>>> +        };
>> On this platform, shouldn't it be 0x6860_0000?
> 
> Actually, that's from the RPM perspective. From the ARM side, the address is 0x0860_0000. The hardware docs show the RPM view by default, so please switch to the ARM view.

Right, this is an odd default..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

