Return-Path: <linux-arm-msm+bounces-72346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18316B45E83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 18:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1ECD3BC551
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D3E13D521;
	Fri,  5 Sep 2025 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpxNGdzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77D1DC988
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090719; cv=none; b=exPOs/yXJTcNgPkoX/LiiTPkdnVwPH7LEr4XhpOKdZmvxA+tIxH6UCy1cB2Fla+yV3VidKY/G17JJ2DI09+jxpQaJ8w5K17DnyBYp6UW9mKBYGwkgiLO9BSEu/srCl7VYduZnqSjYWGahzvmUls7LQO4BUFXRVnP9oJ3+MmS+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090719; c=relaxed/simple;
	bh=mufO7WhSL863WQc5KKR6Rrp1gwzSJEYfE2KGDaW8J34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx39I8odGPWl6zAuHuPxBQgka/SKOKXcP4Qsho+CGxJXf7Obm0kp+G/rZ0/RyFX/H6iy8Yg/3Sei7NfGsIkziDVfXbN3fpKuiFl9/5JNWf1yfUHTYopLHuwvLy4EAPeusEE0FDcYcbxagOnLuXWiqR6EpSOOXsdlwOqr1f44+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpxNGdzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GJmTZ031977
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 16:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+BB3ZZvnv00hg2yX5Hc+9/g3
	ygGWqUcgRjmxZQpicHU=; b=gpxNGdzGUz1nT34yntMjnWt+kyDMKFr/Dp1PbzzE
	NjWJiCVq6wu1N47RR96dzJJGA/w/D/1kR3nhGLQHFnsJMrZ9Saw8zwMhnrEVFYsc
	86fTtI+1JVvt29/bF/havTUBEKdeaz8IBEx1BwkYQCu1GdZW7G55uUM3ylyrU6n1
	v7vYEasZZEmu/ewz2XuQRv2TyrCnuk9Z/UqLaWpLnLYYcQQx3NkjGqkp7VfCZ8eW
	JRZGFm7p/d4hWcDuECWtpS62meo1bA2wOaqpvJTXJ800wCibnJ3dz7q2H0ZyztfS
	UEgNiegsJk/kxCDKbq+nrm8ENdpmBh2XbGrqCW1XflvasQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0bwxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:45:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7296c012e7dso36952086d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090716; x=1757695516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BB3ZZvnv00hg2yX5Hc+9/g3ygGWqUcgRjmxZQpicHU=;
        b=QKazqM2c64B1DCdtVo5zCqwn59bhRs09kEtI7JJXqHNprwrBDDYRAJhHbRcDP4szMj
         6t/NaEESYJLpUGBCWJ/xpD1aaUjT/0pD4nYEBvA4ERBD01WC4EC5JJIaxdbiPgPrDGCG
         C3QT2ZIOKE0+7QWvPuC6a0gZ4De+PsUK/pA753ASinM9jn1dRnN5HDLMhhDe5D/1zJkc
         oHaCzWp7NSp2171WiO4ofD0urd2eMlxbXcnNEwoEikPw38RKe2Dd6vXjc5kEu4gt+2Dl
         YWhW4Am6/UI6oRROpu3ztlbFyfLT0Lp244ryXZlN58hh728smCMM6b12AYgbTo8me1CC
         PmOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLAtsP9X/mTyxqVBzyaf53lYDOjmhIC4i1rQnJ56TzgE0dJw84uVXFrje/cWlHfaiETlP/XpdjO1ydVw+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1AGp8RYmNR623GOnS+En1kJtCs0xrziGeOvEfC7tg/PoY0+gC
	0jeu+KJuenlGNM10eg9ObS1+5UlOXLtDaN/lDusoOphjhnfTck5xMPkHSJk4mFEkLSVq4iyclXN
	7BRLajKPueXFLAJh/CJC7LqB+A8jdXT5Xmg4sWzwQSyp8O1VKdh+hMnv2xNkLWlXgwYnF
X-Gm-Gg: ASbGncuEL6vkWXSOIhctYF+HhTC5dQ1l8aW6FPqZ3Uy8iEuG7pUxrcx/7uIb3SM39yl
	NHT0SX2Md59oRxCt7cgFzhlR6bvpi6mw0kdetjr9ryLvtyM3Syv7l/LMCDEsgukW5vlKlALf0k6
	g/VbVIFcW61uB84i8n/im1PKqVm8rqueHLwTW4GAMw3aicx3gnDGLyGpNfvtVzxwfvQx2Fs7Bbb
	V/zzOfnvBxgIk4hJq0sYxPzOLNk9JJihvK2/kr1uJfGkir+YT4sjqmRmdWvEBJIWqOh/n9oy5dW
	DVkjaHFGtT4JpOvwtu4ykF/k+IZwxIUH7SksPZJ9k6Eclpn9rkuh3tbkniRkuGJYPwFEdDy9p9M
	vKMPX98zlgGjt8yMe7rOJASuE0825m3E0cJXqPoatq0kx9R90Xs2Y
X-Received: by 2002:a05:6214:21cb:b0:70f:a719:5666 with SMTP id 6a1803df08f44-70fac92194bmr255761876d6.61.1757090715867;
        Fri, 05 Sep 2025 09:45:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHACuxE4FbwHplU4elaXyi4HGgfYTCOOuIKAhIyRCUSvfhISyirF3xqoqTDPYeTt0l18tebKQ==
X-Received: by 2002:a05:6214:21cb:b0:70f:a719:5666 with SMTP id 6a1803df08f44-70fac92194bmr255761626d6.61.1757090715396;
        Fri, 05 Sep 2025 09:45:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad4c63csm1858374e87.143.2025.09.05.09.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:45:14 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:45:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 11/12] ASoC: codecs: wcd938x: get regmap directly
Message-ID: <4jj3ofvjiqzdyseezuhup6ig5hfio4y3siqqmxhvpse2yyvnqm@xa3jtgee6vpu>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-12-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-12-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: fclEooYnRaPOh65GoCxYN6ciYWqJtyfh
X-Proofpoint-ORIG-GUID: fclEooYnRaPOh65GoCxYN6ciYWqJtyfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX8mjsMICIybqv
 +4PIK7HqZ0HKr6yQnZ8F+ZKTrBArcflLnXEc5CBwKltkVp8RHSz5ZvWjCKpp+hUH63jBdqTNQe+
 B/+POWx6YMMTwAtuA3DdjC4G4+ZRm/xMTMRDyq3vFSpC9WHj1tDx3Z617zh09+ZUkVHEJKl2sIg
 i0/uxOgoNSG9J4fvTK0gntSjkNn4VXaKXR3Fc4UVkqhMaEWANGSsz5W78rh94CmCkZbKduO08x/
 RDcd/X1XvGt103tou7a7TN/Sg6PRmMOawt5jRTh4uUmOry9IzxREt4atBxFvGUces+7Rv8cG8LN
 vRziP48JIZ/3UUP4/QjAS3Ij8ZA7khEfUVmvY/lT++YiJ35+C1pdkGETC98pg0rfkk/YzfKkvbW
 1cYvR+Wn
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bb139c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=azzZ5_6gx0kgBHoxRwcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On Fri, Sep 05, 2025 at 04:44:29PM +0100, Srinivas Kandagatla wrote:
> Remove usage of dev_get_regmap, as this its more efficient to directly
> reference the pointer.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd938x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

