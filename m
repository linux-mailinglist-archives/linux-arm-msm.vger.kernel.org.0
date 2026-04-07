Return-Path: <linux-arm-msm+bounces-102082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDo+Eq/N1GmtxgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:26:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2533ABE80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F03DD3031AD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBE339F184;
	Tue,  7 Apr 2026 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H22e6L5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duUPGZJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8F3A0EA2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553654; cv=none; b=qUJhbq+0Ek9VkE1BYKpawUjeYzCKCI2DToE5yRb1vTNsnuZ8lTCI11n2yZ9IOARVWmsM4aHUDd5jyVNHvs9F/2Ie/lWm9V8bBwihj4Ctt7cwH3Wzp+W5mFhyOMguvNVEFpI1bHQ5aOrdSEmvL7sxOPBBUkYhkoNyVFBCvrrr/WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553654; c=relaxed/simple;
	bh=pEu16c+A/H6Pg0otjLJ2Tyd8Atc4eYkdXFmf//qek+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMqlsXP7PayAJaanKZZu6iWIPolrDMaU8UN/i17WDumtzJ4M0N+15bL+JZPev6gS+k9SLakWCX1CpwXZ/B3JFPMxVppb/HwgCr66lw2wywS/c57sqJloYkVeAmkKlw1te92e1/+Z2iO4kWFYIUrMU7FP4tMmjC2UnxdsBx5A3AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H22e6L5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duUPGZJf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Uwde3536859
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/ZDRgQ+AUJzZ8v6E4SgrJITD75bOcPxTbFtJLWmbss=; b=H22e6L5sExumZy7s
	6wrGg966cYyONuL80MG6D1iCQDXsfPBIjlUKD01T2csQkhGt2+XNRIRk0AkvDhBb
	qEvbA0XuFDVrwnHdMg6xDwvfjv+OBi2dMlscesVaxD03l1Tl56EQoyHPc2cSwU4n
	h6OYXWVHKMkRtuPZf9y9KzEFkbiAufl9QEMYrMpF63Dc+ZiQZZtPmDRzsK43aBv+
	eSesLZGmGUn5sKxMv8/mdrLWnsdSHkj+cwGhBIUfP98ZvXm+SmPyEYJ4hR7cdAKt
	J2jRWDeVMVDQEuBhr12pZbizlE3UWmo5TrV0ZytzYklSM8Q5WEfLwTvAwIwL/64H
	xIeApg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra218s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:20:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ccb129547so16678066d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775553651; x=1776158451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/ZDRgQ+AUJzZ8v6E4SgrJITD75bOcPxTbFtJLWmbss=;
        b=duUPGZJfmHxQXful4t4tbYigvdYdqKwCg3gEa0wrREso20br3AQKcybSotjeZJWJAa
         qEnYeD7m6amWnJr2Ws4Bf4BynLmHYaMMYvvG4jigWEhEEP1iqYYLmH7YT6A4/C/qqWu6
         xA4GB1wYUj//G+Zk6F5WpAqy+QTZJWinf8+b45wZRytmqwuw72TVePN31UmRPM8h7wiz
         N/wf1S9kUixzZqev+kLUEPrGV7uxT9uzDeBKzUfD9epjCqZNczGnwFkwbO0wV77rDMXy
         vruMMFVJsg/k61BUl+z1y8MTRHZr7/EnqGt0Y1TDUHKyPsvQASzZT9clFQp9+zhUf91C
         mZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553651; x=1776158451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/ZDRgQ+AUJzZ8v6E4SgrJITD75bOcPxTbFtJLWmbss=;
        b=WboKx93gtW+UenQzwoaFxHXVgQblLoG963xT053c+E8Hs7J/zWw1Dznp9GXVQgC1YX
         giJIWj6CNj71/uDUUx4ANUuclmq4QqyoemQowdWy97KFNPYqeSMtkLMJMeXfcj8L9N87
         7xLTTcB+PEHgPEBj7HqGSvTv51YGWUrBvL8ISMWGpBlDtL8xisFpSbjpogcDNOHDO39A
         K1GEfLSBdfHLlctgmPHne4KtwYhK9se1mNCXCq2jk0b8thQFB7I1pmRbvpqT7QxN2MFr
         2l9itoTbfSxNQ9Mvj5GrjqwdyyvHgOHNBTx1Lh5etcmYQSm9kQI0kpRPt1UY0HSk3PeF
         5ZWw==
X-Forwarded-Encrypted: i=1; AJvYcCWZyN5z8woxAZERUriTY5Q/n+Ou3WW3UJ8zJpIAu06JsxzaeZ8onPZeMzALyPneUIpv2O2CZ5Cij6tY0ugW@vger.kernel.org
X-Gm-Message-State: AOJu0YymaDxzTxJKFPnky3BawHAmhPjrzNmXpj1oKDnx0eGDdgWNIwLG
	X9DL5iRT4PxIFoX5/9LNDMqiSbCu04nAGTPLLa+gEod4CC42wirxR8YADmLnF2FWKsiZ01jQf6o
	nNZgP8JAIrWp8oLho0qeq7SXGySSg6NapT1ITYD0KR/rL0CF5ItwGwQExc4exkuIwxNiF
X-Gm-Gg: AeBDieuTZ+G7gUNOL6a5KAYEdygJob4XR422j7GTDFGZplf5PDpSvl4au3gYSS7mRer
	nCJuxGcq35m+nRvQY37dkhye95AF5v7spR8ZIr6wm/8mtz2JtENnBEecfjIQ1rIDyQ9zKkYglm9
	Uq/1botD0r6/vYx/zDMVUsDwJjef/iBCb++7phaX2T1G0q4S7oVEy6IrpEFFnmQZ/Rpio/mpig3
	RuaSLYCbvArHxn1Vw8fwjpmsdm9txmj57V+aaZhrKqBfIK4YwRaZnH/VbEhMUQHOqlXEN4T2QpV
	nG+HJhDH1bnoLAj/tNte+uy/3gDpV3w4raj6RtsVRm6tDgs8HZQvt/W/RCOjrHtAX4F07cAEKz0
	RnIwOfd56BowQogEupdRK7oKWGPr6DfyKBR7e3Qgl2KPWqAgs7LkCL0irOtutTsytsISlNLW2G3
	vX+tE=
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr189196066d6.1.1775553651036;
        Tue, 07 Apr 2026 02:20:51 -0700 (PDT)
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr189195956d6.1.1775553650606;
        Tue, 07 Apr 2026 02:20:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c971f03sm540365466b.7.2026.04.07.02.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:20:49 -0700 (PDT)
Message-ID: <3f592ea9-b017-4191-af3c-0ccac54b4aae@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:20:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com>
 <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com>
 <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
 <CALHNRZ9ZiENcXJn7SKuAoDWoBbuxWuOktBDF7FZob6xFH8A3=A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ9ZiENcXJn7SKuAoDWoBbuxWuOktBDF7FZob6xFH8A3=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IWc0pYqFXIw_IIKNtrkRgvx1HL-gVjyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NiBTYWx0ZWRfX408JIeMy7HSl
 l4I99KsGFnOrR8r5hfsP5Axb4UepopJO2xTlri1peSge38nlwsYhHFbEMPnjWYmI4xzhxP5OUue
 yA56C1IlQqhZUIzUkzBzZAoPS3vtnZg05tGKAKIw7AbAfrzKORKhHJWH3jff+YjZ4xGNcN1satk
 CW+vJ4r5JUaa/LIBlakFNdVQr0lKIWtLp8OUw5GAiW2miXBlOM6FsLMiVVWitebAdE2SUn6TS6d
 w6VtMY19KYUZrb1x+agDSCPDfTKBJ3mwMPZWDEImizjaUO7Trn16QOiVt42F+ybo0QdbzZQd3fc
 xI21NofOZ+fMsg+hIPW2yidaf0wt+isA5POxKU/R/OuBPEwjlPZhRNtzO0cO/UQRcJ3OUgkrtdJ
 ZE9APDovevuBvcbvPJ5jsOC1PuixatrqHXe/PxiIjx9W9nuSdGl/2qrSIIXUGUae0DCQcXDSNSr
 +8wlH98Dw3cXW93K1kg==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4cc74 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=pmcFvTqPr6nAQrvBQnMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: IWc0pYqFXIw_IIKNtrkRgvx1HL-gVjyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-102082-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sobir.in:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA2533ABE80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 12:04 AM, Aaron Kling wrote:
> On Mon, Mar 30, 2026 at 6:32 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Mon, Mar 30, 2026 at 01:00:55PM +0200, Konrad Dybcio wrote:
>>> On 3/27/26 10:26 PM, Aaron Kling wrote:
>>>> On Tue, Mar 24, 2026 at 7:36 AM Konrad Dybcio
>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>
>>>>> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
>>>>>> From: Teguh Sobirin <teguh@sobir.in>
>>>>>>
>>>>>> This contains everything common between the AYN QCS8550 devices. It will
>>>>>> be included by device specific dts'.
>>>>>>
>>>>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>>>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +     sound {
>>>>>> +             compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
>>>>>> +             pinctrl-0 = <&lpi_i2s3_active>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +
>>>>>> +             model = "AYN-Odin2";
>>>>>
>>>>> Is this enough of a distinction? Do you need to make any changes to the
>>>>> one with a HDMI bridge to get HDMI audio?
>>>>
>>>> After this quesstion, I tried to verify hdmi and am unable to even get
>>>> the connector to come up. The lt8912b driver complains that the
>>>> connector doesn't support edid read.
>>
>> Looking at the driver, please drop lt8912_bridge_edid_read(),
>> lt8912_bridge_detect() and lt->bridge.ops assignment. Those bits are
>> lame and useless.
>>
>>> Which per the current connector
>>>> node is correct, none of the devices list a ddc node. I am trying to
>>>> investigate this further, but vendor source release unfortunately
>>>> appears to be missing pieces related to this. And no other current
>>>> qcom device uses this bridge to take a guess at which controller the
>>>> ddc is on.
>>>
>>> Go through the I2C buses that are enabled on the vendor kernel and try
>>> inspecting them with toos like i2cdetect
>>
>> I'd second this suggestion. The chip doesn't support EDID reading, so it
>> is (hopefully) handled via some existing bus. Does downstream handle
>> EDID / HDMI at all?
> 
> I have been unable to get the stock OS to display anything on hdmi at
> all. The downstream kernel reports the head as DSI, and is hardcoded
> to a 1920x1080 mode in the kernel dt. We have been unable to find any
> kernel handling of this bridge at all for downstream, in the source
> release or the prebuilt kernel shipped with the stock OS. Best I can
> tell, they just hardcode the one mode and nothing else will work.
> There are reports of hdmi audio working, though; which I'm not sure
> how if the bridge has no kernel driver at all.
> 
> All i2c nodes used by downstream are already enabled. And when an hdmi
> cable is plugged in, I never see the ddc address, 0x50 if I understand
> correctly, show up on any of them. I tried enabling other i2c nodes to
> check if anything shows up on them, but that causes kernel panics
> during boot and without uart, I can't see why.
> 
> This all seems rather broken, perhaps by odm design. Given this state,
> should I just drop all references to hdmi and leave a comment in the
> dts where the bridge should be to explain why?

That's definitely better than describing (for all we know) broken hw

We can always come back to that if a fix is found

Konrad

