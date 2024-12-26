Return-Path: <linux-arm-msm+bounces-43374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9A9FCB10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 14:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E4C11882A5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 13:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAFF1D151F;
	Thu, 26 Dec 2024 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hqqonSAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE256182D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735218454; cv=none; b=pzVMvIBZkR1ymDtNpRKp76IJuRYzvgLl4aL7s8uqlx8qKtuj2llmSu+wvCluv2/M6sq1iwcW5niAFYDR6XYYQowsDmHuPskFzA5+JVYr9NFAgq4QBqRFuoC9ufKwfYK5QiiLSU6+sNnjSFwhXpkAbNqp2S9Z3lxZHdSSXlDLgE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735218454; c=relaxed/simple;
	bh=MaHDssHaNRMvy91h6r5mdzuZmUVHBeRvIY+1wGSWJAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vz5oMaWjGeazchqA8Ewr4qlH3teJ85uHhKkv4h0U+KNShvTpzpYmrYOIb0ms28xuo9gv1ftFqnTQu+ZJWZJDvjECZW+TlP/LyE/3pk0VyxOlWXwRsEUfou3S4Sg5o44fBMqR2pF1WKujGcDKsfLzaRQJxtcVNpIB9Vh/S/VfJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hqqonSAu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso68009495e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 05:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735218451; x=1735823251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2xYN5a7hOoppgoAE3bkR8Zunji5zT+kUi/AFcDG3CeI=;
        b=hqqonSAuQGlNGIfoBKb+UNNhD0cEzOx0fu1BsB6lacANDx5E6tRfN7YNJ55y9qR1wD
         oCV5z/8biRzKqHOrhJ1ZDyxBH9lgSxLIEvThAOPE20pcO3NrV69gK5uMyGM3BkAwyWaI
         K3obVsH+rngjU3hLxeG4kS7k41nr7IgqQCFSLBIiV2j0yDcZE8VEot11G1XqNJEXASyD
         79EjuXoAUXe0YbYDcJNAnmTpffB9EW+C5r72e89JgPsn9VLVEDFFUhHPpqjNiHnzi887
         auZbm+YssS98EcVupLILXen8OhjPJzIWBDEp13IeLCJghZJEd1m+R+KfwAr7JiazHAV7
         y1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735218451; x=1735823251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xYN5a7hOoppgoAE3bkR8Zunji5zT+kUi/AFcDG3CeI=;
        b=unS2zpd7GJdKy3+Qg80fK0FDt5Vz1mLIoSwz332T/6ML5a92bbcnarEuyYycE1/A2U
         o2ZozCDymdIdbD3pBUK565Y0Hl9HwOcBA5jJq3Q3NmCgp03AibJWFHrIVOvhoR/VvCEz
         atfE2yHMtmMSPOMjQ3h1uuqDyIWHF0KeJsUtbJ+vp3IwguRAhw67+nXe/kDXmO7dwS37
         v52BmT6oz86iAkVBUMwtOFhphAW4AqtdZN/BbMigFHzJBSngXGLUrbwf7soC//zweuOU
         doif8jpOoo7FNx6VYEqPSzGEE39lPwIYtb9qMkz8hXAh0/Iu5tGBpwDFLWL7ggXTDp1L
         aObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXa9bQBcnEShDG/b3rQRG9b7pcZZ9kFIG7TCv48Fk+Kf3BYVh3RHRe3aprJ1t/O2qDHh3cUqdHCBxWMTyE@vger.kernel.org
X-Gm-Message-State: AOJu0YxHh4axSyAIyFsDYu+KUgXlPC9j7LAUNcjlFSBK05LGoSo+SXnq
	t1FmHoxfoSY7t35VIgMNaukRD50CPYiLbOG8xHGYi8hsoCp8lBLj+Eel/R7y48A=
X-Gm-Gg: ASbGncv9Q35HV25a001o2WkJShdmcq7FahVQZbW5F2I9YfqwSazsu4+IFqkReDNiEXv
	VzBk6NloPko+yq8FgOg9JajY2Vp54ei5XXoZ3CgHoIkAfUO5ADwA/cGb9oL1YaPWmu1QlX7AFUL
	HN8DoNi5KVp17moxp6XezpxnCgFWqSdlBQMUxF1qiYgzbR2lDrZjuM11vYqHN9VAjO9gpqskmeA
	yfSv7v2mWCxVVorHQC+MBcMJO/R1wUBvJ6JQUEgyugrwBGNmpzIc2M=
X-Google-Smtp-Source: AGHT+IGvNY9x8znPid+jlSUugq+7Voy4lhkFD150p7UMeaZJEhSIyuzOQxvdWb877xCzmOFRcxCZRA==
X-Received: by 2002:a05:600c:4f11:b0:435:9ed3:5698 with SMTP id 5b1f17b1804b1-43668b5e09bmr177464715e9.24.1735218451158;
        Thu, 26 Dec 2024 05:07:31 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364a376846sm264591185e9.0.2024.12.26.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 05:07:29 -0800 (PST)
Date: Thu, 26 Dec 2024 15:07:27 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z21VD82XCOVgVJUh@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1mk08SHEd5_vc99@hovoldconsulting.com>

On 24-12-11 15:42:27, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	return ret == 1 ? 0 : ret;
> 
> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
> sure it never returns 0 (for short transfers).

Will follow Dmitry's proposal here.

	if (ret < 0)
        	return ret;

	return (ret == 1) ? 0 : -EIO;


> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> 
> This appears to be what the driver currently uses, but why not
> EXPORT_SYMBOL_GPL?
> 
> > +
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> 
> Error handling?

Yes, this makes sense. But other than throwing an error I don't think
there is much to be done. I'll add an drm_err here just in case. 

> 
> > +
> > +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> 
> No need to check lttpr_count again here.

So the logic behind lttpr_count and this transparency mode changing, as
specified in the DP standard, is as follows:

- If there are 0 LTTPRs counted, then nothing to be done, otherwise set to
transparent mode.

- Then, if there are between 0 and 8 LTTPRs counted, set non-transparent
mode successfully.

- Otherwise, rollback to transparent mode.

This last rollback might result in two transparent mode settings without
a non-transparent one in between, but AFAIU, that is OK. Making sure this
doesn't happen would just make the implementation more ugly without any
benefit, IMO.

> 
> > +		return 0;
> 
> I'd check for errors instead of success here and do the rollback before
> returning -EINVAL.
> 

Yes, I think it would be more cleaner. Will do that.

> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> > +	 * the number of LTTPRs is invalid
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> > +
> > +	return -EINVAL;
> 
> And return 0 explicitly here.

Yes. Will do that.

> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> 
> In any case this works well and is needed for external display on the
> Lenovo ThinkPad T14s, while not breaking the X13s which does not need
> it:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

Thanks for reviewing and testing!
Abel


