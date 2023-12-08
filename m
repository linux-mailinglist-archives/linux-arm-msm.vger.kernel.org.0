Return-Path: <linux-arm-msm+bounces-3927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E495180A1EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98CE9281883
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAA719BB6;
	Fri,  8 Dec 2023 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="n6tEPVGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2710F1
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=m6TIva3oXYWV/hzB05q4rbwshxM/02SH0k7MC1nz05U=; b=n6tEPVGDgXxp/IE/vqT4Xr9QMd
	kdCHpldV0N75LsFaugQjQRntBG/25bHwyJtCo76TFzp3+iNRAxKVuHM6hZArgLhdPR1KANyYCnuMl
	NNzlI3bu3JAVRfH08digsEfBKbu4SOfNNkgW+xDCg4TzXkNPB2C7DMGvfziO/XlwpdDCQZHF6/Fc8
	toY9f2zUD1k5wpE8f0xY6KgtZupdQenq0hTRpURblYY2vQ1VXCiJJAijEEUaDZnkg3jMqHRINVFHS
	af3JmTgHocegRfLskP1abSIOkXVuEU0vrmce1VgJ2f+N+TIqcVKPEzbsfXn1exuuNWcco/ax7sSQo
	XR4HI73Q==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1rBYn7-00Bdos-AF; Fri, 08 Dec 2023 12:13:09 +0100
Date: Fri, 8 Dec 2023 10:12:33 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH v3 01/23] drm: Don't treat 0 as -1 in
 drm_fixp2int_ceil
Message-ID: <20231208111233.yp764wee4xkkhzff@mail.igalia.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-2-harry.wentland@amd.com>
 <20231206120316.eexh77nmt5dz46ap@mail.igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206120316.eexh77nmt5dz46ap@mail.igalia.com>

On 12/06, Melissa Wen wrote:
> On 11/08, Harry Wentland wrote:
> > Unit testing this in VKMS shows that passing 0 into
> > this function returns -1, which is highly counter-
> > intuitive. Fix it by checking whether the input is
> > >= 0 instead of > 0.
> > 
> Nice finding. Thanks!
> 
> Could you add the fixes tag? AFAIU, this one:
> 
> Fixes: 64566b5e767f9 ("drm: Add drm_fixp_from_fraction and drm_fixp2int_ceil")
> Reviewed-by: Melissa Wen <mwen@igalia.com>

cc'ing msm people:

Hi,

Only msm and vkms currently use this function.

I see many points where msm resorts to a conditional that avoid passing
0 into this function. For example:

	if (temp2_fp)
		temp = drm_fixp2int_ceil(temp2_fp);
	else
		temp = 0;

Can someone from msm ack this patch too?

Thanks,

Melissa

> 
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > Reviewed-by: Simon Ser <contact@emersion.fr>
> > ---
> >  include/drm/drm_fixed.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> > index 6ea339d5de08..0c9f917a4d4b 100644
> > --- a/include/drm/drm_fixed.h
> > +++ b/include/drm/drm_fixed.h
> > @@ -95,7 +95,7 @@ static inline int drm_fixp2int_round(s64 a)
> >  
> >  static inline int drm_fixp2int_ceil(s64 a)
> >  {
> > -	if (a > 0)
> > +	if (a >= 0)
> >  		return drm_fixp2int(a + DRM_FIXED_ALMOST_ONE);
> >  	else
> >  		return drm_fixp2int(a - DRM_FIXED_ALMOST_ONE);
> > -- 
> > 2.42.1
> > 

