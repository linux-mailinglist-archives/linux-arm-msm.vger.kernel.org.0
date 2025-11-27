Return-Path: <linux-arm-msm+bounces-83662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A5C8FED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1814F3AB367
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3CC2FE05B;
	Thu, 27 Nov 2025 18:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rk3/1W3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+pI/xRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AC2DA760
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764268732; cv=none; b=Kyh8BnKil34Az3J2f0dRL+HQQD1UwGn5H529hLEDHgek6bAVWxJssS3d3Czm49qHCkFrySoGkrOxgOPwujhWaMydS1W1F9mODlBUboPMv8mGajpcyF0EQEZjgTYUzHy37d6vAhmkGn+5Z1fhD8e6t44y7VTyFIZfoB0m5/ngYRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764268732; c=relaxed/simple;
	bh=7EmGp5xuFOxZmnuoVrPri/jYzf6wmTAyHqk2MoUkLX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/sDV51NEaGLZ0hnJuPAnpxK6wQL9se2ZEAbGC3+F8Hn4J058zRzaFnjIXkIWG3IXRyxbuQOqB1TXiz4F6cBuhnUIdEMlJoYMSS7xE2uH3CN5S+ZIdKWOFbb603j/1jVq0xyfHVncqzox/Zt56PKKPa0qBcoosFC3vqY6kvoMFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rk3/1W3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+pI/xRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9bDQE785221
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POsVzQb4aG2qHpC/XN/o/lHwVRg8HSmGyoofXeaIgoE=; b=Rk3/1W3oFZheUG9S
	WjfTLI9vjFils251eCJlJhlpdUx/NNNNyg05C2sYmKvp2RjwrtFSTlhodelaWQu9
	JAN5DFvuALGPyooApESGLaJvyovMUcojBxIhETjmFJqjnopNUsI5lbFlfotIdHcU
	iWB3/LTsyWtxnZi4dKKTIcz4tgzopDowcQ8qcEcvDREvVqUy51um/Qen1UCzD+x2
	tDG+jWFgbz/4KsrKKQDIfop5zOn10x+ALMr0nXJjyqltWgLzU5FEkN0WvQEXKuKZ
	3DcqOQp74EHGsBplrmQnF1iY7VSmvl1rLufugPEeMrpdA8o5+9War9UoKWIoW7QQ
	RKBJUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61s9ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:38:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b227a71fc6so24169185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764268730; x=1764873530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POsVzQb4aG2qHpC/XN/o/lHwVRg8HSmGyoofXeaIgoE=;
        b=H+pI/xRDpuyDuofgFUaPrVf8Dis7wPDVi936VE5m2Wj8v06UcG+gTcvMhS4MKEDJDq
         TegACSInl53QT0p8MLR7zON7rjg93j4N/wxMEiVOFJN4uyNyQ02ndI6J6a4B9eeJoj4g
         pnRE0qpvTgHwzMp9lsgoJqqBxvN9Jvg7WAI5UKGMTBhejp9v2tI5enIGFkc6ZDXEYfUA
         CQ3LkArkPyPLjzpwUb9h1YZzbtNtIYU8tfUw55OP8uDqpJNVnfkWU9SsB471XZYfH0fJ
         J5orXK82f3nqgNDRynuI+CAgqgurThJE0nJY4hABYAKCzCG0dQrU5ws8saTbN9i6amo6
         I5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764268730; x=1764873530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POsVzQb4aG2qHpC/XN/o/lHwVRg8HSmGyoofXeaIgoE=;
        b=pIqcDKMkq3dJ3WHkCt+KDtrA6boBKJxKaYPtuiJrwVL2mRnyhRJPfwPT51Bd1sIVlH
         T9mX0I67vDVWAFn+770IBEOcv4B/pZ3kUFJqXUgTuENFpl7qOAQpNgyqvEsoFlNq9Qzr
         KB3HzrgMVb3cyDi3PRsQrGXvf3R5uAMIjhbdYcOCB7QLYN4K8ObHhozoP+1A3lrdET2K
         zWnzUwK2BNShXb+62gOoiZ+stStHH3e14wpZMgOwygo8/no6xEBPQ5V77yURoOJ8zjZ4
         Af6CIAq/IyTIheJpwm6hlP4PtlqRslVQ+xtM4BuEcrQUeg/AkwEGgVBkrchdJc2kgLGg
         mf7g==
X-Forwarded-Encrypted: i=1; AJvYcCXmAw0r1gseCp7izFJROOplxOmlwqvRIzxlCI1AR6G+OTDS8l0b/g/ZF2ysuSUR91eVMDflbnVIDFkOkB8C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ucVlJI2hddvCIMCP8JVuofqPI9xFLS6pTU1d/skglOabbPir
	CDhT99nAK6xCo37iF6OgvfaRSvEeD8PaJExHtkZ79RpO6G58rWBJg4eTB1HZBN4YYbs/64clGfG
	MU0u0j4maLkiJ41Yq1aYwhHt1c/JPFqiU3MDjy3j9/VuolKN4o0aPOjsVwQwgUfMzmRTw
X-Gm-Gg: ASbGncu9+b+H2nO51/vBg8bLhapowCYlmD0k2/gg/mVmcCmqUIhPR1oG8Te+4PQF/nQ
	Or0CvpCs0jfyAmCEa0Jeo6EQBNuzMnSibAor2XnhXhytytj1mElwuI66tSXLMFMyuFsgC1/GrFS
	q4YJd0iltea6JEChss26EORojC4Yb9yOuJ7vlTykp5OS8PMiiGL8/ololYHt8HM/ui5Jp6r4LBY
	U/ORfeXEIswQpdWz3YPIeO7OLURCdm0trpIRHVMACORPSvlW/WJvrvyeegNt/2NFmM9tMU2jQFJ
	xx0imOVIzS88tPgcL9et8gf1ixeNkqNjPVd9Py1yyEYP/+A/V3aOeSFHSmSaSVT+9wu+4JILBOT
	yKUTbf6h0XNaYiDzmelYm5eGUEOIesKL/KonDiY7jjs6bkacyEaINwudSh0vMPX9YkbA=
X-Received: by 2002:a05:622a:511:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee5886636dmr251071731cf.5.1764268729578;
        Thu, 27 Nov 2025 10:38:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGvBBMNvoaJ0BxGYH3uHB+fqa5EASbvxtHrZuKupeWiooJoc8dPm+7pNnJzajl26gn0WLkiQ==
X-Received: by 2002:a05:622a:511:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee5886636dmr251071261cf.5.1764268728981;
        Thu, 27 Nov 2025 10:38:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d31sm235196766b.9.2025.11.27.10.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 10:38:48 -0800 (PST)
Message-ID: <c627fc05-6980-44bd-bdde-4750b3bafe2d@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 19:38:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] iio: accel: Prevent NULL pointer dereference in
 interrupt setup
To: Rudraksha Gupta <guptarud@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
References: <20251124-expressatt_nfc_accel_magn_light-v4-0-9c5686ad67e2@gmail.com>
 <20251124-expressatt_nfc_accel_magn_light-v4-5-9c5686ad67e2@gmail.com>
 <d3318386-2646-4f1c-ab4b-6ae3bc71e9bb@oss.qualcomm.com>
 <aSWPnRBRdPS8vnir@smile.fi.intel.com>
 <61e860e7-fc3b-49ad-bf6a-9745f205d52b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <61e860e7-fc3b-49ad-bf6a-9745f205d52b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fdp-LRjBIZuCW6vLsk9wzP3IWi4ssXkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDE0MCBTYWx0ZWRfX8+D/ORh5+WPa
 8Z6EDcwNLIaJWvoLbRq5lp7dQ6/YVtfElDndaPchBJflvF+Nmc9Rm6Nv46bMwDsyvKkQvrfhuhP
 MR/xm235VHrshmr8zK8U3iBQqzb/42tFps7LwigAn+gABfj87AcpwOe7YM/JKfDZ2+UO2QueMNT
 xm9GcXE3fdYyuBJM1i9Hm4nnevQRhideHfm5ngLNu0gbUm4m5T+qQjgjQo5clOuYw+xoz8jgWUT
 SGGh8vSIVRSuGadG6QfEi1gc4nZr3Pe6G8xMu0FObUvy7+6877vcnwOmItnZz17qsvfEUHJrfrw
 epUVSpABdRju2F9QDnnSAmSp9grAXQSjNGsMUSjUOZsFvzszLc+LyEKwTTdPVstqvJWscsoRUa2
 UfRI0GXHE2ekKkPGPlTOvFpfN/K+hQ==
X-Proofpoint-ORIG-GUID: Fdp-LRjBIZuCW6vLsk9wzP3IWi4ssXkZ
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69289aba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=9AdMxfjQAAAA:20 a=P8M0t_FSf_X-oylKYQYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270140

On 11/25/25 10:23 PM, Rudraksha Gupta wrote:
> 
> On 11/25/25 03:14, Andy Shevchenko wrote:
>> On Tue, Nov 25, 2025 at 11:45:22AM +0100, Konrad Dybcio wrote:
>>> On 11/25/25 12:35 AM, Rudraksha Gupta via B4 Relay wrote:
>>>> The bmc150_accel_set_interrupt() function assumes that the interrupt
>>>> info is provided. However, when no IRQ is provided, the info pointer
>>>> remains NULL, leading to a kernel oops:
>>> Hm, are you sure your device really doesn't have a pin connected to
>>> the IC's interrupt line?
>> I don't know the actual case here, but in general such a design occurred
>> in real life. So, shouldn't be a surprise to see another polling only mode
>> connection like this.

[...]

> This seems to be confirmed upstream too, where one has an irq:
> 
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts#L420
> 
> 
> and others don't:
> 
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts#L439
> 
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts#L506

Thanks for this investigation, it really seems like it's NC
> Happy to split this patch series into two, just let me know! :)

We won't be taking any non-urgent patches until rc1 drops (~3 weeks)
so if the IIO folks decide to pick it up in meantime, just send it as
one

Konrad

