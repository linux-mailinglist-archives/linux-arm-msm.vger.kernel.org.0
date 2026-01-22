Return-Path: <linux-arm-msm+bounces-90142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BsdBgjqcWl6ZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:12:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E98F0644C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE1E25030F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507C4354AF6;
	Thu, 22 Jan 2026 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ru4bBBOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzH6DqD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025834A3D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072593; cv=none; b=HPE1by//QJEoaXcYdnEkOLlB8/Bi9nzpOSdnwAE18FFBWJ1kVkdNhAle74VWHfCXz6pyq8TiNgDodTvTouejyt89HmRGiFShcvyNi6sxhIXt7sB8MziMV0paG3imWlWYD4WSrqqE1A98cLGursUOs599vR1DYiRIxKxBsdueFRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072593; c=relaxed/simple;
	bh=2Hrv+j1tWU8YnEBQngovvIVQoz6lKZdMV2tctghYn4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RteaZZwYwkg/fjMjzblREB5T/hk5M2eol0HlLHNYVKHiZpW6nFGXlJHys8YnnbpU03vhA4wcHP1H4jvN88In9MD1DXe3AUaxAF8hpdHMTw3w1pO0YEsXYMTW5hMNhs7hYedDPn+xnA145RTExamWb1KidigxfgJJpajacbFBhlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ru4bBBOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzH6DqD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6rrZX725891
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwwrGrKrcG1G62yRGUdibMxWjeG3sF/NPoAYvMYnMDk=; b=Ru4bBBOn99KE9MnK
	9dTMH3Wz7NgPcS++FYNCT+9T5OXRanrNdhFJAFQ+SjX1aVAeQIJzpcm+DdsaqX5m
	EBu5H/WbBvyHAWQMqxtJVwFy8+6K87PvRQGiYonOgi3EBvqki4o8O23nD64QbYBH
	3YcjfKq7RuVzCMK4B8q41suKA801uDhT2sjuseEFOQXbmFBfPTJb+5hiWdO0bQT+
	g767do/1dGEKbKEPRUEFs8o1C2CyPK1sW7k+y1C5wFGNAKXMT1JSpEAAydIw7TUz
	xWdJFPV6Mw1bTSjRlDIKO23LPFkOl7wS/qMtK7SIK159BeSMsNNymXa2wDXn5jIf
	Rungog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgc86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:03:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53892a195so18673085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769072590; x=1769677390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwwrGrKrcG1G62yRGUdibMxWjeG3sF/NPoAYvMYnMDk=;
        b=QzH6DqD3jJuq0f/FU/J9yJ0d25JHPI87ZCV/1s8dB4Hg3tfs7BesF+2UnvDKA4IA47
         lxAXQbJsvzeG8QNRvVZuYSl4flKf+KyIWfe/BaAErQCNOpsRqIQDDAjCMbSa0MQgX7hI
         Cqmg6BOqhqYILSUTmjjmzZvc21U1Dh67jenjapxdcGKHAK9W6qfIT7BnQg58ggcdpEJv
         +PlcCwHTQFVnANOle2SFt+7oWmIgTYOYfGEnQBvS33IOBlsY4nIe9fJiRmNgxyMQKvE4
         /2HyjjRKfaVCna2xTKP0VRwhnECBFM4Ros9Leg8RtVRu4ZOG3s/4UQsC+5q1A5ams/87
         yvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072590; x=1769677390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwwrGrKrcG1G62yRGUdibMxWjeG3sF/NPoAYvMYnMDk=;
        b=BsGuyFyr1+Za/1Pz6m9AaNHTebcb3X5KDhsf6VMU53tRQUsbfg2ToUVIp0ohquE/hs
         NDF6klh1dts45i37xqnoEhJclntjrEtfH6Uzu2UaQ1auHhG/GAmoqtzaLlBzWD5Ls/9b
         vweVK1d1q21Rp7VpRMYS7l9QhuZYV7wRdFxI5rTg1043zLatAP+0hlJfnxgYvpxfYUZ7
         ckrps39YjqclYCOYe1A8dw+eSooa7I8Ro3j+DZRJlzJtNbRoSPtcS/9jNvUnkaUsxpFv
         8GA0ZaAeIG16Lnsx8K6uU8eaitZptzWRNZ+pALuRu38E2hZjvYRLBLXkYrAwYIJQDim4
         2i1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIUrOakpm7soIqH4fpk9vrqpg34cp4wbnqhTRgyGviMYEwhsjloCATb+swWNodf0mRFIQVZCUIYunO0ZEI@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnAdJxYH5wRvzmFFOBG4VKj/jNqE9JCbP9yPd89pz0q4RYUoK
	m9nqIew92rM+R5OuRk1D8CssxNys7zXovvFLPwzUukyB7gccmitQfvmxxCrk3NLDxg8YsAlrP/j
	7qCXDEzhqmDfQ/02tot/UKSrgkS/lYrNW0PMF2XoYiKQZkJyzD+FMsqxeXcAWlc1SxyX2
X-Gm-Gg: AZuq6aL6oevPGHR5zEUV+SN1LfVLqkd6oGbqlTYhHv2WQYCfcCpYSvK+UMNcDJlq5zX
	7OMbuq5HIP0d9xNAMgT7nGExGdtdmVJptASpi682OlFvH9L07ECdp8L6ab29oVq68QmVsveX4oD
	nUUBRy4dnJan71QSJAm5meKwQfQuo6gPwXMWl739eoP3Xvzgih/MrxDx/A9P3KFVffUomTMGs7g
	r5QTIZXrK8BGeV9QG3QDoy+NxVBJPKkcgsR9NmML9owGFAETwWGzE256Jb3Z6/jjHZ9USu2C6+i
	qYl+zfEpqwmvM+aXPeraYyCgt98G6aqmotH1MryUbKbmIEXj6PtWwen78B/3Q7wbLLdqgoO67Vh
	c2ym0c5+0AaLW3SysQTOY14Kr5NSOvKfu23XHPehkOWSVMKWLoYHMb3OVEuvctNZOfbw=
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6dafed670mr212637685a.10.1769072589815;
        Thu, 22 Jan 2026 01:03:09 -0800 (PST)
X-Received: by 2002:a05:620a:1920:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6dafed670mr212634185a.10.1769072589243;
        Thu, 22 Jan 2026 01:03:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879cd85b55sm1586206166b.21.2026.01.22.01.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 01:03:08 -0800 (PST)
Message-ID: <e65fa35b-44dd-44c7-bda9-0e1ff5fd745a@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:03:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
 <5c54dffe-f8eb-4b45-97b0-512a9658c212@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c54dffe-f8eb-4b45-97b0-512a9658c212@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mVMtllPTqc7Jsw-2NkkPP8Dtl7_3CvnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2MSBTYWx0ZWRfXwF63mRBwkS+z
 7bKQNltChPTE2nBcvIR+YT7rIQBNA9pVekwIp2NmbgEKNQ9LHpktjKFnOUVAm+mE21rrCxBwUxz
 6dqAO0nHtAYsbBF/joQrNLVDyI1jO/DnUy4iIh8E+qnS2MZkOX4Wm+mg+/cQMZNdfwMxPEK7k3g
 ep7SLINIva4jURym3YkpcosZYT5TgacDuhfVjFHe0DzLqnmhzh2f020OzmFKzGUPtxsAWsgiGZ9
 bQ3a1nT9TgWwJ9hQHnNuSaPmdcrfHVZhawxy82K1u/yTqO7kOj0f7QTXBYqQK7saBDSkjBfpJnL
 e2GfrZQ5IC5JBk/Z/1m1o2g/dwlnEAlZVAjdzwiJwluNKfyTFXVV1V5jBUqvIIlyvWiZohNzbn7
 cBrjQCUzm/ism+DJLgZDzCPs56p54tQia0r2lRl6eT2SjHWq79sUmeCXWKccOG8youSUmtSKkUq
 /KDn1r46WVCpR4V/7jA==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=6971e7ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=hk5onNUDdM5l80mYchIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mVMtllPTqc7Jsw-2NkkPP8Dtl7_3CvnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90142-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:dkim,outlook.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E98F0644C0
X-Rspamd-Action: no action

On 1/22/26 9:38 AM, Neil Armstrong wrote:
> On 1/22/26 02:30, Dmitry Baryshkov wrote:
>> On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
>>> From: KancyJoe <kancy2333@outlook.com>
>>>
>>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>>
>>> The design is similar to a phone wihout the modem, the game control
>>> is handled via a standalone controller connected to a PCIe USB
>>> controller.
>>>
>>> Display support will be added in a second time.
>>>
>>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
>>>   drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
>>>   4 files changed, 1449 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 6f34d5ed331c..1ba29755e5ba 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8550-mtp.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-qrd.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-samsung-q5q.dtb
>>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8550-sony-xperia-yodo-pdx234.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)    += sm8650-ayaneo-pocket-s2.dtb
>>>     sm8650-hdk-display-card-dtbs    := sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
>>>   diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>>> new file mode 100644
>>> index 000000000000..141d92933957
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>>> +
>>> +&i2c3 {
>>
>> clock-frequency?
> 
> We never did so far we we didn't need more than 100KHz

Let's at least make it explicit then

If you have the original vendor firwmare, you can read back some
registers to know what they're set to

Konrad

