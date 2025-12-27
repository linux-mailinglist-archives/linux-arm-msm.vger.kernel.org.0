Return-Path: <linux-arm-msm+bounces-86697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12CCE002A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 18:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDC51301E167
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 17:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD2F24A076;
	Sat, 27 Dec 2025 17:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qjy2qRXg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzggXxmR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B371AB6F1
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766855789; cv=none; b=X6M4k4NID4U+Sr7crst8A8na6JHHd3bl6Fh+D5RnrDQnBixLwNPDPLp1/zteb3/ucM30ffCLpzDCD92yL4WUZv7mXG/XZPs9CNqh+S03QXqdNK3HEdW8tJHWU6xaJ3H6VIff/I0i55T5yGF7xfss1iqGh6EE3mE7AOVQJqYD7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766855789; c=relaxed/simple;
	bh=+7oylBu5sFDwIyUmMt/wQYaVdW2IYylyHSzAdQPCF6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVc1mmtGGLwit0Q4Yt1VMve1Fn0/xyYCzxMoP8Y6qqsrWkkFNlsNshd0HVxPrQ1e23OTrS7TnKB/OLH3T8vmEeJ5lt1UabWOJ4dZUXe7DeJn9chxAHgZyFhTWGE3C93EOetiwstxFhE2qgDYrxW9Y9uhtEAQ1pgFvk3LRL1H98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qjy2qRXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzggXxmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BR4eART656125
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OHTNwSpgqtc4hs87hHEPCYnK
	Ihd4r2jq6fJZXGf24IA=; b=Qjy2qRXgD7naCyrBml4c45ess+keCYkLSFQ1ciUJ
	SmvxVMzBcqIKffWVfVFA+GNnH8ucUFS+jGmtkKhO75UK0MxbZPc6D+AuXZ9zyVDS
	bUPy/2AliK47N5MiziAOfux1Xyf0gxM0TGlBqYIUOJ+azta+dxl2w7N7CaKbyOg/
	WypP5RDCxdu/OUwyLzmzCEYg9XKnR0Tu3RKHFZMrd+n16tlFXUUCeKxqNyjjKqde
	owXKfvFRLc8Yt+hG2yHUbp3sBuw/nzq31AoLE8Q++BJigUAtVFv9Y4zG3NYJ273P
	LvwznRCcedLdws3+ggV9bPs5XRUErWtG/70h2HqLzANj0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8mf0t3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 17:16:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so197771831cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 09:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766855786; x=1767460586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHTNwSpgqtc4hs87hHEPCYnKIhd4r2jq6fJZXGf24IA=;
        b=SzggXxmR7v7goM80R9O7Sm201RQvNdLdTYyefGv8YjvLFGUymTVRzKFg42YTfiQiUu
         Q4vYvtc8z5Z1Vw4JxgFZ4yVAnVrOyffLfxIFbBhdCjoC7ke/mwyceLWEcuKNbdHdsjBE
         HPqs4isuGVjstuoXU8ByWwsQfC4qwn+OHpm3A+DLRm4bFgs4QLGM2Ac350dqMT2nGqKY
         NCB7HkCdhEmt4J5qQgM6LZhdi4Nl5eBlGoL7HazUaiOXjtqOenfWldwSafotZ1WYGlAr
         Z3ALSvznd8UVaDxwJEkqYUOjrPWLaL0XcVFDUuHXsUNXgJoxjmTDlGQ9iVHZyC3Lg8sy
         H15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766855786; x=1767460586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHTNwSpgqtc4hs87hHEPCYnKIhd4r2jq6fJZXGf24IA=;
        b=HfV97MZbZZNeBeM69kQbV77+gGDEJi4EicD/L8k2AGFZmEgpRrBjAyrv6QcQqAw2LT
         wm2BkYFlrZLdTS8UWh1fzMlGVuwQHoYI3t7Y7Be+f7B0PYgHS7ABybI51PEoXfepYxdZ
         imjvtIABSaYs4zIHAKw22huXVuk59GLUtUgI2u6CD8L/mhJ6MOzeGBnCyq8+soXjgiY7
         UK2zLjQkxGfvrcaYc8L4CFD0Tt9/yrMPVamU9fDuEUYr7frkbnII8PZmM6BF/FoM3AL6
         xQG5sZUBEPUCZqi7pMAJYkUo02jmZZVEMmO2R7za3+kf+JSIbMwrKoiZaok9KNnyMzcm
         Fc7g==
X-Forwarded-Encrypted: i=1; AJvYcCV8e2CUQ92Yd2Zip7bxxBXwMbAyr73zmbLfClOxpJEr9X+mX/hURWsP6lFxuyz6EuUEgBZamESCC0omeJkn@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJPPRq03EVGRWNIPlxZIcYTaPOp0S9J9CdbNG5tgTq0YEG5sE
	Bz9jpc0feAKOV4j72a75Ne57Jj5tlKbjTga00LIvjrQahCvC3RRbkOXqFCJ2wyOdA2K6le9ryI4
	PvHu71XZZqCmzvF1G/0XAFp6ASvu8UmGcK+O4Sa0C68qSL6Q4bKo9GCQF+4SU01Zl151O
X-Gm-Gg: AY/fxX61hmFdNPEqhX6SjUPegWIOZ5xiS8IdE6xL2NMlvPuRe/eAtLZDqzcqOB7+paD
	RDzqKMABpToTnjiXPINGWU7NyEzV0JrIKjw/DV5kUvCt3QhnvdNvyOPlgXGf4mz0que3ne//ls1
	Yn2LnA2WW+X57VzoZDakwQwOoA/xYR71wtvDaBTtxkAWZc6l7mXTYSiMu5ZRlWT7ook6vrENQbF
	0orDVevQ98W8EeFARyCDx9jzlylE/dj2NXJe5R7//9Gzv3Z3fA2VEN16B1JSdIpbOsQ3rPa5oQH
	eCLDcZEuX+y3pztNKMcQBLpPk4w8V2IHWktWf5Xk8ibHPvuYw2LaeLhdRnKX2bgea0GoUxfj/zw
	cUFwhU1eGRR4vBGDweQvGMTa/3QjEI+k07lu6eyTswIZs7MiHJ4QY8GFYDTHToYzE1iJhYbx8iB
	UX3qZofBg4D4TUtgPv3ZyuJiM=
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr436647151cf.7.1766855786218;
        Sat, 27 Dec 2025 09:16:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaVfWYayzuAPhuBrKQAY3il0uhSUminJczgemb5HUYr4w8B2G/OkItgknctxpCiE2WadhZRA==
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr436646781cf.7.1766855785788;
        Sat, 27 Dec 2025 09:16:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267964fsm67171161fa.42.2025.12.27.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 09:16:25 -0800 (PST)
Date: Sat, 27 Dec 2025 19:16:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v7 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <hvjbohxvyogsxkt2wrzdlzlbodjtqybyxyt7bbp67xq7qbs4iy@atbtkdltnhzp>
References: <20251226070534.602021-1-kumari.pallavi@oss.qualcomm.com>
 <20251226070534.602021-4-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226070534.602021-4-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-GUID: yt-vxFz1-h-cLt5iWSmY4z-7DdEvBNV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDE2NCBTYWx0ZWRfXy+3YPEqhvrCL
 BS1VQrhqMAc4Uht7dSOyVK1t/eBQYwT0ahlHTwf5QRM/j3+VRf0sZtvmHDyI5FmJWKTAwreZErN
 OCnMP6zy18TMdiE1PrdIEMI/VNliY5vy8PNf7XoMV/0zAMpK5iotlvcTh6WZl5S0ScPoCdSGTH4
 5K8Eelg4FMCqQWcPse4FiAP5xAH6kg1Am7lLWkrGcjFjJ2lTOWaQ85rlNIQ0nQTPx9tA4Cu19mX
 zM3joBIMV7oC8B62Rjg/661bQYn/92uUtvbo4hXZ2DnaqylxvSsUWDo7uF4Ydu2OGtJ+RfcBxho
 q6IV43Z4MspJ6vI4sfx+ggoqd+7cag/q6CmH81wnrpt67Aw5N2QGyfHxw338Ul3Inih8f/FFLKj
 jbn3YkuPe1SxhvAiLoLmmXaoMsiGESNBiWjK0LulF7KfvD07QAaeMKGoNJfcog7j7Ra+CkieqaZ
 fwqKFrh04hSRm4iHgLw==
X-Authority-Analysis: v=2.4 cv=XuX3+FF9 c=1 sm=1 tr=0 ts=6950146b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TmOT9BjTXP3hLH6PdvYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yt-vxFz1-h-cLt5iWSmY4z-7DdEvBNV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270164

On Fri, Dec 26, 2025 at 12:35:33PM +0530, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 via OF matching on the fastrpc
> node; otherwise, default to legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 51 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

