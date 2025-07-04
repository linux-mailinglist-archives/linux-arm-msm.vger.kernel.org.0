Return-Path: <linux-arm-msm+bounces-63775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF662AF9A3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 753643BF6E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871AA2DEA9D;
	Fri,  4 Jul 2025 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkktpzdW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AAF2DEA94
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651895; cv=none; b=fUGMVjn2h84KHCePGBFXJowu5KxSXVG9Rpk42vGplQdI6bxSP+mOPSl2eLYW145PPg6dBhybf0Jc6kqvj4vZeRbkTgrJiKaZi9o4fLyozCkMSfptrtm1YWxfCIZ5m2PwgWAMQpEom8QlCQDpMyEcdZlJhS8SnHSu7dWD5x/JkNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651895; c=relaxed/simple;
	bh=BI8lvaPH148TBhChk5VfQgxnWJCquhvNcpg5PnObUBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMeFsh+GJe9JhMOAee+2ztRbekS5G+xfdqVR/qUm2V3HWKnOzryiV89lX2BXRu8A4JS+kS6JFx8y2hfXgd931XbTqGsNEhMYlZKPhpjKEXqFGr9BDyPwgHRBdxjbpwpxyCjUcdAvA2pdhIPmzG+Ji5KNTCFhDF0sMjxvd6Y2yVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkktpzdW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564DGeip024738
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 17:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1F4fPAEqvP62EdjTi0IWSox
	l7RsMJ0HC0KZyKC5XOg=; b=SkktpzdW58ERgizP6ibeQh2xFgVNN+gVoR/z5zbG
	T0iP1N9Sr9Dzdt92V6BKDI1TqwXXBpoKGLIxgnresQrzyyxqIyxnXonCuGIx9Jec
	UPn0UZ8Qgf3vlhSUkvaVjYwt5spK2HsRW9+oru0KHgektVXbxHEFro9yJMAL0KRQ
	ixh8lWzuywlB/TVb/pBihvB2WEbtH680U278abcnUb8Y2QUjrmFE812Rhj1WoiQT
	JQHaxiCdtQfRo505QBjaH/1zh53bciDM0C42CYSX2G+BPDl/wrVnhi8dkxvyuqgR
	ory9yToRZ7YbVJMs/LV+HAY/I70YQcrzuNSYode+mnIoyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9vngj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 17:58:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09bc05b77so181505685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 10:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651891; x=1752256691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1F4fPAEqvP62EdjTi0IWSoxl7RsMJ0HC0KZyKC5XOg=;
        b=mvKkxjK/elhuE5AOZTPTc347NjVaOrPRRa8ESu0E30+yAHxBdxQxRV1ny03AId3f7+
         46xI6BQXFqHr+CMg31RceAWb7LpJbZ3Oq2SSwXzDvf/fFsMd5oY88fA3cG4VLzdJcdUW
         PuMq5aX63NIKd1cXP/Nf4zMaieZk6NWXPRN7GwmZKXkSFASUgFpYNPZOcPxDVwWco7Gp
         14qWipziVgkx+ZHnYpEPs09oPuAGGI//bhZ1SppZsrbAb5w3K5FyAl7LSS9z+4JW+XCL
         b3oPbvAaRO7MeaFm/y4cbEYXsqGfVlS0X1e3C7w1J4mYmRetKJiO0iCipO+VvxFZCmut
         BbFg==
X-Forwarded-Encrypted: i=1; AJvYcCUKyKxiJgdwIHFsuwo8ZkzBLToyA7FGE7I92Euf5tZhEiKqB2afS2SjrHUpqfzAIkWxx5vj5Pe0HoFfJDRx@vger.kernel.org
X-Gm-Message-State: AOJu0YwlifQZUU2tz6zFORLL46JMBe77NepV8gpvBEn4UGMlhAym6BLP
	3xWCUJrJlK1Cnh3OyVlbZGk+Sl2ds8wIma5IoKDK4SNqMwKlJMTW0eU9gu7a5W2QOxgw/tN5ABb
	lj1+e9LfOFIB+Pts4YHioKoPDNnIRqSDdhQC1XmAsOXIbpp0ocJGtnBxMRaNs+mwn0hTa
X-Gm-Gg: ASbGncvuRigC8zGvKTEnZFPP/VWvovWVAtQVbtJbtxJqb8x0ika6CbcZpy6Fu8eYem4
	/YWlHwxRfmdFMmzoC5tZ9WM54ykfXQxZUa8Ag/gAWmMqlzc+H8Ou1v2Tz+WvJ6wjCqsXosEa1ib
	Z8Td4YfeLutJbX9N2Ih0aYE12WkrTx1NEDnXz3KK+jfOg+jgG2m0ZGw+3oQCDtIJNijuiWITv1L
	xyYiacG+NAVTITkpb6DWYXXehogSt82VIG8LvCKZZZkFS0oqAm1cDly7jHNv6UZaPkRLi+GN2RC
	BfE+aT/M3MKHakAsH/7MSUOAWwjBrlwc7n2pcZbyy0OPTDpqZGvfQeYKbumfB+Y6Mn9AkxJhwd2
	j9367WMAZwm7oKoXJG6066d+hmpgqE3ohXss=
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d5df152bdfmr319545285a.35.1751651890959;
        Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxi3EOJEoPm5oFMT0+ivzet/BlEeCSvPIneOHAOarymVXusFmqrpwwE6fb7KX41R6g3zjQQ==
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d5df152bdfmr319541785a.35.1751651890486;
        Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d8d6csm318439e87.79.2025.07.04.10.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:58:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:58:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Uprev igt
Message-ID: <wzivs2n2inkvtyy5wvyur5bpi6iexxmrsc2fyzm2vwm4o4opzu@lt7tm4q4g2iq>
References: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68681633 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=M1e0B-rp6HQtO0eZjbwA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: XFVJFf8FeiWH2Bb5KAI7B8qAGKDsJSje
X-Proofpoint-GUID: XFVJFf8FeiWH2Bb5KAI7B8qAGKDsJSje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzNiBTYWx0ZWRfX0LHOSEI7uc5h
 M5kbzE7/Be1uQOsI4Bn26XJ7gjJOKBQfNcGjKDqIDxHnYxXhXB0bpHwvIasufS4cvSzHD8YTcAs
 cWVOZXIWEiyRvzlNDig9vvoUMOu0FBXoGFppbbyhVmgLDMUH14gv8JJUzxfMDgtjjG2mRBxvmzx
 oQzlFb9AetoCpINXLYuHYiBqYmEITIlXKAZjDzqvf9EC6K9x/w3m2ZF9lZ8vf6JMoysf+a+OHwo
 0N5WUplmFNkhcOLFRQ79SiZPQKh4kJ94umXSjG3SS4iN0BubGKYpPKNluvfj+7fuAjMJclpWtTI
 n5FuPRJI5X6hLeM+o0k4QdHkJK8mVAgnypC+gnFsMjvJb2FhDFsyNwSLUl3B0TH6w3wOku9p6Fo
 uCt7wWFmDnSbWT6mipf1WI3/7iHm0OV285rhVaVfao9fJpePaZPEBzMRtiZxifxJqt47wyIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=899
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040136

On Fri, Jul 04, 2025 at 10:44:32AM -0700, Rob Clark wrote:
> Pull in igt updates that are a dependency for VM_BIND, and will reduce
> msm_mapping flakes.
> 
> Skip msm_mapping@memptrs on sc7180 (the test should be checking for
> preemption support, and skipping if it is not supported).
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/77
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml                             | 2 +-
>  .../drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 5 +++++
>  .../ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 5 +++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

