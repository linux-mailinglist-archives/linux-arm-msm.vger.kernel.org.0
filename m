Return-Path: <linux-arm-msm+bounces-22438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722459052E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246E7284D92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F8F171E74;
	Wed, 12 Jun 2024 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C8R2kAE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D8016F0D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718196555; cv=none; b=bWeRAd4xF1BZ7jTO/ezmyVSa6OavO2jfTMThUqLf1exNzUJD81MXIl+poCbo28RGWuZZR4T/8KI65BXZmBj2N22GLGgdQ6m0RMCGy1lcB+SCQQTlO+Gq5Tw3FPpxQWLBFFOwn6eOE4UFVAW5wlIu1gu32oKP99+NYfZtXJlJeQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718196555; c=relaxed/simple;
	bh=nK8eQD3U2HLvmSpYT0ul176n/7+KfLRXAUeTJYk9YdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GskAmBP9THjQgdiwmRwwYP1kB0DnvGWXTE5XgZHKh72nE1/I098wy0uB6iebOqi8TWonzSHiBuwe8vuoqdu9VnV/uHHTqWJBgjlqXnKzWNqewbJDNX4jaAb8jsbb4Ah3OFNRZ//mXa00vzZLzUI3ym3yCqLx5tXh5BJ1wTGuMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C8R2kAE5; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebd421a931so45739371fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718196552; x=1718801352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yxD5VYZZavmxVXtb3enG8WmplRcJPFmwaHxZgVVSPo=;
        b=C8R2kAE5QLFHnlLGclMrXOUYdtvEwoG1MkFG5A/bPsMQqQEYO9MZ7r5mbHC/ALwyYK
         ty577VF8IjbswNcoJq0WRp81AL+7HwXvAHsBTSdc84nqAriQk1Nug2RiSA5knYIaQj7S
         p2CaLggKxmeHEhxWgfBjd4OF9I1m0wqKTKZ4NBEl6UrhXA+jy0SkHtT2pM5Rl58bSbtX
         9Ke4tUEFQDWulCkaNI+fq/4+t/Q4tO6DibeE/Kd4yxHJ7d/JQay8qUhtfGfrmGzBb6xd
         mCQncXScN0+zZJSVuLHhqPErL4QlvUYdKGHyU8l1G9ZZaH4OffsKOVy9ecEnuXuBkPAr
         wYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718196552; x=1718801352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yxD5VYZZavmxVXtb3enG8WmplRcJPFmwaHxZgVVSPo=;
        b=YwNLH+koQnPJfDQsuFkkXMBNk5NxAQ1tllfWpULxgYwZIcbvN6lAjB1c21tvI8U7vS
         qHcl48Q73tz2haxuwkFI9Qmg9hhmC6gPJ9fbzbh0OxqDCP2VYeqyssx38/HzVaRbM8th
         gOatKqJkhlpskhwRAKWnJQLfX2WUjSnReKK+T69WgPg6WvJMj6rCd2hTSfAHHc/623Zd
         sJew087nJCEGyjCvjQvXJNeVKrjKnB04LW4RMu4zSm3xJg1MaBUxYW9GronQiy5bq10J
         SnDF1GY/deRx5d2GGrVGwn9GD5RuwNlTZeYlreVNLfjpY5O6yD1DxqdbRrETaThKuLZy
         hImg==
X-Forwarded-Encrypted: i=1; AJvYcCULiyPRReDmVi73QA8wOa2CT/NU0qrtgx8if9lDToKq17LP8f2FCyYqLrHzaI9fxokXtptAaPLqiuUzo2nNq9VsJxoMwS0SOO63tk5snw==
X-Gm-Message-State: AOJu0YxR3WqBF3Dz5eTCK36gPykYEXd15kEupezGnQPREA9GP1Szf2Zi
	kgdoxzG35jhwBC0QqKkWpW6HTufXCkKqNia0uJJPOGiH37hz/0KbbFsyQd9SRyY=
X-Google-Smtp-Source: AGHT+IHTtXOw7Dy85qXvDzKaBi3NfAqIFcpOA4TBDfQaEJBSthuiUBRe5J4B3+U+O6qnjq/yvAitWg==
X-Received: by 2002:a2e:9b13:0:b0:2eb:de21:94a1 with SMTP id 38308e7fff4ca-2ebfc964026mr9608001fa.43.1718196551645;
        Wed, 12 Jun 2024 05:49:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eadb8d2973sm22603021fa.117.2024.06.12.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:49:11 -0700 (PDT)
Date: Wed, 12 Jun 2024 15:49:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v5 6/7] misc: fastrpc: Fix ownership reassignment of
 remote heap
Message-ID: <xvy4syldmqdklij4wbub6x52gexijlrgtoketd3urohxrca5g2@mmioafzpmy7s>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
 <20240611103442.27198-7-quic_ekangupt@quicinc.com>
 <xc2ys75plbtrenastitqafadfrtolpd3bjdqcrl3wnozpc6kdo@e6e73ousyea7>
 <7d75f6b1-60fe-4a03-a251-4675a3364148@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d75f6b1-60fe-4a03-a251-4675a3364148@quicinc.com>

On Wed, Jun 12, 2024 at 09:54:47AM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/11/2024 5:29 PM, Dmitry Baryshkov wrote:
> > On Tue, Jun 11, 2024 at 04:04:39PM +0530, Ekansh Gupta wrote:
> >> Audio PD daemon will allocate memory for audio PD dynamic loading
> > What is Audio PD daemon? Is it something running on the CPU or on the
> > DSP? Is it adsprpcd or some other daemon?
> It's adsprpcd which is going to attach to Audio PD.

Ack

> >
> >> usage when it is attaching for the first time to audio PD. As
> >> part of this, the memory ownership is moved to the VM where
> > Which VM?
> In audio PD case, it's the following VMIDs:
> QCOM_SCM_VMID_LPASS
> QCOM_SCM_VMID_ADSP_HEAP
> 
> Defined here: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/firmware/qcom,scm.h?h=v6.10-rc3
> 
> These are expected to be added to fastrpc DT node as "qcom,vmids"

Ok, good.

> 
> >
> >> audio PD can use it. In case daemon process is killed without any
> >> impact to DSP audio PD, the daemon process will retry to attach to
> >> audio PD and in this case memory won't be reallocated. If the invoke
> >> fails due to any reason, as part of err_invoke, the memory ownership
> >> is getting reassigned to HLOS even when the memory was not allocated.
> >> At this time the audio PD might still be using the memory and an
> >> attemp of ownership reassignment would result in memory issue.
> > What kind of 'memory issues'? Is it even possible to reclaim the memory
> > back?
> In case when audio PD on DSP is still using the memory, the ownership should not be
> moved to HLOS. This might happen in daemon kill scenario where remote_heap is not
> allocated again, but if due to any reason if the fastrpc_internal_invoke fails, that might
> result in the ownership change of remote_heap memory.

You are describing the expected behaviour. not the observed issue.

Also, the second quesiton didn't get the answer. Is it possible to free
/reclaim the memory?

> >
> >> Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 1ba85c70e3ff..24dc1cba40e9 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -1238,6 +1238,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  	struct fastrpc_phy_page pages[1];
> >>  	char *name;
> >>  	int err;
> >> +	bool scm_done = false;
> >>  	struct {
> >>  		int pgid;
> >>  		u32 namelen;
> >> @@ -1289,6 +1290,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> >>  				goto err_map;
> >>  			}
> >> +			scm_done = true;
> >>  		}
> >>  	}
> >>  
> >> @@ -1324,7 +1326,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  
> >>  	return 0;
> >>  err_invoke:
> >> -	if (fl->cctx->vmcount) {
> >> +	if (fl->cctx->vmcount && scm_done) {
> >>  		u64 src_perms = 0;
> >>  		struct qcom_scm_vmperm dst_perms;
> >>  		u32 i;
> >> -- 
> >> 2.43.0
> >>
> 

-- 
With best wishes
Dmitry

