Return-Path: <linux-arm-msm+bounces-30206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB515965CFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 932962877CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE64137745;
	Fri, 30 Aug 2024 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Py7z6JZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC88416D4CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010436; cv=none; b=Htp2ra1A8XyaXSr7ctuqauFLE8T4d8LnVswGXArE/RudJVFvj2EWaT1iBmUVp/t7abrGo1XZmayqtsGWxOzWSMkHwjaUnmvPLWMFFTpJ7nN29qdqki7gVDXuk2oVi/LWdEyYwET1nBosUuUIFz57vGknLEbR70aJsHKhUwaUZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010436; c=relaxed/simple;
	bh=K/6Q4XKxc4g5s/2Thc+4PCqfiExTjwY3n+TmvP0BREQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkdY1MivzFjQZvBnu5YxmCEpkBJB+f/sTi9TChc19zfYgNnoUzZfxjqk3QnDzWSM7hrhRPT7SzYK+3Ll0dFrCT70JTpX9v4fC1rCyvELINPB/lhgLVr3uwWih9b0qRtVlC12AbHEQCU4HW9jsFJsX00T4tu61nua//Tbe4Uhqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Py7z6JZM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f502086419so14725631fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 02:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725010433; x=1725615233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBi99OhODTsy2YN6E/2v+2p0d/VBJVM6cM05LOFNmCY=;
        b=Py7z6JZMty4ie9oNYCIRz8881IgsfxwTf4cVZ5ZyAUhs0Yj/Yt8GAeIHFcXsfwsZ4O
         RzkTqh9MJwmrxkwP43lKAzPfx0B7sJNdKbP0f2xGzgux4DWOe8PavM+75KNoT7529TrV
         j+rpxGr2fLui9imrEFHq+lxtk1m8EE2eHZZ66r57aG4AQZ16GcfYCwre5w8QaQ1RpYDG
         LyHFv9L+Ef+GAsWeumo9mUw7iWeFZeGZVZS39RSm8aq7ReH4xN5I/FYM82mFO3cBmZbj
         cf+l46bBBhswdJv2Rug8zAoGjiojMXLGIOstF0Yorzsj4mIoj3HxQmNTDUcVYsLzObGj
         MKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725010433; x=1725615233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBi99OhODTsy2YN6E/2v+2p0d/VBJVM6cM05LOFNmCY=;
        b=oo7cVfChYzqE3Stbas/pHq6JJV0fWVPNnYZnJhVSqgY9gb2QXePTdPPp27IU1yzYwX
         Mj38H9Jqgs4QSV8zYUmrMv6NSgmQAlFk6KX5qcpOtnNT8mdluAxnhwPsMNln6gPplf4l
         Ayu01Sk7tVkBMfoBYeYCB8KYoEjc3k/IUdZDVw/zo7zmDpzmCSJCoeiKzDqq6YU/eayj
         ryhNH1nHTG79SCKccwv3sQuOoxkVvaP4J0tlUzY1sY+5exP/4453hsrFlDOb5cwmCGBu
         LrxvqMp/L3AGgtKDUsC1rhlQSxNNl/r+/1XJ3Xfo8v26aOBfyLYlePABJGizScAd8MoQ
         aFtw==
X-Forwarded-Encrypted: i=1; AJvYcCVzGVSh+1/YBUa9NrAGHUCksEPsXF1eXGBmWXhi28x6Fm81MCTAIQBL/VtXALNCKmcQbqA1R59iy7lM41Mw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7IWeH7Ad9ZHo2nbaqmfqQ1UXuilm9zBPeHUFNN8n9kZNEYHM
	Qo9CL0mfHP46LCqxaA0P8LC+aucEAFo3EoBTi6fR57LQ0IgWspqZofmX9Mt/2Ac=
X-Google-Smtp-Source: AGHT+IGHbbYDZwkl7ZaorUFMYTjjoiX5UwxQALXcLi2GUsuuwZ69P46OC0UsVz+iINGN//licHQ0Kg==
X-Received: by 2002:a05:6512:3d8e:b0:52c:ebd0:609 with SMTP id 2adb3069b0e04-53546afa09dmr1172184e87.7.1725010432349;
        Fri, 30 Aug 2024 02:33:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084e00asm511398e87.271.2024.08.30.02.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 02:33:51 -0700 (PDT)
Date: Fri, 30 Aug 2024 12:33:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Skip reference for DMA handles
Message-ID: <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822105933.2644945-4-quic_ekangupt@quicinc.com>

On Thu, Aug 22, 2024 at 04:29:33PM GMT, Ekansh Gupta wrote:
> If multiple dma handles are passed with same fd over a remote call
> the kernel driver takes a reference and expects that put for the
> map will be called as many times to free the map.

> But DSP only
> updates the fd one time in the fd list when the DSP refcount
> goes to zero

I'm sorry, I couldn't understand this phrase. Could you plese clarify
what do you mean here?

> and hence kernel make put call only once for the
> fd. This can cause SMMU fault issue as the same fd can be used
> in future for some other call.
> 
> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ebe828770a8d..ad56e918e1f8 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -755,7 +755,7 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>  
>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  				u64 va, u64 len, u32 attr,
> -				struct fastrpc_map **ppmap)
> +				struct fastrpc_map **ppmap, bool take_ref)
>  {
>  	struct fastrpc_session_ctx *sess = fl->sctx;
>  	struct fastrpc_map *map = NULL;
> @@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  	struct scatterlist *sgl = NULL;
>  	int err = 0, sgl_index = 0;
>  
> -	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, take_ref))
>  		return 0;
>  
>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
> @@ -917,14 +917,17 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>  	int i, err;
>  
>  	for (i = 0; i < ctx->nscalars; ++i) {
> +		bool take_ref = true;
>  
>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>  		    ctx->args[i].length == 0)
>  			continue;
>  
> +		if (i >= ctx->nbufs)
> +			take_ref = false;

Please clarify too.

>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>  				(u64)ctx->args[i].ptr, ctx->args[i].length,
> -				ctx->args[i].attr, &ctx->maps[i]);
> +				ctx->args[i].attr, &ctx->maps[i], take_ref);
>  		if (err) {
>  			dev_err(dev, "Error Creating map %d\n", err);
>  			return -EINVAL;
> @@ -1417,7 +1420,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  
>  	if (init.filelen && init.filefd) {
>  		err = fastrpc_map_create(fl, init.filefd, init.file,
> -				init.filelen, 0, &map);
> +				init.filelen, 0, &map, true);
>  		if (err)
>  			goto err;
>  	}
> @@ -2040,7 +2043,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  
>  	/* create SMMU mapping */
>  	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
> -			0, &map);
> +			0, &map, true);
>  	if (err) {
>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>  		return err;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

