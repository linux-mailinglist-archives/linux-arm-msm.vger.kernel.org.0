Return-Path: <linux-arm-msm+bounces-61776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5EDADF886
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 23:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1138A1BC0A57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 21:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23991D9A54;
	Wed, 18 Jun 2025 21:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBlN9mV7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B221B184
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281184; cv=none; b=E+axg3vPfpZK7j6rvAfDjQ4ZFlQyKM4DxPpwxg9VaUhVjQa2D01dQdzgnE5jFY/u15LdFfhI2//mBXOFxgm8GLyc6JaVLA3B9h3QrC9ppgf+l+3wjOtdMSZDD/dz5x+0tc3Qv+VWNfDKZ1xONcZAsQE39fvDSm4xabeD0XRC8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281184; c=relaxed/simple;
	bh=YqGb0+EZMCezEo0P+Bo7RgDC3F/Pr7/nkkRTRsYIhOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj9s+8TkayCYrXlvmc+68F63wUN7fNhzlF1qYBZbyqKj/hGm+adhO/aCLeQBosqmsD9XUvuiRq0JXf8uPloVV4eSqoGCFN8wm+bTH6bqvnrKRKP8IXE7rz398ECtniyk2WeY+dsvVeaIAvm2PPDg0IBd+cQFaVRiZBmL/UcNFwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBlN9mV7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJ6G1h022401
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 21:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vAAxqdVUwT/NilX9Bt7mr2vF
	kHGSU/5O/o5StSNmHJQ=; b=DBlN9mV7tnepeJZoR8w9nLi8VkKWRC8deKWDNvvT
	SEZXTN4SL8+tJbspoDTR+lS3SOnN6+/zyf4VkYmChl6SPXAC4kMc5MsCJmeQXxWr
	225K9CI6Uirv0YK//5zU3dj3HYYJ4K5TyD5ov+evnA6fqXTVu90xEfVlqXMZ5Eol
	7KFBlD/0Q34VLNVdrYfLRTdWcKzbRgXKXiBBK+qOMH+AaTe1XYm2j9wrha9UT2Ti
	nzvNY+Vs5T8oNUbbo59VxZxjYrQLkuMXNrNYHfhgWdKg6fy7PjxE+/SZ/JcesEMf
	M0/lMzB0V/YRP/gWFQoWbGP4izry5QL7862FtsvHPZ7Xrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mnjxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 21:13:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3dcac892bso12677485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281180; x=1750885980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAAxqdVUwT/NilX9Bt7mr2vFkHGSU/5O/o5StSNmHJQ=;
        b=El4vvXvaa3071sVLalWssMecY9GyBE9jA1W1FMFwMxDX3sY0rOxzXely8vkrW7yLZo
         7xyKRUtnCdTLjxZfblGIY/jOXRBrbVMElHFTlwN91Rrjst0exWHAv5SmwULZYbSJQnOs
         9ae2VdN4SH43GHlKygg3JgxdMVAr6lXzvUpvbulemYqoPf+bAucvrTESY9xZ99Bwuzy9
         /KmctPmQLTvfiaWOx0UD/D8oYzPd695fW+uOl4KDgHUOPsAy6nxmU8y9q02MOa2t95Hi
         8ON4kpLJK8lBSKTOxO5OkiSHMquIhLrelWKUiuX7e2x7ET9KHdoN8DfbexZZ3VGMUIGZ
         Inbg==
X-Forwarded-Encrypted: i=1; AJvYcCXp/M0Q5BaG9XobpHSwWsSm5c7cdGOWHWSp6buh6YhOqqPAZM880thdTnJz+wDfCCJYG0ga2sPBOXHfaMC1@vger.kernel.org
X-Gm-Message-State: AOJu0YySOn/gwpGwsjHLSoGaEM1PTPWZk76GM30OqGC+88c93p6KG3I0
	MF1e81zh0V0zdw1MZMCkO9X6eTM6l4SviqcHMut6UDOTTyjDJlaOSRMBCgO4S/6III3vc/RqJw6
	fQSMTiyNnS8aYry6q3X7MmiZLrXK5wy65FgXQFz/6X4vzJ3T6DBnDdAuiefpya9YlnKpU
X-Gm-Gg: ASbGncvbdfMRTjTwgBmoRfAyIqcexht6GE/ye8aK5tucTGRxnuvTN0bsDl7rIhc+0/x
	KXB534+9p14cv1nMFRYzifx/cY+y3BULyfSgdDxqeNCN4tzQy70cKbIquayb/bSLyKvOdC4tgKh
	RI0kxO6AZYDUr9azCgKud62I+Dy0kbUm4psHF/XcqEgtp3LiqThMeYYT5htD7ukuyFKS8aNPTfb
	EQLsfw6Or98u6LAEUbhsqXy+1ahnS9SD7cZVMznPUA2u7s/VOrXrJvJUgwOE9+Zl1eazeoODL3h
	Q4LVkOc9klINh2mcE1DawOKBuqEeXYU8cUMpP26jzmPPeF1OJWqqAKL+DsIOd/AWxrN7WOuNbrh
	JwugmhksM0gKryE6dOOgizIL/pwEVGm931c4=
X-Received: by 2002:a05:620a:3916:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d3f171a794mr150269585a.24.1750281180399;
        Wed, 18 Jun 2025 14:13:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWKEnrbepBya0uwa5jSkfJilu/p3G/it5YTcJBjQ7HDOe2F37TDMySY4hQYkuerHFFgN7znw==
X-Received: by 2002:a05:620a:3916:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d3f171a794mr150267185a.24.1750281180019;
        Wed, 18 Jun 2025 14:13:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553cdef7fdasm650322e87.245.2025.06.18.14.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:12:59 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/dp: add linux/io.h header to fix build errors
Message-ID: <iiacxuckhp277b5kurmzd7m3v4insvsr2jzgimxt3k6zs2vnei@hzqjdvmsgeej>
References: <20250617185611.2965223-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617185611.2965223-1-rdunlap@infradead.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE4MSBTYWx0ZWRfX3FsGhp4c8j7r
 sV2rBuAQqFrvBu0jDYfZiYHzwo4v3C4jzRtH1QuIztTrkrIGqyJx5nwtqmU7itm5h+Yi+1cUyEi
 OaQ7bzmBh9uXVaEQckyNqJvlT+IJj4Z3KhLKE7UhXcF1vSq7qopUgx05SN8OEwDj9MAIA8B62gL
 eTp/0bN9wVirsKokO1wiy6wotMug8aZD5tKpkYXcI0TjT4+ey2CebPitcjl0/eLlnzfp9/XcmAo
 OHGPs49xq4VgbD9ZZi+rfCtZeDQ1X6/zv+LPYzS4zUm1ejUSuvJP6g11DC/2kio6hk091DR5Jq8
 6U5pMw/+RrEVNblfF2TJ8MyUYEdlo2Ob0id8AjwGCsahu+44lNqf4ow7ktJ50pbyvr1s6OSR7Z7
 HFyVoHLO5t+/vqrnVGRUXSvLGrOzTcPHd9C6O/jYf7YUCO9lEBIkyEZxInmeuX2pfQ67njss
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68532bdd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8
 a=4IBLwaYKg0Bczh402C0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: HaCknHeshLmqEKYG42HON6PQHpFLTgjo
X-Proofpoint-ORIG-GUID: HaCknHeshLmqEKYG42HON6PQHpFLTgjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_06,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=699 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180181

On Tue, Jun 17, 2025 at 11:56:11AM -0700, Randy Dunlap wrote:
> Add <linux/io.h> header to pull in readl/writel and friends.
> This eliminates the following build errors:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_read_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:33:16: error: implicit declaration of function 'readl_relaxed' [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> drivers/gpu/drm/msm/dp/dp_panel.c: In function 'msm_dp_write_link':
> drivers/gpu/drm/msm/dp/dp_panel.c:43:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
>    43 |         writel(data, panel->link_base + offset);
> 
> Fixes: d7e3bee925bd ("drm/msm/dp: drop the msm_dp_catalog module")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c |    2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

