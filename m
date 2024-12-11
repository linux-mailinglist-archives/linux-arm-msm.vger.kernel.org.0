Return-Path: <linux-arm-msm+bounces-41447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E72949EC875
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD5621642C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7935B2210D2;
	Wed, 11 Dec 2024 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fdy1xN+b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936242210C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908131; cv=none; b=um2Sk6Par0bEWfcl1qSPnTtXt5tyEkXvmM6gPrh7S1tF1rsp6yoDH0ci8mCweLqWAgE1i2zp5adcn2wFckcY+OWJVLHPr9XXmFLdAdfMGkw8CJjYEyu0LGDO7Za4T80rN80PpTmxzmyZCZdjjjJUgjQiXJKZy44q8VFfyaVCs9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908131; c=relaxed/simple;
	bh=/LIgJnzCbqzJuTqbvSMCFhlSCDOqqbcZpQ7MPJ4mhdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDbwv1taqKg2zYBhxwab1zL5KCpQ9qXyS1WWFLEQaELpO1SU0/xvBkEJn2LVRzUah3YZrCDpeEyMo3CbYgzKD4NXh+IyB9vPfKIVHITVQkCOvYnIyF94W4NOnasOJaINeCqfp1lUkEjGpLZqHxXr4gYQcj7JgPiiip1Up4QkNlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fdy1xN+b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f664af5so2571235e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733908128; x=1734512928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9vEtBjFWv0oJ9eIaHpJrX0BFB+4qp8phO4ofGzRE0Nw=;
        b=fdy1xN+bGV4jtA9pu0Ud3SNvpXAzDudKrRRYlqzfLCVFXhcrzBK+As9/u9gexAMjpS
         JtEXtsvWjZPfWzhdjLELVisLIxQnQUjU5xQTQUlrPWjefpaJfwrdDVrlGiPf74pgBOEW
         p5lhNPngzsD5BY4m+1uFTTPfhsx3+VQB3wWPJlMrNaHnWxytvnkkWUHCvvlvUnUOmOly
         ImfcNl5ee98uc1WMghMQeMr4Ig8tYNFtkoNErADC7+cOVmVPRm3PXBw22jJv0dCtoERu
         cEHBdVVULbh7WfEwmR0aH3Ed6rZ7703mqDz82AIHtBd/zbO/z1xpr6zr35gBPziRWcnS
         pcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908128; x=1734512928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vEtBjFWv0oJ9eIaHpJrX0BFB+4qp8phO4ofGzRE0Nw=;
        b=AdKN8Kh/+Wpo69RtA/qT4kG0ciIgMxExsEvEodoUp0433gB0kiyleQCUoeh1o0rSHm
         3PTABphoIAojHlDMLlM0nYP5Lf5oF+xCQBHLIcguMeFA2LnIwrvKd0dRUlDT4gxAy4+n
         pWt7tMQp3C3e11TLuT1TZetdsonijFNXvMfLEn4PwwWEz3KSqUabq2yO11nwtthFngPZ
         GV4Use0Cv5ujTv0WBohDGe6eaz9D9LDWcNLzxYhgGIMBFLf0UEPzbWoX0mYsSWpCXVlK
         2h5bY5rsQWqlpn8bsqtU218Jqrm9UzHDaYT9xOZGRELlWmaUKfg97P/0WwxBnZhxcMzn
         RGxg==
X-Forwarded-Encrypted: i=1; AJvYcCVEgoCZ5VT8SB/YCaGjVnl21TeWQp07maLtOwyUwsSct8aoF+Lukg7OOYmhOLEbv8Ccohc3FpS0hQIEQZxV@vger.kernel.org
X-Gm-Message-State: AOJu0YyiGFaiGGY9TdZsToOd0PJadwZVyqC6mFgzz9EJ3IlgdChm/8RB
	wcpX9QJkeIaU0794Uhpnh5wozYR4DLPFOZQYH59CrdFRZ3S4Xsx8OTGChypPGAk=
X-Gm-Gg: ASbGncvKMfDXe3WwwSpJ9Q4JcJu12eYrUs2Psx95PcPMrp5ksFXIOtVEttueNwNJPVR
	xO0fk8llt2w7nau24wlpyaa8ES+bzTqRO2dEpEJJoGFR6m3BBh9yB4hWdMC3zwszwK1awsRlib7
	Ou5765K5so5LaTHB7uoOqg6RVi73p7pa/ZLe3lgNeK1RhVsbrepyBdOKyWL61en14j82/IirYFR
	Fr3J8TyFj0ncOC0ipOE7pISHaooED6ektLoKbJbaxO21Y9jJl80
X-Google-Smtp-Source: AGHT+IGD0J/JRFizsjyOq9cq12J2ujkcAmyNKzRhsrMcAI97nrwbSWWcCwaN8qi6JkWUTmtl0C7NHQ==
X-Received: by 2002:a5d:64cf:0:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-3864cec5b76mr1446900f8f.42.1733908127884;
        Wed, 11 Dec 2024 01:08:47 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4815sm807610f8f.26.2024.12.11.01.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:08:47 -0800 (PST)
Date: Wed, 11 Dec 2024 11:08:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to
 control LTTPR transparent mode
Message-ID: <Z1lWnY+TxSptkBiY@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
 <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>

On 24-10-31 18:44:55, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 05:12:46PM +0200, Abel Vesa wrote:
> > LTTPRs operating modes are defined by the DisplayPort standard and the
> > generic framework now provides a helper to switch between them.
> > So use the drm generic helper instead as it makes the code a bit cleaner.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > @@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
> >  		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
> >  
> >  		if (nr) {
> > -			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -						DP_PHY_REPEATER_MODE_TRANSPARENT);
> > +			drm_dp_lttpr_set_transparent_mode(aux, true);
> >  
> >  			if (nr > 0) {
> > -				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
> > +				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
> >  				if (ret != 1) {
> > -					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -								DP_PHY_REPEATER_MODE_TRANSPARENT);
> > +					drm_dp_lttpr_set_transparent_mode(aux, true);
> >  				} else {
> >  					outp->dp.lttpr.nr = nr;
> >  				}
> 
> Could you please extract this true-false-true dance to a new helper too?
> This way Intel driver can use the simple helper, the rest of the drivers
> can benefit having the common code.

Will be part of the new version.

> 
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

