Return-Path: <linux-arm-msm+bounces-80429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F6C34E00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F256467D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DF72FE05B;
	Wed,  5 Nov 2025 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZJ9w/JP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5/cctkr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668AA2FD68E
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334980; cv=none; b=Ys44J5kiKaG8YA2kYBG+jqIAYIs4CEvN7IbzXIsetKgOhbf+/n2woEuGHDQI1jSrEZJv4PrEebOLipqyh4Wt2g3MJ6aPxPmsgY6fXqNwnb75EM83yrDUaDzdi5c9BQsF1A8jc70f6yS71w7QE9L9ZUecAj73vhhYkXVscXZTrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334980; c=relaxed/simple;
	bh=MdnyFwQzMMsBUv+jMD/mv+gYrCbsSHd+o7FTaANgyCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0ET6qPHn6Pg2tvQi/SFsYPq/NibVBIPH1HAfvf9mdmWMRCnhMOPLZep5qkZYRGr4cc/sMQJ3ITjqEEsuA2r3ynfKK1ZeIG2KjlDDlDT0h2PVPcxa5zBIUFiiT92vkh2xvpMV+rERFuZRaQMmtsvAYUUBSCueV3GAwMzdlQeaHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZJ9w/JP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5/cctkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54Y3CI4011376
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Kpv3giOGr7w2BqYrDqhgbrfM9FEqK+1o0jUct5+PgE=; b=aZJ9w/JPaQ4Jnyoy
	m1eF2uSbCJSvhfo3OYFg6lY8f0vyDxra0Nue/BqqW7yLXtbhaM85NJXrWJDbdh//
	qi82qEfbZBtUSnT8gRJN+cWru98A7fKUXocdovtW4lo8HVNZO38QB+dZg+doabEL
	VsgtJocyj0LevqLYJR0cJnBiSJITqXLmVcWOe32vEcXLaXR6C4tyh4TI3QmI+eDe
	297ImllNURBRyF+3WxIPrpROh7DTJTY8Y26rK3zOnVULj5/kkygL0dTVcc1rRoLC
	wFq2SFqYdSCYM8Z+NXGmD8c7T9TimB2oXV8uPxyutvK2jy+Qo/ZH2s+ycDMGTX4Q
	GNs3Pw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwrrf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:29:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87ff7511178so16287086d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762334978; x=1762939778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Kpv3giOGr7w2BqYrDqhgbrfM9FEqK+1o0jUct5+PgE=;
        b=P5/cctkrfO045HvGe7+mD/Q48Ja9d+b2BWozjdxJHOdxuz1YgxN39lpXCPOd5gttNr
         rJhY0M7LX0ZvvBXxobEUFch17u+crrp28IlCjeEvPERGdW9hf4ellKZEY5yQ929l7i5h
         2wZGm0afhNl5poxIvxU4yYbQK8/npSanUtJFBhmcnbLNhilsrX3P6KCSBLEu7wu1iTZX
         HkGcaJmtSCMXxv8GaJG1FwlhU4q7IWA+lndzZw7BBoBPXThMBcuW3unh7J8FQisK3943
         liBAdbO2q7ww8qzyLKIv+2OPd54dldOK+c9iohqD85ON9c81rJXJZ7WznVXqAx9VoMT7
         wHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334978; x=1762939778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Kpv3giOGr7w2BqYrDqhgbrfM9FEqK+1o0jUct5+PgE=;
        b=D8BAxLlbKm7WdunxT5ahNzOUeNi5JnBfdmCyzjtcB2Pe3aoJZmfg2MVTTFTgRxNJhc
         1ryT1bBEx09CgKn/FmaRpeNRWY7w24TDnnqvpU1VG4yxsfujZYtVZcWbu/cjQfvMm3qB
         6nOEZ50s9z1KwLu1hFIVnvn5bB9SvsQXT/Imd/sy/+R+DLd3qMFkhTjjvvYYoI9q0EYQ
         6bvT0Z5zIW3Y45KrtHftBkAEH+qCYfs9NEW0BFbT/PCoG/6mFORlUElx9nE1aYHLYh6I
         v45RIBdMXdoA922b/TSUXxsAV4qda4wSXNc6f3IdWXFAvnrHIw0Jv5MQU2cbdXHIDdTo
         54gw==
X-Gm-Message-State: AOJu0YyuxJ0al/8ZFwOtxHbQwZoYf0WNcv4ZkQDJe1vzp10BFI+xKjM6
	G6QU9NUxH/yQztAP4v4+XKTrxDOWfut0xEWjzh8U+Wxo5AvsoVtY/R/lrOFxc8uo+6wDtMrvB6t
	Q0eLdpAzL9MkP6l0DUsiJ3Yf6C3XtWYndf9lwQZJoRkdi65E2D1pgD1GZWLfSFTZYAB7S
X-Gm-Gg: ASbGncuoTEYLdQpsXL6D/QkUcrQmeyWJufDVVea9E/h651N2jGamP2tL0vMy/f5dg8Q
	smyquXylFo2VfgDll0/lnxnhrbF2S8LBgXHl84FLVC9V1Zr7YMgMmxfn2izR1L8C+yh+gR8UkSf
	F7c71tAbbqIzh7idscTpNVfj5YUHN8DfF6MFPj+mDahkhEtvnGAUbMF12RMtblQeAGlCv4cUz3K
	N1kLHKh527FJRmlGF7vNgD/B+3A+8CSTfe/jaBRNITINGvT59X0AUYGTDg0s7wwDdQsGffAIEy2
	mK54fKvHlqvi5DdkXbZgORmpz1C6Wyp4h5C4JK6l2ZA2cpNKvfeQ/3nfud59F6A0FHMGStgL2x+
	HaGacEn1ENuB1TkBk5ZV4hSEzFM7b8djoP1Qx0OLkXsBU4GXFGMqb8l/j
X-Received: by 2002:ad4:5ec9:0:b0:87c:19e9:c3f4 with SMTP id 6a1803df08f44-88071190ac6mr23651096d6.5.1762334977572;
        Wed, 05 Nov 2025 01:29:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR5yLUbe+kckPs9cTX6j+3wagDW4PTjqIqd7gs5WtMozLhEkOR7ADTQz7OZxdb5NaChzR+8g==
X-Received: by 2002:ad4:5ec9:0:b0:87c:19e9:c3f4 with SMTP id 6a1803df08f44-88071190ac6mr23650946d6.5.1762334976987;
        Wed, 05 Nov 2025 01:29:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7271f2b678sm64135166b.3.2025.11.05.01.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:29:36 -0800 (PST)
Message-ID: <9d04a61d-489b-4fe0-b401-08a40c692c2b@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:29:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: HAMOA-IOT-SOM: Unreserve GPIOs
 blocking SPI11 access
To: Xueyao An <xueyao.an@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251105054548.2347569-1-xueyao.an@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105054548.2347569-1-xueyao.an@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3MCBTYWx0ZWRfX/jqzxeUT41bh
 dr5wH+e+xaoI+Twomzwvacwa23N/Vb2/nPW75eHV69sFkjnTHWXg26YwK8BsFUCa6fk/31LrIxz
 KBLC08yaNCOfddeqr29PH7zUAwDuy7yH/BOqkdhsIQzBbZzCg7o4KEt/RU6kflIoniDplvEKrfm
 Rq6nz1Xqct5pnK1/x/bkQLzUWpRhDzQVKAv252m9n9ky9ACkJQGsX1ff945errIsPnVQhT++jR3
 z7k1NyvYmGMlZF9ooA6LCLv2jCpfF/k8Jr314fsrcPRVymxo68p3+ktAieC7xPmV6p1u53P2aTi
 VwD3c5A8SeWdedLobWCMCHLmwl46McpDJOe/Pven+OekKJ0eMlqYfDgLzO/8YAqrHMy04RQdBMe
 D2l+hEoNFeKasQ9svT3UoyJD8sXRlw==
X-Proofpoint-ORIG-GUID: 30b2HBg5WyCKe-j9SpKTRPHdFvCZU5tG
X-Proofpoint-GUID: 30b2HBg5WyCKe-j9SpKTRPHdFvCZU5tG
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b1902 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rx43dS7NxoJ6fGjPFHwA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050070

On 11/5/25 6:45 AM, Xueyao An wrote:
> GPIOs 44-47 were previously reserved, preventing Linux from accessing
> SPI11 (qupv1_se3). Since there is no TZ use case for these pins on Linux,
> they can be safely unreserved. Removing them from the reserved list
> resolves the SPI11 access issue for Linux.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

