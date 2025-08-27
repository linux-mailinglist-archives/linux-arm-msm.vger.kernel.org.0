Return-Path: <linux-arm-msm+bounces-70962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20820B376BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0ED47C5423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AF41DDF7;
	Wed, 27 Aug 2025 01:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZG3w+l+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767210A1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756257557; cv=none; b=OJTiCQsKFHvYV3eEpmsKA+SXxK7qNRCDAEPrtDy8QTM4swHbPhW9DX7d7r5wJLXM5SfGiosCbUnfTPDSZ6d1BKDT6HoyDmf+xVuj3tutmid6owz6L6+leoPEw2RRsFb1aPNc5VMCxlYcrdzEXGzD6UIrCsO/3zLjCsNngj1tjVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756257557; c=relaxed/simple;
	bh=52TXGu/y1jZ6B0Eli4oxcK++qV1Y+8k2nj87YftvKLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcL3474wM2yYPvk46LlKNUtal4oM7IpQu4YAt5+RPJ0sMYhNX8WfmLcu6zC54ka1wz6nTRNU7YTfk526ftzHRzt6qOKj4YbiVAYCr6Gq0rJbEqMR79CPqaMfB4s68bCV4kYcxTdjqgilLfi4n9Fd0I596jI2LOQnDGV2ePoSXaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZG3w+l+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLI6fT010931
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1k3UuYecDWpdFzGbi52x4OUD
	ff4svvNikwZBas3LMPs=; b=oZG3w+l+NSu0/SaU2ni/9nsV+u58jUsW8nkB0jDu
	yySDRywRUtipSQksmnb5izUBijIlCvi3MSEpUFksXTBqF363nt8qw1XQmhgZEgzZ
	qGa+iNyLhDIJiG/PWqdd8C1RMAoRjS3Pqc0cK4wan3fK39AKH4DiklnDLwkf3UiH
	4ZgEvHZQqq20+G7Jtmft1MzQP+SHaOCE2qnEF7uNaMLuzAhfmHJ51KzVA51DT9Ou
	ueQCOfI7ho08Bpvdin0f8cC1hplrWmPGciKhehsYFZooy+B3DAOIYXyXxo26GRqz
	KqqhPtMpck+OJ9vmAWwL+VfpAiwGfGyXCT1CuJpsjyvdvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5untrns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:19:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109c4c2cfso233063931cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756257554; x=1756862354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k3UuYecDWpdFzGbi52x4OUDff4svvNikwZBas3LMPs=;
        b=bIFej2TJuYzaV7GO5FmVb02Tnvr1ZWl318HUCRQcdIU1cckpseULHe1xDhSCvn6HFi
         A+kgcD3nvbzzCOjlsfXejMfROx3+wRHPtqK8EgGeXhWBgUwf4xC1g3no80y/IuU0+ZZa
         H3Skg36Zcr+Q2TlHT7tNBdEqUIrg8fdPjwm29D+/l4aMReRXJ2IDR4NOxlNWTudoPiis
         s2wHuDTG98EdBdfN1yCaOen28bbxTJOpUyTZaV2EshvCWD304mzMHRoEt+axgsGG39n+
         TX4FVhM2z3B962sL1swiLm2JHYgBAMeQhkpckjZcZYjC54d93P104zRcTVN0G29M5uX6
         NPsw==
X-Forwarded-Encrypted: i=1; AJvYcCX79+OarMQdr1WdzUD5vSYkZFO4r2+i50WXitHLTfNF822enFMQ3rOGllFh7SrbCDvIY33RtV8kIjNSpBvP@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmm3bu3hxv4Y05BxtsgJWsuphVbLnYbNva17B9xt4XO3/USg3
	BNgR2d+iRYBvBbS+d72HNPd20adhhq1nmwWeEHIvxOca3+zadf1TfkIVRNQLLilLItL+NwMq3pJ
	5hvsZgAl5MD32MGBZlWo6Brt+8/ivDvFjkaXFVymsSrqj2X+4pAv5jbXydT0TJcIhtrz9
X-Gm-Gg: ASbGncuRwKCILV91EGDwNnRROPeXnbej1qW3P7zG7Q4/z3Wwp/pSS26511RmTPsRYSu
	R4qxEFV88xmrdsVgefKOdsIrHTnl6lzuEN/JaLIttDBskSWqeNGOXMeYW7JmyoSrt8mnMFF352m
	tLMnlUHdBcXJehEklePTj3pxs6VHps+BATxabOdgx6mu6GdmoICTX0qu1h++ykpp+LKj3QthQQo
	LISFXsps55pCqwzvkIaboRupn86jHtJU1iBIBZHUa8CYNv4pRZArwPbjVloA0+5PtxR+X8uLXH8
	5BTWDMTyf26S7d2FKbxhC0hqtW/TovMZxBgSma03vJSQlUVygpnNpL8PXfiAQe1w93pO1l9NBO6
	2x6VnPGYCl0jLnpwuagngEfLS2XlXExLpzRFB4Si3QEGHn8N4DAu7
X-Received: by 2002:ac8:584c:0:b0:4b0:7409:5f4b with SMTP id d75a77b69052e-4b2aab4b91bmr216337241cf.48.1756257554041;
        Tue, 26 Aug 2025 18:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHN0lyqNEEWQOXtYVEHBNIyQHn6KCAdgvleKmnUOgyQL8f1kTRBsPaqfqbxGos+0dC9z5t2g==
X-Received: by 2002:ac8:584c:0:b0:4b0:7409:5f4b with SMTP id d75a77b69052e-4b2aab4b91bmr216336931cf.48.1756257553317;
        Tue, 26 Aug 2025 18:19:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bc94sm2596556e87.84.2025.08.26.18.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:19:12 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:19:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 38/38] drm/msm/dp: Add MST stream support for SA8775P
 DP controller 0 and 1
Message-ID: <fdwrpaa6cp47i2hvlccjwbzzr4vnhfispuyodollr4fn5oncwl@urt5vaowuz6x>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: OByGkJfAazP5O3F1iqEjJkp0EIuOuq9m
X-Proofpoint-ORIG-GUID: OByGkJfAazP5O3F1iqEjJkp0EIuOuq9m
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ae5d13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=y2Z3QI12yUTW78QezZYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX5kfCoX0UK7Sq
 QvHEzC2i+Yxjk3k3lX3pD1O8o/CSlFevpI/PLln6t6nONVmtDvGwJSOa5CF13YyGIP1b4WeBqpi
 YRQZWUPSoqXMl3yTQDbolmDB19SIo6Hcv6MrIs25YeAAWgW6gHete+NW3HpERXY/Hgh+wlUwK7w
 s9f0VxZdEUDCQDljn7hO/+hX4TpHrM4VWUpVEXdjEpxDfqjU9G/UtEePr7rXSpSg3KPY4IAXCkD
 S8G70sOW8Pu3BH0SKpC7R69WbBnO9bLIUUm7fIXkRkFEDdc+lVsvsUyEUW4ZRetWcT2jTpg3AZ9
 Qs1I5iqXgCUt4d1TcSBFPmnsO+5LvmTQqEv63SndbNzBmy30rQiovD2eO8VZRlqLGVvg6n0Cd6Y
 QhwnS40F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On Mon, Aug 25, 2025 at 10:16:24PM +0800, Yongxing Mou wrote:
> This change enables SA8775P support for Multi-Stream Transport (MST),
> allowing each controller to handle up to two or four DisplayPort streams.
> As all necessary code for MST support was already implemented in the
> previous series of patches.

Why do you update only SA8775P? Please update all the platforms at once.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 897ef653b3cea08904bb3595e8ac10fd7fcf811f..4a94f37513c21f9a273080b572a1e50a186a45ce 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -108,8 +108,10 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 4},
> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

