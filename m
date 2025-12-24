Return-Path: <linux-arm-msm+bounces-86580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26048CDC4F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 14:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 059553044680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944C02F5479;
	Wed, 24 Dec 2025 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUkJZvQx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIjka8fW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFB2C0281
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766581404; cv=none; b=bdb0YDDbghMSup2HAlKpIehwTHQIDf/RpGCi6sGhyoHZ4L1kXg5KnVwIv8dLtJiZaX3rV/A4InHr7m6+eS3JWB9/jmI2d0nwSaR1VKUnLyBgWFErI0w26l6yIE8BsK7CruwF1YmlSWGjCbwV9YwLAivuCRzpXxyxkO/4i4SOQrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766581404; c=relaxed/simple;
	bh=xhbGXofUNodN8wKKAQpJk+NnW+VJC8Azw99HS+OImzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5EWGaGt7yNP1Z4tb1xlZkLMPMJS+qp3/QYQ6bQFElwzd9yRq2V56NiBTPjp9kFS6J9t7PrPj4Z+lFMY8AGaBIm6oxZw4hLYSCeWHcFoShdYDpxYluLDz9QgN4pODyCT6HEfbdHjEfhX7m60Hk8oIETTSE73vrNpfnizlKGigJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUkJZvQx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIjka8fW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7kiWt1056400
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CoMLQ3A+FSqHoq7wci+EuOku
	pFXnNaASmggKwByogQw=; b=LUkJZvQxGCXyxxq7p8ATp89C8XN+5L0H83SU3qcB
	SF2G24XZlM+8S4yZO3lXR1AKx1HspfDA1P7/aFhU02tQD6B1aAM78h0NWwaCX7cy
	pl1rVvpSpVQ63ogkC7qdyyV5iulFm5X75sm1xniOHXFq5Zm8NODWqpFSL4R3Rjj1
	2FQ1SlOm+fMbATJFjpCOWm2v2j94+BxwKEHpgogGGHGFX+PcKisuL6ZZRHVkvDZ9
	OY7BxnmnVIyMRJtsS+Zlq4cF1UUo+P+VSgi3Y1EG4VKCQLyGMhGRRvFsZXSihph0
	GRIuRp82y4MgxBnE8B1rR5QWSdRguzyBlfuGRKhf7UqBuA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2fua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 13:03:21 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cb133bc2d0so7773776a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 05:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766581401; x=1767186201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CoMLQ3A+FSqHoq7wci+EuOkupFXnNaASmggKwByogQw=;
        b=LIjka8fWST/OViOVk0qiCzZN0aSv4QJoytaq3KyNxgts3ygZFCAwu5uEAvM8RPt1WX
         QnUd6D1qlerYfKNLH99ykA2Npx2gOOuuYY3v++8sv6AkBomapiHATKimlt3IWa4ihRuJ
         Oikyiv6x/rJfOJizURqTIyhce/+z45KBVyjRNhvMi/y09jimLFHT7L3g4D9pnu3CIi3v
         YH1RbDzblt/EzHbx0JwmPv2dGcKCXz+uV+dgr4XpzlBrOi/SM5JPsT4rulQhhUZUa+gW
         511u0AjW6HVr/kP6LgZCNawkMF8FmoSdun9MQMN7l32XeQa0sR0UkuJPiBBPqVWgfqyw
         yd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766581401; x=1767186201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoMLQ3A+FSqHoq7wci+EuOkupFXnNaASmggKwByogQw=;
        b=sR+iXl/qVKubZDwp03OPDdbSxWA7W0ydvVF7y4RI/g5wYj2DUeDJkCzGQpe6AImI+n
         PaXbm75JXLTRIyY/cxXahkMEVzqaMwcqgcOO+9OJ3Zeab37S7Ciy0ThRR/380DNK8z3g
         hHX5DVLnWZLx69aRdqXlIFnClLFBa+MlNoQrYbOBAlxTO5lDSPKXAC/60yBX00CeFTf/
         wNTOg/Hp6bxGd1HKoJ2tArd+vQLCRtZhGRbpnioqD2Hw17QYiXb/GvBiswVCRNaYsiiu
         tMMcTxxw81oIa8/JrwLAcm7yvbza+WFRTY1NxrK1WcqVxHpUdGFlvD8N5r4Wcb/GjGtZ
         NZWw==
X-Forwarded-Encrypted: i=1; AJvYcCWnYplJka27suhA/tASB7JFRfoz4JktAFMp6os83Y7KMj+oG5VUakEZOvtjB1pCr+Yw+QLQkZK0k10xr/Nd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2L38jUyLP1RShSwd15S0hO9sZIXzk61qMP+gAr0FfNzbzfsd
	F6F0ZX8ezg+CucBWFCvdbh2OTq21bFqlRC48KeEu1PzfMIcdCleaGRyGJk8+0zS7YwjyMgXJT5Q
	xmi3cDdysXqY8AYluBXqq07NHm4X0/3Wm1M495sJOqAJpS1lq7o7nSLRy5ASr117Cu4jl
X-Gm-Gg: AY/fxX7+1NRYTIEAUsKCBRNZsY/Qg5oOXqxluKmt6c7yV2H4cTUivqFTSiho5pKA7XC
	T5Vx/o4Fk7hDG4KfXYiJOVHf1B6LHIAHpq2t4VsP21p1yInwAVTwWLllJo59dRPNBp5RrSiLo7m
	pjubFMwdLBie4CC00VGQ/h5gv7OHzHF0f+tZ0YoDFFzmik8Ks25nCOAuEqClTyvzrakXrACulOV
	bA5K4whUFFMJ7TnvnGX6UrcjM+DTNMu9gwyLl5R+VQfuVWqc93NONmdqwBYW8+DgwNq8KiEMgM/
	AvKEm8p872g9Z2HaoQ5HKVGpjGeA04dnteCRw6M8eQ1CrP6bDaQNhEcVoBtKcvBQ9uj6DKtYdGx
	3l93wHhgM9r2+zXbZrt+K+z8Z6YesM1IydG6wB/rHaUEApV/OdPq8FyYHzeBzEglNw5k5w4ZQwL
	vNnm9xYVO2v78N+aPevDAwbEw=
X-Received: by 2002:a05:6830:2e05:b0:7c7:2df4:faa3 with SMTP id 46e09a7af769-7cc66aa23fdmr8356419a34.33.1766581401134;
        Wed, 24 Dec 2025 05:03:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFci56BqdajGnWbClbkiviThpt3xVm3rf78bzux61dK3ALULPOf/isq+eEuZE9ShzSWosGYHw==
X-Received: by 2002:a05:6830:2e05:b0:7c7:2df4:faa3 with SMTP id 46e09a7af769-7cc66aa23fdmr8356385a34.33.1766581400633;
        Wed, 24 Dec 2025 05:03:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b391sm41256101fa.29.2025.12.24.05.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:03:19 -0800 (PST)
Date: Wed, 24 Dec 2025 15:03:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Teguh Sobirin <teguh@sobir.in>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <un2arvxos2kuyrqej4p4fs3jfd3kzpa4r5txoitoctfwl7hair@i2a5lu3p3iem>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <aUu5vZdr9RJ-VML8@SoMainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUu5vZdr9RJ-VML8@SoMainline.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExNCBTYWx0ZWRfX/hXPcytjXVQy
 +BBWWIsULt6/T1UzpB6+tsGHv1WfWkx6Mmd06BAcDQlhcyjKvaPlIi59YigxAAQ7WpKgMp0Uw49
 tylAHLUyh3jKnfRTlwSl57yfJSxhlh+WhQMsZOQ8nhXk1wGl1rmfWyWe6tFw9LIhLrkdEHcwGri
 sEJFPmXaf39NLcTat8YiX/5I06mwC8ZzlAfJ1YESAtYJvM02N027XJY+2rCpYDEH5lEIj3J/TG5
 SHS7iYn0HrJ73ZIaOhJJ5PNVV8ppuwKOPHzZ9ZoebMyzx772zsyn2ZRkIBJOkp+J4ytnELpyCmQ
 y2WSoY+feWgLB+KINf2Snu1XQzXDuRmm3P3XvyUgwtIJJrBijFz1jU8lrA8dkvbKWSj558M7ai/
 wpLv2V8YygNEA9PJAb9HnSgTjw7oflhLVrhW5ngSY+Uck8UaiK40g/1Kt8PKeU9RqO3X3zTj3pE
 DGTnRS8bEWUkKUlf2OA==
X-Proofpoint-ORIG-GUID: FtI2e-x-O1wulNxLgpYRe0SGPaIuRT9J
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694be49a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EZJLH4LHemoWMIo9gjsA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: FtI2e-x-O1wulNxLgpYRe0SGPaIuRT9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240114

On Wed, Dec 24, 2025 at 11:10:35AM +0100, Marijn Suijten wrote:
> On 2025-11-21 14:02:08, Teguh Sobirin wrote:
> > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > INTF blocks.  Currently all code to setup vsync_source is only exectued
> 
> typo: executed.
> 
> > if MDP TOP implements the setup_vsync_source() callback. However on
> > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > vsync setup. Move the INTF part out of this condition, letting DPU
> > driver to setup TE vsync selection on all new DPU devices.
> > 
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > ---
> > Changes in v2:
> > - Corrected commit message suggested by Dmitry Baryshkov.
> > - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
> >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d1cfe81a3373..f468d054f5bd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -774,24 +774,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		return;
> >  	}
> >  
> > +	/* Set vsync source irrespective of mdp top support */
> 
> Unnecessary comment, it's clear from the code flow that vsync_cfg.vsync_source
> is passed down into both functions.
> 
> Perhaps we should pass disp_info->vsync_source directly into
> hw_intf->ops.vsync_sel() and only initialize vsync_cfg when hw_mdptop has the
> function, to make this clear.

No, because on DPU 8.0+ WD is also setup per intf.

> 
> > +	vsync_cfg.vsync_source = disp_info->vsync_source;
> > +
> >  	if (hw_mdptop->ops.setup_vsync_source) {
> >  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
> >  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> > +	}
> >  
> > -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> 
> This change is not mentioned in the commit description.  While true that
> pp_count is only used by dpu_hw_setup_vsync_sel(), that is still a valid
> function to be called on DPU < 5; it denotes the amount of ppnumber[i] array
> entries are used above.
> 
> > -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> 
> Same, also not mentioned in the commit description.  frame_rate
> is used by dpu_hw_setup_wd_timer() on DPU < 8.
> 
> > -
> > -		vsync_cfg.vsync_source = disp_info->vsync_source;
> > -
> > -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> 
> But all of the above comments don't matter if the call to setup_vsync_source()
> is removed entirely - it didn't move anywhere else.  This is not described in
> the commit message.

Fun, I missed it earlier. Thanks for pointing it out.

Teguh, since we need to fix watchdog on MDP 8.0+, I'll send v3 on my
own, if you don't mind.

> 
> - Marijn
> 
> > -
> > -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > -			phys_enc = dpu_enc->phys_encs[i];
> > +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > +		phys_enc = dpu_enc->phys_encs[i];
> >  
> > -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> > -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > -						vsync_cfg.vsync_source);
> > -		}
> > +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> > +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > +					vsync_cfg.vsync_source);
> >  	}
> >  }
> >  
> > -- 
> > 2.34.1
> > 

-- 
With best wishes
Dmitry

