Return-Path: <linux-arm-msm+bounces-55132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D1A98A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697C23A71E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C097E2940B;
	Wed, 23 Apr 2025 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwtSO8js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186ED2701BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414158; cv=none; b=uj/nf8dqO+fnBaopOblLONU9L/GY4hYsQ8z61ZzaEwgJR2W55gIhVoK8DF8n/oBJYFX6uPd4LCwiqMI1i8i6ukU3reP0Zhdo5B1Hr1RWqbSjH7aa6g302t/5fem/1CabA3bY2RprTUM0yxTP5SD1LupKvDSSfR/yaMVjYx4MJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414158; c=relaxed/simple;
	bh=u8S9Sma8OI4x2x7XLoJu/yNlDhBNPnI7qJBkGOkT2WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuU3a5fNT4c1ivLgtO+6aeft2EUaZ051Q/CHpNTHh+5ffalnFaUt3YaMjSkrr/Y+HERZiV5ZXEdiHGOh9kEvEO2PtxboAsLXWygHsC3s4iDdcJP/llQZe0Bd14oH5rn6dINpoYCim3ewnYcxs0FZfBu1PItgsZ0lk5KIegr0OyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwtSO8js; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAqBP9022024
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz2nTeFULvaN0+3E1RZ6/HVP
	9LaXnH80pe6sfa4F+ec=; b=VwtSO8jsHfXWy/IeiZLVXx7dMQxfrJdI9gne4SD7
	XNGpblQpI6GqhIDuMTr8QjX2g9ONYkNJQftq+ykcwOGs7AJObI4btleRbR0kJdXS
	isbGYMTyCyjFdlFzaqlRMbam03ZqUQGZQHJuvMbLr/Bu2/F9z51eZ7qW72y9G+pB
	B3OnO2eAanAxXhWtfVPe6YYIZ3v53iKzZJ4HHHr2oYpZ2rZ4JfoeqXjoJYGIo+ry
	HtogeEU1Zf1n85MpDvTZm6XP3Eff3arNlHKMCAt4n4nxZ0pXk4YJrgy5bSIho2B6
	M1x+RbxFbx6N4K5aCojSnZi8lk98oHPEA/LbV3HERyoRBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh126p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:15:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so1031015085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414152; x=1746018952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz2nTeFULvaN0+3E1RZ6/HVP9LaXnH80pe6sfa4F+ec=;
        b=MHAQvisG6B59u8mRyJpQp0TJ74lnuABII1FqIv94EM91YuK2cqmpGzBZx2FcUgqJ42
         xSq+Juu30r+FnQq74XVUOl9o8C1TMjm3wkWD+QxdfNHb5u5FmJ+PIk46+6L0RoIbUJA+
         +hLkSt2Y0iuvmFp+LfTesA3WEfgbh6n10inTN1C0rfnKiiK+JHv299QrGm8sRo8ZrycH
         NVw1c34ve3+zk78hXspzZ1cB0otdHzfMOZl5BgdJAey0wVvdKKfs2Sd5X8JlJhWHjXxD
         pJjt/OjHRU1WTNHPFiGbISiNdbQihOvfzaM8ExHNL2GZXjba6NaWdiFIuDfU/ykVlPNs
         K36A==
X-Forwarded-Encrypted: i=1; AJvYcCUAXTSMxWW2r+k+rcZpAGAMp+uvcM61VArJbmbNyOc3bMviOilQ0e7HODzpb7FlVyiHUNezxurvZQYgftCf@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFh5rsEe9d7dkyvJC/xBK7avFoTGb/x0rjNuQt3sntrsfn85p
	qRTeCf+6kQRWpaeFdEqVsVRF6OPp6yeaFDvScGx3iLUM/n0ZoglPrWQyaf70V0+tUKSn/NE2LT8
	dIz5ddsdVyGtGKR8TUrdmO6gejqhOLO/p5kA5dp+p6oGlGFCyILT5sCsh5egKIUhD
X-Gm-Gg: ASbGncthsVqAECmuCQicB5BLMyLeeKeRONoO2zRZPV8+/ezm32r8GBlbZ3+6/vTd+7j
	5ukSBD/zupE9HB1C3y/AEMUrEmzJhpBH/OjO/aEVtC5UP9VUnXU7Z9uuD3uaxbvgxAREwcsErCL
	RpCOLsmFfSHFzKEXKLCW6nxjVdSBsYS0XJWqPw52UtqOu4aefjnWgzwyheWMK4btuG7kQbg1jKY
	qTFIRKtoS5nsPbjJlLaE9thrqXuY0k1ZGJryongHtDcpDTjhS0pP1oDVilEg+mPgV/9Vim2+tPB
	1+IWe0v4S0d7F13fA9GIsJbwE11NgupvNZd2uSjTQCU0tPqRw5MIckzLDvWwT2LMZRp5G2/SUCM
	=
X-Received: by 2002:a05:620a:4056:b0:7c7:82b1:ed1e with SMTP id af79cd13be357-7c927fa34e3mr2559258985a.34.1745414152287;
        Wed, 23 Apr 2025 06:15:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH17hj5LULAjk4AJE2RYJwVwGbaVY5mVKamMs+rFkqQwoj0oBdtjb2x8wKg2hqjxempijUH2g==
X-Received: by 2002:a05:620a:4056:b0:7c7:82b1:ed1e with SMTP id af79cd13be357-7c927fa34e3mr2559252885a.34.1745414151567;
        Wed, 23 Apr 2025 06:15:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f6447sm1538909e87.237.2025.04.23.06.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:15:50 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:15:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: lumag@kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Message-ID: <adlotoi354bh73aolftvmi5xsj4etke3zwyhyrcmkana5vvkv7@gcjp62tk67sb>
References: <20250422151314.173561-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422151314.173561-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-GUID: 3jh3dKKKDXpCRbHfXevuan64gvEJ7PZc
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808e809 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=xUqY54SmfJqj2cKJSPgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3jh3dKKKDXpCRbHfXevuan64gvEJ7PZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MyBTYWx0ZWRfX0ogEXUq/zZnc ta8j9XnkWeppgppu10WCZXh5wYnjItV1fe9ye+197l/FWZr22IbehChC1921yOVWTniewNo8uwp s5iNmml1mK6sL8v9EaHzxto9aOQOtdmSV+rpZ1KCbiQJcydztlbWrTszpPkCJBDMOJJBr/2ILn1
 dfUhEhnCGEGXPOQlQiy+8ffZ/UY6AstMGf8R/mTOFnL1Jd5qo03BoY7B1AQnek/wUMOEaMQ9Qfe JaZVgxDKfvLVnYqI7ysPLbf1vwFLPFo0ocmBTaPEFNrcheAfTqxmIWU3+Ztk5RvWvDbZCNCJIVy lt04FiFP8PseWJNrsX8MnYc/Nv4GG03veqp7n2EniFtYLb2dMr65seZBgdk4Z5btViBJVgL57Ph
 eEzlQT+KjxqcsP1iExYCoP1lk3GnsbutauQYqc8YYAyusfLFPKsnvC+XmNroQn14qaYwpd4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230093

On Tue, Apr 22, 2025 at 05:13:14PM +0200, Loic Poulain wrote:
> To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> be active for MMIO operations. This is typically handled during the DSI
> PHY enabling process. However, since these PLL clocks are registered as
> proper entities within the clock framework, they can be enabled apart
> from the DSI PHY, leading to enabling failures (and subsequent warnings):
> 
> ```
> msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
> ------------[ cut here ]------------
> dsi0pllbyte already disabled
> WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> Tainted: [W]=WARN
> Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [...]
> ```
> 
> This issue is particularly prevalent at boot time during the disabling of
> unused clock (clk_disable_unused()) which includes enabling the parent
> clock(s) when CLK_OPS_PARENT_ENABLE flag is set.
> 
> This problem is often mitigated via clk_ignore_unused kernel param...
> 
> To fix this issue properly, we take a clk reference from the clk_prepare
> callback and release it in clk_unprepare.

I think this should be handled by using corresponding CCF flags rather
than manually handling the clocks. I don't think that CCF is really
reentrant here (and I'm surprised that you didn't hit a deadlock or a
lockdep splat).

Another option might be to use pm-runtime and/or pm_clk to manage AHB
clock, making sure that it is enabled if the DSI PHY is used.

> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 3a1c8ece6657..7a547ae8e749 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -543,6 +543,8 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>  	if (unlikely(pll_14nm->phy->pll_on))
>  		return 0;
>  
> +	clk_prepare_enable(pll_14nm->phy->ahb_clk);
> +
>  	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
>  		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
>  
> @@ -554,6 +556,7 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>  
>  	if (unlikely(!locked)) {
>  		DRM_DEV_ERROR(&pll_14nm->phy->pdev->dev, "DSI PLL lock failed\n");
> +		clk_disable_unprepare(pll_14nm->phy->ahb_clk);
>  		return -EINVAL;
>  	}
>  
> @@ -576,6 +579,8 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
>  	writel(0, cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL);
>  
>  	pll_14nm->phy->pll_on = false;
> +
> +	clk_disable_unprepare(pll_14nm->phy->ahb_clk);
>  }
>  
>  static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

