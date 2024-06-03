Return-Path: <linux-arm-msm+bounces-21466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D561E8D7F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610A01F25664
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D583757E0;
	Mon,  3 Jun 2024 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3Z/h0EE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B5C55C08
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408455; cv=none; b=WCXjr8mKAx0AZdIl0b+BFZ6tlevI7HJ84sH7KAfDEI7m0K/sm7/RDA+fLJF5B6UcEJKQjdFRzp63sIHuQ+X1q4luFJPLE751PwXBRFzxD4XjbT3g+4bIasCYxG7Z0LWcPsn2gWJp+xSjV3uz7+zX+9aM11TPY8RxV6BwfYm2vIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408455; c=relaxed/simple;
	bh=+peIGDXHdxeIlHYyGTPXWwFskoqIlU2pSwAvTqgsXzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P45CXItqBE5IL72/qLxLGyA0UscJH+aL3pHIhvmQWuXWErZE0VPuXP8kuZgp1FoPU4UIgskAe3yeaEoK4NOr/6Kq8pk6YVFkuuBKqzLG4bN1K3IdsNYLL95S8I3g4Z7+p9Bodg/78CUUMqZhpY65XkSrqtVUXGbZyQ/+rJCbT4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3Z/h0EE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52b90038cf7so2447296e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 02:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717408451; x=1718013251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLkk+c5ginN4XRe+KwhOHqTxhUkkoXVpQz89rhzf+lE=;
        b=k3Z/h0EEiOqQcw4cIR6sOF5UTDvFCRZJbm5c+PiGTJxEVYzy2JG6OYe4BB1tZqAygN
         wDkVmGqhRqG4bXaqPy8IIQ2mxv9wmJh611vMsf8Emk1YSq+htgdqrgOVrY6v3boQHt6A
         sXzYEZEhysPWnNRVl4F67ivBsvKewwB1tborioPrmBmNNMgyNL4ngGQmt9SUF/OAoF/T
         wpOhhMiU8+O5FyG5O/ZfWHjeBpj3wWNftTk3g3QEl5Dh6MMn/hHaZVgnN1WSdvhBIhx0
         gREISJTcnxKywPLqzkE/7hvgBq6mI/9SXK/qYFIprCXK5d3m0Pg+KBUlWvYR/Q+oMBvZ
         vycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408451; x=1718013251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLkk+c5ginN4XRe+KwhOHqTxhUkkoXVpQz89rhzf+lE=;
        b=fc3seIgnGrG5o3Z+Z6iZsnQgX7DX6fm3ZhrpVqB3aHkuTllZbMnwmM8/qLqZYRcohj
         b96arkCnMJTZa0A8/yTCueAe0OkLKFXLKazinU8io2ejAx1mYRFKzcZxlOot7SKjwHBd
         j4qaCsPOU2erBj2T1IOLH4AQIiFZM3UB9b6CTK/qUv5BUx7v5Ucf0BH5piM6+j5gr9A5
         qwJeGAR3CCa8Lo1PbYPI1mYtKcAoaaVbqDCANJhyFhpK28QFuc3l8vhijwk76JLp4aRu
         dJ8YMzs1i1auC0A8hwXOxJq823DjShU6tbUL/vGLLa0rSTg+qCGR88ZA/sqDsuobKypX
         HGcw==
X-Forwarded-Encrypted: i=1; AJvYcCUH7c8Fg3vuPDfP6oPUM52WESfDrxwCnCruNY9LOXREXt83sRDpCGffQo4crrui8bGsjyZqXPEGrWjs0OsRGHehClpg0Aamg56lnFwR6w==
X-Gm-Message-State: AOJu0YxZhK+9XW60zawrTh48DVBwwYf6tNEPWmIuzPtacu/x/2JwtcH3
	fdobGBV+ZFoe32wiiCkNAeANDrRzWV6n1ELrz5ZE12+ftaPKm3QoGS/xv23YIhJ78Aj71+2aNiI
	X
X-Google-Smtp-Source: AGHT+IEaQX/VHX/ClC4Jp5IPRoDYLsC8l7YUQq5F60Zuf49fhGK2CHsKvXUoSGC4g/yJ5Pnq14Jckg==
X-Received: by 2002:ac2:599c:0:b0:520:5261:9cd0 with SMTP id 2adb3069b0e04-52b896cd4f6mr5309075e87.57.1717408451359;
        Mon, 03 Jun 2024 02:54:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b98ffe95bsm368371e87.293.2024.06.03.02.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 02:54:11 -0700 (PDT)
Date: Mon, 3 Jun 2024 12:54:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v3 2/9] misc: fastrpc: Fix DSP capabilities request
Message-ID: <vbpvi2kf3bo7w6fkpz4axq66ql353ypa5e73l5vsgsdm64cevl@ldehdkav75qg>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-3-quic_ekangupt@quicinc.com>
 <zcqc4dgc6pippwiysybmkbvogfd6gbinnrw65kiulie3wlup5y@wq4dexvamo7t>
 <1272b70e-fe2f-47cd-af77-6d3461b8596c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1272b70e-fe2f-47cd-af77-6d3461b8596c@quicinc.com>

On Mon, Jun 03, 2024 at 11:45:26AM +0530, Ekansh Gupta wrote:
> 
> On 5/30/2024 4:29 PM, Dmitry Baryshkov wrote:
> > On Thu, May 30, 2024 at 03:50:20PM +0530, Ekansh Gupta wrote:
> > > Incorrect remote arguments are getting passed when requesting for
> > > capabilities from DSP.
> > Describe why and how they are incorrect.
> 
> Sure, I'll update this information in the next spin.
> 
> > 
> > > Also there is no requirement to update the
> > > PD type as it might cause problems for any PD other than user PD.
> > Also... means that these are two separate issues. There should be two
> > separate commits.
> 
> Okay, I'll separate out the PD type change.
> 
> > 
> > > In addition to this, the collected capability information is not
> > > getting copied properly to user. Add changes to address these
> > > problems and get correct DSP capabilities.
> > > 
> > > Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> > > Cc: stable <stable@kernel.org>
> > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 7 +++----
> > >   1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 4028cb96bcf2..61389795f498 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -1700,9 +1700,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
> > >   	args[0].length = sizeof(dsp_attr_buf_len);
> > >   	args[0].fd = -1;
> > >   	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
> > > -	args[1].length = dsp_attr_buf_len;
> > > +	args[1].length = dsp_attr_buf_len * sizeof(uint32_t);
> > As you are skipping first entry, should there be (dsp_attr_buf_len - 1)
> > * sizeof(uint32_t).
> 
> This was done in the next patch of the series, I'll bring it here.
> 
> > 
> > >   	args[1].fd = -1;
> > > -	fl->pd = USER_PD;
> > >   	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
> > >   				       FASTRPC_SCALARS(0, 1, 1), args);
> > > @@ -1730,7 +1729,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> > >   	if (!dsp_attributes)
> > >   		return -ENOMEM;
> > > -	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
> > > +	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
> > So it looks like the argument was correct. It was passing length, not
> > the number of attributes. The only thing to fix is that args[1].length
> > should be dsp_attr_buf_len - sizeof(*dsp_attr_buf).
> 
> args[0] is expected to carry the information about the total number of attributes to be copied from DSP
> and not the information about the size to be copied. Passing the size information leads to a failure
> suggesting bad arguments passed to DSP.

AH, so it gets passed twice. As a pointer to u64 (for the number ofh
attributes) and as a size for those attributes (via args[1].length).

Please explain this in the commit message.

> 
> > 
> > >   	if (err == DSP_UNSUPPORTED_API) {
> > >   		dev_info(&cctx->rpdev->dev,
> > >   			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
> > > @@ -1783,7 +1782,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
> > >   	if (err)
> > >   		return err;
> > > -	if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
> > > +	if (copy_to_user(argp, &cap, sizeof(cap)))
> > >   		return -EFAULT;
> > >   	return 0;
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry

