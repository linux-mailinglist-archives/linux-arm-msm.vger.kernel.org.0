Return-Path: <linux-arm-msm+bounces-69896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF93B2D749
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 402367AFA52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2162D979D;
	Wed, 20 Aug 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epGuVVM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF7223324
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680270; cv=none; b=mOwAQTGYq6vBDy39mu3yNNHh9fOEsG+SD7Z3VpR8iVYkiX4tms1+sI6FW8VQnlJdg88y8kDWlNc2PQjl94CK0qLn1qXyfgYotKk5FEmyZcAfIdRkKiiijYNCF9SEaDF6Ec0fUi0wQZ9KzTGi0IF9fZbNc3evnU4XFNaFmcOZBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680270; c=relaxed/simple;
	bh=qkYO27EQCIXsaD48NEJxduCJmgc4ju2NKyZ3rsjrJ5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdwNQIHFP/zs0ejba4GWWGuJZGmX7H5+07rHqFERZxr3Wmr6LtrJlHzpw87KaC9U19JwaiR+oj0Ne28ewOsG7nVz24pqOQRyn6hZ2bmtBSjM3OUCRKuGM/WnMCcADS/Qg9IYCqZs1szWaOihySkGUBaRd3Kcj93W6/P14MuQ624=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epGuVVM3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oha1010893
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LovUKZUetKjTNqClYAkifuYXcchuuq2HOA0oOrFjetc=; b=epGuVVM3UEI+lpZ/
	GC3Gd49RLBjAts2KljoWNXZv1cVr+p/JIiFOTIni5sidKUiq8KP1lK9EODITlCKG
	do4i2ykChgNg+ODHLRPgfw/2uxIGrXvNag/dnw8nYBPZuadkJTjWfKqS2dEimX90
	VRxYcJHdH05LPhJCJKGZO3UvNU1hSJuditpdj8qQ4KkvscAWFiu7us+ZcZXANkYR
	oz/G+N7ALaYxtAwMeJeLgaOiiCtCrS7HX5rVM8sqc0Ju79vTt55maIT7bY9nf4we
	UnO0zqkurPhJR05+67EV2d164UT/MeAXMSDTmXfLQXtwX6WQKJgaAL+ChW0EZFrk
	DMzOVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bh391-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:57:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458121274so77327045ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755680267; x=1756285067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LovUKZUetKjTNqClYAkifuYXcchuuq2HOA0oOrFjetc=;
        b=aEWYtyYaBSqUfR95r6wR04KT/JjJttR0JPkTI2JwyJJGlF7Mc5Nyz/++RICAaC7S2+
         ee855hM54ZI3E/icgWvQ9fbTKylvpQ7zl4mwoj9rkLcVMY4wngvnLTjJJnze8Xf4TXLl
         ezwX44hO0aIUO9xVo6lw/ywRlnod0AlH6p1yZ7vN72uSx9ySvRjg7zCI94FuH/TCQ2Zr
         9bqGSvcWuhlOuR2GccMjqDi+uj6iFseM4E9p7yk+fsrEHrbE+6hGITpSu1ziq/sblHV1
         U8zGuaQoR9IFk6sh8u+94xT8ajzee9zsT2Bf7OO9MS0F2JBkcm2vwxPTWP7KLPnQgp6Y
         IYmg==
X-Forwarded-Encrypted: i=1; AJvYcCXCdDP96flB03S2uF2obJjnzblSreQLkTwHhzLFqFlouKyt/Rqk1aqk6nP1YNHgXxUpxxlhT+gZwkKhkz1w@vger.kernel.org
X-Gm-Message-State: AOJu0YyvCJRH7IJ900V6srHMEbhhC4g1SxnTruys23c3PdzmA7t2fxCT
	M2PHsbqEgv2E6D75Iw7NJdN1CLGt9VWa6qznjceXPx+x1Q3nhcsGdPM3A2rb3LJYN7dL6nMDkMg
	6E27aXFKgXWjr5ARLBsKKRHy7BoBRxNq84wTuk9gsP5IaYnny5B93JuuHSJYfpwq9duf6
X-Gm-Gg: ASbGnctermnLI2qXtb3aTDC3p/U9/DqFXb243TQYHXIGip511F7ty9oPA0QiVgjkRIN
	3eWOEkWwDtMtR/M4Qtn6yT9ZkGLdepBvjBDAToDHuvY6VKEYeDwF2ymrbYncUcO4LtmsFSK6nn0
	oEBQaCuS570jn8QsUBm86Fp5ABdo4/Kw8BU+HrYUqZ3kJNk35cOizdcWEGro5e9HUrP/DlU3Nmq
	9AfE9Ax3XjA4xrjeaN3r+iibueqxB3JlDIDo2PcJT0m9saaYOjlKE85LszHgw8k9sqjprSdhhFi
	/hCP97YY5vqL5QMCKKilHtWy7XwDQTn99dO1K6JSvo9aJ9aYAZ0wTplQNYnGrp5V855vXT9P/6p
	L6fGdsqR1q8M/th5TixigTnAKGl4WYTc0
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id d9443c01a7336-245ef1728ddmr29790205ad.24.1755680267119;
        Wed, 20 Aug 2025 01:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5sQXiIDgpXrdgQJsAaziiWnOkOwfxl+Waxq3t4y+pSVqgHGK5588qw9DsrKpoU1yq0lXcog==
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id d9443c01a7336-245ef1728ddmr29789735ad.24.1755680266607;
        Wed, 20 Aug 2025 01:57:46 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed379e92sm20242905ad.65.2025.08.20.01.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 01:57:46 -0700 (PDT)
Message-ID: <b1eb2ed6-9743-465e-9b2e-75d5a06c1497@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:57:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet node
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
 <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
 <157c048d-0efd-458c-8a3f-dfc30d07edf8@oss.qualcomm.com>
 <0b53dc0b-a96f-49e1-a81e-3748fa908144@kernel.org>
 <1394aa43-3edc-4ed5-9662-43d98bf8d85f@oss.qualcomm.com>
 <7c072b63-f4ff-4d7f-b71e-01f239f6b465@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <7c072b63-f4ff-4d7f-b71e-01f239f6b465@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzsw9d4jm3xgL
 gOxI5qXMKYN0vebknl06pbsWx9qWn56nwtZTwKv4plscbMCbolCwV55a6AV1CPwl0tMQtnhvI1S
 t5seyNq/Xb5jdADfqIZMy6HWCCDXdpoRFxni6YlzRKhH3gNPa5vuExqsUSyj6gymJSW7rxaH2v8
 OSwg/+pW/r1O+oKaq8iT3JG7kj6fOcNBJBq7kIfX5w3A6nAeUnOlonRs/+S2CRqtyKhtjzZkF3X
 vKu6pBoqnbai3RPceKJNSPrN2zAllT6cYuKddu91yREeXECwx0/uzltiuNRCyIkkOeTZpkX8XFA
 trpSoyZe1jdMA1RPKv44nujRCz+KdcChxWAOTX1usrW2jjKtjpZjBqCT8Nht5AK/OHfIHPBMSFB
 YXrMSPqh5KkUqa8mo/QAevVPn7mq/w==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a58e0c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DOxB7AakEuovRElI8tQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4SduTe9qkT8tZb1Q4oDt9co5EMB-FU-Z
X-Proofpoint-ORIG-GUID: 4SduTe9qkT8tZb1Q4oDt9co5EMB-FU-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 2025-08-19 17:08, Krzysztof Kozlowski wrote:
> On 19/08/2025 11:04, Yijie Yang wrote:
>>
>>
>> On 2025-08-19 15:15, Krzysztof Kozlowski wrote:
>>> On 19/08/2025 08:51, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
>>>>> On 19/08/2025 08:35, YijieYang wrote:
>>>>>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>>
>>>>>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>>>>>> functionality.
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Why do you mix up DTS and net-next patches? This only makes difficult to
>>>>> apply it, for no benefits.
>>>>
>>>> The DTS changes and driver code modifications work together to achieve a
>>>> single purpose, so I included them in one patch series. Should I
>>>> consider splitting them into two separate series?
>>> Of course yes. You are just making difficult to apply this. Patches are
>>> completely independent and even your internal guideline asks to NOT
>>> combine independent patches.
>>
>> The challenge with splitting this series lies in the fact that it
>> attempts to reverse the incorrect semantics of phy-mode in both the
>> driver code and the device tree. Selecting only part of the series would
>> break Ethernet functionality on both boards.
> 
> And where did you explain that? Anyway, you did not achieve your goal,
> because you broke the boards still.
> 
> Your patchset is not bisectable and does not follow standard submission
> guidelines. DTS is always independent, please read carefully the docs.

The approach I'm taking will inevitably make the series non-bisectable, 
but I'll clearly note this in the cover letter in the next revision.

> 
>>
>> As you can see, I’ve CC’d noautosel to prevent this issue. Given the
>> circumstances, I’m wondering if it would be acceptable to leave the
>> series as-is?
> 
> NAK. Sneaking DTS into net-next is not acceptable.

Okay, I’ll split this series in the next revision.

> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


