Return-Path: <linux-arm-msm+bounces-82429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9707FC6D41E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A2C88385974
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46872324703;
	Wed, 19 Nov 2025 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSqJ5OjQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhkvjhCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622283043B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538620; cv=none; b=A0ZvH4Dgnrg2JN2dSkarUJDPTulc2Nav6lv7H9E7LJNB4u0AXGssVNPHU4Aq0hjecuFGLgFmQGP4+0N68Ab4riVw1k5DC0NPELGEM4r9G7uIZKyfjn/33BtxS8CZsKdm+alacV/5sNfAzvq5beyQ3EalBLPB25nhJ6nHyvZLaRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538620; c=relaxed/simple;
	bh=jYk6lkyRxpKP4VbXPLUnYwh398albU4lOl6VW0v5OHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lap9m1DouU6O2VCAli1mnfalQoycGI762MAiLyk1/lG+slXrYB/cORQSQ7hN20aa9m/yUr+eIaoaksstRW5OQZhRZGYgVpf0N0vaYf+bk0gXozi7ivl935ufersGEgHmrpGU3lXYLrQAKJZJwBwAzLYfLqFhCPlCFyEzdrtPb14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSqJ5OjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhkvjhCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ56qrN2926649
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JN0/6uytMZfFdGgqFRKuCML3
	Urcs2u6XoPqb2CVpooo=; b=pSqJ5OjQ2LoHRPNAn6sxDYUlxkhY+0iVGHf2d9GY
	U/ZoodeT7UT6Qi8ku0bN/PkSvJWEfxDbdQKnsF9B5e2eXu/3EdWlJnK/xDR1wbGD
	qcwqDUxqRiRPYu/twy0agb9IrwFRSXVtVsEHSWBbgCWvcAGacXJmk5xMZiG03oJo
	YYpiq5JnYN3OkNsHJMZxeB5qn8OZJ0fu0R0z5PveNIFls3xo7Wlf/93mUYU87cE3
	V4NeoGDmRf7Ld9JzqW946clLibPivJEbGZCy31XC65+psSzWEt6A/PQpFRZm9JJl
	vAgS4gCouA6f3doF9semuUL+8FX5KwSUPmPgJfH++8SY3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq293bqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:50:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8805c2acd64so198836906d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763538616; x=1764143416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JN0/6uytMZfFdGgqFRKuCML3Urcs2u6XoPqb2CVpooo=;
        b=MhkvjhCAOycLVhW5WlfibFls0YnVUGOv5sGAnxworJAj1E5vOwXEgmQQcXkUOZqbh4
         kxKpDuwGJ6/42NeFjZ5zzLgvoq0IEHowxVqSDrJGj/uAGymr6cSBcfZ+YSVpYxR+xDmt
         Cc5y1SmsBVVdrrHY3oNfl13UWEy/a3LXOcppPFfZI2dpvSJagVRFxN5d9uNvJwkpgqor
         HRltFVAgBnvFzNlNWnfk9LRLnJdI/EwS73E31PpuzpBpcx32uhsgw30TIGQ+/Z5Y1P/k
         dta+IqLC9KVQo1vBrBwUgv7pMeeDDIS/DaxpjK+XYlNeSz363qhlzakSYPsL6tvcZToP
         y7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538616; x=1764143416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN0/6uytMZfFdGgqFRKuCML3Urcs2u6XoPqb2CVpooo=;
        b=r672LHtUKXb/5tkSB2Xc4/4hkjh7qVfN4S8Q9RI8l6I61dSRnzyzo5pYPNwdL32g02
         seIcECdKdLpEMmurtmUjH3z1Z/4b0kuGFVkq07lCv8DQWTBSi3h/+gV7zuzL8wReby13
         WYsVnm/oNsHD1vSTpwXlWv0PWzQCVKqPjelHSdrwhdxXiosNail94rDZDTKw/peH69qJ
         12HCUWBTVr3IdciLcPAa3Dz1NRDiUJekyYSRjE1AukATy2A1ceOALVFG7giZ8W4NMv9q
         SF1baaFR5Fcpsp3zGSJExjB9ni6jBkTInGZKjEM6ausblbGc/ApAa72kNqwoVL8fOwU3
         rwKg==
X-Forwarded-Encrypted: i=1; AJvYcCV710bxd3/6+Pp1h2MLRi6voJFigRKE2ebzxfM/rhdUEGaa8kVvmQvWx+acRw2DF304+PbudlQ5w2sM43aQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDkZa66i9x7Lt5qKH+o9rVmS9Pkj/Q1FjIm7g2umchz5HQaSd
	kcF54X6qmeRM1tdz5LIjCDbKO8dHDv+8kURmowHmdphHNeFvf9hihsY4ks6+aZ81mUez44zFMFx
	VxYNGr7EK2NcIe8X6qyjtT7jDiYPDGwipXB56Rc0fqeVfHEUbRUemv0/YtL+2ipXhTbWI
X-Gm-Gg: ASbGncsSm2Je26n5ct7HSiHfeGe4Qi3entkHQlB/PPTEf91ivD/Pw0pbp+Qyj5s4wAg
	2QCzIuuKiLTnim+NYjmcdlrp1P1HsfT+dSaX70Q+BcmROMli0jUSwNIQ2l2bCjL/0dpG0t9j7uh
	IV4pHSIgddcISMZHtD7LORtVl7RXutq7By4hNxVsRykLFhmyB6GUxI7a0MHDZ9bKbSHjHqDpwTa
	vRfbCa2gxuGz08IKZ4lEOVYBAHsmVRGO94AxXBxIV9ca6zuDGH7+rvPjRQIOwiEobi2Sfrls6qd
	lYaXpE1QyNmQ3sv8BpcFtUlaPmmcNYu2FjiT5fzsECCHMqGKLX3jotJo/U+CG0rjWBrkiwZxeJE
	hfHeitrHZo73E4/yctp5+dEnw89Lm2HywxdJoCcZj889+Hil38/nTLOK+uy2oU3V+ghXHmaJXff
	bck4LiHdwyZPtjRqU9e8O2jyQ=
X-Received: by 2002:a05:6214:2aad:b0:882:4a80:92e with SMTP id 6a1803df08f44-8829269e11amr264944436d6.31.1763538616332;
        Tue, 18 Nov 2025 23:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhbzOHjM3pJ5oG9/YnHMk/5wiOCbLKCs9ygWrmLCux4YPpy1FxFLwoYztR9nqKADF4nodujA==
X-Received: by 2002:a05:6214:2aad:b0:882:4a80:92e with SMTP id 6a1803df08f44-8829269e11amr264944256d6.31.1763538615896;
        Tue, 18 Nov 2025 23:50:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0b36sm38666081fa.38.2025.11.18.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:50:14 -0800 (PST)
Date: Wed, 19 Nov 2025 09:50:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] drm/msm/dpu: use full scale alpha in
 _dpu_crtc_setup_blend_cfg()
Message-ID: <ogiiqha5ak5z4atck7ykyvbzw4juegsn4z7nazkkstiep3duwe@6qc5ag3kobj3>
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-2-293d39402b59@oss.qualcomm.com>
 <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c2e47f0-ba96-4433-b13e-9e819cfe2204@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691d76b9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ux6_d4rlt1bcc9Q1bkUA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: NU-6imqMRnifMEF8zjuKy3PgMusp4zWq
X-Proofpoint-GUID: NU-6imqMRnifMEF8zjuKy3PgMusp4zWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfXyD376bhZ0ypP
 0gYaGziEGD+C/nY6x0j+3nIzp0CMhBft9/SgRS9vMDDOWaaBFiIDOzlnYkqOr52gvOpv07RbG9z
 mUz6au0X/ntNBT3EJsb7HNWk+siRHz4g22uTNdfLL6BqtPKcwSGNsjmMwTUv63bRJYhyBYP8lIO
 fF4Zj5vutt+y2pX5kvT9QWJRisJd3/O0M1rFQ17/k+1Iuj5DIA5BGxK/UFkRFEmGdJk7yHMtcB7
 DRoW7Z489kk2jWCeH8VoWY6/IoOwDIHPHVy0KMdO8SO0WwqcnyH0Djpq2hlg5QNIRctrhXAP+e4
 HYAjtgcU4+DxG0zElyqhHMsd0WP8a0ufxexNNWs00lom5nMCkGT4LIl0vPdUqrzN60s5lrkY2YK
 2bqnF1YpLWZUEo9j/3hV+AHSJWjfEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190060

On Tue, Nov 18, 2025 at 04:02:03PM +0100, Konrad Dybcio wrote:
> On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
> > Both _dpu_crtc_setup_blend_cfg() and setup_blend_config_alpha()
> > callbacks embed knowledge about platform's alpha range (8-bit or
> > 10-bit). Make _dpu_crtc_setup_blend_cfg() use full 16-bit values for
> > alpha and reduce alpha only in DPU-specific callbacks.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -	const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
> > +	const_alpha = ((bg_alpha >> 8) & 0xff) |
> > +		(((fg_alpha >> 8) & 0xff) << 16);
> 
> This begs for some bitfield.h

Which one(s) would you recommend? Ideally it should be something like
'get N top bits', but I don't see one.

> Konrad
> 
> >  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
> >  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> >  }
> > @@ -160,7 +161,8 @@ dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
> >  	if (WARN_ON(stage_off < 0))
> >  		return;
> >  
> > -	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
> > +	const_alpha = ((bg_alpha >> 6) & 0x3ff) |
> > +		(((fg_alpha >> 6) & 0x3ff) << 16);
> >  	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
> >  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> >  }
> > @@ -178,8 +180,8 @@ static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
> >  	if (WARN_ON(stage_off < 0))
> >  		return;
> >  
> > -	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha);
> > -	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha);
> > +	DPU_REG_WRITE(c, LM_BLEND0_FG_ALPHA + stage_off, fg_alpha >> 8);
> > +	DPU_REG_WRITE(c, LM_BLEND0_BG_ALPHA + stage_off, bg_alpha >> 8);
> >  	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> >  }
> >  
> > 

-- 
With best wishes
Dmitry

