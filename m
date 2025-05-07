Return-Path: <linux-arm-msm+bounces-57191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D3AAEDE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCE7A7A6F44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 21:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1F521858E;
	Wed,  7 May 2025 21:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAAqfIMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B051D9346
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653089; cv=none; b=Uto3Utme6jlenRsZEgv3G/Upt7se8+6q4WLAQtytej/aquVn0ccz7VdVOGvUVeTB0VvGX+ES6acqzy23WwwWIKED4XUxHDljzog1aKyGcc517Cp/ZqX/cJ3B43HU8GDI+HuQsDK+uXB8KLIp2ryWB9wwiZirkE0Dm9O0+l49M6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653089; c=relaxed/simple;
	bh=rALKMBDx+mdRl9PoX2tGF/UF4kbNOW6YkRgErh/Vd7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkjJjSpgJzSSYPaqLPMoxtVaWO5z/2bR6zicWYeTzzPLwHDiliILeL2dsts85eoRH7jKtB9Jv8MRrdsO9xpQToamyL/hZQZg4fMoqYEFriXcpwUW3cOomTx0G0rxP3YEFVz9Op3qaCA+j+PwPlwNkCiQCsJNprpJZG6YL3AmeUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAAqfIMx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547BOmr0020101
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 May 2025 21:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yr3o+GPqvA0++Om8f862Y7z+
	HVP6SVMxvLd+HrwRncU=; b=MAAqfIMxuHYJYdUYpVdHhZJCUZLtl55kOtK1QEhk
	mFb7plCZbr/aiP15YAaRJ6VohldJ5PCA0vbc8LL0z1q/COgSe4q+erJdB3Th3i34
	jmhUdCmNc6udYtr9XphCY2pFDTxG7T6dskBDH2va0LB+KW0n0rsnUXX2HGdiMe3q
	GAi1RDCd3K3to0EShdPUFm5gQO7SZEvECXh7Wcy6+7RqXlR/Vz1HJjARnUuiZ6cE
	MiDcmIte5qK1KQhkEcj8ZP2J511sa2UsutB3Q0uCZNEKZcyDoZazRLq+9hmoE7Cr
	QpV2X07IhMUTS5hcJ6+ytSDne0RmpKZmARphcPn97N+QrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9epckhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 21:24:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so52942885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 14:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746653085; x=1747257885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr3o+GPqvA0++Om8f862Y7z+HVP6SVMxvLd+HrwRncU=;
        b=rByYXLioSv9j2t8lOC0LY4Z1R+KEf0xSCjHhF1mU7GVCH7sTKjBYGtemkrWg1PFWy7
         4KkrvTFDqxsPEYJQzI6ajksirm7OuH62Kd9dn7x1i40ju8zVjLUph06INbEam+5cL/QN
         o6a9E7K80OyUMIX9yOzxe9YqdROYjLaqPvG0tuvES7pi9KWxChi5piqm/YgxwDF/jeyE
         shH5XDsZIjrrch2OtG/l7/+fk62qQlW0goKoqKD6OExuoebxbH7Oj6B/5G9CxILIFzzP
         U/wSroYI1EAh0FngjMWW/nQQeeyRYhLTVErieRnYWDGuAq12bUm9/z1hJps4wRUMCzgo
         T1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHEzVF02rcGnbgVbXyG3WD7+MZyvj8lFAKZxfLuJfdG5OE4NpQQDJqjwWO8R9PrYXhlBT53rjKw4LJCrfx@vger.kernel.org
X-Gm-Message-State: AOJu0YxDsPnB0cT873FtxykrNmqJMz7DD3NQ/lNmLw0mQpoypZaVcI7h
	STjmmUi402FFb/NyFgU03NgjmDTzMhv92fR4d88tE4L1XVR6G0wE5hhK/QDZQsaWkjo5fQM4WU4
	MzR64kHygjJ6/v97LP9197ZzpN9dNY2Xu0HJmJQpLyImb5UH7bW59HLJT7IGqMgXV
X-Gm-Gg: ASbGncsv/UrmZ7x6DKD382lMxPNhB8Ouk503ptSPUV6GLr6pYd+MrmBkXBtM1pa/KQO
	HjT3jTOJP+yyJuz0jJxiE/AT9tt17EDuPqzjREf6R60W/ZSMhDPsa/G0MJ6RoCrmSj4uMhE04e2
	lX0TN7+AwZIiFjnadfPdjHH98wB8tVviIdJY6eDq76QQdSgBvZN2RC+ufR2YeAqWKiZdBI2fXTT
	DKj33GYJCZOg5j20N61bt4d+vmfX9SmXbIPvfzpyQscZTxOd5N1LtgsLjXNIiJvTphxuChXJN33
	bjvzmmZzVTEMclp7tX85N1eAfUMtTGaFbCdEFwRSHy3ZHOgSWbQEn7ZNLq/EU6dVb7nqMA9nAD8
	=
X-Received: by 2002:a05:620a:408a:b0:7c5:dccb:fceb with SMTP id af79cd13be357-7ccf9ea54b5mr141178985a.56.1746653084966;
        Wed, 07 May 2025 14:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV+4FNkfuTlk4HKwK7ViJWDaszxk32pmkR7zSWKKmrIlnWNomLRPlCCNIKifiYiqB/AQHVsA==
X-Received: by 2002:a05:620a:408a:b0:7c5:dccb:fceb with SMTP id af79cd13be357-7ccf9ea54b5mr141174785a.56.1746653084505;
        Wed, 07 May 2025 14:24:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202ad90896sm23728941fa.101.2025.05.07.14.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 14:24:43 -0700 (PDT)
Date: Thu, 8 May 2025 00:24:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: mdss: use devres version of interface to
 populate children devices
Message-ID: <xmpb6zrbnx2jcfjthkafj6viptkugowo7qdfxlg7vdfh3mqlua@2tcbsd4f3dtv>
References: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507193538.2140862-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681bcf9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=-t1pgZ-jyF7rHdee9YQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: p_o6jN0oPFuHVt0W77q6pbGRmMcsCyzC
X-Proofpoint-GUID: p_o6jN0oPFuHVt0W77q6pbGRmMcsCyzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE5NyBTYWx0ZWRfX9QiHhLeoqXKV
 fdRsWXYZmQwYRs8EuTYTjxXG7uUF0M9ADvfNAMYolgyr5ya68AP0u2BwdKDSL0TCjMfDmXKJJTv
 hR9Cq2VgAvPsEXDCPAHN87BG6vagx3nUkUohkUvxSwfOX9V/3HLxLiG7PeaiJfYR19vr639MGky
 BAgpLGe8sspTYPWUAoL579Q+7wojvTZRzQ8J6RcU5uvpyGx9zuKDxWfgg7OjnTopF8SFB22LhZK
 6xpht9UCM+rAvD9SqdzaUIs4TDBSugNNbHwKxWZ6r9x9DCWMNXWx/i3oRt17dTa7kn8N8S4heIN
 JEwOG8yRSNtID1VWB+ODhUERiKDGX1lPSIQ+5rvQIarU8CjYPAui/dLJTKC2kKu1b0Hrd8ygmJr
 z4XaOhoKsgfZVAnbTqrIy8CoQZxf/erPkkzCGnDBM84KiJyhsVrdG0i6GKNjiqT/ekWFtKfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_07,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=986 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070197

On Wed, May 07, 2025 at 10:35:38PM +0300, Vladimir Zapolskiy wrote:
> Trivial change, there is a managed device resource version of
> of_platform_populate(), and its usage simplifies the code a bit.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index dcb49fd30402..116e8f93f8c8 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -550,7 +550,7 @@ static int mdss_probe(struct platform_device *pdev)
>  	 * Populate the children devices, find the MDP5/DPU node, and then add
>  	 * the interfaces to our components list.
>  	 */
> -	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	ret = devm_of_platform_populate(dev);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to populate children devices\n");
>  		msm_mdss_destroy(mdss);
> @@ -564,8 +564,6 @@ static void mdss_remove(struct platform_device *pdev)
>  {
>  	struct msm_mdss *mdss = platform_get_drvdata(pdev);
>  
> -	of_platform_depopulate(&pdev->dev);
> -
>  	msm_mdss_destroy(mdss);

Unfortunately this means that the child devices will still exist after
destroying the MDSS (IRQ domain, etc). So, it seems it can not land as
is.

>  }
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

