Return-Path: <linux-arm-msm+bounces-65826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F98B0B7C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 20:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C072188731A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 18:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138C4195811;
	Sun, 20 Jul 2025 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDJ2UluZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FCB38B
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753037204; cv=none; b=CKa8cRIPkLgeTpUDgTVwYDXTE0m2hsOpan4jABUuC4VMIVp8IqSEQmLktq6ohR7QKn71rQ03X07H5Bz6oj8TX8+h7TZean4CNKD6uU8/rbm5GN/huMUm53hT4n7MrmbEMYcg7FE8FqVjcKIbe//USes1iQoJp/tNs71mdNyvjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753037204; c=relaxed/simple;
	bh=xe85K8u8R7ec7oH/qcfbzLwjEDGcnx+m/nS5Ljgx0zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1JEDEuL6myHy3YtQqvjpcIW0G7ekoSwfj+6MigK4QquLbYN4/kg70+v8hNCY3x4pi4xwiObSnv6bGfkvYDFI1JcpfwV8BgKcIgwPhMwZh9b1JrYs+yr3quTWMqZK8prSqrDn/fQiPrDFm+wW2xMaTqPZeGX1OWlSuHrRHUWRKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDJ2UluZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KHggZH011887
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 18:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XqD9lpozTVEoNik4tz86rDe0
	5zofNC5gW8zKCBwUz6I=; b=eDJ2UluZYmn48okM5vCKIkoHwvuc49tTs43Pfp1w
	hUul0WGhBHMWlK+XbjBiLBiN2SMUMZMocmM6AiRYLK6MUNUlA0dTgbozL2mJs7Vi
	EoIoi1qDTBrv7Cq1xMXMk5e0IDWFtAdsOcfMzKeaHYSGsaD8tep7XnBcrnq+rI1v
	RTYgl2fcbuxzT6DCW31A9KHSqEheETzjbUqBEfTXbnu3XLGMu0c3+XtA1SDWK7Za
	dH6ktLvfQZFXYvCQHhLFFKZMHOsaycEDqA4wwg9n4aSKzuZESuZ1ORpVtscHfRPi
	cI5LYryNh4xfmINPfTdQAqt8UZmjTZE+QFXKRkCxn/CJmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451ajq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 18:46:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e2e237fb4eso662711685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753037201; x=1753642001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqD9lpozTVEoNik4tz86rDe05zofNC5gW8zKCBwUz6I=;
        b=HisFhyJfe82sScbyDoxnqSX/xuzmwGF/5Eefc50kO9tDiwHz/82E/cDHlFc3V9oGgm
         4p28esqGzimt6DyeNG20+hPR9BCmo6gjaqUefZ9yZRqil5GxHhIo+4waBVux9l0zYfPp
         kJv+2fOoO9Cw5hqEuoaoz4Exxq3vYTSo58msFUB4UGdYA48DjwXkLZGyKd7ll7nRxV8r
         kykWRyAKIS0+czNrRNWBO9hI+3U/43pZer+bKQOoqwMjyISDdgOqIpGUiT1is5GoE/Ug
         ZLGfkg4qsv/2ZQU1fBk+XiH0VmWMh6cqLb+Uyoco62h5bFgyvw6Oe2wMsOwa4PqhXU2A
         N26A==
X-Forwarded-Encrypted: i=1; AJvYcCVIX7351ye5pIhcuSNtofIbjfep0hBjxjnccRQZ1m2Xev5xTLF1z0D+mi+sIHa90SqbPwQ4y7j/t1L+sYG0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyefcif634wsHQey+gxC5OkcShVY5QGX0ovRwZT8NK7/T9kALPm
	JaThIt29YEw+FuMyKmfKXAfmemKfbQLhNvtFIWcc/HLJIFMg8+Sfh0PqjYnPiDN34iZUoMFtN6g
	zLmcHzZPWlVLsMs89Hr4vX31CSbHAWpbUCeMhf/EnHJeEjLRrUddRqQPZIi4xwnGvYQXd
X-Gm-Gg: ASbGnctZI/YXWgiTMOiIOJdRpyz4NbQDCsQpygf9f8cIJ/jXIIrcOhjZSO+pFNnCwjA
	dMxHo6zkOqRSuMymYNwb9f6/exJFvzXn4VnaPbogjH4nKwSt95Daj0BuqlaDYJh887vHaepPEiw
	HU1fMyaezKP/3NBoDQcFmXaOX83EtjOO1qxgbren/7XBOr07EHPhDHBk3FgWRgVpYAwGm1H1Znx
	4gVf5BNLExFnWScrX6PTMILOvmC9Poq2VcGJ96WFcw43d4Dc/sVFuXezFLJpSrf57Immlq2dWeC
	fwPUNok2vgLEDUTh5pcBiyiHC6sbl0dIbU02VY4y5o/azlekIabRRSXCaxGkpYV3HOpuZbBrIGy
	6VXuCvtqcKhhSWoiv5YDMH1VS45GqVT34hJKAwMsdN0fWRH7mI4hr
X-Received: by 2002:a05:620a:55ba:b0:7d5:f350:e533 with SMTP id af79cd13be357-7e34d9ac1a4mr1437152985a.29.1753037200614;
        Sun, 20 Jul 2025 11:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7R3w+LrCtL6Ou3WXRvuqFrSDZrluf4DC7QzbddwvwqrYR7HJsloDPSpllSxyamfEHt540MA==
X-Received: by 2002:a05:620a:55ba:b0:7d5:f350:e533 with SMTP id af79cd13be357-7e34d9ac1a4mr1437150185a.29.1753037200070;
        Sun, 20 Jul 2025 11:46:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9b87asm1229044e87.11.2025.07.20.11.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:46:39 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:46:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
Message-ID: <z3ob2cbxuerf2djwm7xzmujr2xwmwq3agpxrhnyds2ciztl52h@nqqljjocqmis>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687d3991 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OsTS_Kn-1Yu-Ke3AYpAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _GaZEtmavoDcrjD6kY8AtfCfstpJhnfE
X-Proofpoint-GUID: _GaZEtmavoDcrjD6kY8AtfCfstpJhnfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE4MCBTYWx0ZWRfX7TzDXOAAxNbN
 6/AuSTmbQAqaLjd1xnrw7lluR0PeM13+OICl3hK5wG8rPmJnSrFwXDUp53SSKf4mLgAZ/+pUA66
 qEMjOUwXgc0EYQXyRRCIBDMXfUCLWDNuCrzcN+w07zL/X/2HYyIMSus2IopGLbE0odeKMfsP8xI
 R15QfxkGOMJrOM3rp3nFMrk2AMm4W4EjnHeeKu/EBEYSCCFK5yPt3OUZmeLjcbJk/QqwKNJDlM0
 TfBQXOvUeZOBKm5H5MPq6mzWlO+WqP1U7KmI21CB5FPMBCcnzaIg9ggfrOheojRzpeyN1XKXrTI
 x8/xP8D4gb9i08Bvczl4eAxOZQkr2R4oi77cOjNoRj/O2LR2OcD76zm5YidYF7f/7gf8ZcW0JU/
 5bisR74xHYlRVpalVDjX2wQgXz4Qq3Cf5wEIseSXxuDyQAezgnsQKphmr/CElsw1AAHON+w3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=691 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200180

On Sun, Jul 20, 2025 at 05:46:04PM +0530, Akhil P Oommen wrote:
> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> different in A7XX family. Check the correct bits to see if GX is
> collapsed on A7XX series.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Missing Fixes tag

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

-- 
With best wishes
Dmitry

