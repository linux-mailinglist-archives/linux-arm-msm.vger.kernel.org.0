Return-Path: <linux-arm-msm+bounces-103067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDWhE0r33WlolgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:14:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F04B3F7047
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40B60300A654
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150A339DBC9;
	Tue, 14 Apr 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvs3SPOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631739937C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154420; cv=none; b=prskomoTie3dQjNsr5Iso9zKRlId7ytRaZxT+/hdrcODvzZ/vjMonLRrLGcjgVTdG3PTqWRgnS4iVfKpkKU6RcGTPhE0vp5d3Ro9XRYQoihlpG4d5C2LMukTRog/ux/9cuN5X9v8hmRzi0tiysae2J3SMjvh28jETsR7h7n6tt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154420; c=relaxed/simple;
	bh=gT+pzsVIRW212TZcva4L+Ri/0g6hFNVEgkKfdytwY2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smkH1ujyqKcvtU53qcABIFsnKGxbJvBZLeqOPmO7LcwP0gh+3FlP+lj7+PJlAuMUBSKvq8m3I0aX1wl11pnNTZ0bdzFuXyACm8xpmDHbgvyQbzU2K3Icmlw/IczWNPKMRY3822bZCzRpJtXCQuIrHs61/4lpjsLvUhB0BerdrqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvs3SPOU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so3377471f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776154416; x=1776759216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoTqL997tPTbH+Ap01GQJYcrt0BpStuqMk4Cw3k+aSQ=;
        b=zvs3SPOUWaJfZaTyoCV5ztGlEjHDSb7rGvmA9wRTfariTS9NPlz4kExcVNvDYIXhC2
         lT0/iL+3PSgFmBkv0tsdzeFAwMWjrXlzFYZ17l0gUQ84Zu1JQrY8BQ/FvnFolMavNjsM
         OW7vT1Z2chOpdbAu8MsQc5qsvPEePtFAtb7F6d15hWfxvFRlGIJG5u5hDKInuy23XeIG
         fmYu2uDTUqcdMmFyhfKmHPQo1iPXE/R+mh0oL6L8ULsiXbZc0QP+223Kpu5xh0GxK/Pr
         Q05Q9plzuxVA4HBbhxYQ9u0u4ZYg7pgZeEYdNH/0Y2iGwqhxQjJ+LQUyYjkYSDgIwLta
         3SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154416; x=1776759216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoTqL997tPTbH+Ap01GQJYcrt0BpStuqMk4Cw3k+aSQ=;
        b=DqJp16d7B7DGK1GB9i8/UmGTwJ2eNoxDN8yd+EbLL0H0PWYuklwLMtNRC7lu2mYi6/
         Myzk/DyrbgqRAEjtsDtc/Yyp+ARAibekzfpqRmBQ6LN8XBiOjTrx/aVGvJHmDyW67Spk
         D0234/fPXOz+Wv0P03NCeq0buKLrVGCeC045bRhU3LNX1EFXau1xxjz0dvtJDUG7Up7O
         0K02GrTKpDmRfrLqaD2//CNzqMW5807oTPshllQzj2bPjkJg5txazoSM0xRVAdRc1DKZ
         E+JC6oylLXWB/v75taM0H28/DMqA8SJGjgc6P1+GUfgXslV97fA/OBLsWjv1FqVB6jwa
         3Cew==
X-Forwarded-Encrypted: i=1; AFNElJ/CFfnm70ZneeRNsR2ygejdbXpvw7Tb/dKXDZSlrOgMj/cu11IHY9KgSqaod2EXqCDkVaKOqYvK+w5MTlfd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9Sg/tkyK10f/zaiBAVJk/7+tq0Pp68MGZefZbTM88Qrdk8LQ
	6I1P60lQu5b0o/G6aWnCYTWi7VRG7SH6Zy4X9/1jsD70ZhbhY8fFBx4tS8tzXUAGuIA=
X-Gm-Gg: AeBDiesf1LYTzn6T9OdZYgF1tra8PMKJUHKDvfgYRJQ1zEjzTNv5rRxdvDmKLlHWW4h
	hTwLBcVKTpR7zR4p0CB21IcHZgxGI0i00HDnrOEr45zus8/c9wmhw/1m27wmaqBmfdrnKdThQKM
	2eB3LLt3AxAzIdjVMjdVgb7xvJ4p6FKHwzCqJBrXGkeLoEljKgS8RCvKvoUmKqNBxYn4ubod0Aw
	kWHMFpjCj/BQ135FLHnHFB9HiUhUDyapqEwhM8xwMUoTzCCEbeAdIviNGbB+Q9TT2ySrHbRW9Tk
	5MeHsB6MeviK8B6ARmr5k1xCYodWvBBZ4GTFm6XbUC47KN0/VSVf9hCiQ1kTTZAYtN5dPgEQ2H3
	zTmVdRTczWksu0nbIUaV5vac+HkKiwkcpzNCZuhmybTkJwuTdSzDwlbbBxr7Vlg80diduTm7y+4
	PptP8fQrfZ7rLJFEdy6CQctr9LEZA=
X-Received: by 2002:a05:6000:268a:b0:43d:7403:4b60 with SMTP id ffacd0b85a97d-43d74034c72mr13905007f8f.3.1776154415587;
        Tue, 14 Apr 2026 01:13:35 -0700 (PDT)
Received: from linaro.org ([77.64.147.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm27040970f8f.8.2026.04.14.01.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:13:35 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:13:31 +0200
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
Message-ID: <ad33KwKYBNB6oE5e@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
 <adkI8Si4ejf6T73T@linaro.org>
 <846cf4bb-43da-4d2a-a128-bdaf1371e19b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <846cf4bb-43da-4d2a-a128-bdaf1371e19b@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 6F04B3F7047
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 11:41:39AM +0800, Jingyi Wang wrote:
> 
> 
> On 4/10/2026 10:28 PM, Stephan Gerhold wrote:
> > +Cc Bartosz, Dmitry
> > 
> > On Thu, Apr 09, 2026 at 01:46:21AM -0700, Jingyi Wang wrote:
> > > For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
> > > callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
> > > rproc_boot() path, the failure in this path will cause the rproc_add()
> > > fail and the resource release, which will cause issue like rproc recovery
> > > or falling back to firmware load fail. Add attach_work for rproc and call
> > > it asynchronously in rproc_add() path like what rproc_start() do.
> > > 
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
> > >   include/linux/remoteproc.h           |  1 +
> > >   2 files changed, 13 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index b087ed21858a..f02db1113fae 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> > >   	release_firmware(fw);
> > >   }
> > > +static void rproc_attach_work(struct work_struct *work)
> > > +{
> > > +	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> > > +
> > > +	rproc_boot(rproc);
> > > +}
> > > +
> > >   static int rproc_trigger_auto_boot(struct rproc *rproc)
> > >   {
> > >   	int ret;
> > > -	/*
> > > -	 * Since the remote processor is in a detached state, it has already
> > > -	 * been booted by another entity.  As such there is no point in waiting
> > > -	 * for a firmware image to be loaded, we can simply initiate the process
> > > -	 * of attaching to it immediately.
> > > -	 */
> > > -	if (rproc->state == RPROC_DETACHED)
> > > -		return rproc_boot(rproc);
> > > +	if (rproc->state == RPROC_DETACHED) {
> > > +		schedule_work(&rproc->attach_work);
> > > +		return 0;
> > > +	}
> > 
> > I think the change itself is reasonable to make "auto-attach" behavior
> > consistent with "auto-boot". The commit message is a bit misleading
> > though:
> > 
> >   - You're really doing two separate functional changes here:
> > 
> >     (1) Ignore the return value of rproc_boot() during auto-boot attach,
> >         to keep the remoteproc registered and available in sysfs even if
> >         attaching fails.
> >     (2) Run the rproc_boot() in the background using schedule_work().
> >         [To improve boot performance? To work around some locking issues?]
> > 
> >   - The actual issue you are seeing sounds like a use-after-free in the
> >     remoteproc core error cleanup path. I think this one is still
> >     present, we should really have a call to
> >     cancel_work_sync(&rproc->crash_handler) as Dmitry wrote in the
> >     previous discussion [1].
> > 
> > Thanks,
> > Stephan
> > 
> > [1]: https://lore.kernel.org/all/ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m/
> 
> Hi Stephan,
> 
> Exactly as you say, what this change do is allowing rproc_attach return false.
> It should be okay to keep this change and describe it more clear in commit msg
> in next version?
> 

That's fine for me.

> And the use-after-free issue is what we want to resolve in the patch2
> in this series, I think cancel_work_sync() is a reasonable change
> but it cannot resolve this issue as the worker could be executing when
> we call this(and this is what it behaves when I did local test) and
> the use-after-free issue still exists. Shall we send a separate patch
> for this cancel_work_sync?
> 

cancel_work_sync() should wait until the worker execution has finished.
If you call it before freeing the resources (= deleting the remoteproc),
I would expect it should work as expected.

It makes sense to have separate patches for this, one is about fixing
the use-after-free issue, the other is more about the behavior when the
initial auto-boot fails.

Thanks,
Stephan

