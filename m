Return-Path: <linux-arm-msm+bounces-89253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5AD27EA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371B2315101F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82BD3BC4DC;
	Thu, 15 Jan 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1KCB4Ad";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFm0RgXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481F352C3F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503100; cv=none; b=UiIV2WZU8jnwI2NvroiC//4GezKXSMEHiMdE2mdHnlmjiFNFkTFEk6TexM1bbogA3q22rq1Ib/bJj1hJ40fjQN1FaQrCgCP5J6uOmzvj0vaG6s3wqpMjHAjYu7Wv/n9/mm02BF935/k2lhLH7TIzy44W4Lt63UXbzYqSYidI8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503100; c=relaxed/simple;
	bh=GY/BLcalDQVEnC3pg8VXufGPcson1Qo+bRRRWSivMic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ennOf/Ys6VBI9264wajuV8FWPeAPjuUpG+qAeuyoVSp1M8g/hJE0u3Sc4DcnbKPFw9GpYkD+YQHZofBO667a33m1fc20tk3ElF6/YTOH/GB3ZMS5b5ub55i7Gn/EtCSrcsng/OVm+NKSOvPKbpFPf7wpDVW2jqdAADR6hIcQ4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1KCB4Ad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFm0RgXf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYXSh2981359
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MwvMaN+xjoWX7LctT9cvIp+N
	AYlffABN5Q6gMAayBvc=; b=U1KCB4Ad/GLaaHCvGY5yn/ZWgHOCVvrQ7EpZluHH
	aMxE67GjFWi3AkL+xa3eILtWKW0fR1+jL52e2d0rpEWCL/Um9QIhBNVw+J/mFtT0
	Xk2rXWYRelP38Ysj2UDq35bCUAyBX4sWUOJXRSlJGI39uioIroc6zjh6YMsIVwNf
	ONr3X/SA6OwjHdoa0U/ZQJnwX2lgxl0TiRR2JZCUR6r+UXzahfmUkjFgzAB9L+Ph
	puyGiqvgchWTDe6cfQjweOiL8TN5zbl5mkkbquftAUxNxnmpo5nWLheMs7h6vBm3
	n2WdayelmbvKgqVr3Nffx9WpKTZ7KzL/2uHQhyxNPXiWUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej2ke8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:51:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a69b7813so20815785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768503098; x=1769107898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MwvMaN+xjoWX7LctT9cvIp+NAYlffABN5Q6gMAayBvc=;
        b=WFm0RgXfsvv7mZlrHbX09hrz9H+n/ywhSYiSIR/tJRs9bXiIYByYeasBqcaG22PD3H
         WZVAIkTbq9YTFOwqkK43gc9PWw9W3SDYVNMAqlYlqOwlhHks21EcPibbmcTmUtxtWAyj
         FDZ3oqrHCFySHcLFChgCEZvg6bqE3YCLYGLHjgJN57Ce/3MyRwPTMIHyhGp5KzFubDl7
         ypEMisrLXrPxGRqyBfHls85jhx0iAhxfjclFpqBq6Wig0nlu2vUiTUr1rVmzczPO9mNf
         avdvF0dk12HN3jF1/TADB1EfxUldM7x1Pfa4IEgi4Rtj4uYQdqf1DbzY9/M2UcKqZ9N3
         +h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503098; x=1769107898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwvMaN+xjoWX7LctT9cvIp+NAYlffABN5Q6gMAayBvc=;
        b=wbrw/DoWhy95LHdhKp/fBZCqsTGFi2P4VwSscqaGTZtxvNSQL0qoy82AzEmbW1pIVG
         DViRHGmYImJps2QuL5AT+8UGT9P70UsLo1Nbj/+ktJE0N5NjPKN4YTRwxaRinn9v3i6W
         R55wz7Y9k/6nZA+283cEWnbFJY37O8VHGhgI7rQHLSkdfjJ0BaCsG2rVn7M+HhXupFLQ
         Wws36fhXQqhV2y8NMvn7Pzh1yMdzaLZ3KgGRHCVkl+giSQvmyk8Y4h2s4OEsRNJrhCoW
         uHizb46xcabrvSD29FKdYZpf0kJdadUFOzZh9qAw4jupe5S1cpkx/LQcP3r9o4IsiCY9
         MGAw==
X-Forwarded-Encrypted: i=1; AJvYcCUi4+FUetuU2nJVVULwK0AbyTIZ580DmstGpyh5SizI/6zidUJS4cygCw2EGTzv4CGxDb461mJde9GbJjSR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Fnhu/iwHVINzoD3gdyDUN3ga8iqzJS+sRDs2AQA56VCNLT2K
	L/hlxaJGub6n2WNYv/O1HBb5YwaMFCjz2QGzNg0H546vVJLKAI+VgzdaoWDcZ3Cd2V7T7yGTbZb
	vdRrd7PnfrFnW4Y8PYDKF5+rPQmFJS2j5tHyDxAVDeTT4eliLsUeZeu3skWj4BiOid8Vr
X-Gm-Gg: AY/fxX4Fxa5Ezsl8VnLyK1AC4ZkRcv01HiPwwW2PoTlspL1vX0KqnT7HVMy3Co8AIS4
	94YD2XCfAa+3gyCvbtIJwLcdRmaqvcDsazd10U1SyYqeaNSWAKbBiDW13r0xiBDzVOVU1hQ7+Nx
	IxG83fhmLR+XezHLGnfCQLeHlIxrkeJXqE6bTWBa2FDgoLliiwHEvA5tFQo6n/Sh7dh7EYoNwjH
	+LUIVpA7R2b4DX/AKPJVXSeHP8mCPyjUMJW8h2UucGd1gSID6p6MXBk3uTfO6PmNgk77jHa0998
	GLWI7LfKMjIfvYhonjQU9UuoHnmx8mNG7USH0NSSUwnaAbSaxt7SLS5+646KEZ+OCUhTrtk2/u/
	qD+QGTsHF+DNvbASh8/YjWFUmxCTjUixRZ5mjjdfR+KPyRJjWXbI0ZNktB7ZLasK8F2xYF9ERhu
	Ypj0pS4pYvHtW1YapodmNsh2Q=
X-Received: by 2002:a05:620a:40c7:b0:8c6:a5f1:7954 with SMTP id af79cd13be357-8c6a68efa1emr57944285a.38.1768503097734;
        Thu, 15 Jan 2026 10:51:37 -0800 (PST)
X-Received: by 2002:a05:620a:40c7:b0:8c6:a5f1:7954 with SMTP id af79cd13be357-8c6a68efa1emr57940685a.38.1768503097263;
        Thu, 15 Jan 2026 10:51:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397712sm70984e87.52.2026.01.15.10.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:51:36 -0800 (PST)
Date: Thu, 15 Jan 2026 20:51:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <rwxrhtnft7xb2geu6sbyhkw7n6bu6em4aiag2glyhudmbt5cxa@wylxybjpfhkl>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
 <x72w6pys3ph7sfcpp2drowkv7wkis2vf2z72eokgo2m3mpiod5@ykuxvtdfcnpf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x72w6pys3ph7sfcpp2drowkv7wkis2vf2z72eokgo2m3mpiod5@ykuxvtdfcnpf>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX0NOZcKVXmsUP
 nHq7Ubad3QawfA9ibCHGph7FZmsp/hTEqRd6RGiB0BcdnWkMeZwQ9M6lCMqolv4FSTxhrkWFzot
 A69GExNmWZl/NiyEcqB8BB3scA8YTggYOmQoLgO3cBWgV1Dm3a1tVGoHhetQ53S/R3E2IFmPC8r
 tnrLzYcFN6lcMODwvKrRAKOPqTQ8pJeSwJ033EU3YGzLqQynB+JxPNPyqCp63sttTGc6ExJehmM
 NHJwBV+9a5K2dVTp2Dlgsdyr8C29RtgHg51hptT8R8OqgLWDGmC94GSEKmRYP6qoRwOSVDeI6uR
 nWOzWG4fp1vem+MU+OC8xUIcATtuWRsSZ5rYqlCgl1vwY5o0kpoeXvfb4A1Gz9uQ1y/Iz4C/HDq
 6/Sjo2qrOzvIy8lmMR2rtZuWPTgH5nAGt/VZmJjiyNDK3/TUMjtXM22eZGNdO5yGjiZTwbeL/zf
 5emvtzFlHZaXjlw6vBg==
X-Proofpoint-ORIG-GUID: R8shCEgD60cZeVn4ycWHrgSmAWSe3KNl
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6969373a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qZx5eA-RdBno99Z2FmUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: R8shCEgD60cZeVn4ycWHrgSmAWSe3KNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

On Thu, Jan 15, 2026 at 09:30:22AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 15, 2026 at 09:29:09AM +0200, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Currently, the DP link training is being done during HPD. Move
> > link training to atomic_enable() in accordance with the atomic_enable()
> > documentation.
> > 
> > Link disabling is already done in atomic_post_disable() (as part of the
> > dp_ctrl_off_link_stream() helper).
> > 
> > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > of queueing them in the event thread so that they aren't preempted by
> > other events.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index a05144de3b93..3184066adb15 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >  
> >  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> 
> I think unrelated to this patch (and series), but do we really want to
> keep the v_level and p_level settings until the user reconnects the
> cable?

Yes (or unless DP RX requires a full retraining). It's a part of the
standard.

> 
> Regards,
> Bjorn
> 
> > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > -	if (rc) {
> > -		DRM_ERROR("failed to complete DP link training\n");
> > -		goto end;
> > -	}
> >  
> >  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> >  
> > @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> >  		force_link_train = true;
> >  	}
> >  
> > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > +	if (rc) {
> > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> > +	}
> > +
> >  	msm_dp_display_enable(msm_dp_display, force_link_train);
> >  
> >  	rc = msm_dp_display_post_enable(dp);
> > 
> > -- 
> > 2.47.3
> > 
> > 

-- 
With best wishes
Dmitry

