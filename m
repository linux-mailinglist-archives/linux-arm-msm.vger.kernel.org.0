Return-Path: <linux-arm-msm+bounces-86832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A7CE6AA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B70963007246
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567722E091B;
	Mon, 29 Dec 2025 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKMYOwQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ozpd56YW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0A2DA749
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010742; cv=none; b=lqhtLSz6UdiQp4qn0LZkMYivHWEY92qGR6qxJmpFn02QCRaw0mN4DMWjxb3hCX3AncEfOH5h8KAI/BCTgrdIVwIw4BCYTjUxujZLucgL3votyuKE0/pLSjJ1/GRO5QyAoIrSAibQI3nvIQZZ2IqCRQfGi2WA/m5vceePkUhuGoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010742; c=relaxed/simple;
	bh=uN3nohyBaGXj3K37SOoKgN8CoKZIV6myBwh7zHaJFKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxwEknTnQO4A0uvDDwmRAnEQndcN0Eq69vSKyPg8BG7a/IdWRKJIcK2ZkuBNZUvV+ndZhdbcDtLWZCOXpcR6jlJHnEyNCVN+P9tJzhVmhvpAr8exBvE96fIffPdJITFLMYvG+6maFlaYti9RKI5g6XvM4cpnC+hiVUdrOFMZL/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKMYOwQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ozpd56YW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA0wY94154610
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I7egxXalU5yHKd99L+K3ify/0mmWKGv/wYrNbPja+hM=; b=AKMYOwQ21iBStZZS
	LiYnaZtsDBwazi6rJjKfaujrbRK/ggPRjQJLWiB/323iV44GdDfnBOOZF4k9sZ/g
	A7lEooV8/AGmT/ZT6jg7FDPz70XpcNR3XH3731fz2uJyyasqEtz2SD7Ti/f0Ims2
	mO6Nui7QCqcNMQJSTc4NNTcM0wpU/GdFJlH+woLQrEmZf98lDHieWKILiwHzjYBq
	nAAxir24HZaSmcnxedKMm1yn1jOjzPPRtsp+RQ8MfdiiDdzitPZuuVOumOf/s97d
	glF57SRD0UcSRE8FxtxwSGm86BOy3a0Vv08YY2O0OiS2og3SH0h6jGMCAMclmNaD
	zkSJLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5m8hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:18:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso36067451cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767010739; x=1767615539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7egxXalU5yHKd99L+K3ify/0mmWKGv/wYrNbPja+hM=;
        b=Ozpd56YWAP1/Vwza3ZYm5J3Svxr4oE1UAgHLyCFX7gzkJdX7t1VwOBe4vLrsDCrrTV
         70yb8e6sgN+NNxGx9WLcLNpfDlHo6bxqU8T9ISgfl8VM412+6AS+a6jcYJrixqtTXAwa
         o9ggej1ckO6LjSVxBxFv6WrmdkjOKVX7TUcAiSZhvubKu1tztSbcLU6nxxT6Z3FRXQ6B
         4xgD4McPqIlDkeV8nuzcCAXXOlbUV6+Hb4w5uTJ77RIJW4Ig7rDZqsxVXDO2EutIuDX4
         r2pWVRR6fIOua6a6Dqs+70mquXKdJ/kGKpdwpdHcQth+PZDbBn3oJYiQTqRPWYNtpX9/
         zwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767010739; x=1767615539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7egxXalU5yHKd99L+K3ify/0mmWKGv/wYrNbPja+hM=;
        b=py1D+x9nAm9bps/11wkZaMdTPiwe8b7RhMU15ZGSHhvBrRoq2+pZhdNqvIIWkjddzB
         MHU8hOMorPdtgTBD18N7YTnyZyxSh8QjTrX4FGBil1XfMuPZUJR0LQW9/zZ/nDHljij9
         OK42NW6tU2H1JVTGIsEcN6vxzsEsm9dha0AR3BGVMHc7hoepDB127GvrO8w9TPZjj+kG
         hJ/Gf3anQWzM8ZL3GIT96XeiXln4BL5h8+e5r1akvNO19mZ5l1wrngA4eq+jhD/9GwaW
         xAwyjHq5WKnYcsgDmkLXWdCvjAQJkjT0j7AflO8pePKl7neT7ZerRfLqxVlV3aJ014rM
         Sg4g==
X-Forwarded-Encrypted: i=1; AJvYcCVfdSaSg6L/J9W88AmZtSo1JVtRzbTrVtuW+puXaSNaSx+C9WyTmGgEtYAWK4q5T1HzaEoYV8vjj4LH/cG4@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzNpySXb2l2IBGa20kIJTnLbMIMinlQwHP7G9W13M9n40Yycp
	F24eTxNUrKkwNzHvD4qWIp/T7M+FeZJiamzXlkX+ROqHJl4oRmgbLmzBme2s/gkTPgEKNsXbEo0
	YViiwP3QQqCqXiNyucm5Esc2prAgxV/0meB3kKXQJEHReGx3TE+4/h2tSFfnqdtp1IL8B
X-Gm-Gg: AY/fxX4B18gjPwDastboXOdmfBlAV7SY/2/G9yXnDODJMKkTRj54IyfC4PPtjRpbPbA
	h+/rRtlqahtV69JoDIfQZI20IS4BxV51ix1OJUO14Foe+fJ0/n9vu3DX4YRG6p1ciN8+3elvWty
	q+xmxGLEJi9Ge79RIXGF/OyhdANEwwandRNGAjCG5aGZZuUzn3olenyzI3UVTUK08RFPrh+0pP4
	GRKJYWyzLCQODN34WgvU2+2o4e3HXfkU1X4G8PRpYPYzEgbOG+SuJ8wgzMUmFLwRvI+lx3OE1s6
	tqmnT9b2zowsLZVVBVC7QlidXXtC9v28x8aE7BIi8ferqcvz5Sil4t5p132WNDTXCZdbKEyDIgY
	Q49vqZf7gYWNI/vaD2iYVblKmxnCAxBg5oMmaat/4xulznFuh18tgFcVUbxYzvOb3Hg==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4f4b372dc2fmr213037041cf.5.1767010739062;
        Mon, 29 Dec 2025 04:18:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtMP+xA09sS5jenlKAYe5EsWqZJlIIZKsKdW4djxJDPCbGUb1Tho6lxz/bODwXk1HXqJpRMQ==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4f4b372dc2fmr213036751cf.5.1767010738584;
        Mon, 29 Dec 2025 04:18:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm3298156966b.67.2025.12.29.04.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:18:58 -0800 (PST)
Message-ID: <9648b69d-bec8-4f4e-8db6-b94972971454@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:18:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
 <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
 <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
 <d15c68bf-1a34-4024-b508-dc3f2676cdea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d15c68bf-1a34-4024-b508-dc3f2676cdea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yMGAF-nmYsnUoBa3_UpNVfOSOSbsIlrc
X-Proofpoint-ORIG-GUID: yMGAF-nmYsnUoBa3_UpNVfOSOSbsIlrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExMyBTYWx0ZWRfX+Ku23diltSJc
 Az/EbSeseZLCV2ZH1z9+o5tQZHATvv3z/wWnLo5smrXvu87SJb2GFobt5vQVSq9Q6MIkYtyvVoY
 heoAvvpRH35damOxz6IdXLy/eFjHEtq6mU6Qed3Y8MVYXff04rIg4kXP84TfCYPX7tsPdsdtID4
 eoT5uN7J87hnUtB0rBfpAROSkDHn0atz4ow7kYEvS5ExoIpPUKBmmjJGGCCEeiVKb2iUT3J3Lc9
 OULrxbLMLFpmlgSRFNYDhii2iyqm6PPBMhOTRuoxDJH/qotW1WFUDWqlUp/HfijxStGjllSwvxe
 LSpbbkhUpLGWU6whp3GftrbS7PVvy+qqMiMf4Sga2Y6uCm3LE0FxCqOxdPG47JzwEq8xsn2OqxC
 h3T1SkYlVvTj/PhQaU2E4iPyLTGyAJRsyDpO3ns0zasdCEQcbV5184+zceJSPRbsMDtMo4PQANU
 dYCHGyZY8oHKyBIt4aA==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=695271b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5dvyyB_Sgsdd-Qve2IUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290113

On 12/24/25 3:02 AM, Yijie Yang wrote:
> 
> 
> On 12/24/2025 1:27 AM, Konrad Dybcio wrote:
>> On 12/23/25 3:12 AM, Yijie Yang wrote:
>>>
>>>
>>> On 12/22/2025 5:18 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 22, 2025 at 02:03:25PM +0800, YijieYang wrote:
>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>
>>>>> Introduce the device tree, DT bindings, and driver modifications required
>>>>> to bring up the PURWA-IOT-EVK evaluation board.
>>>>>
>>>>> Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
>>>>> the IQ-X SoC series. Consequently, the two common files in this series are
>>>>> prefixed with 'iq-x-iot' to reflect this relationship.
>>>>>
>>>>> PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
>>>>> except for differences in the BOM. As a result, most of the DTS can be
>>>>> shared between them.
>>>>>
>>>>> The changes focus on two key hardware components: the PURWA-IOT-SOM and
>>>>> the PURWA-IOT-EVK carrier board.
>>>>>
>>>>> Hardware delta between Hamoa and Purwa:
>>>>> - Display: Purwa’s display uses a different number of clocks, and its
>>>>>     frequency differs from Hamoa.
>>>>> - GPU: Purwa requires a separate firmware compared to Hamoa.
>>>>
>>>> Is it just a separate firmware, or does it use a different _GPU_?
>>>
>>> It uses a different GPU.
>>
>> I think it would be useful to call this paragraph "Hardware delta between
>> Hamoa-IoT-SoM/EVK and Purwa-IoT-whatever - because now Dmitry is asking
>> about differences between Hamoa-the-SoC and Purwa-the-SoC which we
>> expressed in purwa.dtsi
> 
> I want to provide readers with a comprehensive comparison of the two boards, Hamoa-IoT-EVK and Purwa-IoT-EVK, covering all differences in both the SOM and the carrier board.

Of course - my comment points out that the specific wording of "delta
between Hamoa and Purwa" may be easily misinterpreted as not what you're
saying above

Konrad

