Return-Path: <linux-arm-msm+bounces-39328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 125A09DA94B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 614B9B22778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57331FCF7D;
	Wed, 27 Nov 2024 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qidVPDIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA121DFDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732715520; cv=none; b=GOUKmog+XdEW3B14sUhSq89o7cawrmYHQMGsmwPVcfLS4Fk1/+ft2iInfLC54kHDvwdRBM+3/8L6JNI6Khdno9Osz666coWr5bo8O0JOoiVXHPDpvMds+KlO7T9AIuocxa6CT23ZF/ZBGKxZxidS+lddIddNmdX9yF6bLiy6BDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732715520; c=relaxed/simple;
	bh=xBsYgLoC7NlLjvzJe9wyiz6rymUCb9R/llzvivHufJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI9YudLs2Q0zRKkSha3EGpHtxmt7cHCpijmZt6EuHkYo5yMCTkMPgL4fc/YHqPUNVMsSBBpGwKMKO+ey7ud7aL93zvNfjNIMHP7iHVsjZTQhd4lkJBxW87Et889KU7CMF3sNs6/j/gQhXK0wUaZN0CfjgXVGaWUyUSMSxY5c/8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qidVPDIE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de84e4005so2966417e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732715517; x=1733320317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4oRJCCe2Um5R31F+gAGqkSP9r7+5D01i3fvjJRVsk2g=;
        b=qidVPDIE4lKsyWaJaUZp71g9dxnrwn0hTaSdiKu8F7W+LyByembQ4FrsP4zC32GDat
         AJBPtFbW2ndZmrA7ht1Nl7VVr+HJu2k9TFmvMqVPox4Oh9E/tZv8WBu42a/2hC/YUNfF
         +UnHPqGnqi3/w1u4gSIfZyDyuYH3h8aYRbUdqksHvi9kkqX0//LARdXxKkHBm/yvvvyy
         uqhFn+ssSme/27uqG0FCV8xsoe20eAueTgLwT63hD+SomPleaCL1ufpkp/UH6eJvSb7w
         vMMi8BIL60hbJvdszFbSbb9F0D7eKuCif9mcgzDD7YaympQeC5LQQjRedFamSB90APnx
         rkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715517; x=1733320317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oRJCCe2Um5R31F+gAGqkSP9r7+5D01i3fvjJRVsk2g=;
        b=VFGZ3mI18krFLlG3C3v3tbDEmnAt6m3wgg5srIHmlKmWd5C8I5AeV58Pxpodf4KkZH
         BCZsJDDTojBPU6k16QEkWsjCFdG5iDhW5xWPP7W6JsPsfQXUWU24jvxwK+kgeHyC4N+5
         x+qoIj1a+XVMH3Gy06uYdI2/abUGHF/RTJAS2BIbUxodzy7OZNmGwy1Y0gsz/Fh9ofah
         8dhGmX/boYDu49CHo7I776ew6qz88fRzwRyWfmKIxgvInrhb6c/zveNhbup6mGUCy9oW
         O8/mMnIHdaMfdX/bCRBxXpU8gJEhyreEss/wQ5qa/YXlpxtNZFOWc666TY0ydiQygDVs
         bpYw==
X-Forwarded-Encrypted: i=1; AJvYcCVGhCPRrf6hoX8hhsnC8DGeuUfzFb7LasnylXj4emc1wVMjVdLFUngJtteY6CtP5oo+5PzNZpoyMKRcc7lQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6KIVBjCdUi6KrMTzwkO2FsAveJH7PA7v5lXAIDdy/gQnkJX+W
	Lgkawe8QFIikqKBt/nTI0G1ItkWBvcJ0ZDtA2TguuM/gPmR0Gor0dvGsSsqv62k=
X-Gm-Gg: ASbGnct28OaRGdawE7cW6q6AxK6TXN5sxxOh+ggMFQutxQ04oM1GwlDqM4Dhi7h/crx
	GEGs1lPLb0IF3AbUFjTjrtSa6qsnJdIqsQ4rkjo96VdvJnerP2+FX1AAdSV8xt6BehKV62BbkO/
	UsiBZ4PhviX2s8xE1nvqBJvCYQ4TNVIMC0IJBSCM0QLi2xhpwsuC4SIatXzspd610LkGqkIR17i
	SA4exxfGyDXp/EQ6JP0oDn44xa0jS7A9a6ln9S+r/I8Kig1uk7BDvLfOT/3RSeOmX4FtJ2jAL5Z
	p8JFPU6qag3my4ljLpXWeMojcco0zQ==
X-Google-Smtp-Source: AGHT+IHc+fYe+1gTHsCImj4rHorU0Xx7j65zTp85QvQyekS90THXiPR/B4iFgAfn3+Ms0AcxbnUmhA==
X-Received: by 2002:a05:6512:3e2a:b0:53d:d431:7f3a with SMTP id 2adb3069b0e04-53df0108f71mr1810535e87.44.1732715516740;
        Wed, 27 Nov 2024 05:51:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53de91f1e26sm558382e87.25.2024.11.27.05.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:51:56 -0800 (PST)
Date: Wed, 27 Nov 2024 15:51:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <amhqdc6kv6vd66bwwyhozlqptqjzuefddiabgw5ndko3rj2gwv@5choqknbpeb2>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
 <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>

On Wed, Nov 27, 2024 at 06:54:10PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/11/27 15:13, Krzysztof Kozlowski wrote:
> > On 27/11/2024 08:05, Yongxing Mou wrote:
> > > This series introduces support to enable the Mobile Display Subsystem (MDSS)
> > > and Display Processing Unit (DPU) for the Qualcomm QCS8300 target. It
> > > includes the addition of the hardware catalog, compatible string,
> > > relevant device tree changes, and their YAML bindings.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > This series depends on following series:
> > > https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
> > > https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
> > Above was not part of this merge window, so nothing from your patchset
> > can be merged for this v6.14.
> > 
> > If you want things to get merged, I suggest decoupling dependencies.
> > 
> Thanks for reviewing.Can we keep the dependency on above changes and merge
> our changes after the dependent changes are merged?

Just drop _all_dependencies from display/msm patches. Otherwise I won't
be able to pick them up until 6.15-rc. Use ephemeral DT nodes in the
examples.

-- 
With best wishes
Dmitry

