Return-Path: <linux-arm-msm+bounces-32090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7AA97D6A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 16:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBAA5B23371
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD84617B50B;
	Fri, 20 Sep 2024 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPHB49cA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816014EC42
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726841239; cv=none; b=Bbr+3kEYuDeHt7FuPMhGD9aUmfu5959PNOfHS0C8dHxB5bNaNjoWms77d2RkEBYNAfGTSg4lSVzz+yoq9jcqTl5jHBjskpKS3qv7MzQwtQ0MlcqEpDzS5Sf9h5EYC0z7syaN2U7h3kKDClsebEIJaFB3j2bAhQoJTHXmZhxgCQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726841239; c=relaxed/simple;
	bh=AEu6JxS95nIYB8Uuqu4YM+KW3S4bY3rXZzWuHnv+fbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttz6W6hiWMG6B10rZaCcj/7RV5ZeHqOzHMOiTjEXSMhggQmBpAIxq6z+rFlRgCuNIZKSq7ndXyYMeyM6PBx182crO5zelR/tBZk3KhN/boir0FbHke9L7ClZlyduOfXjLZadN8rMlpXI+A7Ois9Ji9pscwoot6t9F2HNsLk3ZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPHB49cA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-535694d67eeso2234243e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726841236; x=1727446036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XR6IdWmHitP7P332IFjnOokOrIV9OMwyDCbtjaKXPzo=;
        b=RPHB49cANAU78i1PDFZwlSDr+67also0lfjugQSW8qoiAmfmDl2lUyhVGTuQfX62BR
         Ejc9eKfkS/vVc/ed2mS0jYRj8CYIZ+dZg1SdoHHXHeCk8MYFd3LHDrWW+hPf8QO8mjSt
         qgc/vW+oEEa26d7auVFSwp8okP80QMtOg4iJuEQdyGufXDPcJR9jWwsi9PWgBodR2lve
         mIcfLVrfu0tUYoqFnWeaScIQB1C+nwdiJTrkPdn06uU2Q4Vkk79YJLaILXMRiDZanX/C
         vsJCIHUcq0EXj2dWOWtQGFRIOKbMP4En13+bE/LlrEaF/g+BwEtd7jPrLy/OM4xjYc3L
         ljEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726841236; x=1727446036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR6IdWmHitP7P332IFjnOokOrIV9OMwyDCbtjaKXPzo=;
        b=La5F7l+GyqQdPJGyCaVhPJ7wcQiSTpLwJBlgBra924DJEIRgy9MQG9SEK54Hbn0KA/
         /mg6k36CixlMZ1/Hz8kgcKk3+yfeVOe4xWRaFepTzAdqMsqj78BtS0iNOoP2++npwJTM
         kaoOD1tYjuBUWBFAKbzghsCpDoeWxDq9gBGUPet0EG6UQCx0BT35oYtfCgTD9bDffbhQ
         08oF9CACdWGkjIThx1ox+Y+4EXchXuxvayqrzz36biSAITiP5ou86FhseSbhcEhtqc/n
         bn4B+iOLGMm7u6SwUlijKA4WHORsrOTROraJ6tncwzFsfXOjKZdvMyzMxj3hZwsOVvOA
         Bdnw==
X-Forwarded-Encrypted: i=1; AJvYcCXQfxBjxrChQ6S/ctBW4gOWhfWgWKvGPd3smc0DIPN1MmXOUNy38CfG7t4twqum4oAtaLTDL13fpNIjB0gW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/qvjXK7deoUetPk5xTvqjgCfNTSTeqq54t62/DuoaSqdnFhhk
	nmKCFrQO+ZcExUxqcZkAf5S5l/bSvakhAOTv50FYvbuxEMRoAXJ4kwC8zlv5rvs=
X-Google-Smtp-Source: AGHT+IHLurzQEveFr5icDDBH7aM0bbvjwbfkigvkkwHmyCJASisE8MbkHzSGUGtowApeAGzhFhgulA==
X-Received: by 2002:a05:6512:401e:b0:534:53d7:c97f with SMTP id 2adb3069b0e04-536a565c895mr2684731e87.23.1726841235886;
        Fri, 20 Sep 2024 07:07:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53687047009sm2186230e87.39.2024.09.20.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 07:07:15 -0700 (PDT)
Date: Fri, 20 Sep 2024 17:07:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd_mapper: fix ADSP PD maps
Message-ID: <5pl7cewea6bfweqcnratmcb7r2plyzwyofsmcjixtkzwx7aih5@tm5c34mmzzb7>
References: <20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org>
 <Zu0wb-RSwnlb0Lma@hovoldconsulting.com>
 <sziblrb4ggjzehl7fqwrh3bnedvwizh2vgymxu56zmls2whkup@yziunmooga7b>
 <Zu06HiEpA--LbaoU@hovoldconsulting.com>
 <18e971c6-a0ef-4d48-a592-ec035b05d2b7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e971c6-a0ef-4d48-a592-ec035b05d2b7@quicinc.com>

On Fri, Sep 20, 2024 at 07:00:11AM GMT, Chris Lew wrote:
> 
> 
> On 9/20/2024 2:02 AM, Johan Hovold wrote:
> > On Fri, Sep 20, 2024 at 11:49:46AM +0300, Dmitry Baryshkov wrote:
> > > On Fri, Sep 20, 2024 at 10:21:03AM GMT, Johan Hovold wrote:
> > > > On Wed, Sep 18, 2024 at 04:02:39PM +0300, Dmitry Baryshkov wrote:
> > > > > On X1E8 devices root ADSP domain should have tms/pdr_enabled registered.
> > > > > Change the PDM domain data that is used for X1E80100 ADSP.
> > > > 
> > > > Please expand the commit message so that it explains why this is
> > > > needed and not just describes what the patch does.
> > > 
> > > Unfortunately in this case I have no idea. It marks the domain as
> > > restartable (?), this is what json files for CRD and T14s do. Maybe
> > > Chris can comment more.
> > 
> > Chris, could you help sort out if and why this change is needed?
> > 
> > 	https://lore.kernel.org/all/20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org/	
> > 
> 
> I don't think this change would help with the issue reported by Johan. From
> a quick glance, I couldn't find where exactly the restartable attribute is
> used, but this type of change would only matter when the ChargerPD is
> started or restarted.

This raises a question: should we care at all about the pdr_enabled? Is
it fine to drop it fromm all PD maps?

> 
> The PMIC_GLINK channel probing in rpmsg is dependent on ChargerPD starting,
> so we know ChargerPD can start with or without this change.
> 
> I can give this change a try next week to help give a better analysis.
> 
> > > > What is the expected impact of this and is there any chance that this is
> > > > related to some of the in-kernel pd-mapper regression I've reported
> > > > (e.g. audio not being registered and failing with a PDR error)?
> > > > 
> > > > 	https://lore.kernel.org/all/ZthVTC8dt1kSdjMb@hovoldconsulting.com/
> > > 
> > > Still debugging this, sidetracked by OSS / LPC.
> > 
> > Johan

-- 
With best wishes
Dmitry

