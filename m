Return-Path: <linux-arm-msm+bounces-39805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D51159DFD47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62A06B225FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73491FA16B;
	Mon,  2 Dec 2024 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qvr61mc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3D1F9EAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132133; cv=none; b=ebvyOuNJic+0gZ/izEgcbh6px7gTRYGSb4bFUk0c0TJ9zRmNkTsFIwxoJWtThxBvOovcdUpYYSFRmM2SNMlFLllSV/jYgg8Iai+ER6FT5UGJyMSIYqBAkdXuFrNNUyTrrrydbXOIevGMtEPxp3dUl4Cp8On5NtdeRYHWtYIIUR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132133; c=relaxed/simple;
	bh=6autZL+1MODvSSer7+vC85PoRulLEMMO7PS+fzCsIgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkFDoaOO+230DxK6H6ijHhtS1R7y9DaKXjUHGeePd+fFMM5VzK8O8nxmuwUhv0pOd8jlcqo3V0IrBMtwDKilq4ik4FZGtuHMsVSgq0OkhEpwWh3tttp2BVXpbFjVgu+rkoe0L3cjDgR32zVtdG/Q/F7SBVRoMGLxHnLC4kR1iIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qvr61mc/; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so40789431fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733132130; x=1733736930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dt2TVt20eO+6fZpSm814SQa3ex5u0vscKnXHANIdRWE=;
        b=Qvr61mc/OtwDzDfNKliRuBG9NOewazCrtpdYR8EdMY4ULKN3ST4Ydro0W8rDeJx9Re
         r7OkJ21Fu0CkIHAi9Chf4q/8NHLNFfjFrr/jnUPwoHrTAbLq4bFwwt3CUrXvnaz3XzJd
         4ALslKyM9nYM0IyPm7PxX4HOwE82+Fus2ZbEJgAVUxhBJKuNCUDQ/00/Zl8cjQvLQa2D
         XUuaUecUbin9suGOkOpUTeXI3C3nLuQjsamCSvrsI0MFBu1oJxBVbrN3Yx8s27VkydJu
         aVFi2HF4JfCbsMOAS9kCFr7auoeJweoZFD03RkTeQroWr6vfLRIPyxFeOVzE+El0bxWy
         aeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132130; x=1733736930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dt2TVt20eO+6fZpSm814SQa3ex5u0vscKnXHANIdRWE=;
        b=jJEXHE3YYySKRO+mHwQTo+HTuLeQjoeTASP56Iqv2F6o7/jqsj17cxhnAgKA3phH8d
         OYoyNOZarhyonS8bPr2bv9VUp2Syw9EYGcgX3d+eeEHhxiihY75WRYzgfTBkTcA1bJGu
         jEP8vocAhFi+goQuYXtUvxaZt71ODo2747oZtMHxxsrV4ymhXwe13VC/Ipb6tR1mgTsZ
         K4pCDdmOfbBrwF/3qjWQJgbEyLQkaDhDRvZ2YVodsAjoSkzb0WnEigY+8PA1Lt7wHiqe
         U54q5vrSm7QcBrQptHejp5vDoel8GwtsnfpdMWdTz090x//HTWHfSEobCs5IcNyRF806
         luDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhcxc57ZWinLP2lsprdE+AD19zq/YX2YO9NaCByYpjfhq6/7a6sIGFQlLniCjb98Dw//7yVWIgDQHgi6dJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwobAhcSSpZ+FobxTMLhSM0LoBJxnAvZ9rbPZFoa2NrdqtdhTjg
	9FONqHkGt+dTVL7Ack+WcLtl3Lkqj7gD4lApdF5K0xk8uwj5+JbpLw/iUmrqi/4=
X-Gm-Gg: ASbGncuAMpPbIHEeOAL7H01Oee9/z++keBCmDxu3UC41Cl/M3S9yqhvQ2305zuSJspF
	2Myi0SbJo9Eisev8dK8oTbw3N7nVtmZIqvTGZMwIsxbjwpY2JG5Gc0qxj82RC0DBc49F/sptH2x
	Ic+i0CsnNnUg6w9CXoqyFn0h989l7FJ6eAuYWzZQqf8lz46qlcFgHkFvkQ0YmSBbF7/YYDGBmmN
	2DImVJUHD0WhjPrvvWKhUHL+2JEE7Btd2u5nr7YAU0WrBM9bVYRoGWvMSHEF9CelXyO5syD8D/A
	jwvx8DuuUlFq3lk+r8V77ICZ+M8v6w==
X-Google-Smtp-Source: AGHT+IHNU47uQDa5zlYUyUe13GGmMqDc5+hiwAOH746/APHiIUBloLMtC0ny5VGjuUcBVKRBt4XeOw==
X-Received: by 2002:a2e:a987:0:b0:2ff:c8a1:c4d1 with SMTP id 38308e7fff4ca-2ffd60ac1c8mr100084341fa.22.1733132130015;
        Mon, 02 Dec 2024 01:35:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfca1302sm12472391fa.103.2024.12.02.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:35:28 -0800 (PST)
Date: Mon, 2 Dec 2024 11:35:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Add support for multiple PD from
 one process
Message-ID: <pqes6ixjbcvvicnfairzmy4gqokffy5aixqnadu2exi2d5rxar@ywify4ambmtr>
References: <20241202064806.1164800-1-quic_ekangupt@quicinc.com>
 <20241202064806.1164800-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202064806.1164800-2-quic_ekangupt@quicinc.com>

On Mon, Dec 02, 2024 at 12:18:05PM +0530, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available.
> 
> For every call to DSP, fastrpc driver passes the process tgid which
> works as an identifier for the DSP to enqueue the tasks to specific PD.
> With current design, if any process opens device node more than once
> and makes PD init request, same tgid will be passed to DSP which will
> be considered a bad request and this will result in failure as the same
> identifier cannot be used for multiple DSP PD.
> 
> Assign and pass a client ID to DSP which would be assigned during device
> open and will be dependent on the index of session allocated for the PD.
> This will allow the same process to open the device more than once and
> spawn multiple dynamic PD for ease of processing.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> @@ -1480,6 +1481,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>  		if (!cctx->session[i].used && cctx->session[i].valid) {
>  			cctx->session[i].used = true;
>  			session = &cctx->session[i];
> +			fl->client_id = i + 1;

/* any non-zero ID will work, session_idx + 1 is the simplest one */

With the comment in place, LGTM


>  			break;
>  		}
>  	}

-- 
With best wishes
Dmitry

