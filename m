Return-Path: <linux-arm-msm+bounces-48981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C8A3FF3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 20:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F47F4253AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549C3250C01;
	Fri, 21 Feb 2025 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbAgZrHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013B1FBC86
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740164560; cv=none; b=C5C9vIxIgfzx0806kpKdMXUDH2FHfASxdeChNgGBgDBEM3HNHwe6WoO8LWpuIQLM3f2KEHFNlOKcFhhmyB2Ni7jFAvYhQKXzJ17O/Xx8x1X0DYioAcRFmPlYGY9xpeSl5bcwm3eI4VDZxFqJTPjiBQ65jvWcwPcZTHaOEKomYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740164560; c=relaxed/simple;
	bh=n/JZko0Q2c1fHbsl7vbB+LWtijblHysyQBHRB9ZsLNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi/qHpG0iIn+ct0+ZclyULlz8eraZ9XcaXzIzQCZFbzOSNqh9rrmNQVIOqGutB2ZHp7J8K7t2MC60mjSuYbXaJHsduysDlOrFCGE7ZN+lTZuj9S+KV6A2XntfjSvY70jOHjBtnUQGxugfs0/jEJnMU3lIgiaBZvSMybqXdAR1dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbAgZrHq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LHPWA1026192
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXUHcu9DayNto7ymR3uyNf54ZcDvUwEq950xuI/kfuc=; b=kbAgZrHqf61Y5OBt
	p2whb+S7th8J5hQuMTTqz3E8PEJs2GLcG++37ZRGwZv0S8l+Lk5FB82u9aRMWshb
	7EAtdQoOGsb8YsK0uTlhHUEHts9mNEknMXpWE9aCrmOTF2+/KeP+aCdpu3NQj6Mm
	1Ao+DzREX3ksyJ0hkJ+ObyeUgJJnHNplLrv2pukeEn1mjfhQi2dPLXN53aALZCFF
	v09MEHpJO3EBGu+5bSNZQOLWgAR0vcq8wTskNTYx/0TaLjciFVA5inPE4zAB18Lm
	ij9cS0azaqTb1sHTw//BVBpQUqe5ytTScCUtunGS62GAU0+c/fhcs4RIb6IzH6zM
	h1euRw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2r3w66t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 19:02:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e65eae5a26so4537656d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 11:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164556; x=1740769356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXUHcu9DayNto7ymR3uyNf54ZcDvUwEq950xuI/kfuc=;
        b=NwRl7TWREHB1+GpB2nfKwbt2OYUArWBj98jyczkILnFHUfBrVLrH6NyAlBHXOukMQR
         03ki7MtTyvmoUfpg/P0hWZimlzduDgdlBQemJR5CaUXVxXwnTTJVu+iW3J+d+8Hbpuz+
         8uNsarLVsIjBYcl2JLBxc8WfP4oEi1LinivoezbYCMAj/eaJDFW3FLecIv0NhvLUTo4x
         vQwOtelz3oyGvSAnL+9ddCm0vfN1FM7bAkFcDu1jo6+6WdKU++Hqt/byYKqvT2DVkiI1
         zni+dxdsp5HyHQ415W4c5Qhiys/lDFsG8NKAJD280P5FAjjIpioFyPtRTMtq04yKMGN4
         04cw==
X-Forwarded-Encrypted: i=1; AJvYcCWU8R4fNH5Grzx+kQZIPVNB3SaHHGMfN9ugy/UNBl5qkzNtOBK/oiY9zsY2cy3mqBsV87YqmqcpuA+5WyKK@vger.kernel.org
X-Gm-Message-State: AOJu0YzqVnO8caQiLIFxIyCIFYuvuEa6sXM6kWoolp0Q3gUGqE1R5m1L
	1DY5aIKYyw+H1YE0c57YI4dcM/QPi+i+kZhkmCSSiyQbN2ddYG6vtzMyqNma87s762pRBAwosL/
	kJLwyycEhvz/W/78Pw8neiyYoOLsukTMtyQWYbDmkTyUDDFrG0AmA/CikESw+nIso
X-Gm-Gg: ASbGncuUzdbqYMVSh2sbCpkjCaYDSgAM/k7xFjEOJZzWeGnDGj3S14JaQtGjX8FBeBf
	B5DCZKidXqhUrHhwP1NyqtYTsONazsbavXat93pILy150nVxYYcXy8ZmB7DHmfAZj9oZwcD04Tl
	gHMnksG4G8QjbPWXlRKeBOUDRbpxTk4olM0oN5ZvfxhD2xDRTJ10mL4I/Sqld5ETMjaFczfv4SH
	WLX+m9AS3pA1aW6KEDeFNgKnTm6zrlcCEkbZCGeNCQuPzl5en8ytZlVm0H9h1cvQj8yzWS3g5Of
	qTJL2Ff+xFUkSklitUpT7BIRR02xw+kV2cUIZVzsnGQOnRvo1rw10phoFtO2g2YQv0UpZw==
X-Received: by 2002:a05:6214:2029:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6e6ae9b0dcfmr20623136d6.7.1740164556638;
        Fri, 21 Feb 2025 11:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5qRbDSww0JEuLalVZlTMKrNMzC0dySW7mKPi0WVxin9L8+a5WmP+vAvs+2tMupIZ5hkHWFg==
X-Received: by 2002:a05:6214:2029:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6e6ae9b0dcfmr20622856d6.7.1740164556271;
        Fri, 21 Feb 2025 11:02:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53281cfcsm1696084266b.79.2025.02.21.11.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 11:02:35 -0800 (PST)
Message-ID: <2056de62-6b71-40e2-9e3b-077a8b54c77e@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 20:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 2/4] arm64: dts: qcom: x1e80100-crd: Enable
 external DisplayPort support
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
 <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-2-380a3e0e7edc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-2-380a3e0e7edc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LytIGBWCd9TN3ceW5t3kIZAw2fG4g7Vg
X-Proofpoint-GUID: LytIGBWCd9TN3ceW5t3kIZAw2fG4g7Vg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=720 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210131

On 20.02.2025 6:42 PM, Abel Vesa wrote:
> The X Elite CRD provides external DisplayPort on all 3 USB Type-C ports.
> Each one of this ports is connected to a dedicated DisplayPort
> controller.
> 
> Due to support missing in the USB/DisplayPort combo PHY driver,
> the external DisplayPort is limited to 2 lanes.
> 
> So enable all 3 remaining DisplayPort controllers and limit their data
> lanes number to 2.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

