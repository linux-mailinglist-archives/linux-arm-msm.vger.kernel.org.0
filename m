Return-Path: <linux-arm-msm+bounces-65727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F61B0AF14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 11:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD7D27A763A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 09:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C77122DFA3;
	Sat, 19 Jul 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwVVF8mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49F1E3772
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752916796; cv=none; b=T0dPE7V4PJwG0I/8fIdBmfxu8knwD0PPcq7/uKfqCagCGbhyNQQ8ai5aoOJAoT3KtvlumZFI93gXy03NqTxPGFH3m2VGLduHDbAW9TX+e1cuvKCn5utSFd+BR+2k0wKyd7j93K80WBCTma5jzY/tpHWqBKar72MCoiuDlmqmZ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752916796; c=relaxed/simple;
	bh=ygdSj+dgBlHZHlJ0zmmFEfBYyyZFFr4Xm0jomCOs9Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTxd2orFG8lOOClHKxU+41u891lhGVaR2w5b4vQvoVIhsocY0QrQRiz+JFzYlkZNNGVri8ojGxsYYLoJnC9aJYNFpcqyE4QWkMRbtWWZHIt7N0fhnba1uRhG03E/XJKsHRjOTkzG9Yum3fsdSxBstB6Fo3oElVokC+mLhVgXnI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwVVF8mn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4MAIi016434
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fgOH2EMBXPQoK79TfkIp2MYG
	GZpvPv+GXdFI8RzZGME=; b=LwVVF8mn8nWKHE79wwKCX/hA8cQPK322+nqhA+33
	cZ9GvIaRKii2zf/E6zXyQuBfmLMUiAGOHYfbAHXN9BvwpiIPLtQp8EzGPd0Wh3/s
	Mqlp0g/Jg/ymbQnVmmkUpjpOvnqKJhhMFEe2e4gzVKNAga6/SZMG1f95UUkXZmiJ
	HajOJzq1QS8+NBOpnhYbW/boGgdLJjITliS0tcU21xCzgeLbDOYUxB2Y9h/OKGSd
	ltMH1H0ZgFQAuaq1hOCZoV1cB1UKkmWGOdPTOlMRNM9+9cAa03HRYJzUcFA3KKw6
	p8xXhUrb0m6S4uUQPhcKMdAd/xJThltCxqqX/ndoV4Bo/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048t8cx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:19:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e333fae758so574835185a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 02:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752916793; x=1753521593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgOH2EMBXPQoK79TfkIp2MYGGZpvPv+GXdFI8RzZGME=;
        b=kKukg5azLQ1xh7sAa2WO/k9Dfb5BYF3ugArrQUtWOKosEoUncshk7KWiLClinuOwI0
         k5cm1T9x4AOvZr/2JAnlBeJhofa82q5r4S8hsRWOcM9FM6whE2moDHx6h1nmo1eYsIln
         Hcr3eff9mOSXbzvqEFq9HTEaDPyT5Lu4PBm16EKF+pRroJmGlEYX+iVZpjY7SEzapQtv
         77Ep6UANl8yKWaWkaPDLwGimaIPn+l6n1EIGuRpBD7Kvzd4C1HNs2GGMod+SGBi5LWnF
         L25qgYgp+Ko0VemquQaacad+Nqmh3GI0Ons4FT5MwlpY7A5TUy+H5H/xkbFZVszbCkpN
         TmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtHOiNHkTOsORaKjdjFzyiyb9VB3vwFzUgc6/IdYZUq7NRsHV7HTKzrYIHc4lFjdEffo4Au6kOcWPTgGhn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg2Z4N8W+roRkbC6MxGyoPRJZotbUZEpr5/vt7qh3V9ZicSsDK
	r9njQeaEiuTIANEAtluh32yvb9UBuj/oqno+BTMNGbHbAc4Br0v9fNC9qfKAFm8BNMsYX4Pu38a
	jpdQeBQqmgjcP1LNWX4tGnjgiDU1Nj1xVtfOJhY7Mrfu7iB/ebh+yKC6s+OrDTbTlNLXX
X-Gm-Gg: ASbGnctu4p/RJoOgylZ7ojALjePzJPfHAbTJriESlV/eyKYQ4Ac2YvF6pwVIH+R6FX3
	4XKkh1fkZ/Ld6cFckzaSM4D4jEZUBQKIXGEG0xC2uOPsEhEGpAZyOwU8PheWzAbmSbgorU/u1xF
	xMb0ZLltjeVWSfq5ql8MkfEgrEbLjLEBloKEsnLm7xCWVCwqt/MaUVHfb46vmbE/SEuQIzPenRa
	Ps1M45TOYIaYXJqk7bsB2F0e8y24Z/5O0/Of5M7MeF81DGJAMiea8lif6pNcByXbQg51MP2GZuW
	5IUyZQHn6yFutKHeqS07zTj+wde3eyl+og1ySvn+0Yz1U4Vj1Gu89zwAjZtEDrOTntp8N7Oy2B5
	sJfFwlxrKZAAZaSiuDZF2GSP7gkPn2BuoXcFtaLBYLjF0zuOeIZbh
X-Received: by 2002:a05:620a:2943:b0:7e3:2c03:a198 with SMTP id af79cd13be357-7e34362d8cemr1715371185a.51.1752916792967;
        Sat, 19 Jul 2025 02:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrTVJZ6H+BDUrXWMtyZHvBXjeITWziIhnLeZNZgm7ut9rW4DupNl8jJmWor3RXExsowMtcPQ==
X-Received: by 2002:a05:620a:2943:b0:7e3:2c03:a198 with SMTP id af79cd13be357-7e34362d8cemr1715369185a.51.1752916792436;
        Sat, 19 Jul 2025 02:19:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1575sm5342391fa.52.2025.07.19.02.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 02:19:51 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:19:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org
Subject: Re: [PATCH v3] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Message-ID: <y7tffafhe3skb7pgx7r4hx2dxccfl36jylko2ujndejxktfbiw@gzbrhnesntxn>
References: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MiBTYWx0ZWRfX6A1gjQMNYHxK
 ng7kUAw4uTnHUFhohqYRv1ioAFl9PxZtSix1Nc+W0ZIzuu9saZDw0ra14CgAViq0HqnespUpfoz
 AbrEFjLPzUFCefL3EMgYbctpNmDkDfTJrj8+NIlwjtbVgnhR144XR5xQDu5ygQlBvcmOiJMz4iD
 RTI1VV0DAgSe0jAMnUsOfa3+exwtrPC4Pi96xPEIIRM5YXcW99/dS8w3gG3L+ePB0h6In5Iyj8T
 9z7QV6g97ZqU3ZnnsZOG3p3SWjgbMx9j+44yxnLoS0CjFzKEAriYbG4Jx3sW30CiGQkvuUfCxwU
 egtOhUg/pvRhgh8YZukc1n3rH5Ni8h2g8I8N4G5k6t4t6USudv4p0L/t3rZ68dwEwiHTdm2coAm
 vbgC9kao4BVttdomnoUVwf4TuBVNJ/IkvJrhgcnEWbT8E+OSEvGIk/SV79mJccFWPEHyX49b
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687b6339 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vVdACntxX79Zt9NN4_cA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0ZQZ_-_KFASdggcohnKTvfJ1E_ov4-gu
X-Proofpoint-ORIG-GUID: 0ZQZ_-_KFASdggcohnKTvfJ1E_ov4-gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190092

On Wed, Jul 09, 2025 at 04:08:36PM +0200, Loic Poulain wrote:
> To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> be active for MMIO operations. Typically, this AHB clock is enabled as
> part of the DSI PHY interface enabling (dsi_phy_enable_resource).
> 
> However, since these PLL clocks are registered as clock entities, they
> can be enabled independently of the DSI PHY interface, leading to
> enabling failures and subsequent warnings:
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
> unused clocks (clk_disable_unused()) which includes enabling the parent
> clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for the
> 14nm DSI PHY PLL consumers).
> 
> To resolve this issue, we move the AHB clock as a PM dependency of the DSI
> PHY device (via pm_clk). Since the DSI PHY device is the parent of the PLL
> clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enabled
> prior the PLL clk_prepare callback, as part of the runtime-resume chain.
> 
> We also eliminate dsi_phy_[enable|disable]_resource functions, which are
> superseded by runtime PM.
> 
> Note that it breaks compatibility with kernels before 6.0, as we do not
> support anymore the legacy `iface_clk` name.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  v3: Drop extra pm_runtime calls from probe
>      Reword resume error on message 
>      Document compatibility break
> 
>  v2: Move AHB clock into a proper PM dep instead of manually toggling it
>      from the PLL clock driver.
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 59 ++++++++-------------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
>  2 files changed, 18 insertions(+), 42 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

