Return-Path: <linux-arm-msm+bounces-82181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E926C67521
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 06:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 677914E2DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 05:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38305695;
	Tue, 18 Nov 2025 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYLS5vEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8l+a9is"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D082C08A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763442675; cv=none; b=uAcdDuTnAh7cEO4HvMLX1RLRBBBsgP/Mu2H/i6c2gYugo8DI7iKbKQpC4me1RqAYM83db9MDRjmFfxtRSbA9LBQbNIMT8EvVTM6fJzx6YMCoQJ/jRpnCOIWlP2+h6IqSNiORfdS2AME3IJhm9SRPDKR4+lz12/phZdhAO/EfXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763442675; c=relaxed/simple;
	bh=6UPi+IM15NSINcqX1pmy+FEWsFavwKpuNJccF8GcTB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eyvb6GgAOw4Tf0+IwNkj+VtSR5P6FkM9ZodvYazLATSllTsczaSa5X/qV11sRrS97ypA11/Ii/YL3K7LG458UD2eZVxusVnXJmG/PKE+GWAzE/QOjna+RfrY4fZztz8E7TqSlpcG14ivjNTHVg06E4THbNdJ6Tb58GL0Twe1KW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYLS5vEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8l+a9is; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHJ1mVv3916501
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9+syfQI/UcZhAD1X3K9cuH3RMhFQ0Kd6rLCrfVZTp0=; b=GYLS5vEgj5yW2YZl
	rms4Z5wuPNSJosmJqrKe4vCj5iw+R+2jO5vTXCRzgtRXmu1zjks9OD2uNbLOm/oU
	nO0Tn2dJcfq/aiyfqndEaSVY/SNcuHzPK5pEvcOaoZUYwJ7NhfrbL6Vr01hU7512
	kv9OKQZ5Ls303hKJcWWIMoWQKT7I618juyc+sa4pwbNkxqj+2sXg4jYcqhtjcvB5
	qHakcVlvJXPc25pTXoIcwewDfkQmZ2fHtUWsox52uKImzfFNH6XSI1MuDnZbwoQQ
	2Dx7J2AvcyvPNxf8MIEESfrcVhOeAssjr5h8vTV5SneeJ4RHyXjmsfO/FtdqVGHA
	wiluZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fxas90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:11:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc2a04abc5aso4159566a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 21:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763442672; x=1764047472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9+syfQI/UcZhAD1X3K9cuH3RMhFQ0Kd6rLCrfVZTp0=;
        b=R8l+a9iscSZzkxzbgFgF6+fwx5XKzeI4gjG8z7LaONJJkIFqPitk0NZ4I1JAr/+e3U
         b7uim1+6jUM9QfFVbwi71zVR0shT00pFDiFEn+fvmzffCGi2DELvKe9xBuF2vGcRrqjh
         UeYeG95y/bvzb0pl5QRwC9I54QmJs9BbpnZpSfhSCs11WEkmBVfQug3AiNWbRoraxoPx
         Hj/n5hdOXnbTgDy8KIa43VL4+WPbTArjPIv9oN6S0J7d5O0wXcHUHLluMOeonkw4YKoR
         9FIbCeo+p8gQF20kVVYm8eTr7m+2llV3B3FhS8T8nzBJiJvTATJ/t93n78vt2voURh1i
         fcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763442672; x=1764047472;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9+syfQI/UcZhAD1X3K9cuH3RMhFQ0Kd6rLCrfVZTp0=;
        b=hoe0ylEKB7WIw66MZmCs1B5QMtZOWa+cgJTOHVUQudjGUl42KYDr3T2NdrnyJm4V13
         ZOyyv81ixp4As5fFW5qmYthSy9B/7fo4Z/cEc7fiSPm1Ms72pkesiTfC7uxf+UAew4Ka
         LVW9K5ScqM+22I/8HMX+6IJHQJgc3yhuNQyj2cN4Bs6pM/+SOfNNfloxDTodHkbChIFM
         0Rragyi1sy+1/ygWMz3kFZ2kB0HhH+CJa/Vax5I6Dj56ZXaTB36oCzzv6Pcu3S4R8lkX
         aUAoIhOOJDTns8wGI5EUvOiuyv+Ys9jmy4evwtSyb5j1Y6QRQO+0deeyulflaLHBOM5M
         kfTg==
X-Gm-Message-State: AOJu0Yx62HK6gZlILVYjBicvh1nsG/2Z9oIFUU95ki8zwBVrrlRzk3lt
	1pF5DN5LofSmuUiF6VhdujOZ0FLGsgcrn4aPmxH8/61FFlubtDhQc9D2hbWuECwZpedws1rM5Vc
	KZ49Q2PVffGR/YryukQtBPxkDCmu+tS51HxE+7/EqKB2jEqFVhV3rXH/fCLp8VRfL/2SO
X-Gm-Gg: ASbGnctAC3UmaXk5CM2n3ZaffJhLpS7r6daKTDW8qN0OPhMQB1/urfat5vs84f8zTuU
	MNHdxWM2Lf3GAwKw1pQB+hGqq8g6Uxb9yG4EG+K32SeyGJOs2md7PG/WXdBuSukcGeffwVkzneX
	OA1MEpa3zDkEE/oa6+K1ubJfaaHh7E8M8dFQZ/CVotE8DwC+4dcq1T9nHIsR3fn0eqShFCXN5B1
	FQwhmt8kn1oz58M3HT8IZpYEUXFJsJL5/3sEKmzCz/mB8E2bubr0ZdqQr2ETOo0mdHjdtLxEVhw
	dZ/GtnzdVe5wrbKRPdrkme6tWsxNuCrSzoA2LpJsyz1NYhbEmbrQeUnkotHsqJP2GurtiwGfCNt
	sUFkQkZC+slt2xH+dujzTPwBiCAAMjjfN
X-Received: by 2002:a17:903:1b10:b0:296:3f23:b93b with SMTP id d9443c01a7336-2986a6b7b8emr169834445ad.2.1763442672159;
        Mon, 17 Nov 2025 21:11:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeGaIgIJ+eHw7T5M4BNa235/PtBEceB/aKYl4gUPq87dOaaJOulivh2MenzAAvJySYtSZDbQ==
X-Received: by 2002:a17:903:1b10:b0:296:3f23:b93b with SMTP id d9443c01a7336-2986a6b7b8emr169834145ad.2.1763442671676;
        Mon, 17 Nov 2025 21:11:11 -0800 (PST)
Received: from [10.219.57.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c249806sm157642235ad.44.2025.11.17.21.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 21:11:11 -0800 (PST)
Message-ID: <8f806e27-6a4e-40f3-ef4e-caec3eac4165@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:41:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v7 0/2] Add support for Gunyah Watchdog
Content-Language: en-US
To: hrishabh.rajput@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251114-gunyah_watchdog-v7-0-f5c155b941d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NWMXwhy4Xrw9ODPnc6sZJ0I6ki7u7HVL
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691bfff1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Jcbj2T6pCAO5tNNiLYMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: NWMXwhy4Xrw9ODPnc6sZJ0I6ki7u7HVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzOCBTYWx0ZWRfX7NbOXUMJi+Q1
 fpO834IZ15zFuWISWmh/TGgG1jjfp/POQ2QXpKvihhmEDCEjQkYncBrjIrbX48ekaMYiFzbDiJX
 1ovJ7Y+oEz5QPriqAw1pEATAz+BDO/lPSPoOEL40DPpm9cfKEXUH+kN4KUH734VJcjEhH6lr4Tm
 cA42hlM4olyWaJpffd8sgLArMWH14Aayn9yW3zbJ64jaLDYa4Gx3X6vOEbLJkBffLX9kWcLcYut
 SUmqNgtr+xP2kMBiY1+DZJ1H29Slqam7GgIcEYv3SahdQcXHenjk+teUINXApWriOHcJEfHruX4
 dqZ09rdfGuHOCGX2h37jK0HIIcxVVHu4yeIDbcH4eSdGZKNIUB7/n0SFuIJvEZech0FmhYebVkE
 NErHqVso38WmMQXpTB0XWLzI39DDlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180038



On 11/14/2025 1:27 PM, Hrishabh Rajput via B4 Relay wrote:
> Gunyah is a Type-I hypervisor which was introduced in the patch series
> [1]. It is an open source hypervisor. The source repo is available at
> [2].
> 
> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
> access the MMIO watchdog. It either provides the fully emulated MMIO
> based watchdog interface or the SMC-based watchdog interface depending
> on the hypervisor configuration.
> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> 
> This patch series adds support for the SMC-based watchdog interface
> provided by the Gunyah Hypervisor.
> 
> This series is tested on SM8750 platform.

Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com> # on qcs6490-rb3gen2

thanks,
Shivendra

