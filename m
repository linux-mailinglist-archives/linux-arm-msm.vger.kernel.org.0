Return-Path: <linux-arm-msm+bounces-88303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A2D0AEA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89E15304682C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385ED32C923;
	Fri,  9 Jan 2026 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUGsoD6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7ID4Aul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A863624DB
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972433; cv=none; b=PDgxMWfimNoi5VrwgjeCU+nPz3YwN2OR2yWyyQQN5eWER6lCuY3cJ4Us+LLX0RIsOT9PUIF3mCYCay039wd5V0epeDMXLjRlIyf3K1K3zCrIWlpnQfD7vj5IsGCuuUOiqbqOYLZOVfFXK5iTadMk9A+9fXZZO5z1sRBzYfhjNTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972433; c=relaxed/simple;
	bh=9vHXsedGhd0hg8FFZJ4dAKki6nT1ArzZ5MrLLDYIUH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2v4T44RIO23RsCZm8BcCd3TPmADKJyyNs3B3CvsI01UkrQzrWjQhZiq2HsjTrYjxSMsLzrqNiDTLcVBMAxhd5q08A3/O14b+dntwrZLJFHbghdhFL+Vv9/cxFbjYTAfONdTnBGWES/Jta/qG5buKwi5HC2h5A38wKG7bLpbIDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUGsoD6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7ID4Aul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099SdhC3324801
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y8DchdoDjl88rzzm8DQwcMrW
	t/AMipXd0G0A9HBu7ik=; b=SUGsoD6KrVUpRRsAOoQxKPE4s412viu0SDkVH/9F
	fGF8iGX/DO3+oRFopDGigt9VfuvVw2w+eFGkn+8KdBDgP/lah/VF1w/xp4/K3AvS
	vhjLqJ3NobCng6HR72PkijTLAP4jx0vmKiyBmGPFcFaU021i0hzTTa3nLI3L81PW
	ohMjpVjMfrYxeshSy/uV1OqwvOGeEUIE41CNLeGMb3OGFBUHxmGi5pfxUqRYX2Xi
	FiD9h2mKCZiNVMnwMaeHLPMKKewhvHfBVjWZrp9EsCRDCQAwAK7gnzVr8NgSy7N3
	R4faUyMUhblKOPadH+fIW1s5mRnu98fQ7yYDWCuLH6/LuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6j8k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:27:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2de6600c0so1100259385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767972428; x=1768577228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8DchdoDjl88rzzm8DQwcMrWt/AMipXd0G0A9HBu7ik=;
        b=C7ID4AulNLhmaYIKZqaqV0aEMETyZyEEU5CJrFWMxoJ6IxiZx0kHaumxCbK7KoaUxl
         H6eMHQXJvjTX2yOtoCUdCy6uo15+SOyC3+ngwebq83UPE6GXC778l9Y3KXeBBhzgxYU/
         uZMV7OV4um4lBggq0u5TAPXh487N2EHjGACiwoa7ufMw7rtxmrlKzEApd8D8r0LOIeR/
         mXo39uyuW6LNYNMpF/UVIhSZAPM0qOxUlLXY1xWBnjbrCy0mDa+qNKrFq8ssWNxnM37D
         bm1bfUHX8LHjrp40DIEpSUPdVgiRQX0Mxx1Tv5ywA3WDH4JHyUTp4OuISYJJB+Vp7bH4
         79xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972428; x=1768577228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8DchdoDjl88rzzm8DQwcMrWt/AMipXd0G0A9HBu7ik=;
        b=NoKzY6TOXmVq+4y7d7qDd9krt4X0mJPqhjcpo3HbHwL2lmDp4+OULGGQzKh36FXNhT
         4wMeQg3dGEMQfIAOkJhayh6IuDaLTtNQ5z2pdJmBCk15IklfXuj2w62+5ZLMF+Kmu4GU
         b48oEQf7AdM5i1QjdqGwEbqfwFtBUjV8QJzw2QgUPj2CCM3Nex2UFf7l2lDP91nmXr9D
         Q1mE4J8YnXyBlZPzfxD/ljNKQLq41haCEpnoIGOwXbaCCl8YFBYewt9oyMm+VsFiN6bu
         xBPweaC5BakbFmRH+SU1tIer5mG4nko37AByKNg9iaKIdF18kFliDAdIx9PLVCaVcIzJ
         6CRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuEduDgKHeHjo180ACFJsezvhTD03hfjYM37LC8DEIiC5c5vahxU9+Zw40oD9Kmv1P4VccneF20zwCUbYn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Uc0mM712YMv/Wnmi2fS9PQIX2kIjedvkQIigIj2Hyygygt+z
	TRKwTiTxqr9cUlzbxjAcEDTu+RYdXWTyqYL24TRjTIFcY1a94K2v4n4dzdJdZF3C4eU1vQbIh2K
	iiE6XLkxPYUejbj6J9Y6iffuohiTI4G/fa6UW4PJBMHA6bcI1NKkRPqEEoKGtTtj4NFqL
X-Gm-Gg: AY/fxX7A86wk++zImVR5JLVhTmZY9iFHOP1C9Fz39k4qvKwAxxguTjhbfEXcPTY3Z2n
	AqFA29E3LIcaafmrcwmzv9TrToyPExrc5BywgRgsRDlZRe/LUsQfOYISp9Z2Ihp9ExS01e9Yspf
	PguQh1k+T7ja4toLur81V3yTU+C2AyAqus0i4X9/O9lCTmOHEi5enyxIhBjPrV8hVpLyfxB/INw
	ETnjpswsLCPb/BLBf9MDEg9NxvDELabXnEgELula1QJNn4ppu5XL2EhgS58L2yNLpohV5cgg8Hq
	PqR0Ygxz2jP2RwzizFhssvBH2GyWwgIis57IlQKVJUjQazwIq4vkx8nhYfNkmi4q5c97vhgaA2q
	kR68JZG0hVqDEc7+yTyIHIrYGBJmwR1XDr1FnGDCE/boFPSXzsq11l5+WZq8wLV7dy+iG+lRDPj
	c710rs6hdl2mL7U3JAFAr6vhQ=
X-Received: by 2002:a05:620a:458e:b0:8b2:7224:b25b with SMTP id af79cd13be357-8c38937598dmr1418115485a.16.1767972428400;
        Fri, 09 Jan 2026 07:27:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT9tFfc7gS81RaPbkOnVTLwgWozNGf2TdgOHQBHYGKonVlbh7RXUkGNq3wcO8DwIDqtpuMVw==
X-Received: by 2002:a05:620a:458e:b0:8b2:7224:b25b with SMTP id af79cd13be357-8c38937598dmr1418110285a.16.1767972427812;
        Fri, 09 Jan 2026 07:27:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8ad930sm22376341fa.28.2026.01.09.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:27:06 -0800 (PST)
Date: Fri, 9 Jan 2026 17:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
Message-ID: <qnwvucdihyavgn5prchafmfly7mc4b5ts4h2wxjky2cbkv4t33@ct6zncecngvs>
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNSBTYWx0ZWRfX/Q0swRIR6DzW
 uMSz2Z2TN+xFtCWVaiuPkBIeSZK2/P5FI54u+4NBcMYKWPzIqPWpsXlo94MyKttYoO4/A3Ji+zM
 gh0XizypUhHVdc1+adBd5MHBBm+i02WQluoM4jzcXajz4VhbJMXWR67SNvxlVb+S3Dnx90h51v+
 QzpNn2DjPZkMalfHJcAr70i3JeGdHc5S0Y/QpamMIxQPUoz7AmmM8B354rpxT/L1A+D7OropZqX
 J2gLGCJrvrofufbBRdDmtyqQwPS186hySIxtsLeMvAn8XK0rUJGwvr+9/b2EEgTmdJHr69AHqp7
 7hfxNMnmlUKXh8tCwFIlRCGL00V7T2LL9sw/r2kbR7t9YCP/RZawfyG/AvVZHhU06cs5Kk06yw/
 3WY+atqSMx1UsHPkM4HVNtjL/g+zlpNIJKAcFhH+IFQ4FY7pE2Sx1P6QmH5FtL1RBUy0EeGkpnL
 xl5vE+SVi0S+qebax5Q==
X-Proofpoint-GUID: cNBAi05A-MiOzTF35UBR03HupoyEjYxZ
X-Proofpoint-ORIG-GUID: cNBAi05A-MiOzTF35UBR03HupoyEjYxZ
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=69611e4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ePONTUrQY_oyHk2hGNkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090115

On Fri, Jan 09, 2026 at 04:30:21PM +0800, Yongxing Mou wrote:
> Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
> mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected

have been corrected... when?

> to the appropriate DP-mode values.
> 
> Additionally, the HPG specifies that the LDO value should be set to 0 when
> in DP mode. These misconfigurations can lead to link training failures on
> certain dongles.

Separate commit

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Missing Fixes, cc:stable

> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

