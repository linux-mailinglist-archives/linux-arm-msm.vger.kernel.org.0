Return-Path: <linux-arm-msm+bounces-31999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4889A97C624
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 10:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDA221F24930
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 08:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815C41991CD;
	Thu, 19 Sep 2024 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQjXKmPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE0175D56
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726735587; cv=none; b=CsrQMyl+Nnnd/nhdAV9Z7nuqC556g8dnYluFoLmp/Xl0tci1QNQNn6YfsDykxJpyoCk53hR3lPqH1N/Zo5Cda81KpPJgv5/cckGeoOiDLBg90wf3I36yp6AH+DaYcByxrZIKoiI5oLFiBvBfIUo47Uq64mO97Ne5U12e1jv3O9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726735587; c=relaxed/simple;
	bh=ZYXvN4PM/Yw57V9eOc+34CW7Je+3EYhkLIft2Mx1y8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiU+sPAIN5sNLl4Usz0aBob5KybhCoJF6qPG2thGzPSsKPH7Sfh66MI0+sN+pjcNCR7abtRBpZnYG/YRL4cE5l5ZPOV7JazYTzkZz4RpqEhmR3tdxu1hptRl8QDdLECs7OF4GzkeJZKY/7i9vMPpeaca2oUuJ8RIF/sJLHa2NFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQjXKmPp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so726763e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726735581; x=1727340381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ12HbzQHhuObShUByJk3xORRM2O/FohuyVTNSBpDh8=;
        b=KQjXKmPpYL+EcSgunIu/SD9xcGIqcaaRt6Boja7sdsjAxv0pduy/h3/2iEJjVOlLzp
         vJpyeRqRHaIo5s4p5KibDdIXDEABqosfeNZYa+Qieib/PCqU1qyWomsEyOW/m2HWwvNb
         fJChej8bnlDhsM5QXjBlADDjjCDPKic/0j27yPWtZZzO13mFuS+uo0pIL4O8rTU5Ql1X
         6BaXtZGhbLNLtMG/5LzKrflp/yWpIea4lpEBlI0SFK2J8cDoUKA71z5tWd7arVkAPCLy
         xNOpI+eN3QI8Y5lwvwgTJcoSDw/rFnv1Dtzf3rl+iTCHet/qFlqdoYYeziuDFVQl5Y2B
         I8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726735581; x=1727340381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ12HbzQHhuObShUByJk3xORRM2O/FohuyVTNSBpDh8=;
        b=c9yGhzelPfKPJjMuPXwp705ySspqQ8hqrN4m8YIg03ZdmG9R5pJApBlSrEsedebJLH
         oQLAC2Kx+EuVUkmlGmWNsIU6Hr/g+FyLCGu1hdT8oeZPm8iPqQ7De3pxhkrWk9mn6Ash
         IniIO+QdGunFjbwRpsxO7doSbGvPbyU9HDH63cuMispiNlySuxfs3BrQU4yH7kZ291N1
         FtpB/XYxXN+iOfpMBGfu+bnFt/pwem7rJwIvmuBEkRCR4EtioYaZoJOE8QJJjsx4bX5w
         Vigct86UzU4fa5xE7w6O5zzAvGhAndqbccOQzpubN6towyCGT7A8EzLehawOlI++JrEa
         dlmw==
X-Forwarded-Encrypted: i=1; AJvYcCWY3dx14cP7m41kJkuD6iUNBt7bKAUKBPu+ITWlR1l5oUKWvJK3Hckr/TnxUvkqwadHVtYvlYPNs2Wp4tV+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb5TwTC1ovnIDEYlhbk2t8Ila82FTzMsLlJzO9VboK03uo+4Mw
	xfhvfQeGByqzNl4cb0Vl1waCPh8Pt7GqHwQxVj6z6JKXtXXKlq3gWyf+b19Jww3dgG6OoAY3+SL
	m+x4=
X-Google-Smtp-Source: AGHT+IEZElLzhpq+N2gsak+Pv41EuVKSdnqfaHqUixwI6vDwWQm809LovGIDQT7jKEi2wN/Tu8W/NA==
X-Received: by 2002:a05:6512:3ca5:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-5367feb9b81mr13497263e87.3.1726735580856;
        Thu, 19 Sep 2024 01:46:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a86a4sm1771880e87.213.2024.09.19.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:46:19 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:46:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v1 3/3] misc: fastrpc: Skip reference for DMA handles
Message-ID: <7ejauhf33nyt77ve26524rtvf46qohipztydjnbezlaz666cpg@3wfhpaxv3rd2>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
 <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
 <7q7rar7ssvzlkol46e5e4yecgt6n4b4oqueam4ywlxjeasx2dl@oydthy337t6i>
 <27ed94a1-eb60-43b1-b181-2b8270015a37@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27ed94a1-eb60-43b1-b181-2b8270015a37@quicinc.com>

On Thu, Sep 19, 2024 at 12:00:33PM GMT, Ekansh Gupta wrote:
> 
> 
> On 8/30/2024 3:03 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 22, 2024 at 04:29:33PM GMT, Ekansh Gupta wrote:
> >> If multiple dma handles are passed with same fd over a remote call
> >> the kernel driver takes a reference and expects that put for the
> >> map will be called as many times to free the map.
> >> But DSP only
> >> updates the fd one time in the fd list when the DSP refcount
> >> goes to zero
> > I'm sorry, I couldn't understand this phrase. Could you plese clarify
> > what do you mean here?
> DMA handle are buffers passed to DSP which are only unmapped when DSP updated
> the buffer fd in fdlist.
> fdlist implementation: misc: fastrpc: Add fdlist implementation - kernel/git/next/linux-next.git - The linux-next integration testing tree <https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=8f6c1d8c4f0cc316b0456788fff8373554d1d99d>
> 
> A remote call payload carries both input/output buffers and dma handles. The lifetime
> of input/output buffer is a remote call which means that any buffer allocated or mapped
> for a remote call will be freed or unmapped when the remote call is completing. Whereas,
> dma handles can get freed over some other remote call whenever the DSP will update
> fdlist. So if a remote call passed multiple dma handles with same fd to DSP, on driver, ref
> count will be incremented, but DSP can update fdlist only 1 time for the same fd as DSP also
> has a ref counting happening for the dma handle and fdlist is updated when the DSP ref
> count goes to 0. In this case, the map will not get freed even though it is no longer in use.


OK, I started looking at the related code. Pleas fix possible map leak
in fastrpc_put_args(), happening if the copy_to_user() fails.

Second. Please merge fastrpc_map_lookup() + fastrpc_map_put() invocation
into a single call, effectively dropping take_ref argument from
fastrpc_map_lookup() (which can now become fastrpc_map_get()).

Now back to your patch.

Please clarify if my understanding is correct:

The driver maps dma bufs and passes them to DSP. Then once DSP firmware
finds out that a particular buffer is no longer needed, it returns
its fd via the fdlist part of the invoke_buf. As these buffers are
returned only once, when they are no longer necessary, the kernel should
not take additional references on the long-living dma-bufs.

If that's the case, see my comments below.

> >
> >> and hence kernel make put call only once for the
> >> fd. This can cause SMMU fault issue as the same fd can be used
> >> in future for some other call.
> >>
> >> Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 13 ++++++++-----
> >>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index ebe828770a8d..ad56e918e1f8 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -755,7 +755,7 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> >>  
> >>  static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
> >>  				u64 va, u64 len, u32 attr,
> >> -				struct fastrpc_map **ppmap)
> >> +				struct fastrpc_map **ppmap, bool take_ref)
> >>  {
> >>  	struct fastrpc_session_ctx *sess = fl->sctx;
> >>  	struct fastrpc_map *map = NULL;
> >> @@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
> >>  	struct scatterlist *sgl = NULL;
> >>  	int err = 0, sgl_index = 0;
> >>  
> >> -	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
> >> +	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, take_ref))
> >>  		return 0;

Do not add the take_ref argument to fastrpc_map_create(). Instead
extract the rest of the code to the function fastrpc_map_attach() (or
something like that).

> >>  
> >>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
> >> @@ -917,14 +917,17 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
> >>  	int i, err;
> >>  
> >>  	for (i = 0; i < ctx->nscalars; ++i) {
> >> +		bool take_ref = true;
> >>  
> >>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
> >>  		    ctx->args[i].length == 0)
> >>  			continue;
> >>  
> >> +		if (i >= ctx->nbufs)
> >> +			take_ref = false;
> > Please clarify too.
> nbufs -> total input/output buffers
> nscalars -> nbufs + dma handles
> So here, avoiding ref increment for dma handles.
> >
> >>  		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
> >>  				(u64)ctx->args[i].ptr, ctx->args[i].length,
> >> -				ctx->args[i].attr, &ctx->maps[i]);
> >> +				ctx->args[i].attr, &ctx->maps[i], take_ref);

Call conditionally either fastrpc_map_create() or fastrpc_map_attach().

> >>  		if (err) {
> >>  			dev_err(dev, "Error Creating map %d\n", err);
> >>  			return -EINVAL;
> >> @@ -1417,7 +1420,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
> >>  
> >>  	if (init.filelen && init.filefd) {
> >>  		err = fastrpc_map_create(fl, init.filefd, init.file,
> >> -				init.filelen, 0, &map);
> >> +				init.filelen, 0, &map, true);
> >>  		if (err)
> >>  			goto err;
> >>  	}
> >> @@ -2040,7 +2043,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
> >>  
> >>  	/* create SMMU mapping */
> >>  	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
> >> -			0, &map);
> >> +			0, &map, true);
> >>  	if (err) {
> >>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> >>  		return err;
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

