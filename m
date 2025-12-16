Return-Path: <linux-arm-msm+bounces-85405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EFCC4C09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 18:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 485013046ED8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE4B33C1BC;
	Tue, 16 Dec 2025 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikvA4rXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoL5HTvv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F86A329C6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907721; cv=none; b=GAJpQ0srN4ghbQpHS7IWX50Lg1caS+45WFmh0OZvucwvQLY1bjn9eRADd3kSTuvP3g7XSoHh6u9POCdJcLR5TA/QpumVAXk8bUWfNyUVsL5UN2OMIuKivt3jY22ZQ4fncSFM3j9AjJLEOtM5mQp77Pj5dWkPxBTtOupIr4cCxy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907721; c=relaxed/simple;
	bh=x4KWC+YXPPYlvG8nC4wNEtsh1nWoGAXx2WIIqmKIgrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVZ4+C3tAoqXTyh5c0axjQPQXuLWGNeLBfAOhgTCHorCnyWtLhQFA9SEDhdAXh373NBWaONyi1RwbC83bB4K972PgbrVpajyB7Afi8Q/g7aBSQZQOIMcSjdJXTC+LD2TEJq25kpd6W8xJ6PeCWAYK4+6hi9+FWr1lr1vfkx96Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikvA4rXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OoL5HTvv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGFqUYw3598754
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 17:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tfz6XIdyU+B9sBPkIM0l3VvZslEO+bMthgxfNqZ1cQ=; b=ikvA4rXW0TmrT/Ft
	89ocD7O0j0rxcqORi/5ICFV32ofGMXxMfBZHuj8W0mnBP6smduHfdBuIl+UNTDTU
	oKRv2XxsbtL0u/WSlAYVxQpH1CgqC+EEgFOlu9tnS2MQkfFSPKJvIPGtiiTPtPAq
	gpjhp4OhCLdKaceQR2BKUGwLGw9TC4HUA3qkTrErIKjHj4OC4NPE8E62we9PZfcG
	k7gpaAsg2PFf+yk3MqRHryz2MBK2Vx1M+q9moXV41XcET1CdA97YWwLzPX5yCyo8
	25Mil/zTdoWKf9HvfIJ12u/EmJZpD4nO5MoI1fXRAgtHK/udbm24phLAgQ0NXQYt
	+Spp/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b35se1ks7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 17:55:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so5269729a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765907717; x=1766512517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tfz6XIdyU+B9sBPkIM0l3VvZslEO+bMthgxfNqZ1cQ=;
        b=OoL5HTvvemD0DHEDF+7pRxcgwugsXQHpGgYE9r8kcPnN4QydfGwr/SRhBUZhG47U8h
         J+xCdT3m43VdzVK8QWJKip4zm6xo9E5b99Rp4lfPi2Wto4yZLDK94s9mM36ECMBZ4tju
         tvIgY9j5oikIZbWVfd30oeGDdjXeJY8WjQ741e7UfUoX7Pi9f0CZPL8OQee59E8diILz
         feoRU3vPLzPvbNmZtOZZ69w5m+21KOAwLqBDklNx5G7sprAgw/bEiF7S372S2fK4uJDX
         TXYJ3eXe3D3525Wv2MO0wUKBMGC3A6EmTVSCGiFpJhwSQH1CkUl8C+khK4BaXPdrqtTu
         HCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907717; x=1766512517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tfz6XIdyU+B9sBPkIM0l3VvZslEO+bMthgxfNqZ1cQ=;
        b=E9mCG9k9uTED6ncXKf/xnmvCTLbbexIT8QrHkUf+Lr73f29Qv492MbnmmucJBh7KLJ
         c50qz+LsvaOyo05izK/ejk94yxc6G9MryK1zX7avrnugLczY0G8lIPkf3RQxFMoZSJia
         NLYCtOTYlo2rMqJghHfmChkXUHPynP4lf8QhhBswspq32MeD2JdVIt+5t74PaaLy8Lzi
         HE72Let6fc3P+F2DSwJ1wc9yC/HS2XjQLXILdsM6rh28s95FJfao+9UZ37cbwCWZkCBy
         lzSEryhxr+uPThQXjQUXf1xtcPGqd/FwLQ2F5il8LyNmfp3iNf0kvuIgsq3txC0xXp0c
         aTMw==
X-Gm-Message-State: AOJu0Yx/FxaIunk5toQPhdpj0qeeH4ho78Cg6QrlVjwL9JBAmAcWCa2B
	5rL6QGXOhEkfM6xoLq/NsOQfFR3Fn/dev1KBEzFijEWRr8/OuVSZryBGWCN1upAst/OsCPoOCWe
	YldqZ0ySoavMK/S2u7Mj7R+nW9VYKelWtTZ3Ex49ximodLvpxHUeHRgBgL2E1K0wrV/Fz
X-Gm-Gg: AY/fxX7zmqqsHBxzMzv6UQ9GIkPEtxNSVk5eqByNh8S/hrbttspxgSQKjmfm8IcpdXZ
	/pmgczj3nMjia9f96owS2OIBmbWNqJwy6QXwGNkbcrgcKMvodIQOfEKeSRJUUmi3OkHOiaxvO13
	9zg15dphLUmm6k5i5lsof+G2lp23js2Ds7bIwVAof5MJ1ABCza+e8mFpOAMZH+f1pUc9ETtcA+f
	719oCeg5S1sZTTe9nS8W5rfbwCWJAAliuSkTXCERS+XZzNNheOpevRWz0jtBkflWssTgeAFYY0A
	ucrB/9QhgEtllSIj6xKoTk6TYPqaBuX+ov89CHcNyplfNwjlI1ZlK+fNr5IeC0i+riAlYlJRcl5
	j69SFb/3SgM5seGgAlpbajUQkeZmFtd/3XvdVEGNU300=
X-Received: by 2002:a05:693c:60c6:b0:2ab:ca55:89ac with SMTP id 5a478bee46e88-2ac3014dd6emr8017866eec.43.1765907716884;
        Tue, 16 Dec 2025 09:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPrkV21G3iPc3ojGgR8o4nFvFrt1frL/UDjVG4xlLNNyF1bO0gpZ8qMANWvbUOVTVbC6bDUw==
X-Received: by 2002:a05:693c:60c6:b0:2ab:ca55:89ac with SMTP id 5a478bee46e88-2ac3014dd6emr8017823eec.43.1765907716228;
        Tue, 16 Dec 2025 09:55:16 -0800 (PST)
Received: from [172.20.10.12] ([172.56.242.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0544f0sm1362847eec.11.2025.12.16.09.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 09:55:15 -0800 (PST)
Message-ID: <d1fb4d8a-608e-44f5-834f-fa92d487c75b@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 09:55:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vladimir Zapolskiy <vz@mleia.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rwDYuf4sfXp3jInY_AIgTl_1Ggs8nOz4
X-Authority-Analysis: v=2.4 cv=ar2/yCZV c=1 sm=1 tr=0 ts=69419d06 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=muPXiAMrSX0Fknvgm18zRg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=B8gxV9zDd2KAh-v8T-4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: rwDYuf4sfXp3jInY_AIgTl_1Ggs8nOz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE1NCBTYWx0ZWRfX1Zm8SFU7RwUp
 7ptjVcFxAwLCJctR1JWIseR1/GeJqG4Vu1y8bp6AYhhoeAQ5t2GUsXJbEQqrxR6d42M8FxsJJKX
 OfocaVruEFXa54crZG2NXkjieHO5iMQydcE+YfNJr8GyPiL7RBWlIzv+ItU+j97KAtN8+6w/OBd
 27oRVKvPlpf0jx9tXpV5PJ/vkiDm9/97ZpYevZ4S8ZONx4BPCVfQcNj47YY5llACC2vNz+m52i+
 nYUmkNPah4KufTRoeDgamkrU690K/vmKK+CXYJT5TlNqFqbd4vmHfXoh8w2LTrMM0gb0+e8Guv4
 TTtseticjfMF1lkF992+11XoUYIsWl4apjsN/TbwwQl8DTFXhB9Fu6ql+gqeCVWJXT0+Binja92
 xo6fLKg/nTiP7eWccffsZlP98o0hQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160154


On 12/12/2025 4:49 AM, Vladimir Zapolskiy wrote:
> On 11/18/25 20:44, Konrad Dybcio wrote:
>> On 11/18/25 7:25 PM, Vijay Kumar Tumati wrote:
>>>
>>> On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
>>>> On 14/11/2025 03:29, Hangxiang Ma wrote:
>>>>> +                  <0x0 0x0900e000 0x0 0x1000>,
>>>>
>>>> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of 
>>>> the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>>>>
>>>>> +                  <0x0 0x0902e000 0x0 0x1000>,
>>>>
>>>> Same here.
>>> Hi Bryan, HLOS does not have access to those registers. They are 
>>> configured by the Hyp.
>>
>> If that's hyp, please add them. We already have platforms without
>> Gunyah. Remember, bindings are defined once and for good and I wouldn't
>> call it impossible that someone would want to run that configuration on
>> Kaanapali some day
>>
>
> If the ICP register block is added now, then it will practically exclude
> an option to run hardware demosaic on Kaanapali. There were notorious
> and still unresolved problems with CSIPHY blocks, which shall be split
> from CSID/VFE CAMSS on device tree level also, for similar reasons the
> same should be done with ICP or other blocks. It makes exactly zero
> sense to pile everything into a monolythic device tree node, and doing
> so undermines any future advances in CAMSS support in the upstream
> Linux, the hardware description in downstream is done thoughtfully 
> better,
> and not for no reason.
>
Hi Vladimir, yes, this has been discussed in the past and the general 
consensus from everyone is for not blocking KNP series on this. But yes, 
there is an ongoing effort to modularize the bindings for future 
chipsets and when it's ready, we can review, discuss and take it 
forward. As for your ICP concern, if you are referring to the Demosaic 
in OFE, I believe we might still be able to do it either with direct OFE 
config from CPU or using the firmware (preferred), given that we 
properly establish the shared memory and SID IOVA ranges for ICP, 
assuming that the load and authenticate will be taken care by Hyp or TZ. 
Please share your thoughts if I missed something.

Hi Bryan, please feel free to add your thoughts.

Thanks,

Vijay.


