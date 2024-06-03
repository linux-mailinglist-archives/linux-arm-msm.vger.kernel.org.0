Return-Path: <linux-arm-msm+bounces-21469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE58D7F9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2871F23A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94497824B9;
	Mon,  3 Jun 2024 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYbKpNWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E682C76
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408957; cv=none; b=EyOxxW8N1WZl1PT4uTl87HxZTsQ6ugan4zFvV4wPJwHbjRXOevPpmM3AX6SOG9SHRwHlQLU4pcnyR4vt3wZFaOmgCIMYwPl9O9RUyl91ptBdJIZTwbFOukHX/d0T2Ewv6HNxFIKM4ywiMziP9d983/62K9jZ6Q0AiXBRPvfEUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408957; c=relaxed/simple;
	bh=pTa5HCj2z6eTVOZMSCn+VDjbL0xjBXrYBD/36aWh+2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVAgHU5wRlsgu/iUzPxhA3fXdqFXzJ3ZLXlG26GOi+MJ40xdyG8BN8/1ISdf3YmYHlK7AhZu7rqy0xMlh4kjvuT4oU8yyxNr8dbI4wQSOCAq0762qFwlLxNKmfUfILz4lGAf+SPW9OaVUfPRzAuhYVbcRCdGUJyoeilafKuofdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYbKpNWQ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so18458791fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 03:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717408954; x=1718013754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ryO4ugnGoWUTuGXqo1VHRq3Edzl/w4ua4S104KUImxQ=;
        b=hYbKpNWQGTyF+tf8UsZasaGwJETWbsr2P0rnnCbawtpdXIHQFJsXFA4Va0BniTUUpe
         +qkTjgh1yKzOMaYACT8VsyiETYvX2oqal9h7mRsFgLpIGPGiwOPoYpTAK3dbpsm8YQr+
         dqs+nzwBd8mO/7sCzzK5Wnb81Y4Z6F5YGANhhwoU6CztqRl96ej7HLIlZN+QzCuBuYcd
         59VdjDQQ/BujmanXnclsskaT+lOxTDhCP4amU40gBBBrmFh9AmC2i8o+KL+EA4x7gYK8
         L8XKJWeFAToeqIvaCbTE1Q+YtVVYBQSgeVWMjFYeNTzgEFo8bes3aXJd7tKQTR1nY8D6
         N85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408954; x=1718013754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryO4ugnGoWUTuGXqo1VHRq3Edzl/w4ua4S104KUImxQ=;
        b=GsTZqGGjHJbD2HSwYooKoPEck7/+dgtfqqsJyLTm83Px2iw6x9KnB1M0p0rKXXlyzc
         RyJkOQGjbAd6DXigmkIJDyG/DoYzMtNGQKmycAT2Tca/vrZ4C2fxZnMdKAQJR6jc761k
         nE0GNvaflKZhPZMpPuahb02lEnmtWwD8SuoCNOG1CXA4ifTsEVUVd7tiGxteWAQtKcEI
         GNp/sunrqCNjRSlevnWVtKknhpJqJYfRWUnQ4Q87RNd9ag14fZI+mogwCEw1lVEgs//0
         tCd1xpRW/7UYHECVMA/xTF41QZX0YkeXsxtF/0lLuoCMusoL3AgJElPznqrHxzLozhcw
         pXbA==
X-Forwarded-Encrypted: i=1; AJvYcCVMgXYxPO6wCgpP+nJL6hTsXMpJ+T2Kppvt4/izvy0RV4wMBht6iWuejd2YFZNT4red4N7+rb+PuTx/eVLQhFOIjZCWFwK11P8TEr4V/g==
X-Gm-Message-State: AOJu0Ywdm1IHHCA7qs5Jm9tuJMLrfSD78LKE8ftz3sm0KlzlceoCChoa
	UK11fB7ejFKwt7xHV2wuEAiFERoTWJcTkylesRdcbi2pUXlIJqQq1hbmNJSFR6YIfdeiFhPqX7e
	y
X-Google-Smtp-Source: AGHT+IF1Be8Y8y0lMsq0meVFZ8v7QE7uzkpO3VUfxY3jGl/v3awRTdyAqEwp3Oo2e6RSb9hkDhKLrA==
X-Received: by 2002:a2e:3a04:0:b0:2e9:8497:46d2 with SMTP id 38308e7fff4ca-2ea951cff69mr50230111fa.46.1717408953704;
        Mon, 03 Jun 2024 03:02:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea9c5bc882sm9105721fa.133.2024.06.03.03.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 03:02:33 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:02:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v3 8/9] misc: fastrpc: Restrict untrusted app to spawn
 signed PD
Message-ID: <7eygwrefc43aaqeihir3odjhdseeewweqvabvq6jg5bbmnhrkz@p33mhebq5v3w>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-9-quic_ekangupt@quicinc.com>
 <q6vl2d7ekrjiwbr4h6cieh6q7vewhbiqay67wrglurphkigq4c@zoeyzywhypww>
 <6c026f78-d397-4375-a347-85f41bff1e99@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c026f78-d397-4375-a347-85f41bff1e99@quicinc.com>

On Mon, Jun 03, 2024 at 11:57:52AM +0530, Ekansh Gupta wrote:
> 
> On 5/31/2024 5:19 AM, Dmitry Baryshkov wrote:
> > On Thu, May 30, 2024 at 03:50:26PM +0530, Ekansh Gupta wrote:
> > > Some untrusted applications will not have access to open fastrpc
> > > device nodes and a privileged process can open the device node on
> > > behalf of the application. Add a check to restrict such untrusted
> > > applications from offloading to signed PD.
> > > 
> > > Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> > > Cc: stable <stable@kernel.org>
> > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 23 ++++++++++++++++++-----
> > >   1 file changed, 18 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 73fa0e536cf9..32615ccde7ac 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -328,6 +328,7 @@ struct fastrpc_user {
> > >   	int pd;
> > >   	bool is_secure_dev;
> > >   	bool is_unsigned_pd;
> > > +	bool untrusted_process;
> > >   	char *servloc_name;
> > >   	/* Lock for lists */
> > >   	spinlock_t lock;
> > > @@ -1249,13 +1250,17 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
> > >   		 * channel is configured as secure and block untrusted apps on channel
> > >   		 * that does not support unsigned PD offload
> > >   		 */
> > > -		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
> > > -			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
> > > -			return true;
> > > -		}
> > > +		if (!fl->cctx->unsigned_support || !unsigned_pd_request)
> > > +			goto reject_session;
> > >   	}
> > > +	/* Check if untrusted process is trying to offload to signed PD */
> > > +	if (fl->untrusted_process && !unsigned_pd_request)
> > > +		goto reject_session;
> > >   	return false;
> > > +reject_session:
> > > +	dev_dbg(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
> > > +	return true;
> > >   }
> > >   static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)
> > > @@ -1504,12 +1509,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> > >   		goto err;
> > >   	}
> > > +	/*
> > > +	 * Third-party apps don't have permission to open the fastrpc device, so
> > Permissions depend on the end-user setup. Is it going to break if the
> > user sets 0666 mode for fastrpc nodes?
> 
> If the root user sets 0666 for fastrpc nodes, it is expected that this check will get bypassed.

So, any process will be trusted? This looks so Android-centric. Please come
with a better way to define 'trusted'.

On a typical UNIX system a used has multiple supplementary GIDs (which
can be used to allow access to the devices) which have no relationship
to the process effective GID. On a multi-user machine it might be
logical that fastrpc nodes have separate group-id and group's read/write
permissions. But then each of the users has their own unique 'effective'
GID. Which of those should be using for computing the 'trusted' status?

> 
> > 
> > > +	 * it is opened on their behalf by a priveleged process. This is detected
> > > +	 * by comparing current PID with the one stored during device open.
> > > +	 */
> > > +	if (current->tgid != fl->tgid)
> > > +		fl->untrusted_process = true;
> > If the comment talks about PIDs, when why are you comparing GIDs here?
> 
> It should be GID, I'll update the comment in next spin.
> 
> > 
> > > +
> > >   	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
> > >   		fl->is_unsigned_pd = true;
> > >   	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
> > > -		err = -ECONNREFUSED;
> > > +		err = -EACCES;
> > >   		goto err;
> > >   	}
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry

