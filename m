Return-Path: <linux-arm-msm+bounces-69690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693AB2BC8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59AF7683F40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C59F31A042;
	Tue, 19 Aug 2025 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nb05A76Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4926C39B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594261; cv=none; b=C/w6y0HR4z7amCCUpH8Ifm8ZBNGPjzMheFSFM3vNFIQae2QW5MRgSRHRBgHj537hfBxs0oQnoCw2szHufnlt9W81cdE0p5rGsq8h/Q+WerWFNtb8Na4qDJ5xvvrPG+30RMaYxZXuvpC6dlDrXAmdxR+IpoFOlApkkZevqu2y9sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594261; c=relaxed/simple;
	bh=Ur/EDwulXmk+KxS1Iyo/HiGIsV1LuoVRseDCDX7NNHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gd0HHRp7kQpI4wFmh3Brx5/BBGm87am9qR/uN7Y9fAR34oI6KUlxsqgvRPLNbnoJJa+Z+kEB9Zb/RQKoxdXPap5l5dKdTbVTnNHzkIr37D1jci221/CJkRqptHffR+7ISALg42OVIZdNdAJeI058oMMZE3Y8IK8ySM5xKJMaGag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nb05A76Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Z1a029790
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtQwBBE7A/L6DYrB3suka029FN2KX9K7yxrcnIgCQII=; b=nb05A76YpPiOGSz2
	vwKgyfBmE6HTLMxdi6KMSAwl+lCIrsM15BUf4wC5FcFazt++cmigwggE66ZVHZ+Z
	LII/VhS37canuQuPj57BEoCVcQtDCQRHJZa1bDvjE7RmxNwQuI0qOdLDNEouVx1W
	RXipSQsgCZ2tXrvtKmTPYVnzEQY10R31absN9NHWNQ4LNLFpHAHGlrwczdPAbeZK
	8CvgKPFlbbnMT31my/tqNor12JVqpfefFg4bdNMJ7bIVA2gjNFoaNn6ovC/0KrYy
	e3hZjWpl7xsh7UcxJcedHUcNRbJkRpLhqe2wYrcCxtTZakAiMefhOTSv3tC8E9Lk
	zG1gJw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mftek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:04:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2430c5d4d73so69192265ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594257; x=1756199057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtQwBBE7A/L6DYrB3suka029FN2KX9K7yxrcnIgCQII=;
        b=TF3Si601K87zG7ifZ/TcPfR4E1aBrKEWapekbb5U6CTYnrb1U7PfWCZOum0r3VXgeU
         /QvD/P1OVmBXtNBe33UeMBS0siqx8eTh7fvNaUTKA5cmQXCpSEnPsG14Y7Gfwvg0zu9b
         FUNLaJjNstfVsEHN/N2o7gOqzw5zz3C92zRjRXTfo3XTzzC5r4qSepGyzXz58H2W441Z
         zwaberwqyR9BLAH9RaMPSi41INR18pAkpWgbUB1z6D1pAx8uhqGs79pgJh4nQ6stElRR
         QTVLt8YtwcpIh1WDXg+uA1dJezNGLbke1r9bYyClUgExdzlA3FYTdU9ocC6+gRW15eW+
         rVUA==
X-Forwarded-Encrypted: i=1; AJvYcCXge4dDRM9KQB0mBMEwiM1XCSrEs9SYhPJO0LaPfiE1BoRs7UUszS5DWGu2Z5Q4Za/cTWwYRvlrmiTecBrh@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXrcMUug8bF3a1OqCYbXfhOdii1am2RWIkH7ZvMso8kHnYZLX
	JnLkC6XeEot/n1yxVdRBayPKGwK7gMV4y9s2Y91lg0kEzyrFu6LPrD/p7VrwXqZNBu0e2PdIYz9
	HEcKvyc9oNk2iknBbNGQEn30H18+G7gG70sqHkpIKTShUJ4fET4QCwgzz3OyQpIKDQw9Z
X-Gm-Gg: ASbGncttpohuIo9poR+9avwfL+1qJN4RsueqfmAjVwJTA8pJgn0F4gdu1X3o799Okbc
	RemE11ThkoLKUzZ1uSbgqRffXZdk8TFz2Q+XOIGVukGnQ9VYScjITW05SXw+jRwBbxGznhoniMv
	EoLNzOEWydBWXz7LMw7K7z+CqPrmQF0EtXsFrWMsYNvOgVgxsxJHmDjVxQPxcVcmuVhlBj0BqOB
	uD8ra3L857wup3o2WOeOlvOZP3jATpAehGbiJkj555f7U4Uxri+mbkIzoKDw+L6bJEYnEXwx3Qn
	ibzclCajLR9kNVHs2RYI1hs4bSJpTKFy1xhed1ZYcznAvlevQBi1NbDih/e9PICGBl2Uzm5teFK
	crXt/WBLreyzk5crOx/Oa22FOEnJWZR20
X-Received: by 2002:a17:903:1205:b0:231:d0da:5e1f with SMTP id d9443c01a7336-245e0f2775amr16133805ad.21.1755594256724;
        Tue, 19 Aug 2025 02:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkh7QwrfpTpI4CY81hIJagXgTCB6D+xkbxXMTtgq4VmPlFbLxOxb5dFrnqC4gKaobuk82+qA==
X-Received: by 2002:a17:903:1205:b0:231:d0da:5e1f with SMTP id d9443c01a7336-245e0f2775amr16133355ad.21.1755594256080;
        Tue, 19 Aug 2025 02:04:16 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f8d0sm102888145ad.100.2025.08.19.02.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:04:15 -0700 (PDT)
Message-ID: <1394aa43-3edc-4ed5-9662-43d98bf8d85f@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:04:07 +0800
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
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <0b53dc0b-a96f-49e1-a81e-3748fa908144@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a43e11 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WpKivvdH6quKUe0GCQ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xrwCaA0cNAMh-S35NMUXUs3Stq1LdGkE
X-Proofpoint-GUID: xrwCaA0cNAMh-S35NMUXUs3Stq1LdGkE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX75mZutLKOIXU
 A+dVdvESHyMHJ3ANPlXMfBXUGDdJ6Wem48ndmvpCjSc0z0Loqh2u/b8NmF9K5YVl8Z9c2BcwAMB
 MbwI8RdSMC4YmrXzUzdvS1rx+yxD7orvq5/axzdHQtoo7avKCobrsnUDFcQ8QquSjPrwjUFeyoC
 tkLFUrdVUX6e4cFrIx4oVrK6DXyNFUc9/gRJ+iIFFLwxCkqM6wSpgB3a197CxKYSJsmLf8mlscO
 FMH7r9ZJg4EdjyAF8kZbkKzfPAazWocWFeHsKxeODnntqmHwbGx3zPhFX/ldq15qOPdLssbCybM
 EbfjWyU5jhwYdSEg0UMD7FMeKTjxFra4UyS6uHn0nhB5AaELu9UevavO4CtYjRtXxS3CfDDHvn/
 A0X/ojql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042



On 2025-08-19 15:15, Krzysztof Kozlowski wrote:
> On 19/08/2025 08:51, Yijie Yang wrote:
>>
>>
>> On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
>>> On 19/08/2025 08:35, YijieYang wrote:
>>>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>>>
>>>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>>>> functionality.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>
>>>
>>> Why do you mix up DTS and net-next patches? This only makes difficult to
>>> apply it, for no benefits.
>>
>> The DTS changes and driver code modifications work together to achieve a
>> single purpose, so I included them in one patch series. Should I
>> consider splitting them into two separate series?
> Of course yes. You are just making difficult to apply this. Patches are
> completely independent and even your internal guideline asks to NOT
> combine independent patches.

The challenge with splitting this series lies in the fact that it 
attempts to reverse the incorrect semantics of phy-mode in both the 
driver code and the device tree. Selecting only part of the series would 
break Ethernet functionality on both boards.

As you can see, I’ve CC’d noautosel to prevent this issue. Given the 
circumstances, I’m wondering if it would be acceptable to leave the 
series as-is?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


