Return-Path: <linux-arm-msm+bounces-60888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B6AD45EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 00:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B53D3A6AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 22:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFA028B4EE;
	Tue, 10 Jun 2025 22:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrEE2rKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D227FD73
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594338; cv=none; b=AyyUrTMasbRipqlUKzPM2nkij3ts0RxuDi3PZBAfj+xDE51Q0y8mfqn95T4b99CbXrCOLWEKcMw2gtnanTDK+S9Y+KXmSEStjDTW+7u9D+BKL53FNQmTFm3Rkv3X7dlLECsMnhyw6jyUXkVUaFTY6xjwJ5xruApsKJ3W3+tf42E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594338; c=relaxed/simple;
	bh=ZblPVCW6RisPNEnVqYsXRlK3rux83HEJD1kpftoB4OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QL2l08Ntl4H3crzZWGRUE2W1rwOheYNcYiseuf6g4r8N5GqeHMAztXv95n70Uuz0hnbiWMPNovTlxNyUh5fCnNQe5/k22xGeurmGfBN3uBRZuE0Aax/PvR0kerhyEQjRgOJDAb/c60wZBl7hiFh+zWG9+1LMec3V/WQshPZuDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrEE2rKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqZU023657
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NIZerdv5856btQLeZiz5wtEr
	Wi3yo26TMxxYpxr5HC4=; b=RrEE2rKOCsDtipjqNu3tng1rbnolbgehv7+H0EAY
	FEZ3H6HJXAhgS62zP8ebfAMARG5HvgV9pM3dCS4KYpPB+BbADg18KKaiF23MAviK
	aWKYFISZQw1nOkOu4S98mILVhI3YL8NvaIbMq+tSvVxm6RH7+mPzzhFd8kcdEiEx
	CbWXr38/2kLY4ZqvMTtkyibG1i6PTw5lI3XtrE4ZMWb9yKLIWvaiLhoFiQIHGo/w
	E+U3k3aU54O3uGviqpsf8HqDgVh5HwDx9qqUoI8DI1zZ2HEvyU02MNC4Z6GZ2G6f
	vwbOSUWzItq5h2m9uqp/dgqun15+RhvbHDPEduLyoYWF4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcjx4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:25:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399065d55so309572285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594335; x=1750199135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIZerdv5856btQLeZiz5wtErWi3yo26TMxxYpxr5HC4=;
        b=tQVL8HvzHqPv5xOR+danaUJzihuwwWcEkYzwN2JGvcbRxOWdS2SkcVdan5tS+UdV2Y
         nRFnpHlKr2c/At3/VwxHOjv9T/pZsXnQtP2Oml0nyBKbPPQyy+TKXeVUr1+KQnz6EO3T
         mJyGIQiq/wRKhT/rYslfX30L/xg4xCuCFnwBQ/nWy8kgo2/dEtdv3yhC4HP7Z8fEVGyn
         R68D7JFhPMe03L//FYirFOEIyqJxJvLw6mpuDQnKzUKOx1/hwnaA/wV17J4lDH2wArSV
         TtlVlqkmXpHWQzz2qw4PatjAFGF0+Okw7jJmad+kaLhKQzdgea7MOznH5YmOKgjyDKFD
         7W4g==
X-Forwarded-Encrypted: i=1; AJvYcCXVQz7zZcS7RYlCS33CsDK/RmeeGoJ9dr2H6p8xYwV/5FtFng9xpkJEh/alpiDbERhxkOxQIzpSmuE4rF4d@vger.kernel.org
X-Gm-Message-State: AOJu0YyUiVKf59FGyeVkTubznO8uc5Qf/gwXs8OT3BcxsnsgZDLX2QXd
	ch3r9VmPw1YOQxDWAXpRa1dZ9mtoa5/1oIDli1/FoQjlQI0kQcX0qYZfsZ8Edv73aK6Ag5Fo4r3
	taJIxvz+oMB+CZG4mb6QmKpy3tpmLb6vC7jGm88z7i4EvD8OcdUcGwXrJH/6QJrHM+PTK
X-Gm-Gg: ASbGncvLJ9js7DzC0h3OnqbbwL2OmuhQ86ZKh0s5gaHLe3qF+RlVaEbXNaJ8q3EcuXV
	kD9mqmtx1nOMtd+u1tdPSzRqPIBU4dscSnIHALrdhtNxX5OQxm+C4cfE1rscp2pQJGRJxaIrKx8
	gGZHw5+x+NBxxAKy2Y+ahPlKaWrYwD9Se+a3u34FIcnqh818RBfzFAoHyumDIyxAXzkEDhwJIzL
	u5+TjyCbBn7mdDZEySv8ARhCejm3N+0AOmqdwDwLI51NWaLGJ0dtWdy/aADsqG5gQRl5UoWNJIK
	LBHsekX/lqdj1qdp4VqUStQNL6fyCy8nSdX7bMlDIR51LpYAJNBrAh7ZTOuM7XERyTE+7pO6uIf
	pcxh4RN5iXAR5JkrZbkgZJzWM0kdhfUSVT6A=
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3a8806306mr191676585a.8.1749594334732;
        Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvqgKPApzu3rPogEhB0z1OsbrjkQcClCu9eRwx2CiVtQGPtd7+Q1xiMRbqpX3rcwtgL9CA7w==
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3a8806306mr191671485a.8.1749594334288;
        Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a80csm1706310e87.162.2025.06.10.15.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:25:33 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:25:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
Message-ID: <gvxglu5n6esoortifeyeapjlkwks4adxktshj4mcc2iyigq5fj@ztsuritnshkf>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NSBTYWx0ZWRfXxcrAqWQ4vCNr
 rvEp6d24pR4KbcKvy4fx3bb1b2CF1/4o2g0gDlQKuqrmhEuPkVTBDgrNAhLpTOWm1zfMuEbG1N3
 Tc4lEoOULHJf4jQeKmq43ffQQNAtZjbwfLW8evVhlV80MN2h6rsQgYLDu1+K5Nbv47Nm58eez+6
 ONWxgfHddi6r0hMsAHwX5zMjKrQbMmZnoEQNGyrF5xayRpNRB2WSJ/aq0DxIDJnKaW5tEwmr6gS
 xYvA0a/2+R9OjIzXjr5DHuahhNTuQh9gyIPNRyneiromvEZigKYSxtyA8xsOfFKely4tzE69SE+
 5JbJVP+rmngIS5fdISGkp7gwHM33zFHdzjqGOL4lRuImv728eJXEEfWeNstPs2igaPYB5eswsn+
 SWCQLB3g1DrhAXtPjI6dib29zG+T4RoD6P+kLLPWPpXvwustsmgb1F2FWkL5agIsAqpV4eZU
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6848b0e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sbni8NmfYZyP3K5nzVUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: i_E8PMkRiGrEgwWE3gvv_ub6kpg91UkA
X-Proofpoint-ORIG-GUID: i_E8PMkRiGrEgwWE3gvv_ub6kpg91UkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=807
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100185

On Tue, Jun 10, 2025 at 04:05:51PM +0200, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

