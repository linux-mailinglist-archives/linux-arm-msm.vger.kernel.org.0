Return-Path: <linux-arm-msm+bounces-98815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB18Cb1JvGknwgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:08:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0912D186D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFD2318C305
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8E42E1722;
	Thu, 19 Mar 2026 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="keS26P1h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAn0xbY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8804359A76
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947110; cv=none; b=EZD4OAlc6C9zVmsJGn8m4fwcuDXuRfBU6sZYBExBdzMi8XqYihdoHYbcaJVSgrNSIbxYpl6JqHM1xLS/g6EwR01CJnQ2qPVwFqB26umFHzxBZiKAhFH3wu1dhk4RXxohzhctqWAIzquRyr9rDZpYXQTMmZB3rhJlE64OwVUy/uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947110; c=relaxed/simple;
	bh=9NzYJubTPuCG8uDlvb2mIrDDxj9Vm8TMCE/s0+FLpbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sius6lO7cKOF/Ho44m48oRTu01NRjFkyAYnq33+9akgdT30Mv4Qgnp+ORKxUhsJfPFHh4vpsBVZtaFCXr4yB5nDLT1rlPRxCD4EEwunG9NmD6R7/SqRxaxgFTxtayc6nA0iKQSXCFxIAJGdN2AmjNSeTVz/hidYxBOB6tbD2U2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=keS26P1h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAn0xbY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEqTY51898574
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YK372rb+CUNWfYh0duhBTEHT
	ammLaznzqmNCWqv9e2M=; b=keS26P1h9dlvOk8F3LxEP5JOaec5YaS6Pc8IqtGG
	vzzHs2di7MDgiyxWJOM4NpyBbU4OyQBVcVxu3uZ1/gTkXSm96XSx5lVZOvE7Mzkw
	MiQv6oV4T+xy5/RkofVsFnXUK7QKQqztJ3qHKmCoNPSXEiXyoqqnbGp/8rdQshvS
	Ubcx4btz0yIO0ZF9mDV2883t9iF6dFnfYMhflzFvXO40yWsdQ4gkhRsh5+iifiJZ
	39/Z6WNgXYfItOB00SRElblWZE2UVqnl6W2dUt79PSImuVYRqFx7+26eQ1EmMjtl
	VqHqbE0H/CiqueJb6TNsbKehTcs83S7TXFLqm2BUSUUa1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgcq8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:05:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b380cd5e3so854271cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773947107; x=1774551907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YK372rb+CUNWfYh0duhBTEHTammLaznzqmNCWqv9e2M=;
        b=VAn0xbY1JdWQiCyloJB+uQMpt53cQ51tXBLJiwPy7a8QvQ4s0RR8wnZILZ8hEBHLWq
         qPhkz1TlXnJwYEzyuiBeDgRyt4FYQPtKNBJauarnkW0gnB85kVJKuwEPQKeCDKODje83
         Ubrt581ShjIYvc8lR4Ypz6kIW4RYYlC5yYEEtRmd+vEmtCFPUB+37Lm57QiIjldIs38y
         OE+miB2lU3zvY+Yl1Mjm2v/ykTii4PvKp6ELF80Woh4fLJSDsAWKRHM6dYcLk78vg6I2
         xyWzGUQECIOoAC54QDxdjS4h8SclUZbdHo4+6Q6DQaNNhvjmCBfT5M/YwpmyP4HHqXwI
         LYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773947107; x=1774551907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YK372rb+CUNWfYh0duhBTEHTammLaznzqmNCWqv9e2M=;
        b=hFJ1HQxDf1eMubdxbUvUG+KqBLG1SmdsLVnVQC+briHQiUFxuO+DJA4k++RchaSwsJ
         uVMc6XrbIJjUUD0FwnheJhDuzt19rJ2LunwO3JPqVuwkbM2PUgbzhYVQ+XySi+aVtN1Z
         sydEneJponxfS0SAs7wCNt23dVvBc0/HbpYJ9ADhB47+tD5PXntohEUJV/VD1lK2YBf7
         0Oxh5nIeeseZhyLf2o8ZOLm49NsTt5SMr/casxy4PaPzI5uaMSZvNuOjTk7zv5XEMW26
         Eu4Wf+5NA/deVioNWEA6cghiDG5/YJBEUtvBdC2b304ZFmz4qSTtpB0EMHqhvfQ7USCq
         5lmA==
X-Forwarded-Encrypted: i=1; AJvYcCV8k6w56FJ1VneHzubxaaFZHLNhRqg/PiP+Oi4EMT6drVy5225VXRjSy1ftH5JknT9VdNZK5vgqTTMVIFPF@vger.kernel.org
X-Gm-Message-State: AOJu0YxmiBa51uB8IxrLPL0uEQbr/OByVp1Fu9opwn10yEKxEHYZhmP0
	wQD4py/IOb1kwMzKKVNyr3IvZbqZLYmVt2CiLDeTSGO14DV8Ym8I1JWkpLUqpWfsfDthydm9v4k
	ARjvbTB3ueR6mhJKBPgYk938XTludCiPKmLwNVcWdwbKvQRkVg2jU0fySPjiJrosZi+bu
X-Gm-Gg: ATEYQzzKwzC8laQXEKlCeo0/ld1yGiPFa4K4hPymCZ0uth4BOCy0PyQSBcuxf3TAw8t
	emBTKsepRu7TE6zMKPNktyL0TTFmBDEoklQUyNxfGulpTJBeuNnudAwEmAC/oq1p5mH3c9NuZFG
	WiQrQ200gDw+iMf64HSqeeTbTNrKDWzIgeuRwyTLyrwwR9EoC9Wgqe02y1QkzXIw4vSGDSMZLBh
	XUmqZaXnvLfZ02qyU/kFEzSxMZTqhQbpbGsCXSngmxq4PDHjbBFM+wKeKoA+AqAOFJhj/4Ge1Ix
	6rdtvqhf/llRe53lu0M+wMwdm6KrHnFBm1irg8/OFn/R1yyj2Tj54UaFLHEcMJqxurXfAaOMoK7
	XjlWGsL0Je8Igtl0JFNk6Fh0CohSVnvX8Q+QR3yW5QsL9DENjLX/+Z8FtyACqg/X1/cYhG7dJMn
	PHZU4jMy1ivug/BUdzFlHhdFvdPi44rxSy1uY=
X-Received: by 2002:ac8:5e07:0:b0:509:28ab:987e with SMTP id d75a77b69052e-50b3753b6b9mr5002201cf.37.1773947106804;
        Thu, 19 Mar 2026 12:05:06 -0700 (PDT)
X-Received: by 2002:ac8:5e07:0:b0:509:28ab:987e with SMTP id d75a77b69052e-50b3753b6b9mr5001651cf.37.1773947106250;
        Thu, 19 Mar 2026 12:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b5esm82622e87.16.2026.03.19.12.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:05:05 -0700 (PDT)
Date: Thu, 19 Mar 2026 21:05:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
Message-ID: <rmv26scjsc6md55dkvs2uam5a45mmslsqbyuf5lh3ssw3tu6uz@wzyg7zm2tfkl>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
 <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1MiBTYWx0ZWRfXy0yYS1tmMKUB
 vq1XL94Kkq75nd/WCnwZ+TOLT7ACCcvOZkInNZzTy9VprOBYi/eC53J0o3JdYVDG6YhNy+tJxVJ
 eOlBT2RNGUHgoxcVRtkYWAYYktYUNyTvG4wzzXC7qz9wrziBkxlCXNU3Nak1jlR6YqKJBreE2r/
 ueQkWQA4bRlyJ18D/tAVnISqJvKFPoiLhoZoob001yeL5a2ucAP3bZ0IPXp9YuwoslBuUjWXM0d
 7690ZcvDn9IAqDJTw2Tuh0Lw/t2ILnZT3kcvktlMiuYxmOb+H9dMOiOQuXMZdZLKwr6QP6ryt2F
 9Sf6nQvAHlJgXRxLaAyaC9LHnHcobN5mEhh4Ac7B9fr+RnLLXGpg3vWWEfanvsLS4R3XY3LrBED
 6tMH2rm+LXuyQb6y0SVpODL6p0APdLAqeUZUU95xKuotx90ykckg2dIQ6alwSpiCsxi31THGtMI
 0n/z5oa0FElRJE1ZeKw==
X-Proofpoint-ORIG-GUID: OCYDS3K4j6icDoqM4OxD6wiDAUHQ9BHS
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bc48e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=L2_DCg_Kqtn3RnkwlLMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: OCYDS3K4j6icDoqM4OxD6wiDAUHQ9BHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190152
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98815-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,pm.me:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.958];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C0912D186D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 03:09:13PM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 3/19/26 12:58, Alexander Koskovich wrote:
> > Using bits_per_component * 3 as the divisor for the compressed INTF
> > timing width produces constant FIFO errors for the BOE BF068MWM-TD0
> > panel due to bits_per_component being 10 which results in a divisor
> > of 30 instead of 24.
> > 
> > Regardless of the compression ratio and pixel depth, 24 bits of
> > compressed data are transferred per pclk, so the divisor should
> > always be 24.
> 
> Not true with widebus, specify why 24 and because DSI widebus is not implemented yet.

Support for the widebus is implemented and enable for DSI >= 2.5.0

> 
> > 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 0ba777bda253..5419ef0be137 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
> >   	}
> >   	/*
> > -	 * for DSI, if compression is enabled, then divide the horizonal active
> > -	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
> > -	 * is compressed into bits of 1 pixel.
> > +	 * For DSI, if DSC is enabled, 24 bits of compressed data are
> > +	 * transferred per pclk regardless of the source pixel depth.
> >   	 */
> >   	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> >   		struct drm_dsc_config *dsc =
> >   		       dpu_encoder_get_dsc_config(phys_enc->parent);
> > +
> Drop this change
> 
> >   		/*
> >   		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
> >   		 * fractional part if there is fraction
> >   		 */
> > -		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
> > -				(dsc->bits_per_component * 3);
> > +		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;
> 
> It would be helpful to somehow show that 24 is 8 * 3, 8 being the byte width and 3 the compression ratio.

Otherwise I'd have assumed that it is bus width.

> 
> >   		timing->xres = timing->width;
> >   	}
> >   }
> > 
> 

-- 
With best wishes
Dmitry

