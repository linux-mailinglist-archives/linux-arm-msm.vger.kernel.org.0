Return-Path: <linux-arm-msm+bounces-93152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEKgHQ5dlGm3DAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:20:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915014BE1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AEFA3002D3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7E73358B1;
	Tue, 17 Feb 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/UYARXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+vuf4Sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425B33291D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330826; cv=none; b=BaEAdpLm0aOS0Iv71T3h6TAZnHiSymd/9LvliWWZvu3Ul464TLfOQFGlJENkyhqt7vDkwYn9b/YRLXaBKcrS7VIAJBi/eBDtdTanINsoBye2vlSPGTxZPXDI7FNWbChJb5ZVcW9VPTwsRL0zbtcH3k4AjPcRWY1vDmkiQZF5wKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330826; c=relaxed/simple;
	bh=cCrmHiZRywdx4V4Zx1woo1QsvjkGJLin3TdaYMG+u0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSLqsCH3rNglIN2BrNJrA4fKfJWsCNiCphqFmgglkyojeHq6Mn2rPgrkZahwzlB1huQBgue/kUWYp4WQlJyVGj/b9SLk9unqvOlSBOgVwWt8+3D99PTtMJ3bGfMt5UeG87tzuPQtIIGR6MVDNkZWftSAFldJAAqQCUNZc/1mvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/UYARXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+vuf4Sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAWO4n597252
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TC7ivbDQ11ZNpJ55VMezYvfuh7l/jPPDBhIV8L68b44=; b=a/UYARXF++Dcxpfo
	MIJtLL8TqRhC2BOyOv54hLX0buDtphzoBijpCAIDU+34k8rOthsAVWZtDfl8jhzB
	qA2RCFbTkXwDfVj0Eg1ys1Kzwpgk7dsc77JDi081t+C5JK1tNa8x9E02FSpweKs4
	9AlF1XkUUhpye+M9W7laRpGWa+uavltegLQva8aIbJrnuknrUCouPqYoYuxTZzZs
	J4/ewaN0QDLDtRgyWHRN1Av/EiDyt7qFkAO243esk6EeWe3xU5hl4kuykV5aKdKP
	6mVS/eXw2p9PVSnkIdeUBYnqJA692djtmq9O0eHTKwe7a+AJWIjLBt+oaxVZXtSE
	LB6/rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361rvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:20:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50698374e33so39904781cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771330823; x=1771935623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TC7ivbDQ11ZNpJ55VMezYvfuh7l/jPPDBhIV8L68b44=;
        b=a+vuf4SbUB0nod302kayfb8kNJNzhx1KtQ6j5l49jPF3WV+fc+dtI5zYWR8Wf60867
         9guXtw+UQQSIgsstXgNZ7dcbG2YDGj9z0+8btrw/IwLv15NGglW4mGH2RLD74OQQl78Y
         RNaAHqqse9+Y5nvndIt7qrduXR7zbiW9ASjkDGrwrmZEb2ZLWQ82YxOQbNs/hcTylhyT
         B5+Lcz9+OR78KkvhARZ5lPKCww0uN/cRFI6jkSQyHeUDh+k73kiaYAuLpQgFTxJLcW+4
         UOFO3euuyLE7vGENZ52GL+NA+sO5uL8CsTFVf+EhtaiY4pcA6IQh2vulos2ryhp4gPPX
         R9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330823; x=1771935623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TC7ivbDQ11ZNpJ55VMezYvfuh7l/jPPDBhIV8L68b44=;
        b=laUcMidPWcrH/P1qLw32yl98ogPuMESdbODjGwIDhvAjRyoQzfxOBPtS9R2Sw3hLto
         g5E7k7NWJK9DQ4BpvAE3OmDaHeRSPPpSYpodiK38rw7InWUsxtTFP2vkxxAxuEjasB+N
         VlENYYDljJb8q3/bnqL0EtPXqvU6IEtsGwA82pTsIu1+/pQFFJ7BIqcBurrpaE2JgMY+
         RFpwD8WKfp6Y1+ZJ80Mr9OiACfSS/BWuT6wb+cHOP0OtCzkFpcsrJEd77WvoUvkgrcjM
         sTkd9gWM5h6fm6uFXa3zTmMCazoiFg1cS10x4SHymtw3B7q8zfN0L4CV9Gzjk9KRKdiK
         mktg==
X-Forwarded-Encrypted: i=1; AJvYcCUGsb6LHOxFNsn3EAOW5RjYlUW2IYrhOaq1dENulossO8EUnDcyD+9aY+i8aJsdWbHy5Zauli9T9x1BjAxR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7i7hKG9KIiPIalxKM9boDgYUhfxcQ7HrUUgyFmiPgZhRR9ORE
	+bdicnqwoowQzGYm2SUhMqWAfZklw7/Rv7rFRnCSihqZn+wfrIpW2fhCgfb1S8Q7aXkPBvofVJ9
	c14h4Y67oF8n0ylARyV/AtiXX3Z2UIaj7RKrIKdYM2T8LDMkfSQX6ase0jL9dXTVYrINs
X-Gm-Gg: AZuq6aJ4INw/XLYKdygjAN80HOHjbzeafvHhLim/6CsqSGazXiU3K6mnpqtyLfLRxH1
	wZZ4FzgFDrGEDC7IOisFhE7OSuv4/PsAzJPwR+FeCBJTrLbGMzHYfDHYI2WkJ8jFXaOb217Cdcg
	t4io0SFBaQhtZoBH1tskZc1FdDRdKL+u0iBrx04BezGWMqvR0GVFknUbv/LXm4L51a/zjMZmSV2
	XKslgDm+Tw1oiCkIQsevqnqiAlh0thAJ3MucQRP+nWq3UrNZulu9yy+dRoI4Ouq0axND5QwoxNu
	8sjQ4xO1kLNgdUMyhTBAN6PTWDeGQ1jpJQ93MzRy6a78BD6f3QcrJcnlH4qk3L3INMVMkfxDjkz
	VPec2/bJpV23wAZSFgcoHvgM1vnFYecyhg0TvXV5VUV1KHsmUgMskb8fYEJVVdXHiS3zbpsKcaQ
	NsPTU=
X-Received: by 2002:a05:622a:188e:b0:501:4de6:96b4 with SMTP id d75a77b69052e-506a6ad6934mr137381871cf.7.1771330822820;
        Tue, 17 Feb 2026 04:20:22 -0800 (PST)
X-Received: by 2002:a05:622a:188e:b0:501:4de6:96b4 with SMTP id d75a77b69052e-506a6ad6934mr137381601cf.7.1771330822197;
        Tue, 17 Feb 2026 04:20:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f129fsm2269934a12.29.2026.02.17.04.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:20:20 -0800 (PST)
Message-ID: <ed9a5194-356a-4c18-8ddb-c1017e87fb7b@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:20:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwMSBTYWx0ZWRfX5pnBXCTuLvZi
 GZ4VG6YPt4vff7kWUmxVFiHEBMMLVoIAzRnR5JJWcEv5zy4fXPmSO1zy/j50SQODd/Z2HbJ8lDi
 RyR1MqDYsRlxZm7+ag0WWtAOm6sN38UaLkQDX5aeKkJk5ZVlXzGw8f+OgkrPWQ17fv4d2yE3xJZ
 TLbk9NRG7/rZr0QEtzUK/9EUqWfiHuTZwDBIAnHty/hxxBqq1khNjhG1+m6ZZ3nJXmSEXRDM1VJ
 dsNcvIgkKw88YN2GU/bW5oj0MkA1chNfD/fjOutM0WNLy+rATVmlry84frc06pnf0PZOe6r5G4d
 vFsXQuNvJ0cgHN47D9TsDWjJ7+XGbjYQ6iAsK67pNdGDoAOjCY4AC65kb6LBBro0itpbaTqdbM1
 NDr4HC5U+Xjr6JyKz0+17Pr1N3j9SMqd+CZXVg+VxH/DpgIXIPzCYEfTl6R2Q7PvrqTif080oxo
 x6JWcqQhsyW2W44z9uA==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69945d08 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=a9I1boEWqR-mI_DZ9jAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ok_JFWKkrSqhW5VeA7Q8Tc8n8IzkPyWp
X-Proofpoint-ORIG-GUID: ok_JFWKkrSqhW5VeA7Q8Tc8n8IzkPyWp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93152-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,bootlin.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9915014BE1B
X-Rspamd-Action: no action

On 2/17/26 8:40 AM, Dikshita Agarwal wrote:
> 
> 
> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
>> On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
>>>
>>>
>>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>>>
>>>>>
>>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>>>>> 'firmware-name' property.
>>>>>>>>>
>>>>>>>>> Based on this property and the availability of the referenced
>>>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>>>>> updates its platform data accordingly. Boards that do not
>>>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>>>>> automatically fall back to Gen1.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> To avoid accidental matches, I can switch to an exact filename match
>>>>>>> instead. That way, only the specific Gen2 image (for example
>>>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>>>>
>>>>>> How do you detect that for the OEM-signed firmware, which can have
>>>>>> random name?
>>>>>>
>>>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>>>>
>>>>> I Explored on suggested alternative approaches and seeing some limitation
>>>>> with the both of them:
>>>>>
>>>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>>>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>>>>> the version string. The issues with this approach :
>>>>>
>>>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>>>>
>>>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>>>>> Each SoC family uses different naming patterns in the version string.
>>>>>
>>>>> Example : For SC7280 Gen1 we currently see:
>>>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>>>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>>>>
>>>>> So the driver would need SoC‑specific string‑matching rules, which is hard
>>>>> to maintain if we are looking for a design to address all available SOCs.
>>>>
>>>> The only SoC with such distinction today is kodiak. So we can simply check:
>>>>
>>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>>>> 	hfi = gen2;
>>>
>>> Agree, this works for Kodiak. However, Dmitry was also referring to other
>>> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
>>> generic way to handle that check.
>>>
>>> Also, please note that the Kodiak Gen1 firmware uses the string
>>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
>>
>> This is not quite true. Kodiak Gen2 uses:
>>
>> $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
>> QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>>
>> A collection of versions quickly captured from what I have here (for
>> different chips, but for the overall picture):
>>
>> HFI Gen1:
>>
>> [skipping prehistorical / museum data]
>> VIDEO.VE.5.2-00023-PROD-2
>> VIDEO.VE.5.4-00059-PROD-1
>> VIDEO.VE.6.0-00055-PROD-1
>> VIDEO.IR.1.0-00005-PROD-4
>> VIDEO.VPU.1.0-00119-PROD-2
>> video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
>> video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
>> video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
>> video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
>>
>>
>> HFI Gen2:
>> vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
>> vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
>> vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
>> vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
>> vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
>> video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
>> video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>> video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
>> video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
>>
>> It seems we can assume that Gen2 is:
>> - vfw-0
>> - vfw-N.M
>> - video-firmware.N.M where N >= 2
>>
>> All other binaries are Gen1.
>>
>> Also, we don't even have to query the binary firmware blob.
>> After the firmware is started, you can read the version string from
>> smem, saving us from strstr over the firmware image.
> 
> AFAIK the video/iris firmware doesn't populates its version string into
> SMEM by default.
> 
> On venus, the version string appears in SMEM only once the driver
> explicitly writes it after receiving the version info from the firmware as
> part of an HFI response.
> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L289
> 
> 
> Iris does not implement this SMEM population path today, and the firmware
> itself does not publish its version into SMEM automatically. Because of
> that, reading the version from SMEM is not currently possible for iris.
> 
> Also, relying on HFI to retrieve the version is not viable for detection
> because we cannot issue a protocol‑specific HFI command until we already
> know which HFI generation (Gen1 or Gen2) the currently loaded firmware
> supports.
> 
> Due to these constraints, I think, the only possible way is to extract the
> version from the firmware binary blob itself.

Looks like both gens use the same iris_hfi_queue_write() logic for issuing
packets and they both use the largely common iris_hfi_queue_dbg_read() logic

So, knowing that e.g. HFI_CMD_SYS_INIT (0x10001) and HFI_CMD_INIT (0x01000001)
seem not to conflict, we should be able to issue say a gen1 command and check
if we get a timeout, no?

Konrad

