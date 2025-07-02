Return-Path: <linux-arm-msm+bounces-63370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D26AF123E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15BE1676EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B40C254855;
	Wed,  2 Jul 2025 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDIt/6cU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB4E242D74
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453207; cv=none; b=K7t8ghQytKd5w/lcGiatNppq0Jj9VQk8CloryxOFlZSOAs2TIBiWpT0P9XYSlb1iy5TSmCovAXuteUvtsFhi5sKiEN8WCVvABuGWp5jlclFgc5WIfYnmXx3dVvfhDKhQWs8V7NtnxB+/3rk1Hk74qLHS7fHnKTO7e5pxGEjr0qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453207; c=relaxed/simple;
	bh=hflC/7EECoo+FWEYujbHOxOfZC61B76JoGLGfoAngoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h745nEJN3whKPN+IoFhr8Jlmc+mEzsbfBWkVhevCjhdmApaNBU6XJColkpb47mEJ/MaAvhQ7dsctpDh8wowD1Z21U6qaTXlzo2PCLfT3Z9PsF+cswiPQxQ7ks4H6upmx8c3DHjajRjnkSRPeExsmC2fjZ7Zu/V5G8M33Zl/preg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDIt/6cU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AGXOd014509
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHOxsE8EA5bCxjxcI+SDUjFcl+31uQAcsQipjX1gMnQ=; b=oDIt/6cU0of3O2Zm
	tgpG2eB+nl45Av9pnRBhnYscFSBV+pZvylbh+9csIk5RtLOnvq4FMvw3VLII+EzF
	xVJoiqiRAvP0IF/wBFu2kHvwuLwM//EkAVqtCMOoAfNyHSZvAM4LdtRsm6zDwo+T
	QUcjHVbZD/08vYQkYZg2vRIOEscHGWuz34lXjWt7JsK3CthRBoshzjV+PbZG5Zcf
	AOrRlW+mAnk62VZN6I6AUueYsXpqaNgy8ttZTxOfKcfBSxceMYDpyQcmbjDPmvHF
	JhsG94EHmfzYwZzTCicqBOxveSmqQQHKiz2OmTC+gINBsgo43u1DszLw2NqnNifn
	pOKvMw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxmcjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:46:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748cf01de06so9720462b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453203; x=1752058003;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHOxsE8EA5bCxjxcI+SDUjFcl+31uQAcsQipjX1gMnQ=;
        b=NwKE5DQUk7SJWFoUGOxtFPZjn+x2xqIvJbsSSGvDc6HrlREv6TcDY825FDRR3SEoCt
         BoZUa4aOfTkSQ7D6YPZOaS/MAy+Bef1kI3F2YTKuA5A+fjje5hrzV8kMYJvGb82BsUqX
         durCuNNJ1QXtXmfvRIBY5eJy0i1CnH1d8U5RGQlPWfsi08yjwRqCZUgDsijSFW5FOKFT
         /hFuGiMl/EMxD/4L9E0yAchCn0jVP+kKjl81220JKhO/gL39QCQe4FVYVP0VLPE6gofg
         Mb02BuOysTxIY8TFnK8WWZRU597ndHSA+4Kolf00VU3hcvJxtiiCHb90tdTHl8MzMSxg
         +uWQ==
X-Gm-Message-State: AOJu0Yzxr/PQIf7qhDOIayAI8fJ/vUruTgBmaZR5rF3v6F0HG3n7tt85
	9obBYK2t1DlYk2JXQH/7qRPH4QsnA5fM/Sjw5AW4u0NMQZy481F7jcyeGiB7QZGlNDWJqCLJvx8
	gOFYHtOgUDZA844fYlOcKXMfcnDkFvX5ivQDUmQsbiHoQfg+VvfD8P6fH2TU53tzDw/aa
X-Gm-Gg: ASbGncvA+DNqgrp9H6tX1wIfKSfp/7HmfcqWyZvAkZYeF+Qbi0x5YXKBQeyYjSy79Gs
	owDQzXHHktouhMmDsmR6HmplvSkZfCI514Chs3qdD9XrUx2/kVFY0WGL/1ABm/eA6lXmiqsRQ7Q
	mcieHLayazeYiu5GvM3OuJkRHNCVsT9gEqLtKnbSk2C5orFwraXnXuWJknDnrtRbaCLK6dgcZPR
	WHvsaX2CSPggA7V9BuGo+058wX/zKOFY08c3ONoul4TgaA24Jw5Fu0fu1rNbnrZPZKRaeJNTJ6W
	mY/GGUCOsAzBQtJHu7+xvqo7CeV225DOmh8DP25P/XYlloL3hiqChmmYFbu64S0=
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3111395b3a.22.1751453203286;
        Wed, 02 Jul 2025 03:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA7+CiZe4GA2cMk4Bhuat5NfBqDvPTJs1RWS1RavlKQ1uFs+BBJ1Y7wgYQ7e7I4vItRWBvcQ==
X-Received: by 2002:a05:6a00:929e:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74b512a4b63mr3111356b3a.22.1751453202802;
        Wed, 02 Jul 2025 03:46:42 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bdeasm14377283b3a.53.2025.07.02.03.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:46:42 -0700 (PDT)
Message-ID: <37695966-1d7c-46c3-9717-30da4e8d1930@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 16:16:37 +0530
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
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <a68f46f0-8053-4d9f-96f7-55de33bb301f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4NyBTYWx0ZWRfX/0RpjkuNtamP
 PaNFm5Q2+w8pCfjP2xa/RrTcEUs/3YTUR3cqICdyD+fwfvyn+1DGQhDFbmYIeEPht+zFVQFnPfR
 jBvuOBVNABXz7aiXcrnyPeEMFou2f74sEzTWcqig9XV90tFPX2WhaEpYJnGc30DQYc32HCsXRig
 uov6LG/OQ7jPbQ3Ms9jm9/aIRS5ur+yh6/QjeJvxyK16SOSfxxWyOqhisbUfEM/GRljsgdkkdSb
 h7vBnHFstVwLOhQ8KdrVnEBAP8RxDQC/QRl1OhmVDdewJxU/9Q9K79axMWv/9u4i9T8V8Oa9DCi
 W7P2lhBzXVRR9DkgysjrgBLynMZRPUiqCWH0u8X/m3CUgWd9NnV6vh+Unxa32vQ6la3z7owqokZ
 CNUqzZLZra0K5GAap+Ryj+N2fbEhyQo1xQb9qM0QXfwXQIvftXr+1txh3MLoW2RqvDIb+j3E
X-Proofpoint-GUID: kkv6oiAAneAgXCYofXhu8y1c3o0t3Ujt
X-Proofpoint-ORIG-GUID: kkv6oiAAneAgXCYofXhu8y1c3o0t3Ujt
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68650e14 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=z-AMgQe07C8pQQwPwfQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=809 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020087


On 7/2/2025 3:49 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>> IMEM is present in the Qualcomm's IPQ SoCs as well. Document the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>
> Where is the changelog? This is not a v1.

This is the v1. The series[1] I pointed out describes only for the 
IPQ5424 SoC. Since I have added few more SoCs, thought v1 is the 
appropriate numbering.

[1] 
https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/

>
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> index 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -18,6 +18,12 @@ properties:
>>       items:
>>         - enum:
>>             - qcom,apq8064-imem
>> +          - qcom,ipq8074-imem
>> +          - qcom,ipq6018-imem
>> +          - qcom,ipq5018-imem
>> +          - qcom,ipq9574-imem
>> +          - qcom,ipq5332-imem
>> +          - qcom,ipq5424-imem
> Random order, no, follow existing style. This applies for every qcom
> binding and you received such feedbacks in the past.

Apologies — I arranged them based on the evolutionary order of SoCs. 
I’ll correct this in v2 and ensure it’s handled properly in the future.

>
> Best regards,
> Krzysztof

