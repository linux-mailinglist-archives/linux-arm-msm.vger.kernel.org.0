Return-Path: <linux-arm-msm+bounces-76480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A5BC6589
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C6EA4E8D52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BE72C0F63;
	Wed,  8 Oct 2025 18:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShAk860b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4C12C0F67
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949348; cv=none; b=LZY5hyooApaoPzzHN8boC7dJ+XvPPZ9IaLU3zAAmgUvD+utP74Lx7BruFZqwabEqWAcPu2+Yq7Ab64K3K5dra5ZDN34uhasam/QSB5QUY+pZKNzTOdbhN/hT/s1hLCmADhVxaOkkSPGlJ5wWvQp1AbXaqN91Z+fbBPG92YtBPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949348; c=relaxed/simple;
	bh=6/u8L0oi2q7BxCX76YiKM3jLsUqqrudJcDAn2jIqx1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zgb3ck/L+d7AUzPVDl7oo1Faua2YKrIfGUjFEcBGER4HbJkGCqNiY/WVtaKonoOW9gfcYXvyTbiFW2G1HwX8QB/cDWiIdzo+ivXGXfYDkl2ROucpWXctgqqXZ0niZPqAAQGzX9cWLWnkIP5xZgUYSOEwHQdVjLmGKvLkFm4rYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShAk860b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5H28002406
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ODPOfu15xqG3giQgLQz8qy9q
	u7JTNTnroFNBqpeEc4M=; b=ShAk860bLdkRDmTXy9xSkwY5CSyE5qzM9u9Obzk6
	rcDMUNkLFauoBMVVA0bati67BruEFTLu+I0S+xLFxerQOU1DCmvejBHTC7Dgf3Eb
	jOxUu/ewFeqQOnp6J451/oZUU0GRrFT9b+wVB91S+CUFfeFX7Azmw1MxFVNoK/xp
	ncWA0gbrsrP/Tv0LiEzhbWjnAIkTuW2GpqvogFJxs+CIj1CxezZi93lUHg9KTBwR
	r3hSgMPJqvmk9tghmfuhKe9WAhIYjaWkTuUt77W0pf71mpfE1hlDs9W9r/2nvZ7s
	f1ofXV2SW18ZmrtMQ4ZW2ZgNGUlT/qhxK9e8ew2Zi+eqhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m09rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:49:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df10fb4a4cso5783071cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949341; x=1760554141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODPOfu15xqG3giQgLQz8qy9qu7JTNTnroFNBqpeEc4M=;
        b=Dz1IrNRbelEDBamGAlVeJbYWBUM2MQDgILvMvI3wxWFDyBgiO9x88pJNBe5q/V1ri3
         bmKOeTMP/IbtupOmRLEClOAvZ1qp0Nsfi0wV7Rdfmba0q+3bN3XQKlxjUQnVQo/byjpc
         Rtt+IuZmk/Yp4aRk9DlHphAKGGug/6Rcvj8dY2J85yGPrwdvBge7T9gJWXq9FOH1EFjg
         0ZN+Af3+SuXlpDaDqJwyoyFJzoLjTwM53oUy4zKnh1NmgyfjoH59gvzeS6htzJbHLTZ2
         otD9VipoPONIjPyFt/aH0hStSelzznjZm+3Djk+CQM5I9VjyTUumQdOgu41ykg0q7Oix
         nxXw==
X-Forwarded-Encrypted: i=1; AJvYcCW25K1hCiP4VrUERoY83ARZvAhwKnCzpAoU3dBQ42k9YW5+glCv25AJMqxyVOEjUV2GqhcX+mbuOxOES4ip@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBISflz1geTekcMfezt76igtHLw3FGtAexI05qEYm379nbTOI
	I/mngymI9/aZn55re8nbec6x4OOz19YweXEmEkx3Bvz3hQUBf/wz25wfJ7PsJh1pEgj9DK+0O6J
	aWjaRl1rMMJ0aXaBwRAwR83V+WsQXiXBaiftvZfGO8hSLpoaAUvHKBjGaucc3sL8S2KH1
X-Gm-Gg: ASbGncvqauzpQiyAAJyK8bj61FymtJ0KHENq7Z66/94YRe5ROnjWcg8lLNVlmVlq+3T
	bXaGJ1Lp4IsuJoobmO6G44IYIZC31ZZ7G83/be0ux8J1z3vTN6p5HXsGsAG/N6SJZpfVsdXoEuU
	R2fuNv7e2il4TtxJKR1dwkgiUQ2bAhwde0qLgpV5qGNaNt6fIulpCJ/Q8CrkL0zD1vihSLs/vyt
	/exR5cQRrP/mb4/+KPyC9XjB2IyBViHiR7gAi2+JyivCmeP7tNf+gpNkFgZmfQPZ83cF006fKYm
	hwiBYR7VKJ/c2CxeIoMXEcyDeh0sDDBpUtBbWunfj/wyuzhprDIGm4wLQGnE7KP8tIGa2xA1CQf
	xDGm7JPHSyMDVsJwikpILEe48unTbWCCHq5Pa9KmRwAHgbRPsbgP1UYkuVw==
X-Received: by 2002:ac8:57c3:0:b0:4de:10a5:2c7f with SMTP id d75a77b69052e-4e6eada7dfamr74154081cf.84.1759949340757;
        Wed, 08 Oct 2025 11:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB3TEGZ+Gflu/39qNY+/p7xX+0/YYfiskGcmubHdrhtp3slU9kmFASOY5QbLqqoFf3Gd89DA==
X-Received: by 2002:ac8:57c3:0:b0:4de:10a5:2c7f with SMTP id d75a77b69052e-4e6eada7dfamr74153531cf.84.1759949340077;
        Wed, 08 Oct 2025 11:49:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b833d2sm22261501fa.51.2025.10.08.11.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:48:59 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:48:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 10/16] drm/msm: mdp5: Switch private_obj initialization
 to reset
Message-ID: <m3c3thrjbajskitjnkktmvp624v7qqfyluggcbmol5axvjno5n@aqnqk5nsu2zw>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-10-805ab43ae65a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-10-805ab43ae65a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX42XHbqUpZ59x
 XRshs8WTwAZWxdPupJYcUKxSaUB1IkVVgNbJGun8F7kr8jW4Ii8zt07+wukf7ogxO/D8dlOel3W
 ZW0itNflWCI18KiHli6V8Qiws6lOLgwXwPR0L6xx+d68fRZMORKAVVnerP3gecyg44gsIUvLGi/
 THHiN278IcWfTk9Dfdh6OiBv8srdEcI1Nk+xvaN2PaaIzqSwEa+TLckjfa8M7tuJhm71xXB7rdc
 8zkcF/0OQpvHsHbdyWH+auCGTVZ+Ja8pcr7pCKHi+IYWoHWRwOcYjOznCFl4ddXiWw/ZuZpPOmQ
 SxbkVH8uBw8fbVWUlMswsnLj7pggqjzpMPvlZAt64apxrN63ObDV+RQ9eJccL8Vf0ZJYSl17hf9
 1YNsPPZ3IcSzaYoOUP65Wp1ioxpmOA==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e6b21e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Ya0CMAANqT041fpYnN-SuUvjJqMI81Mf
X-Proofpoint-ORIG-GUID: Ya0CMAANqT041fpYnN-SuUvjJqMI81Mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 02:04:08PM +0200, Maxime Ripard wrote:
> The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a reset implementation, let's migrate this
> instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
>  
>  static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)

static void (up to you). Or just inline it.

>  {
> -	struct mdp5_global_state *state;
> -
> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
> -	if (!state)
> -		return -ENOMEM;
> -
> -	state->mdp5_kms = mdp5_kms;
> -
>  	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
> -				    &state->base,
> +				    NULL,
>  				    &mdp5_global_state_funcs);
>  	return 0;
>  }
>  
>  static void mdp5_enable_commit(struct msm_kms *kms)
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

