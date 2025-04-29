Return-Path: <linux-arm-msm+bounces-56061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37280AA066E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B1787AFC84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115BA29DB95;
	Tue, 29 Apr 2025 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHycyrzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABFB29116B
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917218; cv=none; b=QBll9jGYtUkT64HRf8WHtR5IrMQjcV2/RfvgelrkhKZ40GWuTA8228dEVcZQ+dZbChd1J6nclPKRkePjauUYLhIq4E00jTpDQhxOYYwh5erhVtirJ6t/swU39urBTtkgNWrLb/5KoKSyxLRd7YB32/tfgSaJTS8/IIahiBBrRNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917218; c=relaxed/simple;
	bh=mYwV9qaC5quGigoNDzErPL97AxB0Z1lobQFByQD2FZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hq6CpUv5DjwOFgpRw01jwk6eTuO+vU58gHzC5kNCz8aiqHiOUr8BpnZS16lATGt5+nMB/8hwTJhEzJYr2aQq9YY1MRNJ8r6F4hT7uX4OOln+8PYkvuVAXZ+LFb6iYi6B7gS50YSXeUYWPcM1x180IFDFSF6cPF1Se80c9QOuz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHycyrzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqQpd001925
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqDGdfO9/jWDyry3sjZsFjxW+nnt4/iR1gA9efn55k8=; b=JHycyrzi4i3ApBuc
	31HQXK2oDNvxJ4SHzcea+VSjsiKuOh6XnUnuVU0NSB9G7G4PWnaoow/X8X+/v8JI
	a+e3N4z51LMQvSD0wBJVsjEJb0ZNuxMFXe2nB+h6KmEX+vZs35oktuv+JFGd+wzO
	RXbTekqBjlinpqhKMpCIG3MjhVtpILlI9lLl0ho/lOLvVaIFhkgF67WGtl2gPcji
	VfDwmXVWoHIM6FuFNKcsY5lmWxXrEDHeP9lQ0wczsa0+xXpnqT9fbzQF/INJgV3T
	Rr7RSKrd8lezM+BIxvGnAXZ2td3lEbBXHzwdpelMJahwDv/V5G9tia/T7jbSGw/j
	17iOSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5k2ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 09:00:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47ae537a9d6so8029221cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 02:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917214; x=1746522014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqDGdfO9/jWDyry3sjZsFjxW+nnt4/iR1gA9efn55k8=;
        b=jQI7D1mM7Di5kA4lmYsX9TqtjPj7P5uZmtxhU/hhj6U0Rxnf7g6w1vWURPdEQ7akVg
         YvIa2K1R7rP66yT+8nhqsfgDqLOAWwqpuujNK+XAGNounAd/E3p2o+HyK1vNJGBb+4Jw
         yY7J8FNq1FyKtiPTAcPcBUZ2+cv2wuwfzP98NP/619Kvrx3wXj4q59YyyYAbXZxndHK/
         txE4i9Vw5E1BZkPDzMZDO8YkrcTYuCSIdeefWjjHb6euQadjB6hQ/oyNAcn2u6VE61ca
         IzeeuoLIipq1UWX7b/Gb9L7HFz3CscHl3ls4Z9vCwD+lNyvmCXVRuAouM1U7KY52//ww
         xlcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3IQwDIFSFN86kiF1EXTjyK6Ix5gGV1xZjgrgRV/Y0vHxQm904yrRcPTKpyqIcUGApVcLMV09r638kgSP2@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJ+f+dt9zdLvqTVrlzcxrfwkzA43ShDwRp1uAyVgrB4tGEIw1
	J+oV9fNpJtVSpw5RT2T/eBkP3wxNXxAQ7ub7ZPTahF3EQksw96UDoXNDn+qc30Q/qCNVmXQG8Wo
	mIax9JsyhpkUBVtqFGAkS0+s0Wgiv2VsTuafU9grO28/WOrrI2e8ZK2SqncqNXrHV
X-Gm-Gg: ASbGncvR9iBPR2yFuVyvcqVDoXYz6e3teua1TgIaqHo/YUc3QOkWuhnOclxRDs/ASIO
	XFlOK3GZnCwdUtIzQlBAfJUwtC1S9yi63nNCeE+t9laCaKT4ekRU0Ig3IgkPEpFOUahROUg368z
	BTmFyJ0Ipw1i/fqyrHDnEV4jvTWa2I3r+xfGQFR/7BJZp+1jVoNr5ha4Y50782nCK0/5td1J77m
	DHNqQy5ii5P8TCw5hWv8o6dGOJapfqcjJfTXuhS3kxIUql3v9MZTUmDByA6AY36tjEA4cqpzMgh
	fuQg0L1jX1PDyPbXUJGACid2nGVCehT+To9kPACIHAqev76rMBqJYjhEPDvLhIzozg==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr13381391cf.7.1745917213867;
        Tue, 29 Apr 2025 02:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoe3LY+sQejWrjRsXICpmmof+c3/tmw3k1mD2dd7DkiBAR+7Wx53r3CiWHkEswrPutog4ATQ==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr13380991cf.7.1745917213331;
        Tue, 29 Apr 2025 02:00:13 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4fb5ecsm747910666b.71.2025.04.29.02.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:00:12 -0700 (PDT)
Message-ID: <a1b7d6f9-13bc-49ed-bc4c-40f4c2fae8e2@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 11:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
 <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
 <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>
 <D9IZWD6MS7A4.3FJ3UI3CG92OM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9IZWD6MS7A4.3FJ3UI3CG92OM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lzkrM6fg0eGVSBlcyuxWjwG1O_9LDyXT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfX628nMkAZq2WX i8tNLI55+PwEz/rZFJutfO9vgUVnseZDcpJSCOm9EFSzW1Brgk49D5FSur1peA2dNo4WAzpq2Lc 73n1+P2tjoOCmhwJzuEVBIVa0srXOIfu0aQidZ+w46mJgWAi3z1AbLf4pbLeIWqbfY3FnTGyTuo
 Cojwrv8MA4tevVmRxC/DDjAxfyE4E9CFQN3XjXEzztkXbmSPhP2WcsS6tpAKzXIUi79leV32cnl VHLNwOF+lAODeqCZsuyakl/B1HzGceCmCb3Z/KwOfWUSe/L1JsRL+HlX1e2jYYE/9tdD595RTaP RNqMGzlex9/8Y+ASDQ/9bsxeJyxREe8USv9sIgPJMbDYQyQj40tAUYz4NVwaVPcKwOO/W9+AGK7
 M4YHXe4k2sbagdURNdhOxdwd9bNFF1ZSQuZoorBQdC+85kZcE8JskqCUcrpw/VopoczYm04t
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=6810951f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=Iso9NqdAnq4PZ9IQp5IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: lzkrM6fg0eGVSBlcyuxWjwG1O_9LDyXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290066

On 4/29/25 10:55 AM, Luca Weiss wrote:
> On Mon Apr 28, 2025 at 11:43 PM CEST, Konrad Dybcio wrote:
>> On 4/28/25 9:41 AM, Luca Weiss wrote:
>>> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>>>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>>>> Enable USB audio offloading which allows to play audio via a USB-C
>>>>> headset with lower power consumption and enabling some other features.
>>>>>
>>>>> This can be used like the following:
>>>>>
>>>>>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>>>>>   $ aplay --device=plughw:0,0 test.wav
>>>>>
>>>>> Compared to regular playback to the USB sound card no interrupts should
>>>>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>>>>> be handling the playback.
>>>>
>>>> "should" isn't very optimistic - I assume this works for you? > 
>>>
>>> Yes it does!
>>>
>>> With 'should' I meant to describe the expected behavior from using this
>>> since most people are probably not familiar with how this works.
>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>
>> [...]
>>
>>>>>  &usb_1_dwc3 {
>>>>>  	maximum-speed = "super-speed";
>>>>>  	dr_mode = "otg";
>>>>> +	num-hc-interrupters = /bits/ 16 <3>;
>>>> Where does this number come from?
>>>
>>> I'm honestly not 100% sure. As far as I understand it, with
>>> 'qcom,usb-audio-intr-idx = /bits/ 16 <2>;' in the qcom,q6usb node (which
>>> I've checked against downstream) we declare which "XHCI interrupter
>>> number to use". Without the num-hc-interrupters property we get an error
>>> that not enough interrupters are available (I assume only 1 is then), so
>>> this value practically needs to be higher than the <2> from earlier.
>>>
>>> Why it's this value and not a higher value e.g. 4 I'm not really sure.
>>> Downstream code looks somewhat different and "max_interrupters" in
>>> drivers/usb/ doesn't come from a dt property. I'd need to check more in
>>> details what this code does - or maybe Wesley can help.
>>
>> I got word that it's simply hw specific - please move it over to the
>> soc dt with the value of 3
> 
> Will do, thanks for checking!
> 
> Would you have a reference how to get the correct value for it based on
> downstream or the running kernel on the hw?

3 should be reasonable for most platforms, but I don't think there's
a clear value defined downstream

Konrad

