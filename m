Return-Path: <linux-arm-msm+bounces-34829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 903929A30D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 00:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0976AB22809
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA58B1D7E50;
	Thu, 17 Oct 2024 22:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNTPLqhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E741D5CF9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729204601; cv=none; b=Qk0c3TC/h1/OvMMFdVLnH0yhDpujtMbeYdayqK5nyljN4rNpBpXD+1OBvobCoZuTshuEEWLjQ+00Ro3T/MP3nRU5T3QSKvJtINuBiFlKnNd0Z9UbA2jBL7h9Ofys9oqfQXrEQTcc3VZbAqL+84Lwz+XAQR120266GwiaB9yuz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729204601; c=relaxed/simple;
	bh=yTXBQ6hL1r8sU3dGmA4317fmoXD5lE7vEB14SeWW6hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMU3c+oWJWha/VTyvq8EaVe7hj8rtmFKloTZArxdecWsu9urPohH5GGTkBKky7f56dHibYe5HgsAud5ebzCywLOvACIBuNotspEgmA8+svXHECTxkccFCA2caQzOyvAN+j9XkkJIwJCrW+l1EsCj4ta4Dqu+fu8H6wSXC2dRkU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNTPLqhS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so1718833e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729204595; x=1729809395; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwAXFmWCXX0r1pv8K+QO23GJE7b+Aos8jpne2JMdjEc=;
        b=VNTPLqhSMjz64DrR2VtCDU5WzoFZPzpeQYCuWxPKj08Teb013YpksA8gf3GsOswK0c
         wy7KukBDve7PKRKUyw1ufS8YkswFKtolJqCI7Dv7eDSaz12gFf8vVu82V0Y3wSfkTa2W
         jI5Pu+DJFWxRoU44XQog5RZPHuP5QkrMHuIC1++MRbaVmhabbTZ7gjLCrlZ5yrpgl++P
         86P4MYznAxnjUIhcEQLfXe8f9L0DNFNBmJBW+Wne/C91Yjn8TXvS/AJAiZHSb4Tj8V+R
         dFYI29lvJKRMLxr2n/p6aH4a8TzVeT6CbPOmtF5VAvHQZQW6twk/30iqRcNe8kK17eUi
         dtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729204595; x=1729809395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwAXFmWCXX0r1pv8K+QO23GJE7b+Aos8jpne2JMdjEc=;
        b=EV59XpVgBv71clrfEih+JFuYYg520PzD+EzsCGA2dY4Jyj1ILnuzaRYpcUJPY+JmEq
         P7GUkEECyKeJQ/QtGVYoz5iiiLk7ZNeD4hea9Iw7UcK5in4iYQexTVZ4wiJJrwQnDf9c
         VPi7a0et3hKkG3e5ZizNkcifB6AVuEEbt0TXtimWk2bOhZk7DVT+P8wp9h9kESJ3SS+z
         NxL4fOlYVne7T6FFwzWJ85l4pAxbQW+BUp7CGKCqujCq8ursjjxELP9H7/DjlBbYSDRo
         9Jd8bHA8oPe4m6Qm06E8C5ReUlJBrIKzwB9aW5t9tFN7Q7aONFGzTkg4xA+n2FqSl+3h
         8rOg==
X-Forwarded-Encrypted: i=1; AJvYcCUB8EpP48IzsVeuPi4xV2z/r8FN9StDA1zlRYDCW428jm0VQnWWvR6BPNvCpam27xhcQOPrvZa7RungZLL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/7u9lBzKtWfKz48Tm9m+GtF2gV1TACZosCuxvrVVwO+D9i221
	ing+p7tirmw8yAObL0rma4/nQZXpzloAmFk7cVOA6OFpe4Ya54vlDRrSI3FCK5I=
X-Google-Smtp-Source: AGHT+IF1I4kSsNnrKhsbvznyz4HHMXNbr14OcwbceyeuR4/kwFXejHD9xQxDdafw6ngrjvMnsFbQAQ==
X-Received: by 2002:a05:6512:3b2a:b0:539:da76:4832 with SMTP id 2adb3069b0e04-53a15443901mr211178e87.37.1729204594652;
        Thu, 17 Oct 2024 15:36:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211c32sm46086e87.273.2024.10.17.15.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:36:32 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:36:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jean Delvare <jdelvare@suse.de>, dri-devel@lists.freedesktop.org, 
	LKML <linux-kernel@vger.kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	YueHaibing <yuehaibing@huawei.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
Message-ID: <zcwax3drscm2btazw3xc3i2lck62vzolg47cmsggkv4da23itw@w527axovqksz>
References: <20241015134606.5b87093e@endymion.delvare>
 <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>

On Tue, Oct 15, 2024 at 09:06:04AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 15, 2024 at 4:46 AM Jean Delvare <jdelvare@suse.de> wrote:
> >
> > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > is possible to test-build any driver which depends on OF on any
> > architecture by explicitly selecting OF. Therefore depending on
> > COMPILE_TEST as an alternative is no longer needed.
> >
> > To avoid reintroducing the randconfig bug originally fixed by commit
> > 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> > DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> > on OF. This is consistent with what all other DRM drivers are doing.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> > For regular builds, this is a no-op, as OF is always enabled on
> > ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
> > explained before, allowing test builds only when OF is enabled
> > improves the quality of these test builds, as the result is then
> > closer to how the code is built on its intended targets.
> >
> > Changes in v3:
> > * Rebase on top of kernel v6.11.
> > Changes in v2:
> > * Let DRM_MSM depend on OF so that random test builds won't break.
> >
> >  drivers/gpu/drm/display/Kconfig |    2 +-
> >  drivers/gpu/drm/msm/Kconfig     |    1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > --- linux-6.11.orig/drivers/gpu/drm/display/Kconfig
> > +++ linux-6.11/drivers/gpu/drm/display/Kconfig
> > @@ -3,7 +3,7 @@
> >  config DRM_DISPLAY_DP_AUX_BUS
> >         tristate
> >         depends on DRM
> > -       depends on OF || COMPILE_TEST
> > +       depends on OF
> >
> >  config DRM_DISPLAY_HELPER
> >         tristate
> > --- linux-6.11.orig/drivers/gpu/drm/msm/Kconfig
> > +++ linux-6.11/drivers/gpu/drm/msm/Kconfig
> > @@ -6,6 +6,7 @@ config DRM_MSM
> >         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> >         depends on COMMON_CLK
> >         depends on IOMMU_SUPPORT
> > +       depends on OF
> 
> Perhaps nobody landed this because you're missing the msm maintainers
> as specified by `./scripts/get_maintainer.pl -f
> drivers/gpu/drm/msm/Kconfig` ? I've added them here. It seems like
> we'd at least need an Ack by those guys since this modified the
> msm/Kconfig...
> 
> FWIW I haven't spent massive time studying this, but what you have
> here looks reasonable. I'm happy at least with this from a DP AUX bus
> perspective:
> 
> Acked-by: Douglas Anderson <dianders@chromium.org>
> 
> Presumably landing this via drm-misc makes the most sense after MSM
> guys give it an Ack.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

