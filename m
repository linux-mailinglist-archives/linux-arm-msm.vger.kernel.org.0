Return-Path: <linux-arm-msm+bounces-61322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C9ADA1C2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 14:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 060AC3AFC07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 12:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB8B20C46F;
	Sun, 15 Jun 2025 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTguGqyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8AEEB1
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749990950; cv=none; b=Xtr5uowFYJ8JrZUTv2UzjJPJDEKsqXgOovXZ2g10uQf9Zm14o6BgiITSSsuOe+3ci9dF4Dq1ppztOv83g2yKsVLNPe2hIQj4F04PcXtcmXNb+pg8zA6V/MxUV99GoI258xwgLWFd4Pl2J8bHpyJ62HgMYWJ7+XOQ0zB/cYyMGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749990950; c=relaxed/simple;
	bh=jre29RieOGiKnxB1hzqpEVWv7aWZU1gTYROS16zXRgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sh6gx8SBcefTW10bkr0LUzTy6eG8Qwks11OWwdR2Tdo9MOkNA3hB/wYS/AqBKWI/OzT0bzTaVPy/OC+DShOmKY/vDTY2sqK4shLiOe8YqfgAobbUvBXHMscZHS7rGyboDtjNkK46FLF1WssnRe1lHzRdiejQavjKLHN20Edih/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTguGqyT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FBmYf4008864
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngPoiqFNBhOmnljSwVUHe/iK
	PJFoP0E3OrHUnWrd2iM=; b=hTguGqyTyAx6dE0/l4yeHhbLYb1CYhvTAw/RyXDk
	B7z0cEhvi2UqH1xUAohNyJl5v+DRB7m6RcPoB1Q/AOCoA/+/9VsX7AxM5brpQzRh
	xDxopyMxMrz/5vLNel9/TsfB9qZZLriEz/G359/pdGLOlsuT+aJ75ks9kkbPCP/U
	ANKnd5BsmVWCayHrz8/DVZEhJ+KhYxd0Kitu4wZmDHreTxUtkZFX/30lzr04nhrz
	wJxKv+IQebfiG1p7EmoDHaeEEugr6g52863lDIq2qkym6N0loX1LTIm7f87bXbuZ
	7PPJXIwwpa/XzKvu1hGbXt0cjxGHwtxthrxiJHozEN7WVw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ht1v0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 12:35:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fafc5092daso87725316d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 05:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749990947; x=1750595747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngPoiqFNBhOmnljSwVUHe/iKPJFoP0E3OrHUnWrd2iM=;
        b=C5ZqHATiI7Ze6tQeyIfPHEavYUYxSVcrWHstiQiWhDGKhF6rl8NHN7s4cLTHZWEwXH
         P5SexSFLHKU9Uzi1M1myky2KxdtToMNWdOlnMO9/egX3sFIz96Yb/fvNV77CazBHW3ae
         UM4IQ4pPtV5FymgoqXSQuUldyQhbgSycEAMgOs/A7J1aI9VZj4MwEFiokReUbBmfIbNf
         aAimWkSglhB9g8iOuWx8AdzPl6Ukfn7snftUlbsKOuk+4E3aZ5okTI+5DM6TIsNDVyRm
         xs5HpbM1mqTD5v7Jnl/M58HBLI03X5JSrn+g1MAf9mns09nY2U5IPN8UOhC9SnjfEFOJ
         5kjw==
X-Forwarded-Encrypted: i=1; AJvYcCVAGKHffo1HwyaXNnwm2ha95rCYBck+1unbmJxouPeDycE0X6PWm0BfEc6Ew0K5FehqU2ebX4zNxkSC3Ekh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn2XsEZyxAjWggvyW3TsjwggnbkDz4nOKnArePRadAcWI82VkV
	o1xARUEsUq6oWDhQ1sq8BTG33zXdESHZujztPi+zoBZHrFGC6LcMR5aH9aCryTDDVXUaN1Rr0pG
	+iWMjTteT+GV07RZOHsGXhGMcRemmHouv5hX+83SHg4Zn8O6PRCOMlgJLgJs9cl0G0mks
X-Gm-Gg: ASbGncujA2l4/OcWm2mXjTfSPzf5vMPbRTWlFb2Ik3gR21B+LD7UjBBGXKgAnD8UCu1
	/5ry6fC5LvcBrgi41O3huXmlWWHzHi+C/wWKcfuNgLfAuZj5IA4UyQTbjAY4xi3BiAmfSuAOgmA
	6X4jaJcjzQXTQVef2AyAZPlP5BJkxhHyJn1CzoPsieK0d6A7Ye4yLHkcFgm8MTtumkv4ZCHHdi3
	5XrSCc7+hT6kD1zWiu1E1ItMDxV+tQ57MzO+p+DdwLFPjCP7lZ2RLbL0Hf3Ow9YMDIdStQEL4O6
	ujOgTVHyTAYWuIBStERIOti1amQpOsh7qr0e0eOW7UY+NFA23Z4jOmv96tivAWAeVIKozJ78gU/
	GZu3H4kDidqWVQJAsQrBrefpk/qfB0g1GUCM=
X-Received: by 2002:a05:6214:e61:b0:6fa:edb8:b343 with SMTP id 6a1803df08f44-6fb45afe68emr106694656d6.2.1749990947006;
        Sun, 15 Jun 2025 05:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+dFuLe0AEC/qFl0Kj65L3FnfTMfCqJDXN5a8e8jZlbIPlEOwKnEf/PfQA/JRH11iM7RDzDA==
X-Received: by 2002:a05:6214:e61:b0:6fa:edb8:b343 with SMTP id 6a1803df08f44-6fb45afe68emr106694396d6.2.1749990946645;
        Sun, 15 Jun 2025 05:35:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3b769f9esm10599661fa.30.2025.06.15.05.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:35:45 -0700 (PDT)
Date: Sun, 15 Jun 2025 15:35:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
Message-ID: <rcazqdcr747ujkba6z2j2oci27ajkqfi4hydgc2kiavm73y37x@g63jga2fcwmo>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
 <f1284637-7650-498a-b850-b5140c47e4e0@oss.qualcomm.com>
 <39a7153e-1a4f-4dfc-a190-3b3370646d47@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39a7153e-1a4f-4dfc-a190-3b3370646d47@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA5NCBTYWx0ZWRfX6HzMZrnAEdKc
 F8OHC3KrWs1PTODDkTwDP5eTcsRnQDT7MINTfm36wien4kkVmQH5zCZRjHtSD0CZmJASeZIsOvj
 A3qSaiPeST8ztNhGrYBLpk7G5mhz+KieCciuIJwQaF4BzD51ssKGR9iGCgqSt2OzkzjGgcSRGc5
 4hpIoLFvL5G68u/FaJzbhQtgc3f09NvbZtv40WRbDl5yxsfqMsPGruSmpa34TOF3xQ8mEj9Qi7Z
 32bJzsYJjH4YPT9i7P4LWVau/sle3Iv4bT/q2awHEHVjMwNFbfkGP/iCDBwUVw516AP4oSQ7U34
 k1/kZf5LgAPDeQnCZ91lpY10DN//jK2X2xE/mY098lQEnrA8ZJng5z+pJ5KW/y54GxI+edTqDFy
 KTwGBowAeeJY/BDS6q1SxC3QkWDEh4/My/tXxAzgqAPIYszBBqI+JN9D4/NRrD+krUCD2ECn
X-Proofpoint-GUID: 6Pi34WAuvaxzurqJBR3GULji3BuhPkQE
X-Proofpoint-ORIG-GUID: 6Pi34WAuvaxzurqJBR3GULji3BuhPkQE
X-Authority-Analysis: v=2.4 cv=CtK/cm4D c=1 sm=1 tr=0 ts=684ebe23 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=Gbw9aFdXAAAA:8 a=u5m3PQENcPi3WFj47B0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=970 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150094

On Sat, Jun 14, 2025 at 08:46:41PM +0000, Antony Kurniawan Soemardi wrote:
> On 6/15/2025 1:36 AM, Konrad Dybcio wrote:
> > IIUC (and that's a 10yo range memory), SP had some eyebrow-rising boot
> > flow (some partitions were non-standard?) - could you please add a
> > paragraph about it in the commit message if that's the case, and maybe
> > include a short how-to on booting the thing?
> Is it acceptable to provide the pmOS wiki link in the commit message
> instead?
> https://wiki.postmarketos.org/wiki/Sony_Xperia_SP_(sony-huashan)
> 
> Or should I include a paragraph explaining it? It might be lengthy since
> I'd need to add download links for the mkelf and the RPM blob.
> 
> But in a nutshell, concatenate the kernel with the DTB, create a SonyELF
> boot image, and then boot it.
> 
> > As for the code.. I don't really have comments other than please
> > keep a \n before 'status', other things seem rather in order.. If
> > the dt checker doesn't complain, I don't see any logical wrongs
> > 
> > Konrad
> Thanks for the review. Going to sent the second version later.
> 
> As for the other things... well in my opinion it's not kinda in order,
> especially the nodes ordering at qcom-msm8960.dtsi. Welp that might be
> a separate patch I think...

Yes, those old platforms might enjoy some tender, love and care. Please
send separate patches, imroving node order, etc.

-- 
With best wishes
Dmitry

