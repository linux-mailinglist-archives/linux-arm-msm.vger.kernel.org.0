Return-Path: <linux-arm-msm+bounces-72824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463F6B50091
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14FB17B53D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C00345736;
	Tue,  9 Sep 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXWfFaKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611D2749DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430098; cv=none; b=d759LlxoLlWv1Vwg9UqOkDOtVFZf91EHvszgrAURCJSOcrK4XXghFwsSi9uAC1yhO5nhjZX6CoYDkfHd47VL5q+t0Hfh1PXz5E9lGRZBDl0WqKcGgk1kuP7MIXcymIoFwE4Jcjjh49/LZk/9Xk7qzHu92vPwFzBc1y7UTQA5dKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430098; c=relaxed/simple;
	bh=4LjeH4GNzPac6D3Qy2qp8apPQ0tzCR1kJkThxZ3Q/yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I30/DTF9O/Sve5M8jZc8D2fDRkkUAiK29TNkuOFKlP2Qeb6waP8iViqce/3Q67P0paUVGGhGGNrk5uaazf6x5Dajc3ndqKHkkpZunzM7iscfaGVOjcNc+2xTPW8F2cUMRaFTJuxnAOV810d3/mC8ld5PvvAMU6LBzmMjZkhElPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXWfFaKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LX5X003664
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PGW3tJNZDteIP3YWspfNxoS6
	+2pzYXFb7hKBbebA/DM=; b=YXWfFaKkMC1+j5b1iYb6QUPrqIk7nP6cr8L/UC16
	Cl+bpVKeRzCRGQtXdtvTpP7BVGjRCz4rswD1ScxBqUGkOAevNK3ZsQSkYVEw3296
	odiZJzF1WEuWmus0e7fSEpl2iorE6UbrjKU+fl4Xr4uZcEvNGV65h9xmjchkFE66
	O1o5K/6IDPWh3b19rVk9FPUdmuUOTPFV//LLoI7T7V8quO8SM62kmEbrV25Xjzy1
	LXLq9BUMEsbVwm1avYXcKbWNlNh/gVKGmzhzq/XP2pkDIJQpOFTihbt74QfLXKt8
	7lz7FyxIiL8uhg1gdyCk+eUDBIIMGYpvYJ+VpACymMbxZw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapgwab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 15:01:36 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-544b17a341dso2561515e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430095; x=1758034895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGW3tJNZDteIP3YWspfNxoS6+2pzYXFb7hKBbebA/DM=;
        b=FLj7ZJBKScC5fefl9ono2eKfrsu1AXXu4VYfShNXScapnwqsKCqswMOmPFXHDaEgDA
         iB2t8LIXdSVt78seOU939ZWmQAHEFGZ54O1c3/0tPwgPU6ffzoA4GstNhiYw0XGWfb5N
         gLgIElsXfTtZFJetcZpBmOVebDm9RMgl3EnWHcVFYMzSFQXxe1jo6Pv/w2cfZ2b2MJfS
         rCBAaZPfR5M4oBlqi2KnODxHCbX5exa46G+pFBCnUDPDIOyZ7RhivRSpqfEf7p1Lo5xC
         5Pq0MtU8c/ugFDMl1V33M0fSz7fp/sHkQIB1SgLBbkZVOku5doX2p1KCP2faqxyPEY+2
         5dhg==
X-Forwarded-Encrypted: i=1; AJvYcCWZLgw7w+FHfiK3m3dqRZxpgkzWASLDY1qHDEFbIDVj6j/T6z53Mt5wYbMaqImLbn4CY1VIC2mNuzwsNHjR@vger.kernel.org
X-Gm-Message-State: AOJu0YwM0oJ7nyqywnyJ4E8N4vvo929QRwr/pxzN0aQwTPwxhiAGtboC
	0m2gMFSSaEb4MmS7KQZwpSWK0ZifESbGmUaXuAbYGJ9OE4RegZ0WZvak0niXZpWv4G9ooZ/qWr6
	rLQXDJLHrgukBtENjN7b1Gw99ud7eJqWwxliabUg8QxK3jmBET/zhUowQNXamXknZv4ie
X-Gm-Gg: ASbGncveLXAGpBjDEfS2RugQKv1QY29bB6i9quCUomRS+wQwLGmx8bHuSMbyGGSKak1
	ye4h0dT4GfGQWCmp1+uLMDQs61wDU0fPAO0V2B8urjK7H0AhLaN+XBs08X060TDr4IeWbXhe55O
	zsUCy7F7QWy6BjmyNNaUmZBlwk810b8sU+fq+3F1mtOs7yiURiHMcWo7Ac5SWyb4NjbSpZ56hQI
	//kcSGYIDwZy+I+Z5BbtrB2Uih5K8voX1tbGGpwMkNKcioJ6nKbmCslM99WZSJByVFHw5K+OMlH
	pU7twViNzgSA9CtXOTB4kxuoZvGkg0Y5VhKk8yCSFkOqVzXVogPBnOjyMo7+7w5j1tjVr3VMtin
	YS9M38que/XCrQGAX762DIvO8Ov/rFgcwIx8iVG2mXPUqlPaUtgEO
X-Received: by 2002:a05:6122:169b:b0:52f:47de:3700 with SMTP id 71dfb90a1353d-5472aaeafbdmr3072907e0c.5.1757430092420;
        Tue, 09 Sep 2025 08:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3tVoSxr+v5y2YajVPq9Q5lmHZV/iznnupYsR5oyRCsxpu2WpDH/jpQIioCiy1sxWM2IufDg==
X-Received: by 2002:a05:6122:169b:b0:52f:47de:3700 with SMTP id 71dfb90a1353d-5472aaeafbdmr3072611e0c.5.1757430090771;
        Tue, 09 Sep 2025 08:01:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032be5sm39213621fa.34.2025.09.09.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:01:28 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] drm/msm/registers: Generate _HI/LO builders for reg64
Message-ID: <pzj3qurdrz5k6h3nylqeiplfj5rnbayp7itzonxnekdrtzkii7@gh542xo2qm3b>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c04150 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Yz1P4QNMHuw7IOoZwkU3nxB6Q9TF4lX8
X-Proofpoint-ORIG-GUID: Yz1P4QNMHuw7IOoZwkU3nxB6Q9TF4lX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXzJaOJY0RXnBD
 gZK1SFciz+xFL3/im3t/uS82HkOZQjOSOm6TiNR7Q7I/Rb+/LdeTxdlVmPq+BwfrMGr9drSIuj5
 MNXbDczMyyvV5RJkcPT9sex4H4idROADWeMYPUqTJnhkD3pVqKepRqdLFshwvfrzQ3mHFZuJy3+
 Hjszj/nt/2CQXeKVclniPMbYWOuMmTP8RY5T2t8Wy+H5e3wwIFbIhYaRS/AnzG5tZXJLrz65gRL
 gdu4UQ4Tr9VZpQCsPUUdmpIF7Wz9MWcnwkkky357xvJ4jG1c5+GVx6uaSYpI2Oj24hmH7yiL0Gj
 uW4kTOeq726SrOmzPIUegJ3cKk/KcYI+5NgJSgkfnI0m5qK6RKx5yy8enzSXZlJeOFxiPXv/t39
 Zmvt8+Fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On Mon, Sep 08, 2025 at 12:30:07PM -0700, Rob Clark wrote:
> The upstream mesa copy of the GPU regs has shifted more things to reg64
> instead of seperate 32b HI/LO reg32's.  This works better with the "new-
> style" c++ builders that mesa has been migrating to for a6xx+ (to better
> handle register shuffling between gens), but it leaves the C builders
> with missing _HI/LO builders.
> 
> So handle the special case of reg64, automatically generating the
> missing _HI/LO builders.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

