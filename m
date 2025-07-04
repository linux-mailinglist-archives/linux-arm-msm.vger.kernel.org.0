Return-Path: <linux-arm-msm+bounces-63693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E175EAF91DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD11189EF07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154AC2D23A4;
	Fri,  4 Jul 2025 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSIuxwf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E129D19
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629964; cv=none; b=jJ8N91TB9elADxMQ5Hw6JCjr2T6kGI+sTVflno/6UnXitI3rt0IGF9Q7XYim2RTyj0gV6ZEhFvm660izhfgb84n1qow91+TuCbg6JuE74E2/WkOtU41ZtQu7rd2tJdymedP4gUNTeuhOmelMg+5VDco6CN55HyV5py/XCVfkGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629964; c=relaxed/simple;
	bh=Jxr0xdYuj2907vXx/1ixI7Q7uwKRLMkvjPjpU4giaJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7yrTwUY93ej97TVm2btxf5Wr7155KNjILAThlOWcTc4qaO7psvsRz2I04oFxjWqBD0Hujv8E56vyGOhZ8O2vSm3IUDZu3xGYkjCAJNAWNWK6aLnk0NCqVLqofCw/lbvTpBJZ8Fqp1yJW9iudVZAIEvOBAmrd4wiAIw02ue4F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSIuxwf8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56473R5K025165
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 11:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsXV7drYMwvyEcS2Cgw5YwM718MexIAF6Q1pCCfKGWA=; b=SSIuxwf8cuP8xhT+
	l0vtAkYBHkf3n7wGfnXOBiaKJSpq4JUoyl0S4JDcFbQij/q7xoZO6NiLliDHOOkS
	sg/KeH6Nh12N0w2jLbfDPooI0DITSAGd1ozxtlVEkS3j3NSaHB/recD4Rqz7T4dN
	FZkgsE+nq3t4A+jp5X5kzVnFGjPDEtqscj6gan5pHJrBNIAt7fzcMo1KVRHdIrNe
	Z4uHJQHeyVjvH0u/PnDsnf4fLsxOBG+DEcoA8QXWnMEJ4i2cb5I20otkGodNyXIw
	m6cZKG33XiP6eMZzILpa2BgpsK+8wwYsOLIaJnfHd//1YtkCEBDyXExzaRsYhQ2+
	Wk182w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650wee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 11:52:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a78573c357so571261cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 04:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629960; x=1752234760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsXV7drYMwvyEcS2Cgw5YwM718MexIAF6Q1pCCfKGWA=;
        b=SL6x9rqOgDY0K6sRHDuwHoXjDxnVjOx0OvmFW3n+qBZW3vmLSsNb5wsmjm0QRUs37R
         pxF8+aVW6+pZUmEqK2PgOPvK7OLsn7TSLCcWePaEkFKItlC3ubiAkHJ34kzqDCdU5R1E
         m5yCt5pneDMV02Wkvwix7LCCrExxP+JmDLyWxis1bzfr5kxsbiNShplidcaS4Ok+J+sa
         wCyoIyfl1YSlNPhFzJaX+Sylfx/museFXQP0HNbkNH3zvwC4GDe5WyXFMe1+bh1xfXKI
         RWj2R42OevfDfkYNgh6Qqge8sC7XijdFKAJaq3KcmhYYt1uWH4SEJXSFJZnsvJgfXPLl
         DGTA==
X-Forwarded-Encrypted: i=1; AJvYcCWhiIBuwRA2fxMxrlWa6cZoOlIwdKmxmy/YzZb/zgkvpQXrCXV+AQVeiT3NQVPDVWifyt5ej5jUnmEUgZF3@vger.kernel.org
X-Gm-Message-State: AOJu0YzMhedMIJ1a+U0WzXFeVcCweboorptGPepCZWl9kKM950FlB7/B
	PZd2Pxm7h8BcrH9HC3QYdUFLZ/smwWOrYkfARettIFi5n5RqgHxVaycSHGh5lkvmEJi88NVswa0
	HfPlJWmzGQ8mj684qo7FLT6Qhk7epRzQ2+CUC5D/9pot7ShjtlTqVkCfSAfL/pZnrjEFv
X-Gm-Gg: ASbGnctvvQYiLbIQsh+WKukmRqQBvTfJmgd6RKMmrl0gKZ9Uk9XVxxPlfH3ynUnc4fi
	fid/l6n5kwJOWtzQkaWFHbbwqvhFYSP4zFLdgIcmofbqudNHzx9Zx2ceLCX+iTVun7CzZ5xVSIB
	OArMwZf1WaUPm57xs7PygQiYnmDFzcP1yWkv2mhk5oJ1Y8BpEBmbQQZuQ9hA1ZY45jY5Giq9LWH
	lst1k24O3W7PiZ0LiENQtQX4wNR+68LcggFxp05Y7eXi1u2uwAH10dyDHO9zyv9huDPBi/6V4QN
	8uhw0U9uuXlCgZ2Nv+o01mw8vpnRkJ6iT7de2TBh9Z7A9iu4hgHUGyFmK2CdvETBlJT8XWXxpwj
	YMhnQ5w==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr114075785a.1.1751629960609;
        Fri, 04 Jul 2025 04:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCSLKywpPAh98geWs3TsZPTeVlJ36KXynK/cQGjD+OqSD4iTSBmU5d4Bk30MBe3jGsdImkDg==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr114074685a.1.1751629960186;
        Fri, 04 Jul 2025 04:52:40 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b04d30sm158014266b.133.2025.07.04.04.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:52:39 -0700 (PDT)
Message-ID: <cfa9cd1a-2a5e-4191-b27f-172ba202175f@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] clk: qcom: Add Camera Clock controller (CAMCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-5-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-5-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867c089 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=lahI4EVxXURej6Z-Ve8A:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX8ZfBZEVcv6a8
 ezuuK15wmi4O7epZa1KaXPzMaoEpzA7dNwJpSYyXGrfuqJ93+niqydj3wxGNDXWc7iO5GyKvU3u
 d7v7H/NTAAgyjwk3r4w/EJdA86UryU1PFoFW1BMT0ou+yMHQFC1Gveix0w3wGiiHXorgXZwE48q
 UZ7Wgo9ijhEyZpKt6m/qJG3LfXfjtxs5AtFJIJq3tT3WoXEJN9XGuhVtDkl7VSLsI/mhIEQZ+kK
 92AwKxg/IHt5r35yxIO0zLeAWaL5OKPwU8RgNL7yBTCDb5jPRjQGcuX9z7wmymcL1hBhH9RTJBn
 S127E585ec/4BFzK2m11bUIYyoNe/Q/jM73RLmaqekWwODAZO6PYglF3UbBjOnH1DuD4yj2cSVR
 jy3aPKXNcbFNLYVC2I8nS04LFqVNLWHuZr31gY6/UxouQ3tBjw0KbhoodiLb/JgvXvIQTj5m
X-Proofpoint-GUID: CWtmLrUsL83INB60O7t7g87WaxLSylW5
X-Proofpoint-ORIG-GUID: CWtmLrUsL83INB60O7t7g87WaxLSylW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=883
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the camera clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

