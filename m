Return-Path: <linux-arm-msm+bounces-40367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A75F9E4735
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CBA8B30FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 20:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AED18E028;
	Wed,  4 Dec 2024 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b="lIvSMnZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2A1531E8;
	Wed,  4 Dec 2024 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344410; cv=pass; b=p45ksI5tYBWuXz2io7jjG4b50YS3U0XHSpQpIVG+CQylbKMukLCOaUCsG0C+UwYfg5/8okU0aOFRQcYl4KcWde0Z/zgdPhHdc279uSdDiY/xazSZH9RHltMccUmuFVuNMl/6TuTKNeIwuklOYHVT4lQ2VC9PvLIuixtC4RhN2aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344410; c=relaxed/simple;
	bh=Ol+JXb5Zh1yHNbSDoMk5CCk4Td4vgRfMN/hetZI2Lgc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=FaBrYealkM1hej3GF0IHIgytkpmtjiq2BoHCj/NnUbdrwOx8TjGVYHp/0IfQbf/S64psCTXsPMovr9jBtMWcb6d9hQKaULmbz/RpNQ1sv1i1NQXLJaMKwe4Q4UBWjtxMnx/BdR6JnXviupUx3QpCW9s6JgtNOKuNZHmmmbkrQRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b=lIvSMnZM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1733344384; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dmboizcmPLouPwkpAFlnvXlApJpw1fL/XD5uBeTZdda2O0IkEgLXgii8v6QBPLH18FQyX/nLW/P3Lcd2im0soN+J4boEmy0OjYvmF/1EK0wnZ2mgisk3BSYwZJv+FjvjyxiaBsfgGMIKGKv63KFV14IJBVI15twfCoz690gShYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733344384; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0WHgurEffc4IU34BPpyNJvfGIYmAwAM0WUxEVWgpiKY=; 
	b=eohVHJ9hjyT3FByzZyIGOEHJeTBONjeOh9b2hBghqRvJHfA6eqvigngzCwTyzbCH+dsbp1571VdEfFCCnkzjTsPdjN3OvkEAI8GYiapiiC8Pk7pAc1AcMJS8/iJNeIHOEmAlfc0VVJEdK+vlCdgAsuw1hPUv5DHJUWWKJTjOIic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=helen.koike@collabora.com;
	dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733344384;
	s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0WHgurEffc4IU34BPpyNJvfGIYmAwAM0WUxEVWgpiKY=;
	b=lIvSMnZM2jM/saNZpSynuPs79b3gtMyMJRG80cR6Kl1wv4gcIR3SERxF00551dbA
	Aq4LxLR/i+Xc+BZmMHeaG+xddm4nB5zJ0/d3aAxFTyNcARxJSkkYGOqECm2VWu1sZTe
	LE1aWXjCQoI3V45Z3vJdW4H8cf7uCOR/4EBjw/JY=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1733344382514675.959292617333; Wed, 4 Dec 2024 12:33:02 -0800 (PST)
Date: Wed, 04 Dec 2024 17:33:02 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
	"Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "Rob Clark" <robdclark@gmail.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
	"Sean Paul" <sean@poorly.run>,
	"Marijn Suijten" <marijn.suijten@somainline.org>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
	"dri-devel" <dri-devel@lists.freedesktop.org>,
	"freedreno" <freedreno@lists.freedesktop.org>
Message-ID: <19393604e18.f9b6fe7d298023.1937039548910081216@collabora.com>
In-Reply-To: <20a3955e-3d10-47c5-8e68-d70342805010@quicinc.com>
References: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
 <193931869a5.f923adf2270026.8321075661083367617@collabora.com> <20a3955e-3d10-47c5-8e68-d70342805010@quicinc.com>
Subject: Re: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail





---- On Wed, 04 Dec 2024 16:21:26 -0300 Abhinav Kumar  wrote ---

 > Hi Helen 
 >  
 > On 12/4/2024 11:14 AM, Helen Mae Koike Fornazier wrote: 
 > > Hi Abhinav, 
 > > 
 > > Thanks for your patch. 
 > > 
 > > 
 > > 
 > > ---- On Wed, 04 Dec 2024 15:55:17 -0300 Abhinav Kumar  wrote --- 
 > > 
 > >   > From the jobs [1] and [2] of pipeline [3], its clear that 
 > >   > kms_cursor_legacy@torture-bo is most certainly a flake and 
 > >   > not a fail for apq8016. Mark the test accordingly to match the results. 
 > >   > 
 > >   > [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481 
 > >   > [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430 
 > >   > [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770 
 > >   > 
 > >   > Signed-off-by: Abhinav Kumar quic_abhinavk@quicinc.com> 
 > >   > --- 
 > >   >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++ 
 > >   >  1 file changed, 5 insertions(+) 
 > >   > 
 > >   > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
 > >   > new file mode 100644 
 > >   > index 000000000000..18639853f18f 
 > >   > --- /dev/null 
 > >   > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt 
 > >   > @@ -0,0 +1,5 @@ 
 > >   > +# Board Name: msm-apq8016-db410c 
 > >   > +# Failure Rate: 100 
 > > 
 > > Is failure rate is 100%, isn't it a fail than? 
 > > (I know we have other cases with Failure Rate: 100, maybe we should fix them as well) 
 > > 
 >  
 > Maybe I misunderstood the meaning of "Failure rate" for a flake. 
 >  
 > I interpreted this as this test being flaky 100% of the time :) 

Ah right, I see, inside deqp-runner (that auto-retries).

I'd like to hear Vignesh's opinion on this.

(In any case, we probably should document this better)

Regards,
Helen

 >  
 > Out of the 3 runs of the test, it passed 2/3 times and failed 1/3. 
 >  
 > So its fail % actually is 33.33% in that case. 
 >  
 > I think I saw a Failure rate of 100% on msm-sm8350-hdk-flakes.txt and 
 > mistook that as the rate at which flakes are seen. 
 >  
 > Let me fix this up as 33% 
 >  
 > > Regards, 
 > > Helen 
 > > 
 > >   > +# IGT Version: 1.28-ga73311079 
 > >   > +# Linux Version: 6.12.0-rc2 
 > >   > +kms_cursor_legacy@torture-bo 
 > >   > 
 > >   > --- 
 > >   > base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b 
 > >   > change-id: 20241204-cursor_tor_skip-9d128dd62c4f 
 > >   > 
 > >   > Best regards, 
 > >   > -- 
 > >   > Abhinav Kumar quic_abhinavk@quicinc.com> 
 > >   > 
 > >   > 
 > > 
 > 


