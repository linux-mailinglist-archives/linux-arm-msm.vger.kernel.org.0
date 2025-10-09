Return-Path: <linux-arm-msm+bounces-76609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9EDBC8879
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57B2E1893A88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3702D8DA4;
	Thu,  9 Oct 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/w+Fvyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075C02C21C9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006197; cv=none; b=Oi/XI+iT2P/ND0Ar8rOXxIdrpceCu7cCyUz0bYi4dQES4nfEuM/yogLoWGf4a4/x/JMeun4j/vdEUhhgq1CjM7oV3xgcjirLOFyiP6eOTJLuaFT1fHdLUOAx31zVDb8vdKrBwvE601QwZbiGA0pojVcx0wU2PvSdboIa2utZfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006197; c=relaxed/simple;
	bh=Uffd3qhqQX8T2QmVySytMSwy734A6Dx7GqzHMTI2XNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCulp4xNjh11fY9iHy7WlAlOhILe82QRQj/LaxuJ4drDsEy6zDleBMrNMWkcnSjfpscdV4laW4/kRTFurPdNyYGOWfrbpIdR1wKrJLxPrScpx7Wzghmgj5IExaUwOb4gJUxu4siDRfr4RRUVxnNhnAva1o2myGnGMSp4TrY3GK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/w+Fvyd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996Eo9s030514
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 10:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIJDBCBIg1twPqmDVsmDKKaAwSLfEctE8SQbINeNBoM=; b=Q/w+FvydNHo8X1/B
	+AXpi0+Swa5J+XQ/geNeQ8nkkJF5U1xvdnGyuLAtpKNiv/tFFGZ/EjtSuEcd0yp5
	0cEgyL76g8p8XbtbdL9Q/zMxTUSa18ljpyqig4VTTlwx0u++NKHaoV8+SAhiLFzt
	6/KGe9UsG6fmMDHQxeDr54qmvJfp0fkgS0pHQ+MIsyB5iMUrveZcnbSe9vpZ4SCd
	KdXjyHhTYnUIKdrgaBCG333ixntrDqcirFeQGtyub1tXxcCjzOQ4f+M/J5I3/Dzy
	Z6iEun65oyz8Del38YPIIwIIYRNy2GzT2Q/D5kU9i4p67GOg8UWOjQkPGSFVZdhw
	aWqSUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nje3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 10:36:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269880a7bd9so17392375ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760006193; x=1760610993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIJDBCBIg1twPqmDVsmDKKaAwSLfEctE8SQbINeNBoM=;
        b=a21gZEFA8iJJ1bKlCLYbKH5TYlJYo4jIVcxq2G8qbeFsWzlKIz1njA0TKid4mCcZcV
         2ydTke4T3RuFeupXq1u1O68afIc5Rm7qyz/QqJ78SM8n/LKGXmUvxTolydQTli/vsKX9
         j3qoDzsygttJnpWroPqds7IikcYYq2mkRBdI9vUfEJgce9TvWpnkYoyKmAz4xYmip3iR
         HiuMpb1m1toSGGxREbQjdKV86Pxi9/u6WzGgAMlY42ItMs6wPiAb6wuC+ZrAvlSSqePx
         7tgztVfPPr3wiWwzAdky3N5p4hWaEjWqZ3SrEhOBeBjRixXd+RdZqDhF+WPEkBohN2r/
         RBiA==
X-Forwarded-Encrypted: i=1; AJvYcCXXzygbiopNsz1RQU7gnxWQpjs2fw9RkRMeCnluPs02giWbdmyM/5auuuF7joYDNGVfzpY8poFZcKhbVLc9@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHxFnJdGSNW5ttxDbwebilbsv5MplqHCIueKGFG4teQ8sQYrB
	ANtZyEQ2oF482fPB++um82T85Iiciznu+Rb9rm/ChxYUUv+gZr51XrpoE3NcW+6y07i3mHaYDqp
	19mEAnI8VVqPLWwnXVqLL2xmqFO7706H4HnuGXP9LjxdRBvpdBcU46t9KI+EJEaODkR3zAWq0Bi
	X7
X-Gm-Gg: ASbGncskXB8/HlhGNQ6T8PHxmKijQ0AIasm+rxfeYnS1Eez680f8YLP1HaNbzwdqFVM
	gf/P9CX7u/YTHShfHSHrfQskGz5O5Ie0TqNHEiuWS2Bhf6Mvbs5BgkNz2GRT5Yz64EsqODbKsJy
	DdQQbGnULCWjGjG+N/0M/IZN8dAC1peuqt259tnRXDCSH9+hvZFEj75UamerFgtZQuDuDK3v3pq
	5IHeldU4dlWm//HEwUbc8sfqwTTY3D2w0s8sLQOPCLHv3j8Y6dVo4/qfXPukZoTYZ9rwFAzQonX
	ByBBBIQBYO8RSQzT0X+Q0o95Ah8jDA4FT2bP4ttO3GPop4bO3wBAxtFVgOp0LomZ38+hcVthCA=
	=
X-Received: by 2002:a17:903:2f0e:b0:248:7018:c739 with SMTP id d9443c01a7336-290273ede9fmr82418585ad.28.1760006193361;
        Thu, 09 Oct 2025 03:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmuc2TMn8t1SqRdjUlCwadYgfMLU57/ABb8D1b4oUqw/kKFE6rOzxHrm+dsfcGBkxJQop1A==
X-Received: by 2002:a17:903:2f0e:b0:248:7018:c739 with SMTP id d9443c01a7336-290273ede9fmr82418115ad.28.1760006192877;
        Thu, 09 Oct 2025 03:36:32 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f366c0sm24318595ad.94.2025.10.09.03.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:36:32 -0700 (PDT)
Message-ID: <304d90a7-a35d-4e01-9263-adf0f609d76c@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:06:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <EAIobHjo8rM1e0LwqDqaUllC0qjV5ElMMhk6KgT1oNnFt_-k7ctM2_6kym9OjEtse5o4pOFM7yCkXgrSGRZhuw==@protonmail.internalid>
 <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
 <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
 <555039f9-a168-4a9c-b45c-d4583c553bc9@oss.qualcomm.com>
 <4777e507-c329-4c22-a45f-099fc57e31e8@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4777e507-c329-4c22-a45f-099fc57e31e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxals0Fm6O09f
 mq3mPVXjp1+Lpc1WNuCuCBXVwtOvGBXuVG3xSiVrBevngCEN0wL2lLPygP2nyAzybL9/3LSuHLV
 kq35EayGIRYWsbFFYSEm3MoBz0swFq4af7DJJ7ybBbSm/jN6KEe5EO4ntNllZOTLYm6+vCfS8tO
 3qmjlXlAxixGRsQUGXi3DcqsBGC4brmMwvq8ZRA0lBaE0zb6V6tcfJxEse35SgpWBIdCAsxliaz
 9PoRYrpYN5CZF1uxIoSOxYaMJq750X+pWkKdgDhq3QxcK24rxbKvjm7mN0atvHP2viMAZSczhVn
 hHHV6yvrE4C7rImqCtZ+hrVD29knFvmNyO7DrqC20764wDqPKWdX/nE6sCWqTDZ7GuIC0rLiBtx
 2ydZmcwX9HsuoqSXI7cgYLi1Kuo2+w==
X-Proofpoint-ORIG-GUID: AIOu7iQBUr5VUCnG65qzpXlwoY3-QOT2
X-Proofpoint-GUID: AIOu7iQBUr5VUCnG65qzpXlwoY3-QOT2
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e79032 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KR3EwNOJeXORIeol_oQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 9/26/2025 4:44 PM, Konrad Dybcio wrote:
> On 9/26/25 11:18 AM, Taniya Das wrote:
>>
>>
>> On 9/15/2025 4:28 PM, Bryan O'Donoghue wrote:
>>> On 29/08/2025 11:15, Taniya Das wrote:
>>>> Add compatible string for SM8750 video clock controller and the bindings
>>>> for SM8750 Qualcomm SoC.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
> 
> [...]
> 
>>>>   properties:
>>>>     compatible:
>>>> @@ -25,6 +26,7 @@ properties:
>>>>         - qcom,sm8475-videocc
>>>>         - qcom,sm8550-videocc
>>>>         - qcom,sm8650-videocc
>>>> +      - qcom,sm8750-videocc
>>>
>>> Shouldn't this be qcom,pakala-videocc now ?
>>>
>>
>> As of now, Bryan, all of Pakala is using the SM8750. We can migrate
>> everything together to maintain consistency.
> 
> We settled on keeping new compatibles numerical for already-numerical
> platforms (except board compatibles where all the fuss was / as it makes
> sense)
> 
> Konrad


Thanks Konrad, will keep "qcom,sm8750-videocc".

-- 
Thanks,
Taniya Das


