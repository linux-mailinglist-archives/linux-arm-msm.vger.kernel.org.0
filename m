Return-Path: <linux-arm-msm+bounces-27741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FD94534A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 21:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA911C20969
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 19:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E321494A4;
	Thu,  1 Aug 2024 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qfii001q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4F14A0AA
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722540193; cv=none; b=poich/yN5KAGnZQatz1B2ulxnPRIAaFR/HHghDijEXhh9wAxSfdPplSLR1xJ0V4OKuhfmQSHuxHZmAsPQYv6/z2j/wAK12CsW5YRXSDmDRpsmhbAOLzGQlBnEiNogHivPyy1nqbyVRMvZntGuqthmuMnkf9EcH7zTJ2RnQqnnBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722540193; c=relaxed/simple;
	bh=DwyodiS0fTxDrN+erUN9D3bUI+I3Vk+4SPA8PXcnvMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYiG1LahyyXzQ3OvwuiAC3Q8kioddPYGVy4iU97OUWWlpBH7lLQQFIpmQU7b+XJ5Gs5tLCqN42/JgJNpONOStK3yCeZrajaML4z6JCaeP1ZT+A50wkeYDxGoQpwnfGYs5G7CF2q7PHRJFgsGS8R8PQki43qAO+mKk589MYO54Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qfii001q; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efa16aad9so10546377e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722540190; x=1723144990; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LK2JaRxlZJvvWZ7XmVupWlUeuB4UTfLIDaiuYK2XiJI=;
        b=Qfii001qIqxoOkktaB/tRIrgREaGGPa2SUpRuIMqUrqZ8v+eRAeIBYp4QzD5Wui9bY
         TwqnrJKrF1ulOcvWuxpSyHVP6jK3vLVZKUNzJlZGcJdyQQJvbUr4VdTBaBwNLdNg2dnn
         eoIi+3m7br+hZc/E4l6YYwBSdpBTuzE4yrD8OePlGb3+hrVb810XorgGZXlnXeMuV4Sj
         H6jPpJEAekQGlTBGVaNULICXaJ+Fj25BicJ0VdcIIKBU0ths+FOmQ5SY4Vs43+zHpz+W
         WDzGOiPi4Z6D/uSoRI59egwug6F+jGtpds46tWVojXSKNiUHMsbb0gi/YrTJvltRdr3J
         5N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722540190; x=1723144990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LK2JaRxlZJvvWZ7XmVupWlUeuB4UTfLIDaiuYK2XiJI=;
        b=sn+815Mqq3PDozrHGuX7VsGFv6Lsde1eVhOHTptdtiQbc2DyGTM3Wyn2i1HyC8PHB7
         jXLw+iKTcpp36ffgRSJn/6sImlByyY5slxQ8ndNqf2PyNYD2jTieaZNRoXTVrIbnuvP1
         uqGRM9Yt0YxYTDZYEy1c94lMHhPW0hgfA5EK2DRaqLcvq8RuQ2WVBepyd4bw799vx2dQ
         /7iFMsT3zr5pqP+0QxkFD5YeNcA57FoEEyN4tdc+U+dklo4mzrYuiAov/Jnb+FcmRgcC
         5lIaaxCag/tcv0LB9amNrzN7FYfYgVlWeWzuXAlBC2lqO21uARg+jT7jgmdc98v5DZ+I
         Rd4g==
X-Forwarded-Encrypted: i=1; AJvYcCXUR1tLWwHPuLTinLcDEKOAETb4fqjXXeGGfaVGpsV/aAb5PzPEeb1xWIOD8MXkYuFAlcLQjp08hzZ9ErxRbWNZtgmSeIQ0NpsGkElAeg==
X-Gm-Message-State: AOJu0Yz3kKII3JwV1lqvURoES8NbSWXq4JWF7sPvUpE2oiq5KxAuxkic
	HSd9LivIUZ9jReaALpXH0MQt4hAHDHqvVfpHzwg1KG9O5at2ez+owOprpPBGiIo=
X-Google-Smtp-Source: AGHT+IEmCOTve/tmT4aAkKKsiEMlQ1kFkOvvakPslX+G+PfidoXuchkcJVQ6kX/awfiCwkIF1/SZ/g==
X-Received: by 2002:a05:6512:3a8e:b0:530:aa09:b6bf with SMTP id 2adb3069b0e04-530bb36c421mr668017e87.24.1722540189501;
        Thu, 01 Aug 2024 12:23:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba35252sm33123e87.196.2024.08.01.12.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 12:23:08 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:23:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
Message-ID: <bg47c2noh3kcfl5tvmryfhxb7gdzql3i5wdhgd7d6xv3ctcmdg@xprfrdwhxs7w>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <874E8EE9-6BE5-4801-AB2E-536B6A160AF8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874E8EE9-6BE5-4801-AB2E-536B6A160AF8@mainlining.org>

On Thu, Aug 01, 2024 at 06:45:03PM GMT, Barnabás Czémán wrote:
> Should i resend this patch set?

No. It was the merge window.

> 
> On June 28, 2024 4:39:38 PM GMT+02:00, "Barnabás Czémán" <barnabas.czeman@mainlining.org> wrote:
> >This patch series add dpu support for MSM8996/MSM8953 devices.
> >
> >Note, by default these platforms are still handled by the MDP5 driver
> >unless the `msm.prefer_mdp5=false' parameter is provided.
> >
> >Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> >---
> >Dmitry Baryshkov (1):
> >      drm/msm/dpu: add support for MSM8953
> >
> >Konrad Dybcio (1):
> >      drm/msm/dpu: Add MSM8996 support
> >
> > .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
> > .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 +++++++++++++++++++++
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
> > drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
> > drivers/gpu/drm/msm/msm_drv.c                      |   2 +
> > 6 files changed, 678 insertions(+)
> >---
> >base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
> >change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
> >
> >Best regards,

-- 
With best wishes
Dmitry

