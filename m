Return-Path: <linux-arm-msm+bounces-56600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF54AA7C65
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E2401897310
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE9D21A433;
	Fri,  2 May 2025 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLsXxWq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB320B81D
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226102; cv=none; b=I3U50etLGVCrJ0QtDyXvbaIR2Pct3/UdCbqNeU20t3hHfapurFgyqMZfFrePbrqKsE6fwnq+AgY2Vh6/jXIB3u5OoloLwfjgV583AKrolgbRpeYG1GmN9fAEvErh+E3kXpOdy2Vu+yyXF1Dkuj620DQEd0iCS/O4wV242+ymBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226102; c=relaxed/simple;
	bh=Yzfu3tcE7pGAm4ed9l1L6RZuyGcZnvl2Kch+QsjHBgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYQnpO0Kc1ojEix5xRGF7z/+dxn7BTOZTbyMN1pfsvB8c3NSMpWk/cjcGY/Hgr2tsld5Dmn3nq0ZcunivT7VapzsF1Y74i/Fzh8gXBT+shx8GPjBguTS2nKx2o/GJTsWipbdgjvAVQ9ObYXJIef9asbXIgNkkywuXz6ShQV/ID0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLsXxWq/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAt8O015563
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 22:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eleFOyC3fOtiERUR0ch/uTI7
	FND8UmJHhoCAGFzcQJU=; b=eLsXxWq/CovyGDefzgsC83Ma03HfEVHyVuNYVy6L
	yPDK82DlulowW/tsmLvam7BTRo1DdnJxxGJB91LGYdzH6/7g1dqkus/cYjeO8Z/O
	lJxBwSqnAsGHA0KpQEoFAHpkGW7sRjbV5EgdqhP+eFy/wlzm+J9w7dBRCmesjILA
	4f6kgbAs29w8V5CTubgnQjpCSe2auxetfeV37XeSVRKWbi+rAwuYWI3H5iEMabzg
	g0UH/UTARw3Mtx/cyRd9DJBeiqLQjaR1qyb9+RC9IXb9cZbQt9xEOloowIgmAnhM
	V+m8TTAdE8OM8TjgYTwo5cBBJTu2Dh1FzumCo9+mK7fxiQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u81jkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:48:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so381869685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226098; x=1746830898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eleFOyC3fOtiERUR0ch/uTI7FND8UmJHhoCAGFzcQJU=;
        b=O+wbYsI7watRXiFQ8LcnirfaH9lbGqZMy0BHCsET8O/py0xd+kq3A0IM7qfpHf4aI/
         RIix2nHJpam9zbihgu9WnoLBD43dDPG3c/dCJKGmcLiu6AVgwq43XFBMc3cwV0XEcRmd
         4ONlCyb+7vSp8oqO60n5sSq3ULTcZel9dtMJEBZoIGk8ZglneV8QlFZdz8jg/Ncfz92c
         E9Nqkga+4DqV42dnpWuW7fcMH9fbcEEhpOm9SNiZrr/Dq1tSGei6pdzn9+PmczSJsVd/
         jXgV94oCNXOfDKmROtdwOcyoQcIdkhPB7Qqxi4iczk7HJrB894gduCCitHF9v2k4Mk+0
         u46g==
X-Forwarded-Encrypted: i=1; AJvYcCVuR1bLzviGUrJ1W+FjdR5b/sdSsb/ELn/FpLXhXJw/N+FzrFVSsCUfs/AByxHet2d/5oQGWUpID3QdaQxs@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3pVanrTbv5b1G72mK2QygKTmPj9V6uY4ms1HXaKtlln+5mus
	maIWo2QVxuMYD0IaFo1BY2e67IUObr0ARr6pm/O80IVvMGwvh0q0aUBAhqblLKSIFfAhN7HtrzO
	KtBirFKS5Hj7WmnhkOYQYuLf4DyK96M1nyr/Ri7sMiBiiNC+QSccNyoxLLZi2JzSh
X-Gm-Gg: ASbGncsyFdbrONQJIDDC00jD++1bFiqz1Gi1zmuqGDsIiFNdvS1Iua3RUsNsToG64dq
	cWTr6jcsK9okYrIrisbg9ke9eUNyKdcmDCjY0TkgxUiFWNtQI6N/DNPp0fFzZPs/gmwAK5TR57M
	uYlylCQE6axX7CTyzjNa1tmP5pog+8wh4Cmrl1a5lDGy9s8fhffaZWX1m+kdHZeMFVB+VRoRfjY
	im23Z9c+qNdRoWuvhAIzcF9ougY3T/vj+XtH7rMNFZlEnb78FwRV+HYI/x7MCp+toifa3gfavcr
	GfoSL5VWSp9wd8oklRbrBnhUy6naUyDB32RESDdETMLbU4yqP5PDra+h3FqlGszDj5Q3LBvfmLM
	=
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id af79cd13be357-7cad5b2093dmr658529985a.8.1746226098375;
        Fri, 02 May 2025 15:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxvVUCE28kLO4ASUoCbxheAfyetz9Jt5+OUgHDim+9B4loVIqn+DtUk4rE7DTKtJgIyo0Arw==
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id af79cd13be357-7cad5b2093dmr658527185a.8.1746226098052;
        Fri, 02 May 2025 15:48:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f69cfsm511823e87.227.2025.05.02.15.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:48:15 -0700 (PDT)
Date: Sat, 3 May 2025 01:48:14 +0300
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
Subject: Re: [PATCH v5 17/24] drm/msm/dsi/phy: Fix missing initial VCO rate
Message-ID: <sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=68154bb3 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iPOKqzCR-5T2sWUWG0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: it9BfF0PJSWHdUa9HXutegFAKxy7Wfuf
X-Proofpoint-ORIG-GUID: it9BfF0PJSWHdUa9HXutegFAKxy7Wfuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NyBTYWx0ZWRfX/+yeoIb8IJIz F1bC/KmXjoF6cIL5z6apAGSOR7g4cjWPWAyGhVkGXm8RpPqmRnx89G/3hcTw5nLASvwMlMHBFIG oS4PkHrUknfA/LB30c1bWiW9IfHTxAvv1hOdCg14sfwbczKz0vbcFgFRujRTF/gYwTiXOyzztwy
 PDhTDG+RCRKox+8wY/lZl7O5MqcDi3hLz5TpdpODRMg2mlUe22fWOI+ZGPRb6tClBGTJy1+hU09 kZmVd5UVKcVh1b9Ldd9xC8v+5kSG9ramOVIcBi8/CsVe5cpcD1hLu6BoBLmfYXoQWhGmkpv/zib Sq6RTYXCkTluHxDXVA8a65RQ4pe2lN/tzioEcBjF8QUb17yJVRNrosYCFtgqM3Im0V8fIML3TMS
 bPGVgoTXO1Ai8Sf0YALtC0oqWNGsff7heFeIGEObTw9tnBadFEpxz6y4T298r3Weeak5cNAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=648 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020187

On Wed, Apr 30, 2025 at 03:00:47PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_7nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_7nm_pll_restore_state().
> 
> Restoring calls dsi_pll_7nm_vco_set_rate() with
> pll_7nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please implement similar change into the 10nm driver.

An alternative approach might be to do something like (14nm):

        cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);


-- 
With best wishes
Dmitry

