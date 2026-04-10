Return-Path: <linux-arm-msm+bounces-102694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PdFSOAIJ2Wn9lQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:28:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE083D8A6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE397300617E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 14:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD813C3BED;
	Fri, 10 Apr 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSvWFVwm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09493D3309
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831296; cv=none; b=WlF4oOT8Txx4RNexE3xXfdjGh5zXUqN9uzLsLUN3hmBBOVTiclDaW+PyZNRTAiy8WNT3W9gteSsnZbg0x25VuhXDjtLH0r9CV069BBJrMxaZ0f1ScajT0jo5BHw4e7+yq8px2v0VhoEtspZ7kcYheZpr8NqazTIZKdLFcf4WBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831296; c=relaxed/simple;
	bh=SlHkwVDj6sqnc4C0GPhidA6If3ojZ4N4s0pvp5GpblU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0T/+2jF/j+42taRmUFjSMzB8kqUvx+kTQtKvJi7W9zl1lBShsE4CS3HKYOsXmp9cN78brlLaU6JGdPfI5h/VAz2+XdiwHxAjTeSgZdFa8c2Bt3UHeLXxRgJny5DS0GP6D9y5WNX2eatSrpJaQMFsrpV/t+J7NzpFXNwiN53cPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSvWFVwm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso20930085e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775831293; x=1776436093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ADKIwr4ulE9AlL8WuP29OLGHGCvedZpXQ2D+7VFVVM=;
        b=aSvWFVwmNadM5+UM92ybSDn7nwmUUnnp+Iw3sxXRqDPBuYynR9WRy4YTDlnS5b7sQm
         AfDiWRBDLOAe1XXjFjLgWdUOxSiuN+PTqJywHdh8Im5jP4P6gprZdEx2ceJERUynuI4C
         JS4dRa44PUI5GOv5KFSDqBV7Swyu9OnZ7mHI8WIP3S6AMY5S04KBuVUJaFn8B7W44O+L
         d1+bS/PDCcdZeNcgl9GLFN9Ac1GW96gvKB4rdrvdifEHWKupKtRzG0wGMBg6RGS7+TFz
         5Z7T1nHxLF0q0h3HgDab8fFGNwJJKr4ds0NxJWfgJ/2XlEIFgR5dJnMMYUIg0oz+BOy/
         fsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775831293; x=1776436093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ADKIwr4ulE9AlL8WuP29OLGHGCvedZpXQ2D+7VFVVM=;
        b=lHG1KiBADTTvXnj5RzWnwakFqdeO3Cu8NB6czDfURmhF0Vq3N1GpspiYbp9oKicUSD
         G73hohH1BNaofgjNPr+vg6svhVj9whvelPyRhuIUCndSu52OWV/7S/6NPwn26qXFckdv
         dwOUCCb9o+Zganr9GBBO3HhpGRa2Z2BhoAEJJVtIkYXchh3A1E5zMt4V4wRbb07tM4fn
         kTcrNgnwvxcuV/7EPnVYJXR/cyA5lruE9sGmQZHto/rVC625EMjWf6917eKH+AtjiZCw
         HdVEh2gNrHK7YzjMXl2T/gUt5OZ/7PIJLIUCV9HwiMT8f8XkZSN4KQvVVGgGNYAg18a5
         P3qg==
X-Forwarded-Encrypted: i=1; AJvYcCXVlmfwJufjNbSItt6wYSBg0nLZttx+iFyDnis3NaKDnLgT7ViLFMc3XJuxvDyZf4y4g+2PYG/+psbvnQOx@vger.kernel.org
X-Gm-Message-State: AOJu0YzwD87vWrEtnBxSP1NQ2YdBpiYceb3dVdEtokUG35x+tb7Z6bo3
	MO1mUHmfVp2nbBs+KpW74gvvxpD7w0WF5RVQbPugGM3HfEhPjp8i8sfMr5i5nCgpX1g=
X-Gm-Gg: AeBDiev4+ukIbEqyXSMKoMepsdPbS0nTyk8j0hLM2tGwn6UYhbNv/f5kinG5avXSrAO
	LnJEu/3Q6zU+bCeGd4z82ofppgnahzbl0WG/847292TWfIFzXcr/mLRijxt0Q5FIwN/+xUccfJ/
	rfP91PT8LDILn5ALanM5MK4suR4Agfn3o0qv9yPP+gjQoevq99wwuj/nRMmgeq32IL7e5+b/H4p
	3uFINcDe46Y4zRmP2K67q+nAuxTTOfxQVzcqCcGL9egMm1e1Ua0aBNfh6DQ5tacvmTzbd3iBwcI
	TZsHhdbGiUtaip32vptmCujD3o1QoQxLvs8w3cLsvDcLrCLGcoVez/tS4Sh5zRIHTUQw/96hwa6
	TPLSqUg+vSk61FPixV/xXP36+51y4GqcEJQEOX72mw7j5shSGS0tO60LSUlVmuIh5NL9mwLBoGO
	IDKVEXIlPH8kD0dzhtQNaGdvjHrbt3
X-Received: by 2002:a05:600c:674f:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488d68cb47amr48303285e9.30.1775831293221;
        Fri, 10 Apr 2026 07:28:13 -0700 (PDT)
Received: from linaro.org ([77.64.147.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm36941185e9.4.2026.04.10.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:28:12 -0700 (PDT)
Date: Fri, 10 Apr 2026 16:28:01 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path
Message-ID: <adkI8Si4ejf6T73T@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102694-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4FE083D8A6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+Cc Bartosz, Dmitry

On Thu, Apr 09, 2026 at 01:46:21AM -0700, Jingyi Wang wrote:
> For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
> callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
> rproc_boot() path, the failure in this path will cause the rproc_add()
> fail and the resource release, which will cause issue like rproc recovery
> or falling back to firmware load fail. Add attach_work for rproc and call
> it asynchronously in rproc_add() path like what rproc_start() do.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b087ed21858a..f02db1113fae 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
>  	release_firmware(fw);
>  }
>  
> +static void rproc_attach_work(struct work_struct *work)
> +{
> +	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> +
> +	rproc_boot(rproc);
> +}
> +
>  static int rproc_trigger_auto_boot(struct rproc *rproc)
>  {
>  	int ret;
>  
> -	/*
> -	 * Since the remote processor is in a detached state, it has already
> -	 * been booted by another entity.  As such there is no point in waiting
> -	 * for a firmware image to be loaded, we can simply initiate the process
> -	 * of attaching to it immediately.
> -	 */
> -	if (rproc->state == RPROC_DETACHED)
> -		return rproc_boot(rproc);
> +	if (rproc->state == RPROC_DETACHED) {
> +		schedule_work(&rproc->attach_work);
> +		return 0;
> +	}

I think the change itself is reasonable to make "auto-attach" behavior
consistent with "auto-boot". The commit message is a bit misleading
though:

 - You're really doing two separate functional changes here:

   (1) Ignore the return value of rproc_boot() during auto-boot attach,
       to keep the remoteproc registered and available in sysfs even if
       attaching fails.
   (2) Run the rproc_boot() in the background using schedule_work().
       [To improve boot performance? To work around some locking issues?]

 - The actual issue you are seeing sounds like a use-after-free in the
   remoteproc core error cleanup path. I think this one is still
   present, we should really have a call to
   cancel_work_sync(&rproc->crash_handler) as Dmitry wrote in the
   previous discussion [1].

Thanks,
Stephan

[1]: https://lore.kernel.org/all/ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m/

