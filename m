Return-Path: <linux-arm-msm+bounces-86036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B8CD33A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C6FD3008E9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D91267B92;
	Sat, 20 Dec 2025 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfDymMwa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="do8B7oEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37C28C2A1
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766248863; cv=none; b=YZFltKzE/S/epFWoFgrn6771vRAEToYhPs6T5w5SQOG1+8+VLe89tjusOtDaNN+G04/l7Ti40hvqgOOuB2Nviu5cYZfiaB5wO8kAziFnMs8h1wKrl0/9B8tsxbmgrOTlChdGCxJb2/435+BjK40Lu3EH5cGBD+RFFQspmXCVLVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766248863; c=relaxed/simple;
	bh=qBffdNY5O2Eg+xeBMRq56Nkc3CXpE8u0Jfv0fAX2GPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmDkYLjecaDRh/zN/Kt1IHSq49ucVcVzAtZYcQ1KCpZl3k0dVx7or/9ws04eGb+GU8FqVwLZX7kLUCx277IVHErlGmceEpRJGFeCEsR4+MNhFy9UYFJGfNjAeTT1U/OtV/DlMcr8O3g6IlIq+DQrm5iKVcID8XXIkL3YDGA+7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfDymMwa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=do8B7oEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPo71089284
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v6GNQuSH/qpxPrgBm42fdwp7
	zr7vPXWJPpjiuOQ47vE=; b=SfDymMwaCU9x53xejNLTJyqgVJm9ccK7FPYh1msk
	JXyAMSoNPLokeJNUwy5sO7sfLcCA5R7+iVYIcn1FQYMrseCRN1zXyheM+FgiE1vB
	oDLbpSXr27arxLAR1kRMf+/7p3fVtt0IfsLuIACXq7xbgHqkhTHwwnMtRY5f1SF/
	ZjMXISCHNhQByEhBtdB9kniigxNaAUiNkusbP/JMFDj+9okThN8uZpz9ArJtKO2H
	ZqcpO1P9cApZN0SL5S04/xi+dwM4mj5QdCuyQ9kOD5NvX0v0XAlqzbCishLwCC2c
	RPEw9tnM3FrPgQRVNIoDc6iwa+xhUVW7cS1VhnYklIGYvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mra8xt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:41:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so86040031cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766248860; x=1766853660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6GNQuSH/qpxPrgBm42fdwp7zr7vPXWJPpjiuOQ47vE=;
        b=do8B7oEZ5KiRavHW84hfRByYK1CxpJZNYvZtGwZkI15g+TR1ZN9fOU5DMb4Oc9JLme
         1Xy+uUpXgrwznI3PlEDWHiLlBubCXqjNL49+bZfH1ucjUStBSnAVMOmr2xq7sk7sODax
         n1gpd9+aTaaX5Qx+X1mb+fCQvEWURs8HuPRXJYmgniU8YlqAhKAOcp/yiJ+81+u9qbue
         eqUQ/pGJMPSIjpnJmlyiRfh//tEFsduPxx+uzzkngmB7C58cl7rhWXMJbUL2R48yrjDv
         b4uFgmFTkNt1+cgyjYsQHls9FcHUWXSIaiYQT7WMQkBFwu90hSS0sbJz2QvdVxe6Ud6l
         DP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766248860; x=1766853660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6GNQuSH/qpxPrgBm42fdwp7zr7vPXWJPpjiuOQ47vE=;
        b=thld+cv5of/c9VkoGz11TZOFQf7Hr9UXHjt1iKl5p0KuvX03aOQ0HvGwichBuDemV+
         97o3m0pL2yeALX+ZjTGoKP/bERKydgDb+sfEB63mJCxE8ieXZ9JsLnfZ5f7WC4ibqpEa
         TKzWEiSwHdYudGuhKBkyVkcZZTi6cfHe1caOjHPJswCClW0GbV41vhrM9URbfdVWQ1ef
         4GwxcYv0RTa49CvlTcraEHN8MZ16am8sirLo/Psub2fN4JJU8iOaDkzDU/yXcFeBA6Mm
         T6x5z+L7zQpaquJRHb5ad5+gEPoo98xBatWGKtS8DxDHUV0JV3R37Jag0sNClpI3yoMD
         9dPA==
X-Forwarded-Encrypted: i=1; AJvYcCU+c5KPVqQIW2IMqKV0ikCYJR4yssiMDzD+yPBtkG2r4AbdwN5I4M103TZTw971UtiZX1GfhywGExt9wo2S@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxJsKITgncslZdXk7OHjErNNsWfITdRbhRVoLEU4S7022+XsT
	loFZO+dFeLvCkr6I/6WJgukScI2Y9d6JIcmNmF91Hbi3p+umJA8pI45VBV1Ha3Hi9rd+Th1TJEC
	zMDa5/Kc18HYjKM2+RxuE6XjeQSMHDd8rwn7DyPy5QQJZOzxYTu7ZUGq4jHq+66Y+JHR0
X-Gm-Gg: AY/fxX6SMYW1nUIaEkSLUnrt5Sw0HE+AKmmz2jGgpi2YGY8aHV13XU0/nHG0rAfi+eM
	Vfxrv53bc7fUlo42h+GXyfPi9cqV05T1Wt+enicMU01H1p9rVQZkkyU4OdsJuayc2qUw+SOuBYm
	uWR33kWVsnBU79SSp8V6sWtHRgFz0G3K5SKjJPNDotC3IcRWenItFI5A1U7VucC0KcCkQePXGx1
	l5Bx7M0INWx0+j7XHR8Vm03hPDhgoPhHpylf/21z0wK3w6Ooxmff9VdhP9RohOB/yLXT5AYquXW
	PL2GvpiuVc+ZbIzJ/TKPGbOwJ1cNY4LuojjODypLMSs/CeRPb9ESuAQ+zJOs8ybkDiMWgjuGtl/
	tfP402BI7DZcV+XfGJViZAqvr17NcBFTAJv5eh/6C///nY58r7Sx73lwJtQGIEcndK7jBtvtIay
	kMHYUi4DgtfHHOww/Nu9KNy0w=
X-Received: by 2002:a05:622a:1e8e:b0:4f3:5889:2a79 with SMTP id d75a77b69052e-4f4abdcb97amr92050341cf.81.1766248859883;
        Sat, 20 Dec 2025 08:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1yrfw0nPqMO1h68f/V7vtTzPbAM11st4i88h0pn9nPirrUnZ2f67Kg7nuyDy8LlO+k3wUVw==
X-Received: by 2002:a05:622a:1e8e:b0:4f3:5889:2a79 with SMTP id d75a77b69052e-4f4abdcb97amr92050041cf.81.1766248859457;
        Sat, 20 Dec 2025 08:40:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262ccefsm13123671fa.23.2025.12.20.08.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:40:57 -0800 (PST)
Date: Sat, 20 Dec 2025 18:40:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
Message-ID: <krmtynkrnpdmunksxwntrnhsopbv4hu3evv5hanm2zukip7zy5@tqtyscekzqfq>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4VB9V3B44I2v7qpu07xEARaB2vwUsNaY
X-Proofpoint-GUID: 4VB9V3B44I2v7qpu07xEARaB2vwUsNaY
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6946d19c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lw3N_3V8nENtiHrPz88A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfX5eVcdmNg4HTT
 t/VlbhiM75mioSipwNhvD+E/kVsjYpKFUPNBapsWnDAHZsNjPYk0Ok5KIgqiuF7jU6At2ukugdY
 dULXTRnNlM4zvdhYVRHKpHlgo9r9uz36WuV9vTzs/kf9DB4+IMKJhQImy7NsZfviyzt3Rxyu970
 hPuj5OGmwOWPYd322ydIHO43DwEjFec6WzJQ7JUa6FpW6zHZq9/guZirVrefeWiiVh+e9XwPBcG
 yiCbTQZtc5MaLXP80y5BJKDn/jQW6YZVMf1S5+SWzOI7S+rGYNLqaNN4V1Q61A7+ppfDOlnONlo
 N3mTIgn6gNKZ9EurCDBMJbUxIIW0iRzw29D3ZzrcOXQVxk/Bb0lgIzOkQyDEjPyX5GtvYIzmKNi
 luTb46Vd35WcrXYqyNT/xhBAKe/G2lc9Ng0ex6HasY5HEwyTn46XJipFOM4K9N0gtKiCQMqHk+e
 Xr2ca1Q8RGg0tcQyVkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200145

On Fri, Dec 19, 2025 at 12:39:01PM +0200, Abel Vesa wrote:
> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
> 
> At least on Hamoa based devices, there are IOMMU faults:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
> arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]
> 
> While on some of these devices, there are also all sorts of artifacts on eDP.
> 
> Reverting this fixes these issues.
> 
> Closes: https://lore.kernel.org/r/z75wnahrp7lrl5yhfdysr3np3qrs6xti2i4otkng4ex3blfgrx@xyiucge3xykb/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Fixes: 5978864e34b6 ("drm/msm/dpu: support plane splitting in quad-pipe case")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++---------------------
>  3 files changed, 40 insertions(+), 110 deletions(-)
> 

-- 
With best wishes
Dmitry

