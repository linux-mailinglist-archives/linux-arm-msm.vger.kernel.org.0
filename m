Return-Path: <linux-arm-msm+bounces-76840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27742BCF82B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 18:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63023BA10D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 16:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E6A2797A5;
	Sat, 11 Oct 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W10YKKel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA338264F9F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760199289; cv=none; b=izGfOU4EimfbVXNx40ihXn8l8ZOfvhBhgrVMEKbkMGc/xtru2hK6LAaf2AlyfR3k0pa25se2A4C7y1lryhCiCqtvG8tvI1oEI/gSIFVE+hSq7qldlWfIM+LRn2/bCzHZyL7YNwyCu3zq7REl9DBI1QeBkIbwz94BTW0UCAI1YVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760199289; c=relaxed/simple;
	bh=dXIun9a79G5jAOcHfxlNdIuwXwsfJITm+BAAABZWPXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTyFHIY5Lg0fB7p/479u5CevRBpqlv0zBeIQ1PvA2jHybQaJ0zYujV/DQv0ogJIV7puvOltYDQ7hEAZhfMwiqx229qaAzpADSsQkP1zxifR+iE936PMryFG+dk6HvpMQU9dBPFteap7o/OIdnqn9D0PPNdjHavWLw+je5qTKOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W10YKKel; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B4lUZs016652
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 16:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEdVXHWDgWFj0dyaaHRuy50qTxNpuKmmrby17kDzkbQ=; b=W10YKKelNKA1wwbi
	k/BwkW2TgV9QgPnXfUVrVFUD5SHWZHe/ikhMFZ4MQ74j7RuFNc+CTqUN6wIHYU8U
	CPLRnWdEGxZMp7woEyJlwDCblV8uRZvJiPAR881dnDgBTTLaCFBPSCU7Yg5g3MS6
	+PX7kM9HJDyyQeAD5KyscUTU69Lcn49v99NqxIQH2cos8wSwAtY5E/qy7BeP1COf
	6uxeNG0PhuMMXm0UPMquEFC0ZKziipJC1uukgjfi6w9k9WfyjOak0vwMFW0yDXSM
	5lSL3SPgiY+g8YIZ+dQNPwLsvvHtkcZ7VKXQyvwDuxwShHc0JXp0uowTKNS/U7Yl
	IpR2gQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh60sxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 16:14:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85bb4e88394so148184885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 09:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760199286; x=1760804086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEdVXHWDgWFj0dyaaHRuy50qTxNpuKmmrby17kDzkbQ=;
        b=vTLGIL9m7vbt0VCCnLH3A6SCKrHfCAR4o6X+79QChqX6Qv2isT8CB0e+dv2+7SWymf
         3QXtQ2MSjPClbyEaUVoZSnaNXZ37eEa5zM2OlAaxSKTjq8JTYdJi4RPXsSUr6PVDTIIF
         6W31knnCbSyHs9hFy3xsuNvBiNmr74oTwy40rD3swPN1yCKU/rqFyWGzcu9tyQTCPyaB
         tO8Rl6jfqtkZ7xgSaq0w9ixodpPn0qGTbZEr84z0xyvugqpdSu7zbeURhGX/S5Mubo4Z
         QqECPxtdhBN1AYmMwGLckEswi4UqcwthZkz5rRoYYQ3/SSrbsS0R3TXQrC4UbS7/n2+f
         NoAg==
X-Forwarded-Encrypted: i=1; AJvYcCXLPWeM/iDQHKZhcoW2OVsVJZujWD7yMIQbPJ+LqaHK5SLzbPL0ftXFc+0KWH7YFDXteCQmqGcUHsxTR+Dm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj58JaqExZQVLaNynFjFw1+RgYYO8Jndy6IJAaVGAsZItfCshN
	RGyE5KoxsPEHwNyjMG+lacwH5kS8erxIz3ENpBZEnR2GoSbAksVQ1Ki0oFe6srUxLN/ZYI5NXMC
	iODPESs8egPYC1nIJWx9DsN/cKd6gZwS5mv1IOVRH58vId6kH5pC27/3ynEjF1EWeESJF
X-Gm-Gg: ASbGncseIfpRiVKprbJSWuZX4PcoaFkwhm0Bw+dKNPkNODynKkXLghz7NmSUyVzzCbh
	5Yehk65E/2QfmXh52qlPx3GXosrcEN+TsPYh6YIH4rfFtBrYLCBUjuzIt97FoFzWhY7y45kuz83
	d0BVa2l5Ab8j0AZojsubDSQLX3B98MtrSqT+yOgf/tkWd/6Sx1+yBYmO38hQW2Jbu7YULCzOgHE
	bu6IvHFRFS7pxWcdJETMkQHWR4M9m+ifVMMZMEnLCmbnv6clvO+td2kaRBQR5fQ4HDYsJ4QGmoi
	zAfp39CEQ042PSl2Hh2RMzQUpHQY6iS9KkZ+v1Z8T+Y7EUAjVInGzYxgtlsfLrZdQCiZqYODKt0
	zb6Rm05yVB9PUvcWqaR2mNA==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr1470264685a.8.1760199285729;
        Sat, 11 Oct 2025 09:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdXAg/xzGRvcQbpISEqpqAwBRcd/3t/DWxb6MpCZ4p0XQK3CnaFf8fCioETBvpvGLnw3G7Jg==
X-Received: by 2002:a05:620a:4609:b0:86a:3188:bb40 with SMTP id af79cd13be357-88353e1de97mr1470261385a.8.1760199285219;
        Sat, 11 Oct 2025 09:14:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9a406cesm517706466b.90.2025.10.11.09.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 09:14:44 -0700 (PDT)
Message-ID: <dfa9078d-7c08-4fc1-9926-e5996d10a1c2@oss.qualcomm.com>
Date: Sat, 11 Oct 2025 18:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
 <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
 <aOoydT_I7d3khXuh@ninjato>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aOoydT_I7d3khXuh@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ea8277 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=uWCIaohOBZLpiXFHXEsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfX/uDUzKgGza88
 Jwy8t7hM13c+wEviy4o5cilIosWE6i73+AYpICSLRHXAQGKFnkgnaN+3GlobmBG2nfBY7Y+GpEi
 Fo9G8PW3IxJkwiy0MXURxX7xKTODIXhX+u8+JZ2InyARCvwlwcqK4/klHrNTHgexBZDZhYp3QJk
 IJQaMuG80UsbbIrVcWUQ0pJdl3jFjVKhSjsBzfScmzHJUqCkSZK/L05x0Z/B43p5OqFvOXmTdFd
 HXZGuXJQ2nHTUS6u9nH2vu2GTThoDsUc0N4BjbOcCRtxPL6HaErA097ZAi+AX3yXPL1ssZiYfrh
 nZSqJwvVUw0ai8xdd0rZOG2Ty+oBeQPBgsCmNriZuyYcGXE4QaGFJ+WyQ+awfXBUUa5wxLGAVzA
 Rt/QTaOUY5FqP/Wl60ysC7Mtz2DJsQ==
X-Proofpoint-ORIG-GUID: PMklsQsxDP0ZVckwej3FqVBg9fXYL8_w
X-Proofpoint-GUID: PMklsQsxDP0ZVckwej3FqVBg9fXYL8_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026

On 10/11/25 12:33 PM, Wolfram Sang wrote:
> Hi Konrad,
> 
>> Hi, this seems to break booting on Qualcomm X1E80100 Surface Laptop 7
>> (arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi)
>>
>> gcc-14.2 and clang-20.x
>>
>> Funnily enough when I build this (albeit on another computer, but also
>> with clang-20.x) and boot another X1E80100-based device (x1-crd.dtsi
>> in the same DT dir), it boots up fine
> 
> I reverted the commit now, but please if you can find out more details
> about the boot regression, this would be extremly helpful (maybe
> earlycon helps?).

I'll try to poke at it the upcoming week, thanks

Konrad

