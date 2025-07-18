Return-Path: <linux-arm-msm+bounces-65718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A731B0AC44
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 00:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C12B4E0843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 22:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3792020766E;
	Fri, 18 Jul 2025 22:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9qNCDFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2811DF75D
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752878896; cv=none; b=KTBq446GIQdbhEXOAPjPwuq83nuQ2nuzryUJdmBzcyXPX38MLGCyIRgw8qNYKcxOCRK2unWopDBT/bZIwk5wmglrTWwBqrP37+4qdZ0n/B9Ih/+Bf7Tr6FDfQ4rSKyOBadtqnaF1V1L7r3xVcR4w64hfj4pJT5GhgARPj/a7CjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752878896; c=relaxed/simple;
	bh=yU0R1bd8AqQ+0FAv8gRzGFzPqV/tb1iCao+CNWd6BLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4UlYQ9KBhWhrwty45eeGrWCP0z406+KZ+f/uUX2wYDiRzXPvO5AiRhWHHuquAv3f8tDSVBCtuAQWBdH2tCftEBtNRVyFhI5yXuTQZ9EdRbXhF3s9sJVuVG8LDM4+xe7179FnxYSL8Mt5V1jbfDzJEVRhGLBRzu0kQK/29DYjFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9qNCDFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IF5D20030497
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HHGP8L0TyeRKQJV/lR6+jNfw
	4z8jT1bWYC47YlMabyg=; b=b9qNCDFIiF37zkPVPxVrouahLXOkCPf8fNx8sF50
	q3scs4vq+BXcx9vVlQBA6nQxRIB2+7jV/r7KfOixhUY0vfz+WAamicYdmKyEHjUO
	uIIaLvoiYPo9jxC0XmARGr3Ui1g9HQ6xaDaGXVQM2HPwPsDu7kiul3Cm/SU5fbJ2
	ycl2x7ZAf6AFr9XWUYfu0VThVk09jwUmMyQouSv2LhB2N2Zsl5mYxbSMaFgmJumz
	NIHE35HFnjm+RVQmD6YQIWNLiqICZq0hixNAUVrKuuCXQzHURxkLwwLNFhpcSDVZ
	Z6onBgv91wQwkrnIq/gj+y2xNZhLb6CL2PNOoWYI/0wpNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7sykr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:48:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e338e627f1so682245685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752878893; x=1753483693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHGP8L0TyeRKQJV/lR6+jNfw4z8jT1bWYC47YlMabyg=;
        b=hTG3odko2OYftIsWTFkbfHzd5SFr9wQIXM7zegcHonFy3y1VffBAnqBeVoSnHpYzQQ
         tSmOKXNXTmG1vZWd/P9t6qQywCpx8bn8+fN466/bgtyZsPCOj/cP65R03Fa/PHA81HKq
         YO35iP0ntAZLIoKJvJUotpJ6mziriQiwd3cZ7wVNyjeP4KIEL+IsXZeDN7ZONjRpx8bu
         QCHONgCAKGhQi7w53Hnj8I+/xKfO/IoOlFOlEjVjgUbnnr8aMEwUJnThXYar2rPzm6TK
         L8db/WhSY8dIPTGlxGIi7eTQyQOvvPwV0kzko7l+CEKQxWhsPEcMaOyMtgzllH+B3KbM
         XxPg==
X-Forwarded-Encrypted: i=1; AJvYcCV3l9u8fceo6tPCniGhr9Ti6M4l+lNL5OXphirpa5CFyZls0OXNsU8cEeK6B2WCUUyX5Jlq0TdLB1dK8FWk@vger.kernel.org
X-Gm-Message-State: AOJu0YyatA+uv9Ho8NtX1aYakis9HJQUumn224byuX0nu8HH+Y/dMeKr
	UswGq6NBYFXrzmg2siWkiwo5LUxbzT2odq1TcySboftShAmcCajipwMa8GR0RN/g9tvrVAoPf8H
	AcPLZDxJjtyGk8TvDQhOjkZO29ntoTIiloelME0Cusy7Q+CxJd4huLaexR8KNruxm0rZ6
X-Gm-Gg: ASbGnct9IB28tiLnBEv9ejY1ZQv/IkyvWbQkhfD292a4eFihRAwHyTzNVN/0O1phh2q
	6Npq/4C+eNktptaYqVPR8ZvG8GEObgQp4CqUsTc1u2InxLxukjU3R5/o9SNl5OKojBXH843/QaM
	+vO+IVT08PWVe33+8wCa26XuQlxK+/7ncJsVuYQGy7xFZbRCpmtV1LEkdiVL4dyqSN81GHk4pXl
	u5q5mx97vE6k1uEVYbQoIOS0IxVLkArRxnY5cSyx7RMZZLDG9KbVphYrkRiRsAbn7IBH1U448d6
	XqO7eLFlsn6vAQ0KF7YCtkwF+ab/UjU7u7MSA8rgcxWdREDTAymNGJIJdgawVtoaCeziuBjKUd6
	ac+bHvYQvaMWec71qYEmLmgvoJF6RS8FjgVXaanNMqKdpB8h3LQW2
X-Received: by 2002:a05:620a:19a8:b0:7e2:3a27:a10b with SMTP id af79cd13be357-7e356b08261mr557584985a.51.1752878892599;
        Fri, 18 Jul 2025 15:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/wGMWsIGMuMedQ4IyeHVUwmgTIKPo1srnscW5QKnARy5UV9vAyXmC6qAal8+ZyC/iIeQGkA==
X-Received: by 2002:a05:620a:19a8:b0:7e2:3a27:a10b with SMTP id af79cd13be357-7e356b08261mr557580285a.51.1752878891882;
        Fri, 18 Jul 2025 15:48:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91049c9sm3710941fa.39.2025.07.18.15.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 15:48:11 -0700 (PDT)
Date: Sat, 19 Jul 2025 01:48:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: Propagate core clock enable error in runtime
 resume
Message-ID: <rpoild7nomdoh2tr5kizt5jkv23gd772nf42nvb3x3eltmizda@jpwx5pbphuaz>
References: <20250718-dp-clk-error-v1-1-9bb5f28d4927@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-dp-clk-error-v1-1-9bb5f28d4927@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE4NyBTYWx0ZWRfXyxw01mD+GO9R
 SPTNggOm7VKdHByDIC+tQc38YSHunnaYLfttk6HKQb11DS54svyLaVnnISIyIQeWhSCLCz+AB4J
 dXG1R4Iux6JmyNbIWkGMsxOMuluT9HXPsda+8u9/mydRLxDZI+1g0uP7AEOrW1JjO33ZRIjfvyK
 rxE8J41MelmvCFVXwljnI6TiLIw0nSIq2R53GcreHNPXqL8NEuQal9F+wfUoYC5CIqtqTXXlF1d
 5HlTp03KX2jOIDA7TXz/agLi93Z6a2qfw89SueWEyUT+I3C8seuDdxQzK+Dqlh3AziOxV7papFi
 f+Q7xb9Gq3tfIydoe1mzKFraJtTg9xI0lMMdWGLiIiIBih7VJ4flRGyWgKeBZrYEuNeFKqfKGeU
 OsskTuOgYg4gzs3Btiwr7mZ26UEO0xb5cRVtVuQqDWvAK+Qv3moWok+QfkNxmI47pNphkSdh
X-Proofpoint-GUID: d5Kgof3gq08_1pS5hitutDvGy1oKy9Hg
X-Proofpoint-ORIG-GUID: d5Kgof3gq08_1pS5hitutDvGy1oKy9Hg
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687acf2d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=K_Du84Slk-LVA_55HQ4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180187

On Fri, Jul 18, 2025 at 03:15:51PM -0700, Jessica Zhang wrote:
> Currently, runtime resume will always return success even if the core
> clock enable fails.
> 
> Propagate any core clock enable errors during the resume to avoid any
> crashes later.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3..77d5e89239d2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -463,17 +463,24 @@ static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
>  	}
>  }
>  
> -static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
> +static int msm_dp_display_host_init(struct msm_dp_display_private *dp)
>  {
> +	int rc;
> +
>  	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
>  		dp->msm_dp_display.connector_type, dp->core_initialized,
>  		dp->phy_initialized);
>  
> -	msm_dp_ctrl_core_clk_enable(dp->ctrl);
> +	rc = msm_dp_ctrl_core_clk_enable(dp->ctrl);
> +	if (rc)
> +		return rc;
> +
>  	msm_dp_ctrl_reset(dp->ctrl);
>  	msm_dp_ctrl_enable_irq(dp->ctrl);
>  	msm_dp_aux_init(dp->aux);
>  	dp->core_initialized = true;
> +
> +	return 0;
>  }
>  
>  static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
> @@ -1453,6 +1460,7 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
>  static int msm_dp_pm_runtime_resume(struct device *dev)
>  {
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> +	int rc;
>  
>  	/*
>  	 * for eDP, host cotroller, HPD block and PHY are enabled here
> @@ -1462,14 +1470,14 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
>  	 * HPD block is enabled at msm_dp_bridge_hpd_enable()
>  	 * PHY will be enabled at plugin handler later
>  	 */
> -	msm_dp_display_host_init(dp);
> +	rc = msm_dp_display_host_init(dp);


if (rc)
	return rc;


>  	if (dp->msm_dp_display.is_edp) {
>  		msm_dp_aux_hpd_enable(dp->aux);
>  		msm_dp_display_host_phy_init(dp);
>  	}
>  
>  	enable_irq(dp->irq);
> -	return 0;
> +	return rc;

Keep 'return 0' here.

>  }
>  
>  static const struct dev_pm_ops msm_dp_pm_ops = {
> 
> ---
> base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> change-id: 20250703-dp-clk-error-7c1965066541
> 
> Best regards,
> --  
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

