Return-Path: <linux-arm-msm+bounces-60681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B134AD2630
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA1597A7B43
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2CC21D581;
	Mon,  9 Jun 2025 18:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EafUsoQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EEE21CC49
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495300; cv=none; b=otxEk9KBIAsLx5VOIwiMmWGYRM5P527/Aq5G4wMbiciKpZyZojtg9+LfQ3UqsTXiDykjqUTPoHKeN4KM/7SHYzuhTHoJPMbhJhtgHVEZaglpn//KF6zf/nsirW5XUytxoeYUIOUCLeQ/utgK5KgP577+XtkxJc8s7CL96DwhKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495300; c=relaxed/simple;
	bh=lLmwBsgqDrtGpBoG6u818eLdzLFv4tb9Vzn5v7VixA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rodZhRXBFMYSJmCdloOzBOdvC6leG44/LjQ6h5QXCKGYQR3wusmQNFf4H/Aw+sGM2IqekmVlXVX9s6vQZvoFqJdOm2Gr8WNl9gUQ3hO+oGS9o1bSDiqib/fJG3o2vjNGa+YV0A3VhHb1FyoSRaDsVM3bVkeEweH1W84QmLpyTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EafUsoQF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559GQ07q004050
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 18:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bdYSp294Kmo6eHdYI4u8F4yR
	kn866GRiB5ZbygzcprE=; b=EafUsoQFjER9dtK/DAMY4LtUOOHr+2JZ1yPJzRdm
	q2RztNB/stSra0seTjs1t/+iKMNLnLqWprO/h/B2HRCkBMpcBFmcF9gJUFTu9GGg
	U6kSzocK/oO7znsssoliJgh+8iqOomiIoX4F1piOPOg2osW2vsoyrwlpIXyEMshl
	53isUTrcBzHn55p/R7TFzfcrEJni4fLX+BOaXvl33+H4ulKCfv3P+D1MJBzFrQ+g
	mRCRSEIufOza6QUatZCtFy7/2YVs7VM7rcfF31ia5hFHL5S7lhlCBg+IOXxZbOlI
	KNjMI0ny9yuHkgdY+z5kRcwZE4GW3eHjSdXQceHJaY+2+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1qx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 18:54:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so813654985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 11:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495295; x=1750100095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdYSp294Kmo6eHdYI4u8F4yRkn866GRiB5ZbygzcprE=;
        b=sd1LudPkfyXUcYTSqoHgFVEOrhGGX5kX611aebOi9CYq2FSsSZvzzB6jy1KWi93DEq
         13y7enhx/7wAxpAkKaJm/MWcBP1/3RvHykLgZRvT6I+LpIC+FTjwOc42Ymk0JnDEGX/q
         PWU8gywt258EX+ZyLPDyRx2vNUrDGO+KlaLdvMBBVCyMuEuf06K7pDqlXYVacCis4gRm
         /+ukrNwyEPyv7x/bNPl+KbDk7ryIWp2iQ646dTFdvO1Uwk5yEkKDgnByAzh0jSeehA4M
         dhR8XDem8PuOr26Mj52HgtFSfwYq6P/3I2Ccx9/L4Yjm+F/cXGmROr/wzMcIVsHcVuZa
         vyOg==
X-Forwarded-Encrypted: i=1; AJvYcCUuFlnO3D8fqOrp8Fa8FtHZjFrkPlCq8FpBVyLj3oqJ/1OqFCG0we9At8GEMR9wgbv7im09dCll+sXyswZN@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZrNcc29cDDNzu2B17Y6PR4F5etYs03dm0rDCZNXbUWpDMCQy
	atM7NfW67UspfJ3CoXUFf8RFOrc3KabsMuDctvdaszMNcu4n9Syn72Xs9FPqX63+mP5XwY/nQ1o
	HvPLo8fgFrGFMYpzDZmC+5DXXPoTIHOuqyJsj8G4C+gHMO1rcpQh7coyY4z/pXoXeGj6v
X-Gm-Gg: ASbGncutCa5o9OJ5zATyjXEGEwGcveOGGsdA/M2LjQwPyxbecIkyCqKqnZ9vm89be3V
	qnzEsSCI9NYox+KyhlOZrkrA3imV67Dv3cqWtO4tSJcFzL+3GMLianuaXBzy1EJBi4AenysV/w6
	wm09/EyaHYx27UiP0H07TUHXAW+WNUmQihMIfS/FLV4SKj6iU3UpMKF9ermbi4c6fYQWX2f0vnv
	5NzXmaCUIAi8tCm3YHDfd02dcIgJrrWJXApijuYef8GZWu7Ylu8aWHNVX/+D8y79qnFbk5kXqNm
	PI96031Dk6ExU6WJjw6tbiwFiYBe30KEoOwQQ2OoJmgJKx5A4zPRzKoC/QeIsHW8V6FFByKXRDi
	Wc4Z5wBU+/A==
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d38d2e21bbmr731860085a.17.1749495295545;
        Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNLps+ki1+SdzxXPF5sfV00WqC348swYXpemcq1eg1DxuJ4nAqN5qEFtZ4+PjRVI+oaARS7Q==
X-Received: by 2002:a05:620a:6a81:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d38d2e21bbmr731858585a.17.1749495295248;
        Mon, 09 Jun 2025 11:54:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a1e5sm1291949e87.141.2025.06.09.11.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:54:53 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Message-ID: <c4myfvymbbg7likuahefxtuscskkreflyonx4moul4dqnvmjog@mzzz3qrlsocj>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX+YalLFz7VtSz
 nj6VCQ8tnVKaHV8/uLjz/+0+AJbNAGXd3B0kMysH1YfeWl9iiuqL8xfbZDas5XyqodGKqSLV7eC
 Pbk6ajqk5Mn8jojyr/hadZu8dK3sp3JUb6YgWLEjZs6VlRl7zECHBr5J/LhgcTEX9N9mXU+bZi6
 Lzgqe8dg88NBk6/7gYc8+/1KYpzm2lqGD8DyZ3plzQz6Ci0m2DoMzXEaERCxv1WiPIu2J/1G571
 7Ug9hTDLHsITgDpUBnO8AGKyQvBNGLbk+jaUCEifNN5t5fXB+P3p+YrZW19XY8Uog5gWUUb17C2
 BNW0PJY6mnmyn39E6Onk0OLxyEH7nsLfAoZbt7J6J11HjdGwKKfU+0nTTfi3bcobmJ3Y8TjwbED
 vHoxEi9rNdlbE7+po3ohhGMH9a8Ajc6bP2OaiNXMXVhHbaBsatVXVGB8wpk49BVMxPi1Jrkp
X-Proofpoint-GUID: NH9kFANUi2DwKQPVHtY_w4-hqvnSiv5Y
X-Proofpoint-ORIG-GUID: NH9kFANUi2DwKQPVHtY_w4-hqvnSiv5Y
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68472e00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=722 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144

On Mon, Jun 09, 2025 at 11:24:35AM -0700, Rob Clark wrote:
> To better match add_gpu_components().
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

