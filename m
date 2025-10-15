Return-Path: <linux-arm-msm+bounces-77412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6ABDEF29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA3473579B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BD225333F;
	Wed, 15 Oct 2025 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGlp81zB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE821CAA7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537550; cv=none; b=iNpUbnwRYe042ky38Slg5YTTd3pYrIrfLQNp7qwmHIXDDCCDs+7gf6y/vtjINZ4V8LYOfxWA/IWK324HreD7xd5Lhu6+Q93Z8Y6QbFlMg2D8RwWNt2I11qKDfPcFHbyz9ZzPMtj8uLitHGSITYl3uVWkvgPYDLxrYG5C7D3nZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537550; c=relaxed/simple;
	bh=0/Nkjxawte1xSGWBAeAz4zNlicLOOiHatyq2kN/fkSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clDwW40hHj56HAVXGDUVOkUVcgTHG2VnRqTx4egb7guFs3wBLs1aYkkJiaXhoDx+KTyRWGBxjzsSYT0Mii5uIUuZNj7RoOQbIkDVoHgK8P02ONKoMAHKTOyXug2S5YDWiaAvfDebYt4xlFPIDBjvCK/ZZBhgxTjnx5R3xrUuh9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGlp81zB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAVo9V024777
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wHo8Vra1vzjyqc4KdZsz2I/6mrjzzqutTDTJTdctpY=; b=bGlp81zB3/kC2eot
	K4nsU9MxuIjed8SJ9zqWT6ieOCVdE/XPJQvJJbm40hs2/N53lU5JKl8EWJVBaHc0
	cLz8jE4DFKcrnpKdvIymQz/3pwKl8rkGVMp6SLxlMcxseiiem57JtO+MvG+/sFLd
	l+5x24nBoiamMx6DDqLjUVPzXEf+6vuyZC/QDMvKnWS86tjdMfRG5wKU/Hhqp0XK
	uprIPQYD2wY8gu+BYF/Maskebbc7ImLW0lD15BQ3LXXfrJlFXMWm7HDIjFECxxbk
	Tz9AfW9BesxLbxqyLe13HJkukWjywcTcbn5q3GFtAS+tAGZrkHZ22B9J3KQxcrhb
	m8J4vw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0vmsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:12:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f82484faso7010254b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537547; x=1761142347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wHo8Vra1vzjyqc4KdZsz2I/6mrjzzqutTDTJTdctpY=;
        b=Ngay/xkMEGmnfXnxStyjS/lUKXioQLat19tIIelEXn2adTDcrGnRMIJWTvn/UiHVRX
         ZicZjuMFzL7BG3evgYv46yU7l+95knOUtgDwoaipM8rqPsrs/5xlachScRFQIkpX8un5
         DTIQ76iOsJjJd1F7MUAsSGdWcYZwMJzZEKMP58WZj2DhV3JWfwhsD2axs6JYAoNmNLAU
         xODnpKwGGaPduFzruYoUJwN6FYOYcIZAZ7gNEG124iI6rPOgRpkID2x+1WDzAyqEdz/6
         ZrdTVRW5XxWLcmpV8pmCQUztf4Se7sPd4O17pjscw6my0QK9fFJIPSfMDqLusUIHyAZc
         poOg==
X-Forwarded-Encrypted: i=1; AJvYcCUac/h7OTY60ZvzkSQcPrjNsi12AO2Ayc8qdRyFwtEroZ4IufgISv6ZUjx/v0bc1ld3zYMA0K4pQL1pkMkg@vger.kernel.org
X-Gm-Message-State: AOJu0YyRX8UlaKQv5fLbyHCFhblMiRrqGzu5nLKKqsL1ca0TZFsBmo58
	kXgtSXJoOCvc9EqM3shG+kBu474xCoAJB2VUynJYKDGBGbbIXgz17ywmQeUgPq/GmBhXbZKU2UU
	mntE2aah+slYoPiTuhA5tHLbxQfu9ognMyvqCORfPh2QxXlJydRpbpuTEf5Zs03wMCE3P
X-Gm-Gg: ASbGncuJaU3PfjjMcqfoddFzGsVPdrWARreaWOPhZ69kDLCiqLFYQElGH8NRldmlVV6
	FA7+uNcxnDIcFyKONcErAkcXlfUJTs0xB4CayrQDE8JgiVuv1QDUUzUV4GvbcLhZOgTeLlxSlzQ
	xRCFx9vnMI2Qz1uQKViapaolGo91+a3ggeOjvVQI+4loTIj6YszpmzfOTMJqPyT5Y0urowGlSXB
	1l/TF5vLGQr4YjO4BNH1mcjM6T7hBFjZ6ybdskT7UGY+/ZgIP8Q5YaFHa6vFYgIwvHDMmaQQS5O
	/W03kM01yRno5x1hNon7ZaZptZh09Tf77jtDybgql5E4x2Jp+IzJ1jw3Joy/2qW5OcEW47s=
X-Received: by 2002:a05:6a00:3e27:b0:77f:2899:d443 with SMTP id d2e1a72fcca58-79385ce7d1emr33730444b3a.10.1760537547291;
        Wed, 15 Oct 2025 07:12:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9O/0dJRMlLmSW2AYZVzbX7T6xJcZVwENkY02XFT5vDOdiAN4Kwxk2zeM2DZtd/QPojIZL9Q==
X-Received: by 2002:a05:6a00:3e27:b0:77f:2899:d443 with SMTP id d2e1a72fcca58-79385ce7d1emr33730391b3a.10.1760537546628;
        Wed, 15 Oct 2025 07:12:26 -0700 (PDT)
Received: from [10.218.44.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09f407sm19119352b3a.43.2025.10.15.07.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:12:26 -0700 (PDT)
Message-ID: <6b6a6cd1-faf7-4ef5-ab24-171a59c99085@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 19:42:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <8828946b-3979-4e7b-a11c-740d8a6253ce@oss.qualcomm.com>
 <235cf6b7-e758-4d16-b5a1-182cc869b2e4@oss.qualcomm.com>
 <bngdsqmcxtlolmwr4it3wy7rldikzffgwwuyj443dc3v3ilaju@eiveujsf4up4>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <bngdsqmcxtlolmwr4it3wy7rldikzffgwwuyj443dc3v3ilaju@eiveujsf4up4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwv3++PRIdXYE
 zTC+4E7zEzXTNJLJ8R5oDr5diY1a8hFVV8bevM3mdBQwnI+GQYSatg0EvHL2bK1pC1CtQoO9CvE
 RCiYaXzYG3toBeTSX9kqbk8nWYS5odiYGJH6JN5KRojGHUUyM+evYcgqBV3puuUIr1nzbpt+K/m
 YzqOctB6tB0vlrsctzV90Pbw08WiHqPn8Rz7DqwZ+JGZHzTMqIvcaGCcjqkVScNyKWCF69nPrD+
 RMJQcwqME7yh58Gec+nJI/FUEea3RkOD6pe9tA6wajbaNXrjUgbxxfYAIC2mf2nSIsH0ZI34gPF
 PC2rts+7i/XgYYwRqcYAmUCl1qYOu7n8Lt1sUq5cA==
X-Proofpoint-GUID: F7I6iciRKxcCaXbBFXf5LCZr5g-Ved2l
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68efabcc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=b3unEIaTcIFgp9XBJ8sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: F7I6iciRKxcCaXbBFXf5LCZr5g-Ved2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/15/2025 7:03 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 15, 2025 at 03:58:31PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 9/25/2025 3:48 PM, Konrad Dybcio wrote:
>>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>>>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>>
>>>> Add device tree support for QUPv3 serial engine protocols on Glymur.
>>>> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
>>>> support of GPI DMA engines.
>>>>
>>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +		gpi_dma2: dma-controller@800000 {
>>>> +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
>>>> +			reg = <0 0x00800000 0 0x60000>;
>>>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			dma-channels = <16>;
>>>> +			dma-channel-mask = <0x3f>;
>>>> +			#dma-cells = <3>;
>>>> +			iommus = <&apps_smmu 0xd76 0x0>;
>>>> +			status = "ok";
>>>
>>> this is implied by default, drop
>>
>> Hi Konard,
>>
>> Do you mean we should remove the status property for all QUPs and GPI_DMAs
>> from the common device tree (SOC) and enable them only in the board-specific
>> device tree files?
> 
> Could you please check how it is done for all other platforms?
In other platforms, the status is set to 'disabled' in the SoC device 
tree file and enabled in the board-specific device tree files.
I believe it's fine to make the same change here.
> 
> 


