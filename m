Return-Path: <linux-arm-msm+bounces-75873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA4BB6640
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 11:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 089224E5EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 09:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818042D77FA;
	Fri,  3 Oct 2025 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ce/yHVoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37CF2882B7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759484384; cv=none; b=niGZIY1UkR83BdEKCPedpq2Qcs4xqd6bxCIFUGgkyT1qdNg0lpMuQLb46VHgsSwLjTTLDJQ1C0wgc748Dq3XvixqcLm2L6miqFzVqcO4cyeVDe8+Ja2pMlFtEqgvoL8nKD4s6ELatmiEEaLALAEiMSm2Wg2jzBYcJGX7MbExuuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759484384; c=relaxed/simple;
	bh=SmXYDokhFwrv+zy33WxsUhFm40t/pKJa2ltf9BoIugU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmu07xPtFWWZnIom6zOdHGj7igMiVQwX9aLNPqazYxHjoee4j/I+VKRYBeIJbedtI6Q+rTak3x5AMnjtP+zi1JF2jK/JpdgV6zMtsMBBdNOgY5NhswmphoGGduWSgQl9dGmC10UAbceQBftuvI+YKax7/iOA3kiqD6PXiG9gjG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ce/yHVoC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592M4MmI012709
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 09:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	04eJkInxO2ENPO6VxJdXgTlBaS7nX00s6IyWW9hvzsU=; b=ce/yHVoCO8wPuS8T
	S/A0T+mXL6oelPbL5oOvKYBJ4LPlPW20wRtsw/kZnGBGjUobOrLW/QGhtQuqCN79
	lZrKFNM58DEVb3tmnJPEfd3FLu0izJhf1V2Zl+HAYbKmwpP4lioVERpgNnsvSFS8
	vd6AofobY8FPkYjne+ByoAZxbdi+61HPGbfdOydfy3ZQ/j/Pd06iG6ja2felx95l
	Gx0BrFQVk3qKy6CrRIDCZd1YOQ/zyL4TpP4ET2aYrLIhzwoVl1IYYqrseLg7bT91
	EAZHQRJcQQKbwtKkqcyfJoR3XQMGubzfHmBO8TELK4+734aUJoxbyiih12j/FOSz
	adwqNQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u2kfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 09:39:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269a2b255aaso43504645ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 02:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759484380; x=1760089180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04eJkInxO2ENPO6VxJdXgTlBaS7nX00s6IyWW9hvzsU=;
        b=X33B/eLajZG/7OX905zVQKEhisrx2q49UhNPciEZH42oL+o2GYBXnlb/xk7b8ekOMW
         aafbOs3I5M60xrsI31yVqzDFdBZ76Cr1QoIFBockTyN6oU6bkH0dhOOXPGirE3fLen5b
         I4hbu7JhT7aX5Dj8o8eZhTV6adujb3jVPJS0F9XPxQIPKWnTDkmXOZ07CyDgWhTWALBW
         15g64LSEmzhmosrizleUszqTV1Ibg0ToZqwdZgoMRq/sKAJ97HxYkqIvuWyVMPH9z0x1
         bzrIpTiDB6IUVH5fKYcxsE8MV1yaYnEQrc8FfJOgNzushNCbZgYLVNmyhi7J9N1KRh8T
         UWvg==
X-Gm-Message-State: AOJu0YzUJJq4s56QTVvBSUIwfwdCZ9gSAy6TWJLjQDrD0uNMEUQF6Krk
	1X6sr7N/SC3lWJPZqYqZCFzO3dhEx26TZzvdDq2TB9nwIuzgowDDj3rY3B9nyfBDWCeJvo973zK
	KlTKFcUY1+O/95jr7ZDtkcA1sIDLocIHrQFz/52pdEUJ294ueGgPJjbH8AXezUtlG+DOW
X-Gm-Gg: ASbGncvjogNz5YqF3Y5RogyyWShCvcOKsrHlYrDVoKVSM0q7VUGyBW8faM0xgPY8vol
	hFTiCE2gAlTM9op/Pg6H/hu1daeeDuscjdMSmKs5mYeTRg425NoiyTvS8mPDUhAsVnH+/a8uFOw
	Ja5nob7QWD8IcKHIxq2LrEZF99+JXP5bcJmPtM0L2P8Eoxwym4/pfTeAqd7XR3849aNpnXPFiGq
	qTg0vW6+ThBnfhAOswB8gwlgTD9HWUNheZqZOPcbtOPd502NYMetTfVV2nVU64vtfXwRjI8oZU6
	Up9XJK7vpkZHDhIG/iRITXrUnxk09B2rpcNJGyvVRXlNQEWaWdq4EphoNeUoLwyHbaDZ5PJWsNN
	NNbt/IHaWd1MZKg==
X-Received: by 2002:a17:903:1b03:b0:269:9a7a:9a43 with SMTP id d9443c01a7336-28e9a5bd5edmr27721045ad.10.1759484380332;
        Fri, 03 Oct 2025 02:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1F+ny00A4izU2Vmt4qqieA1wCTH034JmDPn6Ou6qFqpyQ/6nCQyCk6gspjRmbunlDp0O00w==
X-Received: by 2002:a17:903:1b03:b0:269:9a7a:9a43 with SMTP id d9443c01a7336-28e9a5bd5edmr27720775ad.10.1759484379904;
        Fri, 03 Oct 2025 02:39:39 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1f19ddsm44936695ad.127.2025.10.03.02.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 02:39:39 -0700 (PDT)
Message-ID: <8cc1428c-dd23-4b20-8c79-5d6e7768d4b7@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 15:09:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 0/9] Add PWM support for IPQ chipsets
To: George Moussalem <george.moussalem@outlook.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Devi Priya <quic_devipriy@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Baruch Siach <baruch.siach@siklu.com>
References: <20251001-ipq-pwm-v16-0-300f237e0e68@outlook.com>
 <3cb50330-effc-4089-b80c-d454bccc63f3@oss.qualcomm.com>
 <DS7PR19MB8883BDB4C3147C86F062A4B29DE4A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883BDB4C3147C86F062A4B29DE4A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX1alrgmCtlP86
 ytNPyR1fQfKR6eNG7M4g1rdq7yg0mewBxlYb4hSI2g/5zd2znsuUnzuQ4zJsiWv5F+uu1+S/D3c
 J4rVThWderisACnJiEVLhlDpAJYfGZcEJEQv5uDFjJggTijLaE/wOTvUDrq53KL9J193kZ+VA78
 5aYKigzPvidY6xsxHOJREJGU/DtU9byJvJwGsPyLDDLa4/GIv7PLjSShXAmcLIW15A1PtTBIzBz
 YcWa/fx7RXARaU0dQc/SgvSrYnez7ZnDltLGh0J+yN2HG3tQE374BMB+mZC9877Q4Y3XoLpFUF3
 LYAf+68rNvtGtnTe9nMQuLx1P31hmXWFDG8a7XbHk5P16zC6Y5Ytjv8eIIgL8jIRAP7hnfNcWiC
 5cROHg3YfYr/Mst3rPHueuBWpIJdtg==
X-Proofpoint-GUID: MtiE1761eFNI0_VF71qs9GVMyWvOBfEj
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68df99dd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=LDzoOPf9sO3yNRZ_Fi0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MtiE1761eFNI0_VF71qs9GVMyWvOBfEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029


On 10/3/2025 3:00 PM, George Moussalem wrote:
> Hi Kathiravan,
>
> On 10/3/25 13:04, Kathiravan Thirumoorthy wrote:
>> On 10/1/2025 7:34 PM, George Moussalem via B4 Relay wrote:
>>> Add PWM driver and binding support for IPQ chipsets.
>>> Also, add nodes to add support for pwm in ipq6018, ipq5018, ipq5332, and
>>> ipq9574.
>>>
>>> I've picked up work based on Devi's last submission (v15) which dates
>>> back to 05 October 2023 as below SoCs are still active.
>>>
>>> V16:
>>>
>>>     Removed reg description in bindings as the offset is not relative to
>>>     the TCSR region anymore since simple-mfd support was dropped and PWM
>>>     nodes defined as their own nodes, not child nodes. Updated the example
>>>     too.
>>>
>>>     Dropped patch to add simple-mfd support to the qcom,tcsr bindings
>> George, thanks for taking up this series.
>>
>> Can you elaborate on why the qcom,tcsr binding change is dropped and
>> made the PWM as an independent node? IIUC, it should be child of TCSR
>> node. In V15, I see the qcom,tcsr binding is applied and *dropped only*
>> due to dependencies / lack of information on the "pwm-cells" property.
> Please see below patch where it was decided to drop simple-mfd as TCSR
> is configuration only and any child devices should be defined outside of it:
> https://lore.kernel.org/all/20220909091056.128949-1-krzysztof.kozlowski@linaro.org/


Hmm... Sorry I missed to check this one. Thanks for pointing it out.


>
>
>> Thanks,
>>
>> Kathiravan T.
>>
> Best regards,
> George

