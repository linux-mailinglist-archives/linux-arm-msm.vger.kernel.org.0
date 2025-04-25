Return-Path: <linux-arm-msm+bounces-55731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EF6A9D11D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8C037BAA85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F442219A7E;
	Fri, 25 Apr 2025 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buHlkdeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673B21882B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607960; cv=none; b=nfoymJBW0oexJjFL+L5bKlcAd7BB9wvzrPGd3pMox+IpRQVlTlyVOy3De1WcPe63U9FcdUG1mNtEr8xLYqb1TDzZVK+bL+3KkYBFrVZ99786sX516js2pH8KTUW2po68bhAH3FVTBHsEwKfB0nFwNqSKItlKmyOU2kOI1T4UXDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607960; c=relaxed/simple;
	bh=k8cBQFBtsUcnKnz0V/Nj0OYz9EHXAT2PzP5BKRD8MVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1hn8X31wd9kvk+7lMCJkoSTeH5icSuamfLe8P4yGm6Ofzs6tHGYKX6l0ol/gRqqr9E/VJfTp5+92cLM43Vz59s7TrsxQRG39qpo5Vbr22aaYQ4saCJVnVF3nsuU+6w9SxNNMJ6aljQH/PLYy7ab9eOe7k//oxFjW7Ip9PEkqWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buHlkdeU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtBw011069
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LRv92KOIwcjmIzz9Q5TxqXo1
	6+d8D9ntGnUnJ9cFXrw=; b=buHlkdeUCX2IhNHrdS2sz3oiWrOK1CJJhiiCDn07
	fUt8T4w1jDWuxz5UY4UXBWypUlbeIc/b1tvICgWaYNHZBBXoTQH710SjWvxUHs4e
	eyt2LBwVssiGYbKvZJ48NSSOA5fDrKCDm5cqN3SWS3Mc0CsoYZlotSRNfybmXaMy
	pWQkMWSFdXvEK5e+rhIuXaGiYx+S4GsKDPnDO7dz5PCU/55mflf3vJhAuq9s7jDE
	0t8h24AyKNI7XC+7EN+Sf+tSE39282irX6309eWPCJ0tjkg3Qv1S8USTGFEmOvsO
	VkYdWLrjb3f97pdnBXWdR0rJbux0j/ZP+kVNfCWkvnIJwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j7fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:05:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9255d5e8cso456097385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607956; x=1746212756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRv92KOIwcjmIzz9Q5TxqXo16+d8D9ntGnUnJ9cFXrw=;
        b=iOI8UGgIZMQTqrM/NsSgPke9EtzjEXLFDyFsU5FIc2vzzoEbPUfjc/Gt4AF2dFZT+Z
         nCimDfLMpBNCoqVvhcNfpUzYJC+W6Vkk7e01oe8mAsnBFPeVozwk+uUZOFjzMW5kUS99
         h7Wy6kIxoohILs0VH/mkukEMt9VjOk/x+axqQxxZnrwyCXiDOlLskQ6z+J0iFd3wCiW+
         2yTM1xc2pQc4KKIebZPpy0iW8VM7sgxtBKtDGF8g+jz0n9RrLVj/azihhRTT8QD9rm8k
         rt3ga3t0WOxI4C6qbJWnNa5kZ8mQxCHRGlblBYFZIhtBG1zO+5c67AJu1dLYNLHh/KGf
         7Lqg==
X-Forwarded-Encrypted: i=1; AJvYcCUDA7qBvz8whhagDwK7gmfY1mrvI3CbURWtzU86lEwLpyNiPYmx1Hk7cdVRPJ4y8J/++sLOBc1YpKnMCzgW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy8Jdvoy8HqyTfeXDh5lQ7Dbois/zBF7GQZey5N9flc/QCXw3g
	w8B6rASHTy976Ksi6eQW/wjYhV3Ilew9JOgh3rr0J0f8G+FzL1jNfo82VAWicO7o5xTTHwR+agB
	0oPZZ4KrOsnjFH1I3JUA12+7cHpUZrDb+hGqOJt6g/51d1201OOaoT+uw5g3OO5Ta
X-Gm-Gg: ASbGncsV3A4lPimJMdGnh/hq631sXTFgtbwwVggwcdBMoHkyENqpBL5ipuOuKcUhAFP
	v7FP8ozNUW8DSW73exdEZ0GDDt+XMlTzFqI+vMQgaXrnoTOzX0tCSRV4PBnjRnZ4y066y4tF79c
	KOSy/2PjXvrm2Wq+XhAaZzgC6eTjC6zZsrqkeMbsBu5SzRzpta1b/SOS0IOQEWzmW7Pnn4QidVw
	rwl0kE7J0aFhEdKUEWBjvpdszIZsyHyb4QOWPvZh3D/e8KWPCry9dzwW0wbj/NJe1L+6+ZssWS0
	Ph0REI4SEwBBThh/Ek6rt2OrvSl862N6Xhi45iMV07DYpVipim5kqtqEO2C6z+Mek7mORRIXNq4
	=
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id af79cd13be357-7c9607b23d1mr561079385a.53.1745607956402;
        Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSIuxa3fWgHA8r+nKVNS0fd/thKUyHE882nF18+9xWUpORLb5D/kIP8t14NpMUJ3MCW0p8BA==
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id af79cd13be357-7c9607b23d1mr561076585a.53.1745607956073;
        Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bf7dsm692860e87.100.2025.04.25.12.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:05:53 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:05:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <kawx45acgpl4ywifjnszqhddtq363etjsyo4jomg7mbtqmmtev@nqghr5rtsoen>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>
X-Proofpoint-GUID: 9XYhTbk83SeMoU4YCJrVx8kT03lYrnsE
X-Proofpoint-ORIG-GUID: 9XYhTbk83SeMoU4YCJrVx8kT03lYrnsE
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bdd15 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-fZx5E-Z4OSi-0Z-ZQ4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX3XaRsHkyG/h9 fYrd+9lhCyXsQ5dpSQ7zVU5Z/fc37mNg4WJbqh6KsYSvqhEWjZgcCTpuHIukHj7AwMHYERxK1ja +agUr6FQEGLhEfNi8KWLJLl6Lg3g9k/LKOINYozZZGMUueBAACP2IXr0YwnTQeOD9Qdz3rmvCXO
 e4khypNDcujn7VQKPAj0PTZmqyaDv3hmN0XGcIU+HVqVnKwYeNFe7+AP8uweSDvXCX+obZOSsYm QsstGIz3fMLtHOE9e43Y29+LeTJrvsn5zY9Ez997SrT72P2hZPppX4c6ywJF3GhM4Zbkw8bTOFo C8mcJUU8v83OicGbszQojkFMN9hwfO1d4JU41N4zITnEOSiUwykUe4JgFK+UIROIJ8h7o+KSvei
 9Ru10yN3P27bjTFBiP13iINYzy7Y4wGR2esJVUxV/J7NQNfWXWMZaGoaKWjZeSOaNSzCeXlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=802 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Thu, Apr 17, 2025 at 04:10:34AM +0200, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++------
>  drivers/gpu/drm/msm/dp/dp_link.h    |  1 +
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

