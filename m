Return-Path: <linux-arm-msm+bounces-20760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A0C8D1C17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5150B287919
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA6516DED9;
	Tue, 28 May 2024 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qisfLHyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A2816D306
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901330; cv=none; b=Qjcq+k2nq25DHym3nOurJqNJEXX0+6NR5/nzUnkJSE1EpsC+sIdq4JxmA5twJonddNu6p+NmvHFopvF2WqCsOtG48WJ34h1PxCDax89WePPXldsJHHd9F+o890IKT4Z2xm1TW6Ts4+VMTD71MPZQoZ+ylIyEyj6phgy/+uqidyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901330; c=relaxed/simple;
	bh=nVItmHmWfZpxTvU+SARBv92bdiu9gugUMh8PvSptDCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3dk8KTbOqTtpGE+4v61LtC7fjXmhJgYqChjIl8BnHD5vycUI/Z94lCUAwfuLtbzMGNp7kVaLKZL8B3jR+MDegKs+5BSFP+Z3s+d8OoOSPwNjBh4yFaXcD1RhMUDWCXw7urHHYLrZ3owL1NwRY/Dgy148AqXxV92p65JLY8y9yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qisfLHyv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5295dadce7fso1164552e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716901327; x=1717506127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYqBf8JNyTPdH+P7qD+kU/XiUFlY30r/EeoCGQISSVk=;
        b=qisfLHyvIoGzLjsFNqwZ4GwWZ8UEaMajk29Zk/0XKYZ0M4/wmckt2S1Ss7TBpxtx1n
         nCksrZIbrbz6xQXm+O0FNbsVrFgwCooKMwfADKH0lqrYv4nmmDfe8h6nJc6Hw94nEyvS
         /J/PScZxLymqUUGTDlepSLJBKCHr0kZw+63Y23MOPqtRjSk+cyRy+hP0DZp4OlHmRiN2
         G+InY1CgprB/nYTCA0W4rC20KkuHQF9FmUkfRH2wMyrjPvZW6+8PMMKCZ0aRPnnwxDSW
         yXP4LQSokP3H9YhqHfRPKeovDian4Qo/ClKWwcYg+pkBU7EcQHCbXxIfdPrw+WIOBMDa
         gPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901327; x=1717506127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYqBf8JNyTPdH+P7qD+kU/XiUFlY30r/EeoCGQISSVk=;
        b=rtpe2XVYJwNwrv++96Sh07FdGDPJZql60Z0bNTizxJ//impTpBQAqfdrJKnY24V6NM
         qxLpUj5tH7zScgYugJevglo/sGPHOiG2Dd6ELru4FHywbZy5vwlsscf4RBWQ+04Rv0Zl
         WSuI5hlSOlVnnnekrKC7nYuvzy6Q2RqEoK6e13dySNAHW7CFp2MLHT9yt5C7gzyMpg42
         DRXynnAHFm6n7OLrniS4qOugWmsGWVf+c1DDY4TlMxs69azj1HE/xT5opAdHnTUhEyy8
         H83AZvlv6piylaoWEJLeOosUKFSqzuFaH+4zi7hjnYscADtWU0WN8sS3AjwFWZmf1Fp1
         MjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhWAXElEYaU/8NOW866M4Q9TjrWPfvbLltcQ2H9dinDbRxTqNRs3LH87Jj7fcWVeJ5/nT3pFSXIrgKEhU8rWwgKGJad2hyM2KL0hTtxw==
X-Gm-Message-State: AOJu0Yz1HSrGPllFayvYm81MmLipOkQBGWlCqFqH3rLvPH2hb9/LyhzE
	cLPw3EA9Wg0Zyl0aXMmKrfqf0be99s4OTfuhJm3LYUdiB8kMoMHYVS0cZtzPpfWHv9IBRY89jfD
	G
X-Google-Smtp-Source: AGHT+IEFkIFlsPs9Cg7yr+8yjlt3pDw20emYJkDUHLfcLg5/hC4dxKSdsVXshMx4QDmQoBYZ9oSW6A==
X-Received: by 2002:a05:6512:33c3:b0:523:899f:c63d with SMTP id 2adb3069b0e04-529663e663amr9870168e87.47.1716901326475;
        Tue, 28 May 2024 06:02:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a77f6e55sm688940e87.118.2024.05.28.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:02:06 -0700 (PDT)
Date: Tue, 28 May 2024 16:02:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v2 7/8] misc: fastrpc: Restrict untrusted apk to spawn
Message-ID: <w26h3ufedlbv7rxwqkjin47snx37ljpduq442lzbthrdvdhowt@o4wujbbjlssv>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
 <20240528112956.5979-8-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528112956.5979-8-quic_ekangupt@quicinc.com>

On Tue, May 28, 2024 at 04:59:53PM +0530, Ekansh Gupta wrote:
> Untrusted application can attach to guestOS and staticPD if it can
> make root PD, sensors PD or audio PD attach request. This is a
> potential security issue as the untrusted application can crash
> rootPD or staticPD. Restrict attach to guestOS or staticPD request
> if request is being made using non-secure device node.

This is obviously a fix. Please add proper Fixes tag and move it to the
top of the patchset.

> 
> Also for untrusted dynamic processes, DSP HAL process opens the
> device node on behalf of the application. Add a check to restrict
> such untrusted applications from offloading to signed PD.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 23dd20c22f6d..7f81a18b8aea 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -332,6 +332,7 @@ struct fastrpc_user {
>  	int pd;
>  	bool is_secure_dev;
>  	enum fastrpc_userpd_type userpd_type;
> +	bool untrusted_process;
>  	char *servloc_name;
>  	/* Lock for lists */
>  	spinlock_t lock;
> @@ -1274,20 +1275,24 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  
>  static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_request)
>  {
> -	/* Check if the device node is non-secure and channel is secure*/
> +	/* Check if the device node is non-secure and channel is secure */

no unrelated cleanups, please.

>  	if (!fl->is_secure_dev && fl->cctx->secure) {
>  		/*
>  		 * Allow untrusted applications to offload only to Unsigned PD when
>  		 * channel is configured as secure and block untrusted apps on channel
>  		 * that does not support unsigned PD offload
>  		 */
> -		if (!fl->cctx->unsigned_support || !unsigned_pd_request) {
> -			dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");
> -			return true;
> -		}
> +		if (!fl->cctx->unsigned_support || !unsigned_pd_request)
> +			goto reject_session;
>  	}
> +	/* Check if untrusted process is trying to offload to signed PD */
> +	if (fl->untrusted_process && !unsigned_pd_request)
> +		goto reject_session;
>  
>  	return false;
> +reject_session:
> +	dev_err(&fl->cctx->rpdev->dev, "Error: Untrusted application trying to offload to signed PD\n");

Please drop this from dev_err. Use dev_dbg and return the error.
Otherwise the user can easily spam kernel logs.

> +	return true;
>  }
>  
>  static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)
> @@ -1376,6 +1381,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	} inbuf;
>  	u32 sc;
>  
> +	if (!fl->is_secure_dev) {
> +		dev_err(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");

Same thing here.

> +		return -EACCES;
> +	}
> +
>  	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>  	if (!args)
>  		return -ENOMEM;
> @@ -1531,12 +1541,20 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> +	/*
> +	 * Third-party apps don't have permission to open the fastrpc device, so
> +	 * it is opened on their behalf by DSP HAL. This is detected by

There is no DSP HAL on plain Linux. Also the question of permissions
depends on user setting up the system, so this probablye needs to be
rethought.

> +	 * comparing current PID with the one stored during device open.
> +	 */
> +	if (current->tgid != fl->tgid)
> +		fl->untrusted_process = true;
> +
>  	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
>  		fl->userpd_type = UNSIGNED_PD;
>  
>  
>  	if (is_session_rejected(fl, !(fl->userpd_type == SIGNED_PD))) {
> -		err = -ECONNREFUSED;
> +		err = -EACCES;
>  		goto err;
>  	}
>  
> @@ -1818,6 +1836,11 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  	int tgid = fl->tgid;
>  	u32 sc;
>  
> +	if (!fl->is_secure_dev) {
> +		dev_err(&fl->cctx->rpdev->dev, "untrusted app trying to attach to privileged DSP PD\n");

And again dev_dbg please.

> +		return -EACCES;
> +	}
> +
>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>  	args[0].length = sizeof(tgid);
>  	args[0].fd = -1;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

