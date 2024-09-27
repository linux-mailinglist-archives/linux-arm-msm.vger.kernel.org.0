Return-Path: <linux-arm-msm+bounces-32646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E489988096
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 10:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6EF2281B62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 08:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1667F189B95;
	Fri, 27 Sep 2024 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTGZ72GE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2EA189B8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426542; cv=none; b=tUykMY9JwBS0hfMFcM2f4vHqu0N4OQ0fam3/SyGkHxyuWnCiqN2wnEA7GYc3e7heAn/kWYbPRuTXr9jC5qIhZJ8Ftv+k/aS6CULbuYm7i1fXYyqvVyuKF1CRvTcTcuWAP6wp+esdDWTeE6o00lvf4t5sP11045LXEQb2r1OLrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426542; c=relaxed/simple;
	bh=ny/myTaVbISE08gOHJ0mVH34LeYOvJ4iO8AMP/4kh+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=froj58AbYyxG8kiZBK115tsq5U6YHf+vf6kTY2f0XGQpVdSoVTQgpC+cbaIYtz0jIGLC4jJ17x3Fod01ck6TCzr7M5cbPNkFSeLro56zsp5WJ45RXcXBTdNj9O74smAbOa2p1wvtbkwwj5HJ7QjHtWkcIFUZuRYmMQnKZ1ig5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTGZ72GE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53653ff0251so2341897e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727426538; x=1728031338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wORqZqv9cUGC80DSKYgE6tfqrN9lDUHFj2CIW1jLYmc=;
        b=lTGZ72GE9tPGyjZ5yBrFeRQx06IqwGUARU3zzXXK7mB2t/C25k0C3uq2mCRwkVNdcG
         S8e4xK+ab5SasZSPOEjDGwZEeDMtignSc4CYTu25M7CLm2eF3fSlEr1oQksqIi+MIZwX
         oviEydJadsxhGZ3cb8ET03iHd+TxRVzXY19X/qR5hBTnTKs/FMFVa2zw3k91YoMRf5cg
         pfKVbIftE/wb19w28Wg+6clUyCcO1sCr+JDi70FrnL81+3jsEaiMsS72+8tafoTvPKfu
         0Jfa/ZArPAfLq5hHxRHSE+RbhHATePoTugd4OGMSd3Ya9+MAtiYPLKiiKe9xX4oHde+H
         rPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727426538; x=1728031338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wORqZqv9cUGC80DSKYgE6tfqrN9lDUHFj2CIW1jLYmc=;
        b=cnLa4fONDp4loq2oPg3Vk1x1/9t3QbS8Ahw0QV8SzXXmTf7si53TG6axMLVIq0jnZd
         4SKUwtlfDILYLQ6CQ7DJm1957o+pgM/iLSWLix+3ktMWq7ngIWbWnVxml216H2BmD5vH
         tPMe6xVfvPq+4B9jvrvyEBYPAOYTGhdWv5V9MZgNXk0ZUM1VRo9NP/01NV1IlwWAHsuR
         9M1y2WwhHI6xNxBW06zy/5BykGxqjNR9Bl/ac7YJKCVWShHaneW4dZk+mCUt5+w5Rl6C
         gFQ/DGSaXsmedY8K78eD2lPYsMgC47SPVDP68fvMUDcN78KCcdSggVnqIYuZaCsgiqe4
         tixg==
X-Forwarded-Encrypted: i=1; AJvYcCWfKYt2Wey5vH83HgDpaRn1664XnOBNfr41bPQpLO6cJr/CKwtBbUqSwuyk/ba+w7LtfY4MUfY2rKwNEtgc@vger.kernel.org
X-Gm-Message-State: AOJu0YxngyQvi538k3l1qg4UmNzVVOYIZ1dq5VAHoEy5anOBp8ppIrAV
	Caqfgu7CgY97MopNaPuo3+A1o2iyAplG5fSYq9uw3B/R6TyfAPOm6b3YM8P+9j4=
X-Google-Smtp-Source: AGHT+IGKld9rtmGQC3DBnDTbpXbiuKQNjTBpR+lYTXMLGlZV+jtXEFJDHRP8wtIhf6Y6NwwWQqYIMg==
X-Received: by 2002:a05:6512:3052:b0:52e:941d:7039 with SMTP id 2adb3069b0e04-5389fc70ef7mr1616146e87.59.1727426538329;
        Fri, 27 Sep 2024 01:42:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd54752sm226998e87.19.2024.09.27.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 01:42:17 -0700 (PDT)
Date: Fri, 27 Sep 2024 11:42:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
	konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
	neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 3/5] drm/msm: mdss: Add SA8775P support
Message-ID: <lpxx7xa4j2ghsj4klcbmribpvl3dzksy6zblbdo4zt2huarzmv@zz4yomzsdwli>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-4-quic_mahap@quicinc.com>
 <35e6yleiy6wkja3ojlfjddifxv7kr7x6tyn5pszas2chouuvql@trpeb7b4eop2>
 <2414cba4-53f2-4aec-b87b-9f8d92035bad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2414cba4-53f2-4aec-b87b-9f8d92035bad@quicinc.com>

On Fri, Sep 27, 2024 at 12:14:16PM GMT, Mahadevan P wrote:
> 
> On 9/26/2024 6:32 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 26, 2024 at 04:31:35PM GMT, Mahadevan wrote:
> > > Add Mobile Display Subsystem (MDSS) support for the SA8775P platform.
> > > 
> > > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > > ---
> > > 
> > > [v2]
> > > - Update commit message. [Dmitry]
> > > - Reorder compatible string of MDSS based on alphabetical order. [Dmitry]
> > > - add reg_bus_bw in msm_mdss_data. [Dmitry]
> > > 
> > > ---
> > >   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > > index faa88fd6eb4d..8f1d42a43bd0 100644
> > > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > > @@ -573,6 +573,16 @@ static const struct msm_mdss_data qcm2290_data = {
> > >   	.reg_bus_bw = 76800,
> > >   };
> > > +static const struct msm_mdss_data sa8775p_data = {
> > > +	.ubwc_enc_version = UBWC_4_0,
> > > +	.ubwc_dec_version = UBWC_4_0,
> > Just 4.0 or 4.3?
> 
> 
> UBWC version has to be 4.0 as per UBWC reference document of sa8775p.

Thanks for the confirmation.

-- 
With best wishes
Dmitry

