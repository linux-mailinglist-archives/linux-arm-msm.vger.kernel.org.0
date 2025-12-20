Return-Path: <linux-arm-msm+bounces-86039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B21BDCD33F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA3A300A859
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF3727F01E;
	Sat, 20 Dec 2025 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxIM7VWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP2FhUno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAC23185E
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249453; cv=none; b=JrGMuSYc7vlrwKW9C1ZvzORm2RfF5bohQ8wKnG7GpADKO9bAHFXptRuNptmWLvCeJ+UvpayhkHEAhcsRY50ivD1Bql8/vKfCGCGQj5V9RUnZQypBfcu3fnKroEBUSJG+zZPF4ZEk958qeOHMSjZggbXeXdST6OtHAd5QmYBustk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249453; c=relaxed/simple;
	bh=V1J6jegOyogaGAsF0mcTQ/UdeNAjWE0BVnbAjMA7mhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMVkVPsAgdGcItJFDFSA79D9eWW+WNj8PV1AG5IVVZH9c8k4N2zCXyEP+p8urSUQaK3arIyc4W+2N4agt5YEN1KScuGwMJY3PUgZw8O3aWMgupPaMeXWpqdUT6bu5HsZyTMnJizWaxHZ25YFJL1HEkLymq7u/aXW8IafnFFCbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxIM7VWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP2FhUno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBOnYX3196903
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uFf82mLJBjZjNx5KkB24U4aM
	KDWvcWa6QMSouhjlBAg=; b=WxIM7VWZk+e+IZM5ePFc6mJxWoikxG70AXWQemKl
	Sqw7hQ8IuJYKb8g1C1IjAvK5eDTHljyi5M76Bn9Igg0xyJXNufPtLppXcfGdILPJ
	bAFsuNG62sm6atSuYY2GJWpWUmrWulVLFwumcXAKFGbI4Pw9IthsmbQwIZxsI/o7
	Z6gdLVx2TYEYCxiVVVmydGh4FWQPL9o8ZNQ2JpUMtGxYuY7NfuuQIoKaAl4OKFno
	OWYFQb2E7e83r8Ir/HPdF6a0ZPX9I6Q3sG87G8fARSAS3D2ungknArm5cjtmVIPJ
	JvOToRr5FTyMN42IPl8Eoy6PCv05q3lJgqd17wDOBajzVw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36gy9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:50:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3822c06bso68550486d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766249450; x=1766854250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
        b=kP2FhUno8NZGgbkSruaIt+4/brw+M8Z1ZmzwdK7x31RMkf7i7c7qpqSQbKJ8ZCvdQ0
         dcnh0Mvqeg1JTZXIVjBjDXxpyqsX/6oR2WdSeF2ZW67dw1W126qRRBu+fdz19QfCe70X
         FcGsvDqv5VmVt2dk6aOdOVq6RpPUBK4rAJCFn4Q0KL+Jik/ddUCobq5S7+o3n/Yf90oU
         2MBEI6lm2n1eck/C4zugS5n+NwwkNa2H+D3c4Um3kFFKykAfoj/AzTCyVhKTSEf1e44+
         ZecfQ3Jo2m+eMgIOU6yt0ABNwdxx88BoxKWFyBcZJ3DWGZtJ+euZwb0g0zUYiWQgUE6F
         RCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766249450; x=1766854250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFf82mLJBjZjNx5KkB24U4aMKDWvcWa6QMSouhjlBAg=;
        b=oJ15RV1uzeGVkA1bqC55BrnJuiih0ew0r+bSX1Vw50LDgagRVWuXGUbG7+7RgAwLqQ
         xZG8/cKldB//4WZWW+0XxnqyQwx/7Cmz/L84CmD/KDhuT9E3AKXVM/4VAuBMv3jvA/2l
         nrAyWK40AdXTXQ1b26yDv26L9YCCdDF6FWvNZQFG8Go2GHr2gm7uxJBdF7qwo5qqy2yl
         b+xLUKW0wwvk1zmV1Tmmpl/X50IBIkx3O/+3AkpGAC9DX7CScjdJhs4bL2Z2PUkTL9SX
         pcYOg36RBKzt73kvyeX4xu1frj2h9W0sCZSPW0urHSez4rVdZEYhb2DRapWS0YhmJy9X
         m9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV5lQVYuGXy6aeRYov7Pz3ZZ08kxM3SI0P9hedYFaAxtIgy03TIHcV0fGVEvezcw/4ZT1VaPXVQGU3DhIQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PNRNwYwtIF5k/119aRjG1lTv21nnIYe8FN2PupZ9MPuWg8jb
	l0PAvAkwRxKWdqWDjqCj6Ap7RJqR5GBGWg9Hrdfaz6tmByn91ZAcRT65k2IvbvIr3N+2Zhlnaor
	OWxahpPwMAokwllGMjRJzUCV9rowGCNT0LMxPLeOCen3CwTKa04aue/uchSGEDA96ePXt
X-Gm-Gg: AY/fxX4zUuyBRHdEF90h8zuVFrk6AbrU2Mq7M5CO+JmNL7LEwVo8fnOoN1bGaX5KHjL
	XNnIV6nof4IPqGOgbopPwR3vpLncOpvvmfh4IIPLZGNpo8r8Ey99am9ZQsEesSVh5aiELQhuv3u
	xB8Qf6h9J9DF6O0YNjPg2woJsnzVryqUGtIIPUJ5GhkAfOUjoGsYIlNV8tiC3Mgu29RrbgLQLPA
	lKXC+ZqQetETrbIRhWd6DEx+DhKbZZa288nBuU4/zn9Aw/oq4RhoiGxi7XinrZ+1+50BOB3FjlD
	cHXh+u1Dgfvq9AtVuQK0iMThaQbBPnv+SaBMsAOvuWulai1vu8UT0XKEe9AR8+hP4aIMDwMZEkA
	9JCEOLgmXyS5JPc5ECcyZHB+M4XHNgjzHjBbWQOrjAhv75e5EbUUdc04r6T2Nny6f/lXKV7Qaqh
	UOxCErnGLD9/72IQCEr0pKvRA=
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id 6a1803df08f44-88d850fb9f2mr89852976d6.59.1766249450486;
        Sat, 20 Dec 2025 08:50:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBxCqI+gr/WocZ4iNPcl5owbDZ5ubpYXfDj0Gm1KEKgQ7LzgELWHUHhzlxo4GL/MCnBb74OQ==
X-Received: by 2002:a05:6214:5787:b0:882:483b:978d with SMTP id 6a1803df08f44-88d850fb9f2mr89852676d6.59.1766249450044;
        Sat, 20 Dec 2025 08:50:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm13654431fa.18.2025.12.20.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:50:49 -0800 (PST)
Date: Sat, 20 Dec 2025 18:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/6] drm/msm/dsi: add support for DSI-PHY on Milos
Message-ID: <kjqlk27r2wtoiuruycnw32sggmlaxax43l2dvpd3idnbq3i52e@pyltdthhzgsn>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NiBTYWx0ZWRfX5lzA2DkMZegU
 Ngs7gMDTPwqrYdU/TRtBU5hmOLf1uJfDP1C/O+sGNP18c5LH2s6Lelfo+0FUIqG0uuDABdbjMyY
 H6tPXXI8RwA6J5odh3QSvS7s1qmvWCH93yRuZrI95/G+CJANHZqHIocDmcA0mwmhEGznVTA832O
 CHYz9cdk4wPwl7RLOxPYmjyt3RmUUHBhe5oEIvoETzhwtlE2OIlr73xjdxVJYEpxNVKxcJX6O1H
 x7FvVLRF3XIxAEFpJHXG5vxfDsePIcB48tSJrLNMTdcOnm4a7e8ycQbUqa2N7plXii7AWhDrDgF
 DQpPVPDLLN0+EObvMrcwYD++bLMsyeh85MRPj0UrRUTfKkpqYYH8YaQycyXJ1wXcR42H9iS45fW
 UmUvWDc4bcAG8F3RUzct7vKYIs41lqzNmZv7MO4bkgUX2PVpeok48E6RH2D/Btg+TBKo2GqTd73
 IAASgFGyUsUz5oqSNhQ==
X-Proofpoint-GUID: i72W055ZGDQf2O5NfggEBIHu63zjyq6N
X-Proofpoint-ORIG-GUID: i72W055ZGDQf2O5NfggEBIHu63zjyq6N
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6946d3eb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=pVFFj6NhozAmOX4LvaEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200146

On Fri, Dec 19, 2025 at 05:41:08PM +0100, Luca Weiss wrote:
> Add DSI PHY support for the Milos platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 24 ++++++++++++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> +	// FIXME not sure about these rate values

Seems to match downstream values.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae95000 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
>  	.has_phy_lane = true,
>  	.regulator_data = dsi_phy_7nm_98400uA_regulators,
> 
> -- 
> 2.52.0
> 

-- 
With best wishes
Dmitry

