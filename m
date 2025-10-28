Return-Path: <linux-arm-msm+bounces-79252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4657C16067
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23C8F4E1B62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7799344053;
	Tue, 28 Oct 2025 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5WeeqEg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mh/psjAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB2B3375A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670965; cv=none; b=R5LN1DLxdwtMWJeU4V4m0luGoxkSq8UUqQj4iHB5/fW45OVrCGzNuFe//wqjroZa1fhd0FzuvJ14dFQJ2Kt6bQ5L4ZIKADabsHq1KBIBggrhQqHTar9AMCtK3hBZ/rw8Go1IXc3VKY2zhq8nxyJVJn+KKLOdOjJoOj25P7ma+Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670965; c=relaxed/simple;
	bh=b6bFiqRfaqkqduCHw5Jtu3028bY0/oBvz28HabqE+4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTkmQ1VeshpIMnH7UkXKXZV+HMsTKKxBJiyw1nxBY/DgguskWWkUr0vzMuaViqKPAoXbNAw+U3IOrKicgR5WJrFKu94fbuIhRrpEZaYvSOubZsbfvx67fQdshg4f6TuBvVqCBqoGmORtZqMkAiaxLbUko772Kwxvw33GuBCCzl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5WeeqEg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mh/psjAi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEnhpA1965827
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cxkp5uN1hgEm1U7CQUVNW25h
	7bex2SPSJGWvI/3+x5g=; b=O5WeeqEgym/Ed2fgGBQMV6HSxphMhBfeNluJHd1n
	YEfHstEthnB/DoPpsTjyRIiu7yldRCJRYfWemRT/RMH9gtf0tVNsP/tAXpt+5iQh
	hwktCzhnbuYqw+zjjS5OGwp9l8GhWImoC7Du3RAPAvCgGMh++TzymCbLvQ9P/JQ5
	aSFvcfJlBFQM2gEDnxsW6ff/lNqaNaJNhv3CiDTQ47cbi+VZslZ/r7obTzZpN9iU
	qk3P9N7WZUBUkNUPZU+3+xuGdxx3+yTZzgVwfGICkeaz2KfO+gWwMRqbB0C6KRWJ
	AMhsWaVNvtEggSym9aXFtPjW9op3o80FLZ+yK5tdocunEw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2w51s05j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:02:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a7d8436a4so4048401e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761670962; x=1762275762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cxkp5uN1hgEm1U7CQUVNW25h7bex2SPSJGWvI/3+x5g=;
        b=Mh/psjAi2JZjvo0GRAnop3mAF0cBeqRjbqJzS4jnZLAFQAtLVyKKlpcxWh5YA3Bn9q
         mIrQ2EL4BsuVY0ceBlsW57HaP3HmLKTpeUwY9C0gXKM47j1zKnVSmZ8spfjTJzc3GXer
         e7GkbWy/AYR8FN5Fv49TWJeHRlvXq4jCr2qfliYM3h+JpvqSwF4P9HdUaXu0AlX7dH3/
         V0oAc2tDsyr4p6siWrYPIbgWb9/OW6BEox7gQwzQ4ShRADhflk0+v0b6FwjkU9v+lSH2
         RlANxg23tat8ZeJ+pcU22acZnbHCGf+EzPx1iqgqvsvt605KP3riUpQXEekbSLvPYVkF
         iHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670962; x=1762275762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxkp5uN1hgEm1U7CQUVNW25h7bex2SPSJGWvI/3+x5g=;
        b=HQc9VXpQcrMcPW7XkJdkCkR9rA0ydL6LnL25Vg38E0QQwdwASoZKt36Zxjws+HNouH
         CBXZbxZ/ANp+QKLD0+20PxF1S594TSBZCRQ89A4jiR+bGj7VjewUHKEU3AwqfEOf3Wcn
         ddJdpcNMBWO3p8+5wGwqDw7M4upW/Mm0S0q8X1lEpIetstut+bips4MFsQW9fc0iOIEs
         MNDEFSahAccpnVrNsobtJi/LscMQrqfoB8vX7DhxsmsOuAiNzDHayckm6agzeHd+yk+b
         MRMt9HfchKwHJ+XMHe8RcI7JaVoy/gBkFpOHxZOnValeBOJuPpy4d4UHn27sjeXvsu1v
         M7hg==
X-Forwarded-Encrypted: i=1; AJvYcCVQDL9alEV68JjEo8PxumOHtG4Ro6C2VUCSXag+Yyr+L2o8Sfv83W/wcvsh4Y4bWbREd/0iRlt5HpI5tUj7@vger.kernel.org
X-Gm-Message-State: AOJu0YycZn3ZytBqbWix9v8WRFmCnZBK4eQzx9Sy+4uDSY4qKDepQgvq
	nbZVnNLAgo0h0Sdqt8GDatbaV9FJrjZQEBks9BmCDaV3UNS29TeYgZ1RzuyMK2adhJ5wUXhZZMQ
	BlXkYLNrq94Sk/cXndPEA+xzurL7IpnaufJ2TGXmyf/wTd9eQmpmG0x3AqZgNMVc+s8jh
X-Gm-Gg: ASbGncsM3odPt3rJeTE+LAzUOUWjBXpPhKRQKgb+GpAf6xzT6d5WLulAB1sdR2YcGv0
	8ai9aZXA4zTJGNZt3UMqjX8BeuFjP3i5PSxq+flso7mUNBe3zqFV6EuL1nojpD35033/NtKBk3r
	yzLi+H9V+djwr0Mp2SwAU9lAz3rRraJ4afxWMoV/+RzJAuSZPIRmR1tG/1znkfKKQRv5Pzxgcmh
	Pwm6YDBarL6JIt21nSsWWMEd+nrs/ZJ5JGKeqAR7jYdRopdnviByDGYcVXuLOkg2A5k1ClcBY+l
	OMZ4mDXqjpxL+vJkJlJ9CYfj/kxcv5Er4mfsuIEqu0EXxrUeLTP64cSWleGm9wJ1lE2fv+3crPa
	XK7PDQBRYF0pwG77VrD7f+vJGPCDlWpF80hmVI7RFws6Ewgb2k9mM2AE5d73JgyIDn2dPcRApNN
	d04mSV2x/dSFQn
X-Received: by 2002:a05:6123:2eb:b0:544:c8bf:6504 with SMTP id 71dfb90a1353d-55812a5716dmr211457e0c.12.1761670959959;
        Tue, 28 Oct 2025 10:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFylu7+GWulmg8QmGwQJyndA+hF5O5s0KQz/TRjUhN57ySnCjdNwxNX2a1vWTcx0/uWdHcc3A==
X-Received: by 2002:a05:6123:2eb:b0:544:c8bf:6504 with SMTP id 71dfb90a1353d-55812a5716dmr210602e0c.12.1761670952807;
        Tue, 28 Oct 2025 10:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0c61a7sm26970681fa.28.2025.10.28.10.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:02:31 -0700 (PDT)
Date: Tue, 28 Oct 2025 19:02:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
References: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
X-Proofpoint-GUID: yoEMVCwf6IQgF4-dZSvCHdY48PRfnGS0
X-Authority-Analysis: v=2.4 cv=YMiSCBGx c=1 sm=1 tr=0 ts=6900f733 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DMwz6m7ubag84I2EhSAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: yoEMVCwf6IQgF4-dZSvCHdY48PRfnGS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE0NSBTYWx0ZWRfX3HSeqlfCNlCL
 ck5445c0wvGM5oSJbJ2rHAaQJPLIQASLyStdPrc5LKgBB/5M5Nmf7OBgNmSQOiO1xoEVeWeCOxl
 72Dyo/6/HukzD0dEXXme2bUBOvGXh6gcBQOa70J7h6Zr+/mBCGLellZuKwbvVycEt1jgUaQg3Yc
 IcLuSzLwnAUupzstxivKkyQhVmt6PY8wibhXdmmValEzg2GyiMYPhbpJNA+mokM60j+EoeY8rNR
 2O9yaQZ/eUwgyW0h3MG3MIIWLKFFggmwfv4C8dc/pNkbdgzdChoZMMfrR+VRGX91DjE/8eWNyK+
 sZiVYdW3HAOR+xYx07kLRQXfKsBZ9Wn8FOe5j+yzHzVKbflY2kw06tNVpZlmnZntu045gA9LJ0k
 zAA91CeTgvHrpfxywQQdYZRThGW2Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280145

On Tue, Oct 28, 2025 at 08:36:35PM +0800, Teguh Sobirin wrote:
> Move the loop over phys_encs outside the
> hw_mdptop->ops.setup_vsync_source block.
> This way, vsync_sel() is called for each interface.
> 
> This change ensures TE vsync selection works
> even if setup_vsync_source is not implemented.

Please see Documentation/processs/submitting-patches.rst. Don't describe
the change and pleasw wrap the commit message on 72-75 chars boundary.

I can suggest something like this:

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks.  Currently all code to setup vsync_source is only exectued
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

The patch itself looks good to me.

> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 258edaa18fc0..f36c5c7924a3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -784,24 +784,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		return;
>  	}
>  
> +	/* Set vsync source irrespective of mdp top support */
> +	vsync_cfg.vsync_source = disp_info->vsync_source;
> +
>  	if (hw_mdptop->ops.setup_vsync_source) {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> +	}
>  
> -		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> -		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> -
> -		vsync_cfg.vsync_source = disp_info->vsync_source;
> -
> -		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> -
> -		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -			phys_enc = dpu_enc->phys_encs[i];
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		phys_enc = dpu_enc->phys_encs[i];
>  
> -			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> -				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -						vsync_cfg.vsync_source);
> -		}
> +		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> +			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> +					vsync_cfg.vsync_source);
>  	}
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

