Return-Path: <linux-arm-msm+bounces-56599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B65DAA7C5F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78901C0223B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2072E21C9E4;
	Fri,  2 May 2025 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7AK8ydC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941E21A94F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225883; cv=none; b=MXDGQ7beeHk8xQay38/aRB1WCMu33q7scuL7Qiim2hYscWPFLAHc0p3mdKccraV6iHb21VIQAuccKuvcPO4sVBDrcfmOpjIBD43GwPUlOJ5E/kFWgYjXVteQHOx1eXO+qsS5haJjOWjHMqmPym7QdtGA65Mbhmm0SLMiClT1VMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225883; c=relaxed/simple;
	bh=CqvoPC1f2YRstyDCde1pcGieSoRE6ZXhJMmxOjIThAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI4AaAZF0cmrzR/5yYd5jIqENocTIEOC5plZGP6PwawoDWNOxJh4Qf6cs6MJP1TsmAq5u7gIcyZ6OvXkruj+6uCgq23CusMA3nssWZP1Qr5JoyC0qVvmm4jHt1Lz7aJ+50ugPPXtlt8i+CZdUCRqeC5/R0ocvjmiGNSTzlrUH+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7AK8ydC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBWmq016532
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 22:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WRrq+JvjCchJkzjakhXCAMug
	ssdkhskj9a7C56XZN6Q=; b=N7AK8ydCrs0QV7SJMozTnUh7yXQ1rJagdVIATUlD
	mzufpYOVzBMTjUONZ1D1ZUzVhGTUM/rrXCya3jcB3DeHWYW8y0uDQsr8CpcMvbl4
	K1wwaA996PT0Jx0iM9xQXiilZdifyqOV8k4LREj9ZutVXpIABGavdOZ250ySw0eF
	MKXpp8JIfkzxRrNGyn2M2UyfaG/RigUbY+NF3BQ/sCxpNsz5zq48Nur3XNNBTlmK
	796BRf956tr1Ea1yufLhJkgwGMhnLVYngWlR7IfIonP5o007Qt5+ThREIbNb997v
	yFw/rNoBiIo/hV5VAOEV88X2j6ml4lfsy2Y2t+DnW3x8kw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8he03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:44:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so457892185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225878; x=1746830678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRrq+JvjCchJkzjakhXCAMugssdkhskj9a7C56XZN6Q=;
        b=XciuibVRk01dnFYQKQ6HM9rVa2baTnF2Ylg9LNJS7gOtkSXstGQEc00lesJfF4n3SI
         q1cyzB9cOBiUmGr9zJJlYiU8mDqUhRpBOl4vxNRiqlG3iLUKN14igfLueD0ihLplrcNW
         02KcZOk85p1YcUv/Te/2fNC/vVJw6DhbAGxNCZUWlxkEve2DMMH0ChV+f1hrf69P5UzI
         IDurdV5mHmJ0nDod+0R4L4Az0yhr/gv68CTA+JIgBEv4f+p0ZRmK95QDGNHvwztRu3Xt
         rRhoTnDqDSzb8c1uOo7P1egWE/kUawRzdNo9k9k0fiWLa/bQT3L/RYb8LJyQ+1VvKKmF
         k31Q==
X-Forwarded-Encrypted: i=1; AJvYcCWykJ4do2C9lWLxaU0NpNnO9CjMuggbM0WWODxsZWZ9YWILCTjh9jCt2HQ649zPFfPBpU73kKAkuUEMKjpT@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZeozKOHuKe6IVO3WqnaBeyvWUT8gfksp+rIGByDlhWdXgEyx
	Fo+QsqUzr2df5xOpyLNt1C88wyqO1jqQt8lsz1YOw2TO/5OZ3tSskPXKoamHZn/6jkxO9X10ez+
	hXoRxqRzgNfcuCfkMmeFlsD0B+sXgmwGrCGYhCAi5mm+5k/w52or9+d49mkzyNwLd
X-Gm-Gg: ASbGnctweqlxdVC+ag7y9GpkOGkxsGMkIcsjq7nHeVxpbwRWmt02+UBP78HFAT41gE7
	UlsQZjlW76gX4v0HbXMKfqZsBOFgCvYMR2clLHS/IBvjkuzvyh5RoSGiNTFm4Gm8ugQNb65MqLs
	9Yri4vQalgKXVyaMhSyHSx9ACjvOdbGkZUsUJS937I8fRjlsLkkRVzbsvWiW/JDp/TRMz+u+9b0
	vShXhewV2TsjOPi8aoNZO1CE50pIx0y82Iv+RLOkd1tJ8ucUky9fnjv7qNrcJiX/93yYI/GkhXR
	8rCbXVOVUJ/LfUSr/u/o1rggSmsvLzZxq7ydRrjGcNDSz1YJr74iwUOkD2/De3CUiIfpYl12QEg
	=
X-Received: by 2002:a05:620a:bce:b0:7c9:230f:904a with SMTP id af79cd13be357-7cace9d3466mr1299523885a.14.1746225878462;
        Fri, 02 May 2025 15:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR9ei7jxgp/PS8onB87Q7/5GSY//ByuX9fCpmi6JJqZKrf2d98eQeCqXYOG1RoePQHCor2Jg==
X-Received: by 2002:a05:620a:bce:b0:7c9:230f:904a with SMTP id af79cd13be357-7cace9d3466mr1299518985a.14.1746225878099;
        Fri, 02 May 2025 15:44:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5541sm521277e87.77.2025.05.02.15.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:44:36 -0700 (PDT)
Date: Sat, 3 May 2025 01:44:34 +0300
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
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68154ad7 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=kpr1jEbMLSdAOIkivb4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -3Ex1sws-YBmdckgZ6hWALL6cZwpgTN6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX5fYgfgMBsPeA V/BFB1WO+tOz53m6wweqmyS4ro4v1AupNwmJdg4+fuxuUpam+ok4jCd3VAAPsMIc28aoKLsIder RBZu7Tl9AMm7SeddeGxqq4uayx246P/0+P50rJNnpYEIegrBdRnZORBisdAgFaAGAv+hv7iCVhE
 1YWRQToK0X3zhfYUZaEJRedB89yPEvXitubfylQGnm4iCvn1xIxtV4sBBoJBMYquCfHwBzK9YlE KyPP40jLvJjymhtzokhgYgMUkX0KcrtPnGwOeOgidR6/lmNqmUtpk0LOhDyVvZRGKycz3VN2Hp7 C8U1nXYl6/FZh85Qyh1hQvpWASRKurcDngvxBkpeVEbmuiq5QM6Um2hZDcR12LE7Wr1/zJNSSOo
 rXdK+SlTFv+kbkijGvEdojwK18ghThfM/Z0RsNSXD3HTxbSxqWb2kYg1GwW+HdUKnwyYHtrR
X-Proofpoint-ORIG-GUID: -3Ex1sws-YBmdckgZ6hWALL6cZwpgTN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186

On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>  {
>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);

This (and several following functions) should be triggering a warning
regarding empty line after variable declaration block.

> +	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  
>  	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	ndelay(250);
>  }
>  
>  static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  {
>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
> -	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>  	ndelay(250);
>  }
> @@ -996,7 +998,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	}
>  
>  	/* de-assert digital and pll power down */
> -	data = BIT(6) | BIT(5);
> +	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
> +	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
>  	/* Assert PLL core reset */
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d49122b88d14896ef3e87b783a1691f85b61aa9c 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -22,7 +22,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x00018" name="GLBL_CTRL"/>
>  	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
>  	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
> -	<reg32 offset="0x00024" name="CTRL_0"/>
> +	<reg32 offset="0x00024" name="CTRL_0">
> +		<bitfield name="CLKSL_SHUTDOWNB" pos="7" type="boolean"/>
> +		<bitfield name="DIGTOP_PWRDN_B" pos="6" type="boolean"/>
> +		<bitfield name="PLL_SHUTDOWNB" pos="5" type="boolean"/>
> +		<bitfield name="DLN3_SHUTDOWNB" pos="4" type="boolean"/>
> +		<bitfield name="DLN2_SHUTDOWNB" pos="3" type="boolean"/>
> +		<bitfield name="CLK_SHUTDOWNB" pos="2" type="boolean"/>
> +		<bitfield name="DLN1_SHUTDOWNB" pos="1" type="boolean"/>
> +		<bitfield name="DLN0_SHUTDOWNB" pos="0" type="boolean"/>
> +	</reg32>
>  	<reg32 offset="0x00028" name="CTRL_1"/>
>  	<reg32 offset="0x0002c" name="CTRL_2"/>
>  	<reg32 offset="0x00030" name="CTRL_3"/>
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

