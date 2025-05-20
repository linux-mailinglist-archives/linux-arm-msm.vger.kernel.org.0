Return-Path: <linux-arm-msm+bounces-58789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25359ABE477
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C061BC0571
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD18C1EE7B9;
	Tue, 20 May 2025 20:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zo+n/FMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B40281360
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771642; cv=none; b=EdiQHsLTNN9mN6tPxGMfq/O3/gMTMDrnM0ZtmtasfRAA7LC7SUZRw3GP48uBNADzCIPBt6S6bqPLB/HGnNh+3v7I+q3HAgcs3VrauMLQDKoDa88V7XOxUKzYD5YNB84u2wtw4rUDZ4ZR6BWFESmSBqMnA9AOuTsvp25SO7ZejZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771642; c=relaxed/simple;
	bh=XPuvDT6TSWe7zvKeUnoGJQNymZiLkHqbbi39dBJDQqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hE6DPkuCVvLIsJMay+mcgPWSY5KZg17Mj0uVF2BZKlGkf0ybNXizqYfoa182xqsM8MzdSwklDGiuzDn8LxqBao4rB3SLz07UZcHTMdHL/O8+nG6v5PjMq2lVBezO2RS4WA4pL+at4yxnIvXIWhmSpz2lL7ouyC7s+vfgC3jtNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zo+n/FMs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdjo0032560
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4+TilPmXDGw/Gtk0BqOASle1
	/UOmT/X4bq+tNDck6q8=; b=Zo+n/FMszjKFBUWpEfP52eZJPyhg4y7h1VjyQptn
	9X1oEHTRtb/0U2ZF5HaCpX3xq4i0JAX1yB5ZmxqXyKSBliCiigqjulOhXff3qJcc
	/JdtG9DuzWUM2DYKZR5aRquMgfE+Rzow5zwtpHbN8llRmKPpqJ4INUe6k+CmWabu
	YEkNKSuTQsIp7oLRHDO3DBSS5kPpQTAP2gLg8K6avYEhLg86cQQc0jddhdm+vL0o
	qz4L76TeOq9SjQ6V/NsS5wiGmqHuHCvc24JhdSEHwIYWEc8jc19EeM5zFj9+dHnh
	WevVPQU6n/7qtHLVAryGlXgb4E2z5572+nZcaEzo6x+izQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18hjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:07:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so31088816d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771639; x=1748376439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+TilPmXDGw/Gtk0BqOASle1/UOmT/X4bq+tNDck6q8=;
        b=l+rcXu53UN2silVeeMicoaUJUA7ph+LnPDZpjX9UA1P864lZBoIoyDJlXZPwMjsgZ1
         3+UjpaI/LR4ktpT0GSLZcZmM92CPzfsSXrQwloTIXevu/f8NojJgmkMW9d9gEivxQ5y8
         NSmJ/xPrSh3BTcqs8ZPaKZ/nlMIViHgdrgzT61TOm876dvslWfSMwa0BcDMj9Zz+tKA5
         8/I+IFcy5vCRBaXvd7mJBQi8TPgN4ZW3/FKivHHKF90pLIGAUhBxSDrejPVDsLhhXtUA
         1eS7vytTOdpFfk03WeJQbPPW/2A8RkCc2u9x1iD59w3l+Op+71K4Pycp9+V/j4GkUasI
         wrLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB9E/b/ebw+SKsd+jLqP2MBD+D9AfXMantm3lnzvHIxy2LcGdX8vBZz3sA9vUZKRqHHUirqNnMpS7IdJY9@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPXK466L+SvlEgyl0sAtUSfrTAtZp5PHvuZVnAOuqohwjYQ9K
	QDxLqCK9IOAQTd3+JSK0C7UwnriKrjihTJKAERCAy/rkahbipNTzg5eGbhx9PYFvwEHRe10pB2q
	6Ldm/07Qk1mEEexrWSNZjsGxSMIRxWT9/PeHAHZdCCMs8q1LU6feeSgLHscJf/hNrjY2ftFA9EV
	x9lUU=
X-Gm-Gg: ASbGnct+GV0ZoU4vQcWmEwzVrjWGMZTnxm+wHgXq5FtRS/AxpiPyUsVvzOJJeqr7K40
	kAAyCMoTvbClqfN7F4/UqbuM75b+aj5r3AYAJiAylmyhpOy3c8EqLb30nwfJgUUjZjT32Hh3X55
	2CwzjP7PTqGXbiIBljJgURShFpgB3I9sBaoCruyuQ/Cqxq7cWJj76UjiDbPsdfZ83GDNVLh5FvK
	dV4h6x/A2qRhHiwHuYwv29IA57ASl4zR9k1GTQS3EGPEQojqmNUr6ecTW9kmw8G5fUFcW9z9qkW
	2tYZNtP2hPElCvazPQ8l9HCjqTNeGUJAUSA+B1IHAiOFjMxeWFwnW+0WpbJl2P5tywVokObYVHI
	=
X-Received: by 2002:a05:6122:46a7:b0:52a:863f:78dd with SMTP id 71dfb90a1353d-52dba91e5a2mr17897520e0c.6.1747771625670;
        Tue, 20 May 2025 13:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ0ooob77YB33x3sc9TZXU71R5l2H/nFxJ6YO2AEHokNTU7hQE0QXzh10z0MZ3u3nyRxcaMg==
X-Received: by 2002:a05:6214:1251:b0:6e6:6964:ca77 with SMTP id 6a1803df08f44-6f8b09023b4mr282754806d6.28.1747771614002;
        Tue, 20 May 2025 13:06:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f18sm2485042e87.158.2025.05.20.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:06:53 -0700 (PDT)
Date: Tue, 20 May 2025 23:06:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: qv021_uReriwJjTH8IrnbzL_h5RuzOnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfX97Rq9OU9EgNn
 OYIzNgrLebgaJehLWfj2M+mgTvYxpnaPFG1+2QVwYANhpNtSS35V2bRDIqSoWpbkD+dAeoHB7BE
 3EQDc64ebh2u37mTeQJnjnrGWwCwXpkyLDKlYroqnk3IZarhtvyKCuoTt5BppiFWg758PrCfguy
 IF3GGGrR9u9H005EAdwUBWYx8mEfjkUNX2dgsFFmY6TjR1e0DZwXSeadLayrfL4Gfk0lKS6sWtB
 0W3KaN15MD4reC2RxKm6pxuKF9mtc/BD/7S/DkIos2gPUtDtzSA12SvunKvhao6b/B2isRbER0I
 40iIU6YEFYkJcJWhtRz4G/At6nbk+PKJNRJ5D4IvNWsyytaTyIDx7/rX8hcdGBzokr1Yeiimz02
 SlLzjwjtGTl0eRpfdB8hmIo2rWp92jAaacmTtptNFTYWdu01dJw4UO6uaC80eNK8Fzb3SOab
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682ce0f8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qeqVY09uaiYIOShEJ-EA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qv021_uReriwJjTH8IrnbzL_h5RuzOnB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200162

On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_10nm_pll_restore_state().
> 
> Restoring calls dsi_pll_10nm_vco_set_rate() with
> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Fixes?

> 
> ---
> 
> Not tested on hardware.
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 9812b4d69197..af2e30f3f842 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
>  	/* TODO: Remove this when we have proper display handover support */
>  	msm_dsi_phy_pll_save_state(phy);
>  
> +	/*
> +	 * Store also proper vco_current_rate, because its value will be used in
> +	 * dsi_10nm_pll_restore_state().
> +	 */
> +	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
> +		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
> +
>  	return 0;
>  }
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

