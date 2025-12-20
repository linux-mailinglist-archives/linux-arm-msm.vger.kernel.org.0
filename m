Return-Path: <linux-arm-msm+bounces-86031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A13BCD3316
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CC093004EC0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784522F5472;
	Sat, 20 Dec 2025 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ge4mEeHu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiArPAT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C6A2E92C3
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246698; cv=none; b=eh2tO4u5EWEmM/Rd/TSm4kKdmgY65e9i/vkVAfF7FZPCik42S/9E3ul8g7iyO8JB6D4hNHNuJRO8eDf/MUnQswNaWE00EjLXYtkN6sk4Bl1ddkhdw+egIjTIF/RIaBh0MqaCF5froWKNZ07gayU39ZytWEiOyJkpMTx2NfGRDtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246698; c=relaxed/simple;
	bh=Zj78uDHcvfBFj43qii8vSorB9e8lxLSy2WRM2Cwuzxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHAjvMP26HT+Ag2AN1Chc15hk7/AxiXlrpgnEF5nyFrkt+71qxUfyhHVO1vvotZJSkm+Q3Cr+xEgFZHLWys4kZVwFOzgvinc9q9i7cDB5EG+82unwI/cLrMrrInhknCfc0l9yUsmKbQ41Z/FgzzoAXUH5psrKEUKBg4/pSU1m6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ge4mEeHu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiArPAT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPSKF4095621
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmcZhBjars4zjcHPa/pL2zw7kJTeYDk3S1p+LVr9T3k=; b=ge4mEeHupeeoyP7Q
	LPAd6T6is4KfbjK7PyBS6TNFZm02bmfbxEqTu+kkvLLENw3r/9+XOmHEhY33gsg+
	MAU7xdEJBvkW6KYvhww+ALTG4xIBDxb3tLrgCxPKxOBJ2hTuxvgo3FjU4aLIq8kF
	eP27XmNCurdVWZxZ9/t+0Z5MfRJUsjf3xGK1Mad58J6UzK6CrilJj272C0qfDcy+
	DAKPpyVzMy/GVwPXIheXovI3zepWc02yiY24J3cOWZvQlg6D84KBcUOpW1QL1haD
	T2GBNCypgsCxgQFjFA95SXpbUpSOygvrcTR4hYBqTJ7Xv9yho27qu7K4qKzCxNaC
	QTgTKw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux0vyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:04:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c904a1168so5530371a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766246695; x=1766851495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmcZhBjars4zjcHPa/pL2zw7kJTeYDk3S1p+LVr9T3k=;
        b=NiArPAT0arzYyn9N9LinBhxAORgJHbWPKkQie96AU4co5SR/6ByE3qpzIpiGIOOLDf
         LqeMJeNCOS+0CljizVPcM7WegQIEqqFCpiN68aud/VgC4hCKuxdQCTWAmqfdiEEiQ8/a
         Yf4Rnwq+b/DuW23Q/V+LTWLzNRQz7b2zVa8YqoiVo9mMOkP+x262jScnhoMrZDm9fOxg
         w4Op7n+ljUIT8e/Bv7mAEunAqZ+nEvG1wczlypsbEQgscId+tNUvalvjsTIngaPmhwYt
         tXtjmj50B3puTUU6++ETDl0CQ3aZl+WmmpzHC4K2p6IUeNdXHZAIhVPmCOMpQwLCooqa
         e6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766246695; x=1766851495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmcZhBjars4zjcHPa/pL2zw7kJTeYDk3S1p+LVr9T3k=;
        b=s424deuPhpwRHMjswvb8jKx0iKVu9FnHt2vcWF19TcxweHMlJJBGB1p4+thpT2xgKD
         crwnhofnWfn3YlRpK8c3ByHvkQ72clYUfv4lsitosThHWJBj4JBp0LOHieQOEIK/JFHA
         I0tuS3jOjSYZ0NoiquVd34MT21YIaia+s3KvITJzQ8JF8VEplTOKEs0p+ZfHpWWHxtNu
         TV/54X7R37oSzXuiaJ9PdQXSDMV2dzEkV7EBumBJhQx4D07cHhYyxRNp4WFjJr+fKUQW
         NiH98mkeQwrwoAOp6xjfJu6tNJ10IRJz7Xn9BF7gfGYL2Z02DJu3S1XO+7d6dgp5STxq
         aT+w==
X-Gm-Message-State: AOJu0YxMX67GxgoCaATCIM1AvcuzUlGvzqlFXU4JNF5vpLkKWR5NUe/A
	crL8jahJZPVoY4VbTEVOR6lVMaPFOoJe9Xv3GKe3VbRmNf817xnxjArGi8RUVzWX7RlIDKZe4RB
	nGvEzt00fb0wSVGAailjdeLDAtuIQFdYnUpso19kMaKT9CslKfkzVd2uVopRy7Oi3WeUa
X-Gm-Gg: AY/fxX7klqpgujQkuMOUVz0k8vkdynGqdTQ5HCTjmlr9x00KW0U5lJU4NNMfa01AMDf
	CK+gRw1yBMm0j3Kgs6irkk/XW0lsKJVgcLwb/qhscwgeAvr+tefuWVnzpO0w99cfHDeHURNK78V
	ip55Ay8qAE/eZLT4qVI3+cP8HWjO/7410VqvNczEyb9FiX+Ih/VKceim/wuyO/l/qLFwyiwujq4
	CEoDL/+QgBbq7ZNbliTvEQwss5skdgRRk4T8xKbZxYtb68db4c24yX47hUYh6iCdb5d+dazvK09
	Ab1T7BIBOSPiBbuiOD6sPp3VcuMUU/BL1iT4hn8QkQ106keemk1rLGq9KR0yn8Zb252VacUV1BG
	+nMA3mpVv/bt4mXJCM0lm9iiZfSDMfp5i108NqbAF
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr8505000c88.25.1766246694614;
        Sat, 20 Dec 2025 08:04:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYoKASIiDh1XJqI3CeJmoab/jilojA4jpnJzSooOYAC3DFbkpG6RKX+gYwN338b4mcKlBF2g==
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr8504956c88.25.1766246693981;
        Sat, 20 Dec 2025 08:04:53 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm22486533c88.11.2025.12.20.08.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Dec 2025 08:04:52 -0800 (PST)
Message-ID: <d23623b6-5f65-4fe7-b0ca-635e068e7c4b@oss.qualcomm.com>
Date: Sat, 20 Dec 2025 08:04:51 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
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
 <d1fb4d8a-608e-44f5-834f-fa92d487c75b@oss.qualcomm.com>
 <eff759a7-06ee-42f5-a3a6-860956d7ae84@linaro.org>
 <c2125dbf-bbef-426e-adf9-7767ad822ae1@oss.qualcomm.com>
 <2ce4e296-701a-4354-8988-87525769ccac@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <2ce4e296-701a-4354-8988-87525769ccac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RgrXRO_uOKFFqUnMcienFWfcE7XlOpdq
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6946c927 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6gem9hBlJlRA9BxbBQ8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: RgrXRO_uOKFFqUnMcienFWfcE7XlOpdq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEzOSBTYWx0ZWRfX59aYgucIgkwm
 uqrCUwSwQCFyoBoM8Dei04yH2yyX7TVh10QdCEhfaAZDK3OdxzoCtvvEZ7maPlLHY4N5pTqtIMF
 tOkg1Ay0GlW2I7DI4lTSFkPV63mliQ9W/DK6Wv+Z02nsc1MHhwrojbpVdBVg1mMRQqT13odvm0e
 fqJIAQshLq/+h6UQrc/XFSkMtgJv/j0xllXNid2VjP2+cCif8Rh88/rstC2ZoCRbRq/7JSYzuh7
 zBqs9lldTZsFu9Zn9iv0ye6GcTFea0yP/Lpr4bjBD3txKfhZIvtRhmoUY+BRG7T5pmsQwC0LCft
 GQJbBV890lcg4GfQHcRIXWFJidLODWlyhheU3uaklKKxeS3ozTSn76ubbI+oa5+G7bYuHVkjrMg
 n287PeowLZRYq8Lh7eq29ugERP8LBdn6dxcfLtBu51FF/O9W+09F/M7Otaz7EOvkdk7VBuotcKj
 9c5EcEV8UeC1wl5Xh/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200139


On 12/16/2025 7:29 PM, Bryan O'Donoghue wrote:
> On 17/12/2025 00:46, Vijay Kumar Tumati wrote:
>>> I don't understand a reason why to do worse for the upstream, when 
>>> there is
>>> a clear and feasible alternative not to do worse, thus my 
>>> misunderstanding
>>> and my grief for upstream CAMSS are my concerns.
>>>
>> Thanks for the comments, Vladimir. Bryan's and Krzysztof's argument 
>> was that the bindings are required to describe the full hardware 
>> regardless of the driver support and either way not modifiable in the 
>> future, so they preferred having the HW properties of the key 
>> functional blocks in the bindings. And we were specifically asked to 
>> add the properties into this node in this patch series. Having said 
>> that, my knowledge on how the bindings are handled upstream in the 
>> long run as the requirements evolve, is limited. So I will look for 
>> some expert advise from Bryan here as he strongly advised for these. 
>> Thanks again.
>
> I see no technical reason why describing the whole hardware block 
> precludes any further work. How could it ?
>
> Anyway, I'll repeat my ask to describe:
>
> - The full register set
> - The interconnects
> - The clocks and resets
> - The SIDs
>
> ---
> bod

Yes, it is what's been done. Assuming this thread is closed then.

Thanks,

Vijay.


