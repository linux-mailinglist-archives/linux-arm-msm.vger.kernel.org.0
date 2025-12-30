Return-Path: <linux-arm-msm+bounces-86920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE6CE8DD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 08:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D80BF3018F45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CAB2FA0DB;
	Tue, 30 Dec 2025 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIvOZoAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6ikKlWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802982DF14C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767078802; cv=none; b=adoazedTM+PelgoOKxiaTxVbS9yAmX5pQwzPmiY8O1A31dVqZlbB7X5T7MMqwzHkLJBzPWeB+sEd/z/oOB4fk1jq0M5ACPun+0LT0F2hXlTegPI/mPAcBrKZamfUdtbM/FY9smnHLqMGzxxcPttYK1Re2rnEY0zraVi607GKSkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767078802; c=relaxed/simple;
	bh=Ln9uCMI/zIFPWemImFwm/73On5YDQk929Xfv5JrPnVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVioLkzSIIGZmuO3mf6sMiR32xFEH/wHoxk7/Q1svZlDXAzo6Slf6jYCvuIMisNvXsE4aQ1M4D4jGuMbHcU3v783fCgYWZkbyqYEE2Au4IXYMGLTtue7y3UMNylY184yOtxW/UkQFvcXilA3RgzBqJdT6OPekkGFyo6h/QYoSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIvOZoAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6ikKlWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU1AfN6956368
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2t4zTTKKthp0P8Am8Kh6TS+m
	+XzSxbQAsLzx7iUdk8c=; b=iIvOZoAEe2tkOOyie62WCeiytuUyKvrJpQ9jZPRE
	thHcjkXdyS1WMqk9XDgGQb3i/RZdnNuOHbJwjezBQas1Y/jl2j2V0Kcvr0tZr/kg
	DMfOGUCT7XgPE9iivgzvn58JUfytFQjn+Tc8PxYjYJ1RndaExTHp8fdlzy2hT1i/
	T5tQkcR3JS+NLYKlEYsaIF1V0X+sRcSYrqv2lED8fArc2nXhbsKyXo3EIPwfj94X
	7R0uh4+bA7Lt/XLxqYJGBVYj737IJgFc9CsiyCIEt7/+iP66XyYzf1yGtpi80GKh
	lsPgM1jz/fW3kO68Za1BkxuWBTCHWgToTpwDyxfVR7ARTQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1adw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 07:13:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2cff375bso223907646d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 23:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767078799; x=1767683599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2t4zTTKKthp0P8Am8Kh6TS+m+XzSxbQAsLzx7iUdk8c=;
        b=Y6ikKlWEPHOVKKnWCfFJs4gdOANR+kfK8kzcbEcY6C8wdH5uyOx28gJjI2n482bZ97
         WObs8DiaONMKYxm9BVGNG7t5Xf4eDHh4ba9VPWH7fwMeLl/JCVkMjEBWbZ1HH1huXYDg
         TeC4fdNszunQdEaSwDUCnlaG+U+Q3nR+1xjkUZjp7VUR6SDLubA84X7dN35XaDecife7
         FtOVB+Vine4HEpXrP/y16HQwUQRiNe+q1j149ondSkVqe3AwC/bUxYdOZPfDtR6KFGd1
         RqgCjkf0pCYKjALAyy8OJqU/TsL4hQQNqFk24ayZ+7IV+X0k2Zejs5/KTVM9RFcdnonT
         81JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767078799; x=1767683599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2t4zTTKKthp0P8Am8Kh6TS+m+XzSxbQAsLzx7iUdk8c=;
        b=k4SjL94DUydv82S+TkyGtXOMSpSbptBKAvLQonKotllc+5ttgosWRhaz3OsKZghdjj
         pftqOJLGwwkli4d3e+oPuWQMQyfSyLuUrF3H5Mw7lsRl4JsCWe7BMJPjiF/oYwEBCTGs
         8GpFAvmoGBb7pnuyQF41c/tLe3+881H7jnwdOI0M8ppP/15Hz/kuxsgsPU6TscCyXwmi
         Vtbixt6K5Us968hiTMMNGkwFyCUNFxqATULKeBSRb89Mg9Pnim0iWMs+C3+BMX2v16Xi
         ix3J9Nayn+e0dRI723dW66C+Wx8xOf6drtdLm6qr4g5N1yUsLC1cM4ph4L0QMWV12B53
         BAnA==
X-Forwarded-Encrypted: i=1; AJvYcCVoxGhcD5CjpaXzBao13QKHt20buFISFYn4cATfJFlTddGR4gIGEWfkAtO4HJkLQ7ynnNrCRe9dJdeg0f3q@vger.kernel.org
X-Gm-Message-State: AOJu0YznwetEGMxrfg7haKngUH0QzsdnFCBgEToIm0BlYZBcO6YFZWWL
	j3cwvQBBcMEXIG19mwuBhZ7fG/ycEMI2CqFbJ8G/WYHtbTI1QBO5vCr9D9HB75wGXxaEy5EiTOk
	QmpL3iqfhKQIC9G2HjnvrHVUVMmV9D60s1cnwtAZBzhbTsoAO0A3dLMgBOEpP6iyzRm5B
X-Gm-Gg: AY/fxX6VuYgKQu2Rt6XAq2JemCqFN4upXkV/552jUNuNSIHmaxTMUqSizTem2DjXWWW
	UR9XunfwMpRdsqWDQrv3rK3WkD7n248vQCKE7h6x/QCDQGjwa0qMHr8r1y41Lec4UJw7r7lYTna
	VUmearqhavUwVNQbsKOPP+6x8UKGV2nt88qv4wl9bXp1kPAZ5P0fAjGZJBstOyC4tTowSh/3CEb
	l9B0+p0lIMJW5ZKVKbaktWbyRamp/frWPUbH3LxkbHXujQvMCo7YdiIn443gxHq3GM8jrlNCSlt
	t3p4e3a8Auq+kcs3GGhEFE2J7sACu4uSwvh4RAcMGbLNn2dV+mQ0q6pF0B42e5Bntyhn1ry7nwQ
	ltjUQQzt/aFRJh5SLDcTbCp75KqV3ILxLkXWujskV9REPONWT8hFgytCNixf3mCotpXi1jAz+l/
	9WRft2LebFCjNOLYS0vDZCf2U=
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id 6a1803df08f44-88d823300f6mr528311476d6.27.1767078798575;
        Mon, 29 Dec 2025 23:13:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXL9PeBhvMT8/4p2SJ7DsWu4DdAlh7lnhb5mktPynlGQSvdJ49OQrCr6XsR8efN+SSL8GXEg==
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id 6a1803df08f44-88d823300f6mr528311286d6.27.1767078798093;
        Mon, 29 Dec 2025 23:13:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628040sm9952668e87.88.2025.12.29.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 23:13:17 -0800 (PST)
Date: Tue, 30 Dec 2025 09:13:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
Message-ID: <hl6gz2m5jcdvkobkwbzrnfulphdssrqqwnkt3jtap4eplr64ej@gmmeikz7z5n4>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
 <20251228-intf-fix-wd-v5-2-f6fce628e6f2@oss.qualcomm.com>
 <aVJlvFWcq5QMVWYM@SoMainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVJlvFWcq5QMVWYM@SoMainline.org>
X-Proofpoint-ORIG-GUID: 2XZNzqC21fJxXYXYXkBbj2FtizaMtz5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NCBTYWx0ZWRfX6aIo6/Wprbcg
 KQidfiGyy3/JqRmcy7TDP5y2Bqx32oSuE0QtgxqGv+VcGjCUhbIibE9v+bvlaRLL1bpc7qx025D
 TFdDriHugVifuqG7+XHlkl35kygwUjEW6mnWQiyk1jmtZ+bGnw/QeLRGBdB3MfmqU/grj3qsGek
 cmPtf3W3FzRrQquDmbzb2Vg0CbW2tjoNho/6ZpLovE4freQUyrTEforXW7rc2+c1k1cvYIWptlh
 S2znqBQElhCGW8jyMqmQaJVo5RIK8qvSMy1IavXGYGFarAFSkqTpdX2jxQx1dJGePwrCm7cwBq+
 VbIPvuOPUsDAvtvPmOoutZNcwUXw/3h+bNWh/NaV+zBeKkr1e3IZApV2SzYiBmLQ0DVTM3fAfbU
 Iwt3Lh/xXgs0mPUNJFh6D5TfrVkwB4L8KQB4ycOJHdIoS6c5tGDdg6sKg9c9mLr65zJYgLdJ/2C
 8cEI2bgYeiXJ1xFF1RQ==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=69537b8f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gKpLsENyAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=zvAJQZrOlr4PNjufmXUA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 2XZNzqC21fJxXYXYXkBbj2FtizaMtz5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300064

On Mon, Dec 29, 2025 at 12:39:13PM +0100, Marijn Suijten wrote:
> On 2025-12-28 05:57:12, Dmitry Baryshkov wrote:
> > Since DPU 8.x Watchdog timer settings were moved from the TOP to the
> > INTF block. Support programming the timer in the INTF block. Fixes tag
> > points to the commit which removed register access to thos registers on
> 
> thos -> those
> 
> > DPU 8.x+ (and which also should have added proper support for WD timer
> > on those devices).
> 
> Right, yes.  Commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming
> through TOP on >= SM8450") was already a fixup of that (though marked as fixing
> the followup commit 100d7ef ("drm/msm/dpu: add support for SM8450") for being
> the first to use the new DPU_MDP_PERIPH_0_REMOVED flag).
> 
> > 
> > Fixes: 43e3293fc614 ("drm/msm/dpu: add support for MDP_TOP blackhole")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> ...
> > @@ -791,7 +791,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  
> >  		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> >  			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > -							 vsync_cfg.vsync_source);
> > +							 &vsync_cfg);
> 
> In some way this makes me wonder if we simply need another struct, in favour
> of not missing fields that are never / not-yet read, although resulting in more
> clutter.
> 
> (Just a nit / question, not a request)
> 
> ...
> > +	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
> > +		u32 reg;
> > +
> > +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
> > +			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));
> > +
> > +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
> > +		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
> > +		reg |= BIT(8);		/* enable heartbeat timer */
> > +		reg |= BIT(0);		/* enable WD timer */
> 
> My downstream also sets BIT(1) for "select default 16 clock ticks":
> 
> https://github.com/sonyxperiadev/kernel-techpack-display-driver/blob/61a727e1ce1fda617a73793b2cbb76b5ca846ea2/msm/sde/sde_hw_intf.c#L511
> 
> Although it doesn't read back the current register value.  Do we need that; or
> maybe you are inferring this "missing" BIT(1) via this readback?
> 
> After all downstream removed the readback exactly in favour of setting BIT(1)
> though because of a "default value change" since MDSS 9.x.x:

Ack, thanks for the note.

> 
> https://github.com/sonyxperiadev/kernel-techpack-display-driver/commit/e55c68138b04770d51067c158f92de526e0c926e
> 
> - Marijn

-- 
With best wishes
Dmitry

