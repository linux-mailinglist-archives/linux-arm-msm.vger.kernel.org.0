Return-Path: <linux-arm-msm+bounces-31605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3A9769FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 15:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13987B229C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 13:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78171A4E82;
	Thu, 12 Sep 2024 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nBroMuoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E0185B60
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726146351; cv=none; b=ur+EXanJfBbgD2w9PwDV/lLmpHsT71R4RZg+MYBZdagxkDgnjj8sYIOoQR3ypTKpXkbyQBX+vz15RhA0GcKKgaxkwA6EJ6fWH0M2fa39q+rwrsLtRDaUGHdpFVstSItJL8Vn1qa9M5YQLJ/rJVfPeaRFfCAQS5q31JEEyua9BJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726146351; c=relaxed/simple;
	bh=hlkTgQ+vglbDbNKIx9IIYbTFpcT1SEwtfoPqz/sTgmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYP7qClWcvyUzldfTfC5zHBTltbvoDTcTuMoJ+Xm/O3kSPzZy2F9zuMLbT6X0JHisH/UKRP9JZochV3y+R2HU7bDQ5XOb9hfOEIGDvdCOco0n5UcW08Wluuz9ujIgPGazrMx0RYFr3yghyhfzK3fklySsl4DDXSSufTGi4yA4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nBroMuoN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53654e2ed93so1122556e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726146348; x=1726751148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PFy83Xo4HRlT4VMw6aQLtndBYeuj205BcBDL+FukQos=;
        b=nBroMuoNxVfkrNHZFuMq8fDb3uu2f2+vDz0ISdYwSOReqFuiNIi5y9TlFxfV4qlX6x
         JA8dLm50ESxmRNurm1bsW37eRdPPjkfu9NkvdckeaUl6mh22RbQR5M+1Q3HHmcXRDHns
         zoORC/zAKf967p0rzGAJP1lR5do2or05O+Rv3QlMc58+pHpb5AmbxAWfoxIbfPNjc7E+
         xTfw/YzyLh+aTAgNcDhMbJHSyVRd5YpPTLFPNEeOExJhu+rv/Jej+wnIUviD8UGBVyBj
         EraompsTVCkYrAUBX0cyBceWF63f7+yiRyt2GRH1wACU/iM3xM4NOrTnWSazU0xk+d1h
         RuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726146348; x=1726751148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFy83Xo4HRlT4VMw6aQLtndBYeuj205BcBDL+FukQos=;
        b=qyV65hNigy1HwNkBcLL02C9vzkP6Vrn261eFkKp8ZjqqLGGa4u/swCzlygQ52indQc
         9CpXzvZUMlhN1bO83U2DtnhCUyZW9A/acBZTHBvk6M90cGSSd1QssRKusMPRqkLf4y1p
         48CUEPvUSx14qkPmq0y8CkL4+efYOvmRGAwEinnDsx9PowrpkN+R6dyKshd0/Cyn2GDd
         e+IsXArhcUTVyxCB8RLXWb4D28DOje1LReqx1SP/q3fqTDtcCv7FHXB4wVvtBuGN8PDu
         uadCLAv+bkHqD79VcZaJPTYg8mF9Xvq3HoSMNmSQKP10jOmpM1luVUko8C+jofYffNj4
         NPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIFgM9fUPsFOI99MnvzDPnqAFkTIeZkLvLSZPuJwQDPKlL7/w+vSAdEmrSPlp3WaluHLv7mVd8op9mZe2C@vger.kernel.org
X-Gm-Message-State: AOJu0YwEynCabiO96rBASszN4MfYqg6K7uH4+wX2byNQOdsy3Tdk8rHZ
	Wim0lQMCsNm8/5V1P1B/52Xl9sX88waZHEwBJ6VXTQU0n03OV/O+20u7TGXbWhE=
X-Google-Smtp-Source: AGHT+IG9ZSiURirjUXz2mT5qhibORJ4JRGAIyTsfUR/UAuymDe2P71ZfmKMRfdgOKZSIFaKeDErLAQ==
X-Received: by 2002:a05:6512:3990:b0:533:3223:df91 with SMTP id 2adb3069b0e04-53678fbab40mr1562276e87.24.1726146346365;
        Thu, 12 Sep 2024 06:05:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903bebsm1882080e87.204.2024.09.12.06.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 06:05:45 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:05:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
Message-ID: <ki27iun7ar6nmwpkzykwjvkrn5jpadirbz6fy2c25akh2sbgpj@etbg4uo3hixr>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
 <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
 <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
 <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>

On Thu, Sep 12, 2024 at 02:50:04PM GMT, Marc Gonzalez wrote:
> On 12/09/2024 14:28, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
> >> On 12/09/2024 13:15, Jani Nikula wrote:
> >>> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
> >>>> On 11/09/2024 12:23, Jani Nikula wrote:
> >>>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
> >>>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
> >>>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> >>>>>>>> inline functions for W=1 build").
> >>>
> >>> [snip]
> >>>
> >>>>> GCC doesn't catch unused static inlines, while Clang does.
> >>>>
> >>>> It makes no sense to me that adding "inline" would prevent
> >>>> GCC from diagnosing the issue... GCC should simply ignore
> >>>> the "inline" keyword when definition is not in a header file
> >>>> (maybe they don't store "origin").
> >>>
> >>> Please just read the commit message for the commit I reference above for
> >>> details. There's not much more I could say about it.
> >>
> >> OK, I read 6863f5643dd7.
> >>
> >> My remark still stands.
> >>
> >> GCC's decision to not warn for unused static inline functions
> >> in source files (not headers) is questionable at best.
> > 
> > What's the difference between source file and a header after the CPP
> > run?
> 
> That question is moot, since the source file / header file
> convention exists only _before_ the preprocessor runs.
> 
> If you meant to ask
> "How is the implementation supposed to track the origin",
> then I would hand wave and say "internal annotations".

No, I asked what I meant. #include doesn't have any semantics. You can
#include "source.c" in the same way. So asking the compiler to make a
difference between source file and the header isn't going to work (Note,
gcc has some notion of system header files and I think a pragma that
changes the behaviour a bit, but we are not talking about such cases,
are we?).

-- 
With best wishes
Dmitry

