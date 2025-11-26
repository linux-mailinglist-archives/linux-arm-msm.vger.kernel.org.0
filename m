Return-Path: <linux-arm-msm+bounces-83340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 488EAC8793E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 85FAB34B636
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD06188735;
	Wed, 26 Nov 2025 00:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqFMeO4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmXvqVve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF467156677
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764116585; cv=none; b=R9vOOUT13XNWKl5PW6TvtfW0SfzoxImh2t9D5kdiNs71TzaPiPLm3GdmXAlcumvcQHRwOVNHvkjkSRUHW6d8QNLSF0wAAmObhTN0IP19yMox7R6pHfN0oRMKIYjfSlqEtUcmlHEsW15bl5XsVP75XQfzlURwUahRXyyZpIZQZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764116585; c=relaxed/simple;
	bh=kq+2rxOFGVKwexDoRItOWHbj8fKM1GWzgRSSTQlGc6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WznBvZaLp1BVP8iB2qlFCwFa7H97b6kc9T7ntXt4ZMpH4GFuGdjzhc72vtbFCdumXxX3K7k/AErE68p+a3bWQ2RTVCoXMH+sICiTbSLd/pGJ247q8W+PRo7EMtJpFkflm04vI2mjpulJl0vE0n15AQSZsRz1JgJgZoFvrVILb6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqFMeO4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmXvqVve; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APH391m3738821
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o3BEQiEzssD2wKmrX0PXTYBj
	y7L7Q3N9642YJTqZ8aY=; b=GqFMeO4h8cX5fITdKXzsOUg79bN6JOCqfL3Yz2K0
	aSlBsFZmUdE+JXgcadw/Qb+MjGBJ+YEq864aofplo6aMPVg/uGLGjW08Gt4PoXO4
	aC8o5V13wQwKHYzqzFqevNGX9TAMnu0GDnpsKlaviwM0rihMlmC0bUFtlLvGZPg2
	n0gC6BiXQxod+iq1EACRJ2dsN03DB3b0zdN+9iwD/1gsv8jEl8dNVwMf8dkUmrLM
	wttiJjWH5TWRIWhuTuvrqWocyaZLmHn2+9s7hbU0aoWUy2miM/9musrqgF1Kby8s
	1QiRevJ8NTygSCV5mPOlKepnSjwcvN82zBLvhSL3/iSx9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggyh02a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:23:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b23a64f334so1602886085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 16:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764116582; x=1764721382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3BEQiEzssD2wKmrX0PXTYBjy7L7Q3N9642YJTqZ8aY=;
        b=EmXvqVve5ZrjWh+HYYP/Mp08W8Jr+R0bJtns7uvB8mQz0DZbQ6shZTYGL4Fy5nep05
         I+0WcKS2f4cuVfcBz9K2jXCIbpmWxpo7qqGjDwDKe0teGkOecXv/Qf/veenFZSJxtSsC
         OeOhrD2ryuVJF4rb+jnFIIYj7EpaF1oH5pSc53Tur5WKWxtonI51aRw7M5i+IjEq2I70
         WnHOT2i3mVWX/cLOQWbZRd8LrqQoXHXYCmAZ8/6lJ16HnHACM3+IpJGEA1xs4GOvyM06
         MgG6R8Ov06qmUGoGk1s3emku1+Z4AK3lUSN272vYDGgv1BgdUEYMbiIgozfScPOz29ka
         Zv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764116582; x=1764721382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3BEQiEzssD2wKmrX0PXTYBjy7L7Q3N9642YJTqZ8aY=;
        b=j6t6UIN+VlqDA0hzxQwiQPhZDWCV8sY4BdSZfcdFg+qCvx9BKhBrRyVmOAfOxOmvNA
         3edeNAWUd+TY8UADVSGnO2CR0Yr0/Jc55s80FpY9G1XRzl/VZyIuSAs8k0w9B6KDZwJS
         d1rGgDtk38r8M6NO0T+z3Oj7NcnhTgSaizSPPayX6J/FJH1V4LDnO8mo+xl2VgXRNxRY
         Y3kvOGWLEPEWkefluPzyu7vqbPdHMaAqIFD95KhDboIXTynSnHob3EK4kU4K34Rawdpg
         t0BU/HcGuq6lRgpqle4pL7U6Nci5gS4FyRcEeR99gHO/BGM3s/x1ToAlVG6GW5ehTGWh
         iJPw==
X-Forwarded-Encrypted: i=1; AJvYcCWcjbcJYL6DLzLCL3qzq0A+hHZp0W9THcrxXfUYhPlJbGfWgoAYGZ/mz941xTR7CblVroGzwFk9gs4YvW3i@vger.kernel.org
X-Gm-Message-State: AOJu0YydV4S0d8WoZCsdqcLmvogEybGFgLs+YwYEOJ5py1QULgVhXs0y
	8W/AEEDt8+8Aqx2DlfxzUkhciZ8kAo43iwMFom9giMCrR1M6J3lPM5xLYdG+AHLv43JDZxluWTt
	Rcg/zEdMjs666k1vZ8PRtqPRAz/ZImXXaUV1fDSSohC+zHjGHABKG59eNEy7YzU4lDeja
X-Gm-Gg: ASbGncvQfY5sdFtj1S/R0A8aGtz0QNkfjFL4S/9tblv7RahNjfiypYSEN6s5jPDtTa8
	Qe2+KKJahDSiedVRcr/I2RGZcSI8Rqu/JevuXT/Uw9uzoh2ttHbbwwQrEIz+0Z94TbL9VlLYcGK
	OIUMYazyzlbUNoFkjJv0Y+ShqzxU2HZ+vIyPRSy2BlHJd0FV1J1Ea1VIAt/LzkRxQmY2zqkbsg3
	V7tCQ3FVR3Msc1iJHyUNXhQJ6kxhD/NL17ZjvJJqTgkizriDcxNEAiG2ucy/mn5z2S7oqmY55gM
	cL+oQshGd6ip1JhzUeByOb+uj97wc37/JEMalGDqFTPBO2lMPPDAGYGdCgGpHP7aFpbcy6Upv+H
	jrcW8+SvLSPX3cXpVbAEQoUkBiRrCsv7GrwQZaRi6QvJgVMO5zc8ymegxwUIeYdxdXqQrPWgclW
	4c8Ew8pH6FnhrLqaRgYukfleI=
X-Received: by 2002:a05:620a:7101:b0:8b2:64b1:692c with SMTP id af79cd13be357-8b33d1eff0emr2287484685a.29.1764116582036;
        Tue, 25 Nov 2025 16:23:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGJsO67rFuFd4Ro7ZbE35nZtZftobbHH2OfIfbhStQdhA7bdtQMih3YOz2fnHDcgJaulJP4w==
X-Received: by 2002:a05:620a:7101:b0:8b2:64b1:692c with SMTP id af79cd13be357-8b33d1eff0emr2287481085a.29.1764116581476;
        Tue, 25 Nov 2025 16:23:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db89319sm5511169e87.36.2025.11.25.16.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:22:59 -0800 (PST)
Date: Wed, 26 Nov 2025 02:22:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add qcs6490-rubikpi3 board dts
Message-ID: <4r7zczamkq2udcmwrfh6nzn433ug2qnpm6hhir7b4ixg2muhjz@jbpo54eqmkx5>
References: <20251126-rubikpi-next-20251125-v7-0-e46095b80529@thundersoft.com>
 <20251126-rubikpi-next-20251125-v7-2-e46095b80529@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-rubikpi-next-20251125-v7-2-e46095b80529@thundersoft.com>
X-Proofpoint-GUID: ClgccrMxUGxgd1LxyZ1_VZEXh-u6JTgW
X-Proofpoint-ORIG-GUID: ClgccrMxUGxgd1LxyZ1_VZEXh-u6JTgW
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69264866 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8 a=hFi1a12O9VuTv44D2lkA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMSBTYWx0ZWRfX1QQiMSzIzB24
 hHjTl2FfRL8iikScT1fq59pDATLz+bQTO96IMUnXEphV4ud5tFmNtIqsKf7HplD6kzY/qu13npJ
 Ins6gf6Dlx8P8KOt3v9uU4y5d6mkJ2fX6wVzfbzERlzb70QKg12rMLeRnV42PGYiD0sA2Ppip5g
 OR3vuBzUHn4p65b3xLtPP0FfqpK0XFkKweSrBbKgXi9lOw42pQdYC7gZCaGdkZgevo7kQFKMmQv
 jtmIvfiCoAsOeTQOSgArtqXsdMT1WqhE5OW+1W9fTPJiPiFkZNOElvEKhSverbHAYaPvTNhexRx
 zHBbyOI40cMtMI52HS30IFSyu4/62o4nkVadidSiHnyhrGnxwfbO3W9lEwgHMQ2lxzFUlIQqvoq
 A+o7mzRb/blFsD9oFsVIIq0JQtpHCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260001

On Wed, Nov 26, 2025 at 12:07:03AM +0800, Hongyang Zhao wrote:
> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> QCS6490 SoC.
> 
> Works:
> - Bluetooth (AP6256)
> - Wi-Fi (AP6256)
> - Ethernet (AX88179B connected to UPD720201)
> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> - USB Type-A 2.0 port
> - USB Type-C
> - M.2 M-Key 2280 PCIe 3.0
> - FAN
> - RTC
> - 40PIN: I2C x1, UART x1
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1410 ++++++++++++++++++++
>  2 files changed, 1411 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

