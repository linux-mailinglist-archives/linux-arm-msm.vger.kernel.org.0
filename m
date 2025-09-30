Return-Path: <linux-arm-msm+bounces-75585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83DBACC60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC72188E3FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 12:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73512F7AB9;
	Tue, 30 Sep 2025 12:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaoRTpuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD692853EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759234006; cv=none; b=dUP2DMMWbdBJDpQjro8w1MGJZlFblUExTBQnag/AzIXqpXoqjka++xHbv88AM8HvF+InGH1CXb+soIkQ2tRcC6ZeBLJn5i/8Oa0i1kwIByg76jxAqNqXL6YzM9CbNhtfn/sgD6R3nqYE9EvlXV/jT/xWJX+9ASISClt+H/PyDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759234006; c=relaxed/simple;
	bh=kTN82QZE1YVf3HwRi95Em/EAWrMW/V8K6a1OaEPGfc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfVgO8NRqawwc00TwrG77EhKTkxK9o30rQtVmfNdtT7eNBeoODiOuFYGLKjmSOXHEEKICExvhaKWtbgWkyU8/E5bdPhNr0o1SE4qKulSuHvjXWceG8Wkz8620xGtoGjneFceIY33+Omuf71zMI0fJh3cpbIZ4PO4HGeVBJ5QFDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaoRTpuk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBvwSh010703
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkaBsegfjzyeBh8oOxCHkshGj1/Y5QRA9G6enyBN7ZI=; b=iaoRTpukXHuTeq3S
	WLKzIuWPnKgcExCUnR1/FE/rtI4GSCTocagt+tSpSP5xWZuIJ89ohsASpQbu0Po4
	wh9QAIzmHjyDDYOI5YmDH8XbeEwcGKO9RaZFHMgW2Ce4B0Y90UdRX4L6ipdcH5v/
	IOoPXA7Ju/MEWkKFMP2ANKt9OWGNADLETSx1k3wCFGwODocFPE+GYb2WRHT14z21
	nuCg6nxnlHJavri9aAhtp7BNjwFUwNd3fNtRznewsRtqWMXpE8onEQ1M3wC6M0E6
	XVPmX8UD5C2SkX+df4Q80a5ZnEt8QoKyVlfy+efBSDMWJmUQaszLZXDXOfWMiwmT
	mT5P4Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcs721-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 12:06:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781269a9049so6093763b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 05:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234003; x=1759838803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkaBsegfjzyeBh8oOxCHkshGj1/Y5QRA9G6enyBN7ZI=;
        b=RKYmlsfDxWmYN7D7nGAX7yX8nQMGI48WzStlo/429gEdrjzHSyoZ3/iqQ+aaGpgrWQ
         7/nZes1L4QKBKZxGN1hot5p9HmdB9XVmxfI9DD/37xbBUiWoi/U+1Qyypuch8zHZg0Lu
         jvBwFr5Fbn39WL32p9F2WP7oBEqpJXfI1SEqfdcbKfAQ8UVe98H475Qh4gLfMvbVcaC6
         eFUPXY+SAA5hxtdFdVRVZNKWfgDLoTeTD63NnkLXa3r5P7vj9H8UNwLjv/PVoJlECNjs
         Ki3UDI3DAZXQotkrLOsuZ7oslsjgHVRopPLimCSBoQF6/ppEJ1I3X3L2A9swICJaYICP
         /2kw==
X-Forwarded-Encrypted: i=1; AJvYcCWB2Hpuefm/1CA37c9ReCR9/yyx4ZIO13ZTftAcGAEEp7eqDwNyYJVFkqa1rGHh2zwQKmU8CezGXHD9a+Gm@vger.kernel.org
X-Gm-Message-State: AOJu0YzSkzGYtVE0IZVH7WYnMqEytY4Hosh2S2JRJMLeIQCtX4NGw/Iv
	OPMu0SqMlYRvRIHyB4ct1fjgkujPIj77jSsiASylYsFIHbXStS+/W1RGJRMsbQDTAyvso0zr27J
	AGwdwAm6m2owJLINtYh2HMsrQIamPUCjKnCUKFbwEGJxRGf6XgHzWos/093PM7siAZpSs
X-Gm-Gg: ASbGnct0bxp02Rn8AJ2Dh1IK/P3zOqYVRFYGLt6/WUXIuei5muKJpzFZLzqwBlLBYa8
	YD7DomZU849dTQB06eOUQ3TBEOb3iCGPKd9LKvdj9u5WFseAre24C7CkoZ4gzkEw2qr+A418AyB
	EKWv9+juI5qSaYn0+7P6YP/tkrswaF6Uq2uPxBwpPwoMRIBeHrBbFMwjJXxsjfZS/RPWs9o32BX
	orLPY0V0hpycgVGkNouoPN31F/0YsFWZCzo8akU6kwox6m1yKrJrypplddu94NJNRS8JNDH16CY
	FqxZabwGOE0rxBQ3GnixCbWUARww5WMqHPNcDYYuPHq0mTq2GWPb5ZbQ2lxAeuB7rebcuc4LQAu
	rTvc=
X-Received: by 2002:a05:6a00:3e27:b0:781:2538:bf95 with SMTP id d2e1a72fcca58-7812538c1afmr13271677b3a.10.1759234003372;
        Tue, 30 Sep 2025 05:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAWC6qZJiFW1T+hfkMFajhkKgE2qQSFj6mEYH92+MF2n+0pztInszFB0KjM2zlM/1ETInsQA==
X-Received: by 2002:a05:6a00:3e27:b0:781:2538:bf95 with SMTP id d2e1a72fcca58-7812538c1afmr13271630b3a.10.1759234002835;
        Tue, 30 Sep 2025 05:06:42 -0700 (PDT)
Received: from [10.219.49.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c07696sm13638107b3a.74.2025.09.30.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 05:06:42 -0700 (PDT)
Message-ID: <51637d37-aa5e-492a-851c-e5d6bfbe421e@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 17:36:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] arm64: dts: qcom: kaanapali-mtp: Add audio support
 (WSA8845, WCD9395, DMIC)
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-18-3fdbc4b9e1b1@oss.qualcomm.com>
 <CAJKOXPfY-CpE_aKd910PQ2+u9ux2EvuVEt9ArzhdVCJcTQJUQQ@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAJKOXPfY-CpE_aKd910PQ2+u9ux2EvuVEt9ArzhdVCJcTQJUQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dbc7d4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LNC-FtsJvgg718asVBsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: s1eBYtuIQKvvVa4Y5cZJz4VT8jp2wuPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX26Z/ocYH0emt
 +51fAOu2QjhMSjHzK8NwqF9uq7N4Ydzp1plcehblTMV/LGeHf83RpfGbEXC+774JMMCAi/cEOxU
 DulEBOIr+ssKt/0OuLe1FRUpmoCmqc370I7ukf4ROq2yL8DhRlRagrx0hJzjVKajg6+LoZqYTxt
 8o5x4wzsPxehlKk1HsSxq1T98pNhMfDSjaFoo+KPr/vzQahYKS1qPAkonnHbbRjYaz5S//SIis6
 gW5yB/2uIhAkeZzA6493BjcwJsDLo4Ww5LoA5uih/KKiV8NPJJHY+VAFdc5FUWc/1bFOfgkk/+T
 X8dQqoIghUvprPOTXXXtaPpCjnW1/wMJkqbZWb9OH9GUfeQuIBG+09FyigtCYBzL5jQErPCnYAE
 3MeW6oLRTebY16YFetAb4ktoH5xBOg==
X-Proofpoint-GUID: s1eBYtuIQKvvVa4Y5cZJz4VT8jp2wuPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004


On 9/25/2025 6:56 PM, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 09:18, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Add support for audio on the Kaanapali MTP platform by introducing device
>> tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
>> microphone for capture, and sound card routing. The WCD9395 codec is add
>> to supply MIC-BIAS, for enabling onboard microphone capture.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
>>   1 file changed, 226 insertions(+)
>>
> Audio is not a separate feature from USB.

I didn't understand this, Could you please help me to provide more 
context on it?
Is this regarding Audio over Type-c?

> It's simply incomplete
> picture which is wrong for case of submitting everything at once.
> Either you release early, release often (which I asked you many
> times), or you submit complete work.

These patches enable usecase for Speaker playback and On-board-Mic
Capture. Do you consider is there is anything need to do to make it 
complete ?

>
> You don't understand how your own SoC is organized and create fake
> split and inflated patch count just, as someone admitted, to have LWN
> stats.
>
> This work is incomplete, so please start organizing patches per
> logical features, not per your patch count and company KPI
> .
> NAK, incomplete patch and previously communicated as non working

Earlier there is an issue with SWR-TX interrupt configuration so did not 
work. As i fixed/configured
interrupt, it worked and validated on Kaanapali-MTP.

Thanks,
Prasad

