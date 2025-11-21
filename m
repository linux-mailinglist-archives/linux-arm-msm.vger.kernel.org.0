Return-Path: <linux-arm-msm+bounces-82922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF28C7BE6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 23:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84B374E8A22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EB62777FC;
	Fri, 21 Nov 2025 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqiA6n6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJ5cJ4V7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAC1F09AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765044; cv=none; b=LLncyonc88ijldJP5gWMKFUDwM/nOqos6/6VnA7DczmuyMNxLNCkcaLUc7XKJrqaPTdRvGeWXw3QSw4r7NyVgyxvQum3znJT3aFHAnTkdmRGV3SrVK+TqCP3pRU//ZoMc9P9QpmZGuO/kLl+tf4NElzqMD7KFiaAeeFllQzqnA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765044; c=relaxed/simple;
	bh=50QsdQw4z+dicGo2EIOfi0+xVg4q3kenTRbe8tLSQ5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ1r+YBWGypu057HNoFp24UWTwv7LVxFmW4dFfl6vseneVt0OBeyp/R/tAB+j9SDMOAMFLjTk+KkUMUD3KcHhzMCC6QawtYXy3S1FRQdPoHlqBHImzs6Pv29ZvsVGbVmY4JxZRxN3fdKwaCm3isZjGeDAZ77prPbrtsaXbUx9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqiA6n6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJ5cJ4V7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALIGfS24024992
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lt2VlA60KpZ+lORVZ7muV8XL
	3Uazs/JmPydxQ41bnJg=; b=RqiA6n6kdmB3nZW7u8TogQq024jj38eCRS2zanl+
	3VTpqQEEVBn1aX7RaY2PTqhIXQOXXAY8vhCUzOAjQkxoUxq72sgmnPR7/dna8PSM
	C4eJCFBn0gG382CWfI1MA4RpX32m5sCWHt6y2LMuqhDqqzkU8pqMJ64XeiAeb9YV
	Vl7QPa7C48PoTKKx2IdX2r3G4nnCu1aAf1g6ihh054EOqlNwNrkMucYx2pqX4ZP4
	aGz49iGg289NkLszGvSEWDxGc9lB7AWzVn60XupuVKtfwwVZCVs0XuIB2u3n//18
	2MCjhux1tTTDxh0WY51n7MmuD01tVeROgK4/cOeRGdKe9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajw7a0mbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 22:44:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2217a9c60so1032479785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763765041; x=1764369841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt2VlA60KpZ+lORVZ7muV8XL3Uazs/JmPydxQ41bnJg=;
        b=LJ5cJ4V7/kVOHEBpRC78Rmy5AFmxZdMl6lVYNVkvTgQx+xTnyOxDlkON5LxsJOqGIs
         5iu1KDG+79xY7nas/53xXutXoXFR3Z02dQq7/wiIOFif+P5OFzsegWkCIwIiIcTzX3Yj
         Ln9daZw2PdfuCMn1l3Fr62xglbAe9rHQb8EdoaeuNo9KFLiHCWMNUT3IPH4/9l3qyx3e
         JsCkUqCX/I2GOGtZKHYIRHHjSVbStJk0GV+UIrHVmmW2u5rxTkJezX+NTWu1BDTPKIYs
         dd/nfNbBQA2OHh/SwUCheaJkmDy9KizXlosRuz8hMfxKJ1qPoG0pEFvnrO6Lc9Mla2D1
         ZHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763765041; x=1764369841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lt2VlA60KpZ+lORVZ7muV8XL3Uazs/JmPydxQ41bnJg=;
        b=H+LU3j3JtuXESngOXlH+d7DpuwfZSM258gFpb2skYOqb8eNMVJ5zx/14uS5ce8f8Qn
         RVRVEOMQEaCeYq/UNrVAc7h04VfOPbzwx5HMW8mseCQiEbhYSgQY2GTObolpkXBAqdfB
         r/2J6QiPRvtheSEEgr6m1QuE3Qpt06+/NZgw3QzerhA9AhGVBw2xum1IMW5mH1un8PB2
         +C99T/zHei3GfousyUvm7XBtg9lFMxHahS/F3WcmD8WweA7B4/tZ+nfqhKe/IBlZef/k
         DCAxkTVhgVXnCyaApjYA/l05NkQ9+If5WEJ7qamXAiCaFAYAM0ZGjHPMMH/O01be2GO4
         DmrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUACci2YH1vnv/+SjMk3vqqmG/dB0U6GjdTx88q4JRggR7niB2cWFzKRofWE6ZHWwldgD9rABWgL7ClgwT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zMsahsZm/MLTUOnfV+vrw7avgssvLnQffz9RLGVO9PaReCcl
	O8hHjxXL5xi5U6gIXN8sP3sU9gm4FAIAnIA/ZHOic3a5oCGt7a6oACbog01O9K2Av4AVUab7der
	5prB+h4oiyi3JJITkHsNqk6DltBgAKglVbrzFmQqILP5wVzDWi6KbInpHsW5Eg9C4AT0N
X-Gm-Gg: ASbGnctIZv+DzIAfjOi2BZMorkFNs2B7Ro5sLhNbfKZVXuRQQvLzPA9t2gJ2IbLAYXs
	DWhOmRQFMJQeoa1Wbb8PmO4Gs9yaj3dC99ttfZGzgDEo3+wt+0RQWJyGGUXXzxxR7a3BGuWxwFM
	/TD+hbloARNUdkN7UG/JFNRfX0hydutGwaY6CIm1S7LjfKz2rV4MObqEu+XT0c6UbjpdwXP8rBA
	7Ma5lUI4/Qit6LI/7UQfcKTxjCzgKSjM/cXEWW9uFMPHO4NSSWVigwS8/UCr1ZgXfmPZb4qH4Ca
	XTztLom7vy6UYrNpHjoPH1VCvTu7VN8Ei0Vr8PQn0Y5tthx1vxrKCmqiPMpIKgFfLINEpPjCOA6
	egQYhccPYOI6TJ/TTWQIxuO92eSrwazpb42mSfICXAnO+Uqa205sFhxO/zHwfX2vUIosNqg6trV
	Gtgf5OGCKthnGlMj4Dt+k70iU=
X-Received: by 2002:a05:620a:472a:b0:8b2:f371:55fd with SMTP id af79cd13be357-8b33d49c4aamr476407085a.73.1763765040886;
        Fri, 21 Nov 2025 14:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0ofJpRILhI6bT7upBiowbl4/wWW7HOk62pS6i/7dX+IWtsIMnQzCq7R/HNDZEkEuBvwi2sA==
X-Received: by 2002:a05:620a:472a:b0:8b2:f371:55fd with SMTP id af79cd13be357-8b33d49c4aamr476404185a.73.1763765040435;
        Fri, 21 Nov 2025 14:44:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59ef2sm13345351fa.16.2025.11.21.14.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 14:43:58 -0800 (PST)
Date: Sat, 22 Nov 2025 00:43:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
Message-ID: <53wibjsozkxtgo3nfvdf7dmxpwexgv2wveazc5ql2qlqhxeuyv@ypigdjopj4yp>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NCBTYWx0ZWRfX6GeO50OWag/8
 QO3uYR6bBZwfkfUEixZJfHN6Ggcpv4Y9ZMy/afnFFkX63Sg0coEA2Qj5adKXLsYQVF2vC18Lcfj
 jsecF75gcvywUEoZ/75lMVm6PMARTpQ2T5+/hA2Yo+IbcAsjVJYahXuUQeSGnvApfYwoh8FPeCI
 nFMWPbA+otLADM69ie4HEobv8W9vmYIaWCtQv8XhXVUlPXMRfWCLfjqEflUFgO5HFktPFdqhoU/
 kIZ1SuQ8+s7m/HBMi5ZPZYrlaojl6M4XQfl1/lD8NmyRZ7BMtEEu/Rs763/xKYfXcPCs3GU9uy8
 S4PVfCXldiQB7lag+SiSys/HTn39ofGej5VYEihExpJ3v09hWSk/0gOspF8Z4a13TJ5Tehcr78D
 S9kLgEcu9XCz1zwLOaB+gPq5g/EuSA==
X-Authority-Analysis: v=2.4 cv=QOhlhwLL c=1 sm=1 tr=0 ts=6920eb31 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Mg129bpxoquNgMNKXTsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lIDGLE7ceTd9zg6700dFh68CHddwJJSR
X-Proofpoint-ORIG-GUID: lIDGLE7ceTd9zg6700dFh68CHddwJJSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210174

On Sat, Nov 22, 2025 at 03:22:15AM +0530, Akhil P Oommen wrote:
> Some GPUs like A612 doesn't use a named register range resource. This
> is because the reg-name property is discouraged when there is just a
> single resource.
> 
> To address this, retrieve the 'gmu' register range by its index. It is
> always guaranteed to be at index 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

