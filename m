Return-Path: <linux-arm-msm+bounces-76479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F0BC6540
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEAE219E3EC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5162BDC14;
	Wed,  8 Oct 2025 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZaHxiZdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D57284690
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949272; cv=none; b=TVVEjmgheq1fOi+DWBYcntNuEjnbCgQX2GDkgg/7BLBWfG83pmub5VKD4OT+siUdjw7wWrjP12oBdqlfk6EvpKgFQ9y7mw9276z2BTwwAxJU/ySW2uQkFy3Bjxcw+yTafltuGoDOowmI31PAzi7x4zXOYM+VPoZOqJPHp9H+lcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949272; c=relaxed/simple;
	bh=RZjKvsgxoNvjdSzePq03HBgQ6kNKNg/O3/87I9EEkGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaJ9UftLO4k8Z6z4gdtQGXE5VYjYHAQPZD4PL/5d2pPadxs3zz5lCgq9i1IgWLl0wBoLypNs5dPuXYtoGSAUH3cTwACi4buDgpeNHEfqQ7knA+BnoN4mPP6oG4GPheORO1id6cE56BvpD12h9yH/v8lNaSo0J2hVn4sb4fPMPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZaHxiZdY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Hg5012818
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3OK73bHBwsSCsPnoqJcEPf6
	LmWfF1FEv1wyHSAhwNI=; b=ZaHxiZdYlT7+2IktgpTpOzhGSkLjGR295GpDPaw6
	8l8B3bvaL7vdSbSAoSY941nFJm5pCfNKHEi0YFqrI5jIKGtIdX706UXIRd9i+722
	YWAujWCZ3W6jPj59Bt9cUEKWL+6vdZegQbxvyNfiK3UiV7k6PRtJWDxp2Xkj0aHA
	Zal1+mHOKtNdGRbS66QXyeDQ3qovBTvc2P7uinSv8omTGOxxCWfADCy4D7MW65Zl
	cMxXKOX5Mkn/7vb/nwJvWPpSgfmO11mtjq4BjeEs3gYksBVFC2twrzy8l9tz17+4
	r3h/5dv3KvcGBqYB4rGiZh7TXZNbsej4qu1NFfJh8Wl7Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j09a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:47:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df7cdf22cbso49619221cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949269; x=1760554069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3OK73bHBwsSCsPnoqJcEPf6LmWfF1FEv1wyHSAhwNI=;
        b=quy+AtE4hebKTzuzA4TJG9fJSD9Su1fjHvnzawZaU1QvJQOECSSytqCKO/k+Pw4IYx
         mVhfX+AbejLxS8rQap85WvTmk4a9+ysz9gR1W7plzi70y0bPhXx/EtrzIepLgSRca7XT
         +DlkvmAh9YVvojkrRvdaaEo+VTkRrxTQN/e2XlXlEUeohGLCLTHYDgmYy5iCp+jM82FN
         bfU70vuCNe3nw8I8VL94OjJErzOyGhmzpMTRx5GLjotDEVEej5pCy/gDNbIdEdieQjP5
         1lnoOVJoId6ylUOKd7eI2r9+iq6z+hoUzEVoA7NuhM56kOBuIYVRIwBTDoLaUSfXnLup
         Zxvg==
X-Forwarded-Encrypted: i=1; AJvYcCU/ExWhI/g+69hlZJXiYsjTA76X9z4x2ZNvYngM+YzHOL6QfUYkcYsPY0UltURtDW1fpyyFL6aTnjMHqNYX@vger.kernel.org
X-Gm-Message-State: AOJu0YyQg473tGn0st+v5GHPYvNU7v5BzJrd2PdtvrD7IRkIPy9vSCKO
	whsN6HhWgMK3K7Ff5xO9EQPoDWuZjWyjPma/8ubdpv4JgPku9vgdcazpD+icKgfGfK7gNXP/+rU
	QyZwaQysMWF26qxQImCMSCKi1x25fyH3aHiwYwlzeRlseRcaxeqZM0rlWm6roxgIHSJ60
X-Gm-Gg: ASbGncveXhRMNDogRBbzR6ftPO5kk3uNAXzlVkgGROmn/EdtPzjXH05t/7Rmw80NnFL
	4esdfVNyo1Wyz1JNGSLFx2AOUaDycatvkY1cEA2QVXeBVpARPzZXmki35/4uZcUSbCs+j0mLezE
	uvTNF/E7ncNelSqiwQeWxb8fwYPsidrKf/ADwQYkPHjS+JMyWee0EBItkhoRKBlw87FNesUqtJB
	HrnJkcSq3JwC47u3zix3fxL6ndM/RtEcpqwVN/IHGgr5D6Ex/tNxHGR6AMEZu1nFdIphpGyobUH
	tVQnQnjndlNmiLDDrPV1mDSi4RyhrxaoFFnjLXXT8lcoo/Ddn3KUEMtQ8BrRaIIyy2Is/SjxMI/
	2PO2m30tWqvMxOgjJqTR5ZaOCETjL29yKtHzuR+xokA3UrZMFybmZPwkLfA==
X-Received: by 2002:ac8:5d4d:0:b0:4d2:ba6f:28fa with SMTP id d75a77b69052e-4e6de8b5d39mr136839621cf.34.1759949269019;
        Wed, 08 Oct 2025 11:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKQvzko3qbaxFgsjx82A+PL+c822Ka1T/cMhgVoRCIXqgJtpZtPaiuhGC8/IySiPYiH8Eyg==
X-Received: by 2002:ac8:5d4d:0:b0:4d2:ba6f:28fa with SMTP id d75a77b69052e-4e6de8b5d39mr136839181cf.34.1759949268518;
        Wed, 08 Oct 2025 11:47:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb26f3sm246089e87.103.2025.10.08.11.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:47:47 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:47:44 +0300
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
Subject: Re: [PATCH 11/16] drm/msm: dpu1: Switch private_obj initialization
 to reset
Message-ID: <2gpgdmamnljxpmgvrkgmojnrkv63c4tcmo4xglbswtv4yc4h2i@hk7op2aug6mx>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-11-805ab43ae65a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-11-805ab43ae65a@kernel.org>
X-Proofpoint-GUID: OEjiAau1ZmIPKw1frtnEjXWtnSBrjYwU
X-Proofpoint-ORIG-GUID: OEjiAau1ZmIPKw1frtnEjXWtnSBrjYwU
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e6b1d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX5prNnm3FfxVB
 erq3Q8yuQLZCkgL2GdbEYibBGYLQi101OnsBwdq1NboMQeeM3iavyOwiOEBFZXqwQzpLZO+ZdI8
 UcZpSYFGJhlWZbXhQA6SqowYJV7wBjK+bHZbqEYlQcbIwOrQ9JrMMPD6mxRqwNwG1pzc+ZfAj1D
 iuZ3V4PB+/HOl5ypYSe/n6dt5Cnt6B72r3jWJME59PCApOTRVuQhVTrVKTUynLAbWN4D6qLMlCQ
 vvuN41rMH2Jfo45uW2GIB6K5KcM/81ITCsCb+Fp6tI/+XQNth8SXH7lhH76TOvaUFhfn6bJ246/
 6U501dcImxsxG1u3+JP5lTTJFx4HrZIuBu7n5nFUWRQCQpDwT2NbOiJc5sV/ksTNkSV2XboQXF2
 H/gtUPIxeHt0BS2nr6HGLnkn8ugi6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 02:04:09PM +0200, Maxime Ripard wrote:
> The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
>  static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)

It can become static void now (up to you though).

>  {
> -	struct dpu_global_state *state;
> -
> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
> -	if (!state)
> -		return -ENOMEM;
> -
>  	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
> -				    &state->base,
> +				    NULL,
>  				    &dpu_kms_global_state_funcs);
>  
> -	state->rm = &dpu_kms->rm;
> -
>  	return 0;
>  }
>  
>  static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)

Possibly we should also inline these two functions now.

Anyway:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  {
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

