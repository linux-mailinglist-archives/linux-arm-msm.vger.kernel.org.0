Return-Path: <linux-arm-msm+bounces-68307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0192B20558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC4D6168D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E36B1E520B;
	Mon, 11 Aug 2025 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbTh0PHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076357263F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908252; cv=none; b=YgzhvQQLGAHe5SXHK1oykStn/mvI+NoBAClFSqu+utAgVANjV5kkjqU5+uPTrDkaFIR14Kd+z0vFXu6fqrhdsJ0qXDJ7+b6PSGrMV+EsIWxHdWaBcm0NZRPllP8BO5zXJqe/4uMjeFq8ZNBnd3dfJXIO8qZG4VoMmF4TSa8Y/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908252; c=relaxed/simple;
	bh=x9cOwHUhHXPY8X4ZtckPJM8tLZN1B2IsS7ENoVbe01E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6XwE4hkWyUNb+syN/U/gBDXZXQt9Gf6wLJMoMc2AfUPgfm0knea1/5OYlTCob4ZEagqiRl2KEEkyPyqx/aExyXIftc2iwG+MQHJVkNhFdOWttgTN81d2FBI8kLJBDwyszu9P6R/Ffed1tjnhwXCgyKnrknz7G1zjbpJWwe3FE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbTh0PHL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9xW000635
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UnmCHPZVrs6fp3g1DtME56zq
	8DIGelnQr7GBLyjo+J0=; b=AbTh0PHLe6Hqp2GF83C7oLkqY+xVq55GoHfPraLC
	j0nzYRel48zZlDChdvMVVHR2hzfMm+batlJn5gCFSWgYWDzChUfisDZKLkY6vCaA
	JjuWic6QnXKJ2g6RoAUnFptBuh9sW+s4YIHwLdhdhKZN8+x4Fx1oEX0iQpqRxnaU
	ZBzhCI8dFXCgdv8znKcS7AHTCLpzrzZuqCGHLiysVQPP+aGJ60O2pddpOo9r7rfI
	EkuHER38D9Rhz1aPFplGkdo3WP8+Ay5N3BFaqpoaf3gZFIJ+onRvoPIYC41ZCdlc
	EKPyYG1AAkYdweKK4EPOIoLPEzwXXElv2SnANmtSc/gu0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uyd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:30:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0de38c71fso7463971cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908249; x=1755513049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnmCHPZVrs6fp3g1DtME56zq8DIGelnQr7GBLyjo+J0=;
        b=L9VJG3MZvJ9TjD0pF+MfT603q7mceFMBqWBWv5AcxtzKTkd7oTf9/af2YqU3XU+oMY
         g92dn8FWGGbjmTe3z0E34C1JjA6ajTxoHIEBq9aHN7DHFym729Hx/sZ+76K0x6sf1ki6
         3H7J2ciXxHKkVlc01t+IpZJIyg8fLA2bHl5510GViFVRi/ECfJkK+rPQTE502V70pN/w
         d0vIAsgN09nbmJPPTyL4gGE4bNVFUMYGL6xwCbm1cEmdUWb8wteDdu2J31HQUN4fZ71t
         /g9sENZf3lkdFD9tUexMw2IRceK4XLpYr4Kc0C847K3PrS+HRX+1QkLsjghR/VXKh79h
         6Kjw==
X-Forwarded-Encrypted: i=1; AJvYcCUtNc5Fqy7vkxVGiDapg1+GZjRK0Xo9xPVGmUcd0TWyeknUCR6l+D+vfSi2kiQ6vPnO0rYjl4FKupFcBMTs@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLeYitDZA8NKOAZ2EPzI+9VtGX34lwSsGbmEOUNu+LRyOJq0/
	15YS0+qv6bogGNWKCMLFMMzGWAlLfKKJiyHcjIAIft0Hk96yeVwuFiFrDtqwuw0GdvEweAt1taR
	9al93VtT2/+GDsh+NiBATWdt/dQhVa+YrjQbec5TuqTItNLUZEhfQe6FJcD8G2MTW2V7F
X-Gm-Gg: ASbGnctl/GWS8MyaZYTk5H+lWQ62g1pOca6CaiaR/1brkYIEXuqRaRHxuLRKDT/tpDl
	JIeew+SYpLcE9gdkEdQBe80kBUmxV4YvtKzc5Krb0sQMOKcvwLcA/MmOHM/wfFtp5RynqvdDgdl
	QQOvW9tTJKCaKBXJb1AYpPUy7chYo4tcxtkm74dNs4+egEjywcVfGs4nDoCNl1C3XWgnaRZvfPi
	yqsNliS5Ue9ktiPnirIBPCNrz1qjzHiIO4QGniE9dn69T8aUxsu23viGpn9qUc1V/h8xRQhCESm
	OgRblzG8wlzKVOhhcv8iHP60wkJRk8HKoPeuH7EESQjY18r+gv4n9TfLou5zpCX0lYPzJu+sfEH
	qU/g+HE8vk4RxckS42Au0+Ixv/A97CFqDoulXOVlb8cD6KI5QdKm7
X-Received: by 2002:ac8:5806:0:b0:4ae:8835:3ae1 with SMTP id d75a77b69052e-4b0aed41babmr187408021cf.19.1754908248555;
        Mon, 11 Aug 2025 03:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuf5qtoUnT+tc8B2ICrvl8IAPGTKvOtw3BZsZTanNw0atI/DIbb3U6d2sGEsqxH83orNUAhw==
X-Received: by 2002:ac8:5806:0:b0:4ae:8835:3ae1 with SMTP id d75a77b69052e-4b0aed41babmr187407401cf.19.1754908247969;
        Mon, 11 Aug 2025 03:30:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55ccccf88dcsm938218e87.55.2025.08.11.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:30:38 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:30:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate()
 to determine_rate()
Message-ID: <conbpmqs2cdgyu2oub57j6oq562yzlfvdkidfbetgsobndya43@wj75ikipfz6x>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX5JXTtyhhKXYE
 oZ6R3fyz9mOm8GkSwnS+21KNhLNzNCX07124POcDWLXSwpLuY73Fv3kTKQ7TbUTXq5jsFJK0UYp
 3gw/U4fA+7poSVFuiHuFDBzNT+bR8UB3JEv1mYXdxHRUXnN/dal9qPdV/FKskSGx2bvRHluxsWF
 cgsAkmZpYoFleZrLqQNjCcqiHQ3Nhg0GYULlhUL8i0ZkCbVYvw8j6Rhit7FRXU4y1j5UEw+mNXF
 dqnVMD0Ul+fx6YNLBYrZGuvv+NNTO4lQDcXlBEsg7yBDwfFCJ/k2T6+oiRgT9jl9vv9GSuLMBW/
 /W4zsQ48Mtqey1JbpaVKBNamoxDsFgYTwSl8cuF0oy42dPF0Dn9Wgf4DXgXaTgmK+pXtYZ4+s4B
 1y+n5iIC
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c659 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=dIVbyNGrPfH0ZhoiaTEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EvWTX6o7iEl0zty38U-gp24A4LHFig7E
X-Proofpoint-ORIG-GUID: EvWTX6o7iEl0zty38U-gp24A4LHFig7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On Sun, Aug 10, 2025 at 06:57:25PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index af2e30f3f842a0157f161172bfe42059cabe6a8a..ec486ff02c9b5156cdf0902d05464cf57dc9605b 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -444,21 +444,19 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)vco_rate;
>  }
>  
> -static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
> -		unsigned long rate, unsigned long *parent_rate)
> +static int dsi_pll_10nm_clk_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
>  
> -	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
> -		return  pll_10nm->phy->cfg->min_pll_rate;
> -	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
> -		return  pll_10nm->phy->cfg->max_pll_rate;
> -	else
> -		return rate;
> +	req->rate = clamp_t(unsigned long, req->rate,
> +			    pll_10nm->phy->cfg->min_pll_rate, pll_10nm->phy->cfg->max_pll_rate);

Nit: I'd prefer if there was an EOL after min_pll_rate, but no need to
resend it just for the sake of it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +
> +	return 0;
>  }
>  
>  static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
> -	.round_rate = dsi_pll_10nm_clk_round_rate,
> +	.determine_rate = dsi_pll_10nm_clk_determine_rate,
>  	.set_rate = dsi_pll_10nm_vco_set_rate,
>  	.recalc_rate = dsi_pll_10nm_vco_recalc_rate,
>  	.prepare = dsi_pll_10nm_vco_prepare,
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

