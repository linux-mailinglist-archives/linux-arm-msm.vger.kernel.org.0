Return-Path: <linux-arm-msm+bounces-94207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EqLOTO7n2n5dQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:17:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 523221A06BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1B8430151CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DD9385531;
	Thu, 26 Feb 2026 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icyp69qD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yb4+M0HN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACEF3815F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772075823; cv=none; b=p1nfFxoCCJ3CHpq4mmqfEyqcUYzuDfNSLCm2ecdjPi99Wsfk5GHuQyLAe2VxZLq7AtBdSJlTCsC3HXTQGQqIjx3TaVWYvfjFRAU3eJO1jWtX+T5NETM2msTf9tAEmZ1ykLdhGajnx+zI8Dijk4g0UvL/SoZAF18H+OAsVz9kZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772075823; c=relaxed/simple;
	bh=eA/pys3vvVU/XyfVWIjmJ/Rynf+QXRxwg3CP+owHqws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etLzq7T7yIE3+FvRs75DbA5lJc2b1VMiHKbIsXO/lJEaFS+dnooZl6j+aIMOXApGKmluWrc4i+xHbXE7T+HBp07fGqBJV4Pv1InmlI4caxb3mehXfmD8Y7gvlOLHAFkLUURtGUyh6Ep0ilB4FkAmO3cY5tR2oD+Q/ZcZGrWlEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Icyp69qD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yb4+M0HN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q0prbU2975470
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x4Oin2eFJWAEHjLuD9tLoYce
	wXRKKg+sy1mMDk6n0RA=; b=Icyp69qDaTGEUhbuhBW/swKuhVkCMrEGUdLgvjDr
	d3g41kocnw4YMsXB+IHsQEpJJnJX6R/zi912um7smpkQzs2y+DeSyCZTEcgis2GW
	P2Z0rrPBadlVFjd8HUV33l+pAK7IgQNrLnObLjFhOc/LTA8Z8VaBxMxVRq6XW1vn
	NG3E6IvVlTnVnXGwq36d3EMZFF7EY0305JL9lF3kXEXahbDCQ3sx7uE8mPHC0mmm
	t/PgLWOL0K8HyXqOhBWru6WSZMkpiZ64zr9xESyHFSbKZ77j13whcoPqDFwvYbrt
	uIXLDZaoQfyt+k/n329BZsVi8y9x+7Xhehp80WKtCG/K9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0g8bar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:16:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so443036985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772075816; x=1772680616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4Oin2eFJWAEHjLuD9tLoYcewXRKKg+sy1mMDk6n0RA=;
        b=Yb4+M0HNyIGWYCUGz2W0S+wswc96dLPLqq5/shcOklZqmedQwljF7lUbAj/+zoDA74
         lH4Pkl1NLDTw9c7mrnBGsz82kvpHh43n/VPX5g794poizVtdfxKFMmWMUDQM9LEY8M+3
         RWXFrtZAnOfkyvDJi5nYYZ5bSAGylRcymmw0M40WHEiP+eG0auKkILbp5jGFqRxP89XZ
         zwBSPGptbazUkZrn8i7KRKfJ4wEevlBZCX9bbCKdH7Cu7S05svx2M75+Mfrov/lUQHri
         HE4JmYwNCzb7b7283jtyFUWO3gj9RAUbxSCDMZrUV8da/X1hZkhc1tVNApVyDYyqY+FT
         nFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772075816; x=1772680616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4Oin2eFJWAEHjLuD9tLoYcewXRKKg+sy1mMDk6n0RA=;
        b=IDEAq7jtsulTbmxxU96AD3yMlEBrw42QFBUdad+M1cWGTt33Gc6cHLSXsrXHG1RQFE
         zlPdt5IlzMq31ulXL/Ezxlo18PlOYdIuYpxZOkmGH2+/Mk/+2AhHUh6LWfy1ttSk4/LG
         Upn2fggZ+6BCtJkQgopmBUa7wEDlTnzi34Vy0YyIXmCK0GEwcgcsZBlOVlrGeFecKe/G
         wmXWvHQaeM9SBrPMHgAKXnlry6qFWkq1/9yQ0C1mnz7inciw+D0kBA/C9pew14pXz1Fy
         0tA40m0+bAtH6UdcUHZvzK2qbEue/6E001dXV9syNGiN30XO3muzN9KNi68yT2w0C2z/
         4fIw==
X-Forwarded-Encrypted: i=1; AJvYcCV2/BRDCoUFv08mpGzviJ+8aZWB8aV0vhfgM7KuQ28uhmDZ6jFyo9Ew8cCcrUj3IBSczHQO4mRD5BQZ4vBg@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ7v58Z3KWJQTm2Fgj0XijknBvteBfnvKKCmTZqZYGwLr0koAi
	itB2YsFmKsL6dEL2Qsc9X2WgTGHVheIWp/JmDrjqqe7UGgiRvrMkUjfhUUy5b+cf79ksF34ezP9
	6lrt7+T0Bn122ezAsJ9PEHo/qo1V/kz/HJdJKZc6/UxNdMtiaU+J2L3yuDVcMZrVRo1F6
X-Gm-Gg: ATEYQzwLIMxRUIklzWTI1h79oPu/RI1P5PWFlOVqNjFY646D0SZZrNUfbXPWnN9zF96
	oZm5rFNJKViEbDXMcyUx975FXFUT64Hm+hTxorDe2+D217wrTtqSCLzOf1QH4g58/dw8pk3yENC
	zulSwL2RqYvig98ThXtW7sf4Y2BzQ3Z7mY1OMurWJH3Ne8OLvImQRmnIOzzlWaNZZ40XouqXJS+
	keV6xWl8yqPOOvmCEYy+b746DP0fMV88u/v+z0sRBcRSscSzQOuQmr2t/krqBV4ki2A8NTk/icT
	/5gmqG8cP3ZGy/q6oPv3GireN45/bq15Em2K/2shQSXLLrRsId0/TMDo/ICc+pn7Xr1LRVhQTm9
	1efCW5OHZGMpVM+6DJ7fLif+dOMAY8QoiLivvfKMFiJ4QA+tj0d346kB0Guhb2swk3xS39NHDoG
	RGFrGVU9hpplAgnA5HuIAE35JfoWqRH0UFs48=
X-Received: by 2002:a05:620a:29ce:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cbbcf5ff82mr384724585a.22.1772075816245;
        Wed, 25 Feb 2026 19:16:56 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cbbcf5ff82mr384722885a.22.1772075815795;
        Wed, 25 Feb 2026 19:16:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a05b2e6sm243072e87.22.2026.02.25.19.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:16:53 -0800 (PST)
Date: Thu, 26 Feb 2026 05:16:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dsi: Add DSI PHY configuration on SC8280XP
Message-ID: <zpilakwmv45vrfr2qvigelgsglgmhpiozw72nciqp6slyyhluu@ks2bys7r74ql>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-5-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225054525.6803-5-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=699fbb29 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=t8rQu5QzYQlLpjgIwqIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNiBTYWx0ZWRfX6kqv7358sJWb
 GEF1l6pwrmOReDX4uVy8WeUzHIEMksaYfvHNDBHK9gXXwJGkXsvhQo9lXF2d5PXQBSBBYnt1s7s
 KfqperIc4g53sDAfNqmnCTt6hwAQzkGDzTqYtouIf05t7zaupKPrnRkwo+03VwdR8uwJ+1yvRkc
 MRLrJH0tTkDLiYC7JYosnkwfnLcpbGR4xNYwh3IGkSUpj3gXpuatEeIlKm8B08ggSsCqw44+Gvq
 6zCTMiyR6OUUUeKIMkhXK6eu9eVMYagEfpCfsWFB31ze4khrv5j76xBid9ABDyVNCAGQ0OAMBYV
 bpYt2HZzXWVueGxdze6w216tDactVKdjeeAXYkLRtch67iUXkDZHGxZMUDOsIPqG9g4wwJvvGQh
 iwQPIJe0UY0xPT7ghESpYtB5Q33Nt3zwDt54NNFMc+qjQby/CnJAYCVr3zbkp8+3+y6iBC0xtwH
 0rje8WRAm8uPTSxH5Jg==
X-Proofpoint-ORIG-GUID: XuKmmefjLgwWW73RQr2UgBERP_h-nPAv
X-Proofpoint-GUID: XuKmmefjLgwWW73RQr2UgBERP_h-nPAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260026
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94207-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 523221A06BE
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:45:24PM +0800, Pengyu Luo wrote:
> According to the REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL
> value(0x3c) on Windows OS, we can confirm that the SC8280XP uses the
> 5nm (v4.2) DSI PHY.
> 
> Since SC8280XP and SA8775P have the same DSI version (v2.5.1), using
> SA8775P configuration.

Then we should not need separate config here. Use sa8775p as a fallback
compatible.

> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7937266de..4a37c50d9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -565,6 +565,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_5nm_sar2130p_cfgs },
>  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_7280_cfgs },
> +	{ .compatible = "qcom,sc8280xp-dsi-phy-5nm",
> +	  .data = &dsi_phy_5nm_8775p_cfgs },
>  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_6375_cfgs },
>  	{ .compatible = "qcom,sm8350-dsi-phy-5nm",
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

