Return-Path: <linux-arm-msm+bounces-57243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270EDAAF853
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83CF617DD06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260351AF0BB;
	Thu,  8 May 2025 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv/Kb+64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790AD4B1E78
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701255; cv=none; b=i2PRjpWkOx7pp7p1h+zLChbwQIwdJQMM/ciBgHCffSnDxjvi42SuFIWaLWlPOSB5zIhIXTFzJPC2YJZRDX9up83yZ7KcbQbtwnQnYudadD2yKAkhcZRJqr2RsBJ0b18y5DNs3VdqRY2vY6TxA5+C7kc851vWcDea6U7e6FsITgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701255; c=relaxed/simple;
	bh=0cKobRXvUf+DFCw1YjKv/NXBgtucGhl1ZO6NNdoT2Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOZqjERC5oZtiGf8GoMKV6eFQcp9Ah2FILrtUYLyaEyNyUlB09TogJsElPnK/ftqPzminXJYCRDEy8jekkRQfAS0j5bg2naCyzq1TONO7qZBzkTXxv08qRVliZesw/s83qwxlEumC9P+b7EbNkCGppZg+NPmd35IS4GR1fgyko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gv/Kb+64; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489cTew013054
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DJLcczpvmaxUKxKji1M3aDjS
	LMp22wqvdaaWQcNcABU=; b=Gv/Kb+648EnqCkbT8oiSS/nnHx4/i6ee1pUgaNmQ
	FnUjCk/UAGVjGYH+VGq/D25g+DQq0qKGlcFyPwANejgQf8y2UpnO8/UgdIKBKLS1
	aNytjGviDAntLa98J128KzbAgX0nDDcuJKdVacTi4UbTMa+c9gYx8ac6c43JnapP
	KozT/27PhRry8eHLRrBG2B90VDf1lG0SvYLz2qY+R8mAQBuFFBu/Uhoxlh20tF3s
	dWlzP2EdfoLOwoF7dLiuIQM/wLZ51WSrniBRSogGH/tKt3XWmyTbJOAaocLoJYIt
	NwWM4ZCfcXW1BbLRm//hlmW5SyCgvTk2Pu2lMwPzxU+VdQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52r6t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 10:47:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f4b72d4ba0so17232276d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 03:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701251; x=1747306051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJLcczpvmaxUKxKji1M3aDjSLMp22wqvdaaWQcNcABU=;
        b=XdVoDDQhT+2QLtlr0165wATTdxbx1ZEpkcfcm2n0emMgempeiOZccYssZiu24WpSs3
         RvK4/IJGB7B7XvarjwY8WeRl6D7YtyT3hFsmYapv4US2F59oJHojMh4t7Qej5ktGAkAy
         ZJt4gLIwXAaiQhhFM7DsHgU8M3edSqzotpW7CdxWZYYqotNDiuAFqaezqkUU1crzbLAS
         vdjJIYrXptI0Er8+BiJeUq0MBlJ/yALEA0GcQaFknlBv1zRg5rA5WqpL9Kq5FvuT0jH2
         TWI0w5SXfNY9dvmtZNoBkybkNGmv22lhuqv5/skjP8iI4Dfnj+x02PkeVPu4J4A4RK+6
         kphA==
X-Forwarded-Encrypted: i=1; AJvYcCXpn+8qWkuHDcJoI/6LrllePzJ6gJVWbGZAVx90UctUdraWKn7LaUBXix88VcXUw0QPcN4dzicQ9CwMBiM4@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZMUQMUzZ6We0b9fdM96XwIRbRWoemMd10xGLhnPeBqfEhIpL
	ZSRjP+Hxti5epY/HjnUONy+0w69ixI9SIEC7P112tmzApKl3/isbmFNW3hIqrKyou3Q8Rle6WHI
	c3CNaWBrjzpekuIHTFjpXRZ2KQUxU+4+FbyaR0X+XkaFXZ+SgCBncLwubbTEt/gcX
X-Gm-Gg: ASbGncv68+LKldqbCtTcElRNHhS1ZI3fDeu7hb3188culmqLLq2QsKg45wyIsgldBTO
	mHPXsBP7R49LBpni/HvA2sNAY7/XCKUVzfBnd1DP5prsBvC7/rv1iZODGmjcJI3DgrCnp2Qo2jy
	T1rRulxC+pHCO4GKyVPrG9z2JTsPhsRpcT1+vxU2Dw1Sx3Q6OkxCUPQDZx0uoH7+TL4LeauA+eX
	Ws9YTsCebgbngu0Px//RLEobQOjWQvFRNAM5cWsZQ2+tQcFSOrH5Mk66Q30Pkv+Ku0nLq18iB53
	/qnW3fmV9moCihV6rTmn2ZUQEmHz9NTXiCUTqAIwgg52G5l7WjTc/lF+n/0r7WrHsWD8mbKp/0I
	=
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6f5429e1f20mr112740476d6.7.1746701251159;
        Thu, 08 May 2025 03:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHl4JUcuFrO/9rVeQzXi9JZCdORJB3CJB1i85DoLPVXTX/Y5q6n8b+WwBx6so7vshDBnZtiA==
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6f5429e1f20mr112740036d6.7.1746701250806;
        Thu, 08 May 2025 03:47:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f21a8sm2573813e87.197.2025.05.08.03.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:47:29 -0700 (PDT)
Date: Thu, 8 May 2025 13:47:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
Message-ID: <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MyBTYWx0ZWRfX7JHE0i5tkacj
 DfuWrpzNR+wnzLHh8tPMVnugntVJ2lPfnqeX4DrKwVHtG3titup/8BQmWCf+ZG7LX68UwmMkFNE
 f9iVM6z+8dPapYzVCMUjVCVOeOnwjS702DNO16MHjNfDh+1dUmHxXaDniAnpKaT6h7A8n0RTBcV
 OfKlKeefsM7wHUJ1ZvxTWOxm+zW/V3pqSTN2+Yr0EUMK11b8QkN0dMPJKLGGQSCUi5IASuJztWf
 oyYFqoSKYWOkOXMdbz5hSlV1Qv+iHxxDxKVlMERjUl4cmzh5lADcBP3RtBE4JwJoFBWuHQq+Xv/
 093YEPEOPZHINZQaG2qsWEa+YKIA9dsLJmqMQX+SaaKqEoMxeKdWEib9J5LpO/7xiVdjkB07emr
 WQIkOyw419VWv4bXbMqWmkxLWxA3EJgQy4Y3Akv9aNTE7ylQo7KrHJQw9yfBcEPD9Bgxl43G
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681c8bc4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EgBjQOAtpNY6-goZWe0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6yHqEDKlJiZv9gsKs1tM-LrXWA5jNRT_
X-Proofpoint-GUID: 6yHqEDKlJiZv9gsKs1tM-LrXWA5jNRT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080093

On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
> Some display controller support flexible CRTC and DMA, such as the display
> controllers in snapdragon SoCs. CRTC can be implemented with several mixers
> in parallel, and plane fetching can be implemented with several DMA under
> umberala of a virtual drm plane.
> 
> The mixer number is decided per panel resolution and clock rate constrain
> first, which happens in CRTC side. Then plane is split per mixer number
> and configure DMA accordingly.

Here you are describing a behaviour of one particular driver as a reason
to change the framework.

> 
> To support such forthcoming usage case, CRTC checking shall happen before
> checking plane. Add the checking in the drm_atomic_helper_check_modeset().

So, now drivers will get two calls to atomic_check(), one coming in
circumstances which were not expected by the drivers before. Are you
sure that this won't break anything?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			return ret;
>  	}
>  
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		const struct drm_crtc_helper_funcs *funcs;
> +
> +		funcs = crtc->helper_private;
> +
> +		if (!funcs || !funcs->atomic_check)
> +			continue;
> +
> +		ret = funcs->atomic_check(crtc, state);
> +		if (ret) {
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] atomic driver check failed\n",
> +				       crtc->base.id, crtc->name);
> +			return ret;
> +		}
> +	}
> +
> +
> +

Too many empty lines. But the main quesiton is: why are you calling it
before mode_valid()? According to your description a better place would
be in drm_atomic_helper_check_planes().

>  	ret = mode_valid(state);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

