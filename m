Return-Path: <linux-arm-msm+bounces-70751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD97B34970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DC1C2A16D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22FC2FF17D;
	Mon, 25 Aug 2025 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmFEeEtE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368863002B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756144580; cv=none; b=F82OaQ7bR1Tf2S5t7Kw0/s5seNTHHQCBh0zgtwqj8z5pVzOO6QClQf3jBWjbha+xGXaQouuQyi0DHA8MF4GnPf235rtcI4PtjlZqexaRJPOmrfcb4ELWRu07YmNhYAo3DQ91NhKBJeoYJQ/qcafevRjRqEDZ97+N6EQFeywHSv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756144580; c=relaxed/simple;
	bh=USYs8DzwEd5CNXpqe1TdlO6VwgYBKIjtqfccCFD1qv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nk5JiDzSS5ykaC9tOlEAA1sLxZfb81RDez6n3bwB+MfbEVyezsmjJRHRktxs/YKpk1EooTDBUk36jB7HycSScvssw5xxzvmRaGiqPYU8UfN8oDrpcTctWhAnTmYE4FSOqRo9MCOiLc3eyXE7+wjPiQlY7H748gPMhFoCV6quMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmFEeEtE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHOKVg024938
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qZbc+LiP+W9ZiZBK8FOlQwQv
	CJhWGeKmTwDpg9afkms=; b=ZmFEeEtEHL9QS8O5lYBbwW//3Z5kDSkVvUidjwnA
	HwAmWqM8lPuO7Ay82PqQAFq15BFH8p/Pe8T14QetYMWeaLbe8DuuVGmXRajltWsL
	JU917ZPjSDacM02Xkn3wDusb3Xfvj+RC+BvbsX7IKID0RW6TximIPBRm8zNamL1L
	aagz01YHUsC19EXqbfSOK0dbiq4QUQEGM3lImG76Igt79hfAhve8NKtWih8Wch8d
	fNFh1JTJVIlcbC/tLRg62UDkBLtATeuikNmAp2aHyLdqNKqxbYGt6SxsNBFjzcWJ
	Hua46ytpuNScg/PpNmFK/Laj4jnB0w6UZqO5x0meY/xX8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdwwgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:56:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0fa8190d4so143078481cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756144577; x=1756749377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZbc+LiP+W9ZiZBK8FOlQwQvCJhWGeKmTwDpg9afkms=;
        b=MYNPYYusy7SVwUikLfNR9mTIGD2j3FvlfPYaC4VEhfoJ++JChpkxR1uld84+tegM9A
         HCXgtW8A2m2hzRlKUaN5k6Cqg7w4SkLX4EjwKKdOPGL2p8Uek0t7GqE784KxtI7t47xd
         NO9c8I/P3COShZXu2VtOMpRuakePoPO09NsWgA20umhG+4hI++6NnUY5RGTJIsE++I8u
         +6p3v38/++gvx4PCAdCc0oolsQYjQvZ/+00/r+NS6vHK9cTRzUW+eNQe96OybGguhJ2j
         WWvWNAAdgyz18ygoZBM5DDGsOT51iwzXKXsosvQvFWAkcV24H57MrFfbPHiNGf53sS2O
         BgSw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Elq2hnWTjPoYFoaL9M/b3IF5JwxXVq8Li8TLvkh3kLZB/hdCRAFJodeX0toz3hEbXhFXMqUw43jeuAIs@vger.kernel.org
X-Gm-Message-State: AOJu0YzFWFU5I9LvmADio5AYphnb+/DtWgH23OheA1qOaf2U3n+066Pp
	/rkHiPmDDP+iqf3Ox26hg+vzJ5GJHldbNiaOOuVXLKa7F/g/Dd/jSUaLo/AFB3qKOtFJWg7yVi2
	v+AwLzcmBe24obWHbcWyvmHKvih3smgMFn79GGnaXk65/rjRcKwQKOfPzf/SNzq5Xr0d5
X-Gm-Gg: ASbGncuME5dBToVA8vcGFXElVcV85Qfhc8i4r/zsce9R0WPzNwuvy3Bbb2QeelbC0e/
	4ri0bZPWpftGt+Zqs0ujri2yLNVhGJl5y9Vw/u+M2IylEtm22Dt7z49F/ienrM/9InfyXzAaXkC
	/JzTWX2/TJxVlJdt+TyV5GBypiFvO+83DgsPAINX52hvxianrrw1h8XDLWT4yn4eS9TMApHLxUB
	SLHpsdC3ip6lWNm8NEssvbfMbv5lQJs+hjJNlT1/bjlsrazx7iVWrhLfaZQs+1gmCkNnmcEudi3
	U4yy1/G+9kPjoXW5NuJJs1D3FwvwbmkZ9UijDPDkH0zPdPRTKEMiMHm6xCd/OBbz/f2QpxwcLHP
	Hp8vv90jaKEgtWqFQMpcWLhPGUZccuJH/ky7NngqNUh/vh4jnsony
X-Received: by 2002:ac8:7c48:0:b0:4b2:9883:830d with SMTP id d75a77b69052e-4b2e0845a60mr7129921cf.0.1756144577006;
        Mon, 25 Aug 2025 10:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe/SOgbCIAs7eJLZOpHwdby9mGDyCQ7MxuYmguN5qUnjk/bn2DIS68PMx9r4sIAT4GiA9z/w==
X-Received: by 2002:ac8:7c48:0:b0:4b2:9883:830d with SMTP id d75a77b69052e-4b2e0845a60mr7129441cf.0.1756144576374;
        Mon, 25 Aug 2025 10:56:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f43351382sm971641e87.124.2025.08.25.10.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:56:15 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:56:14 +0300
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 13/38] drm/msm/dp: introduce stream_id for each DP
 panel
Message-ID: <wvctskhoyphicaymbm5b6kermvubhrn5u6uzui3pqf7p3a7ia2@zirqohupflvp>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-13-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-13-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: S1rk6SAPG58M_szgRc1zBykNGMX3HU3Y
X-Proofpoint-ORIG-GUID: S1rk6SAPG58M_szgRc1zBykNGMX3HU3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6KVclgVvG9U2
 a/GYFnTo5YlWjvlB93pKo1KyBda4p4+b9wQc3FiUmaGmwqRrG2C8QrDsCncgB4Af9zJDSnuo7G9
 1qJCvfs0pzxBOskawNRTqBZpJtBLt37YnVwQPDHyodu/glykoXciEx39A2pJONRso1flPSyFAjJ
 W6G6aRB9+YMIpVE1mep+y2F9OHTn5mdx7ctIwAK0YA054xE8un2XStC4THarqe6svGlqReevMWR
 n1B5kDpijD5c83LOH/rm1v427nivWttB7EN4fsjUGBr0hlG72/TG6Lki6UOGXzTQ/FZcnB4qTdp
 i2kyKJieOQgYBP1MEcp9rOGvmgOoZltTRK9/WJi5VJJQ9gkiVSwBpbfILZkPKopIwuEQKc9Ey/Z
 vHI/ZZ0E
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68aca3c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=esdiVXI3waKZDF_2LzQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:15:59PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, each DP controller can handle multiple streams.
> There shall be one dp_panel for each stream but the dp_display
> object shall be shared among them. To represent this abstraction,
> create a stream_id for each DP panel which shall be set by the
> MST stream. For SST, default this to stream 0.
> 
> Use the stream ID to control the pixel clock of that respective
> stream by extending the clock handles and state tracking of the
> DP pixel clock to an array of max supported streams. The maximum
> streams currently is 4.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 58 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 11 +++++++
>  5 files changed, 73 insertions(+), 28 deletions(-)

> @@ -2677,10 +2675,11 @@ static const char *ctrl_clks[] = {
>  	"ctrl_link_iface",
>  };
>  
> -static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
> +static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl, int max_stream)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  	struct device *dev;
> +	char stream_id_str[15];

A comment would be nice. Or better replace this with the array lookup,
it's much easier than snprintf.

>  	int i, rc;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> @@ -2710,9 +2709,19 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	if (rc)
>  		return rc;
>  
> -	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
> -	if (IS_ERR(ctrl->pixel_clk))
> -		return PTR_ERR(ctrl->pixel_clk);
> +	ctrl->pixel_clk[DP_STREAM_0] = devm_clk_get(dev, "stream_pixel");
> +	if (IS_ERR(ctrl->pixel_clk[DP_STREAM_0]))
> +		return PTR_ERR(ctrl->pixel_clk[DP_STREAM_0]);
> +
> +	for (i = DP_STREAM_1; i < max_stream; i++) {
> +		sprintf(stream_id_str, "stream_%d_pixel", i);
> +		ctrl->pixel_clk[i] = devm_clk_get(dev, stream_id_str);
> +
> +		if (IS_ERR(ctrl->pixel_clk[i])) {
> +			DRM_DEBUG_DP("failed to get stream %d pixel clock", i);
> +			break;
> +		}
> +	}
>  
>  	return 0;
>  }

-- 
With best wishes
Dmitry

