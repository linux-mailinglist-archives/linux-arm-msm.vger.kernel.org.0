Return-Path: <linux-arm-msm+bounces-103070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC90JFT73WkRmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:31:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1256C3F754C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DD55307B36C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEB33A6EF4;
	Tue, 14 Apr 2026 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTzDxoIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5EE3A640F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155264; cv=none; b=mKfFTbBTjjpedkX7N3nm77oweJuRlDAn+wDm8vyT+dPaCzl/cfhMHW9M65QX+4tPctZZcrzobxkT7uTLueTIYxzN9KByBoz+r9wQu7pNBh7lGKwCf6OrMTvIDtnX0pIRgfT/wwo5/H8SY70mLj4Cslm2vDYaIEC+veER10oJ2Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155264; c=relaxed/simple;
	bh=seC81ngWogUab0Cv00JdZnlQAdPQmT479POgeSqYkGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJpAdiP/wPcAgiQcvOozC57WVuRb7yfMqyKQ0L185dC1OFKFfZ2+JNs3Wb/wTywH9Mv0Z4uOJWxiAI7Y5+JLfB7pMEBIVlgPnk0hjFh69cyecaoVYOa86UbE5MHlshRm9kQeeKs/9Rcu8j5091uCkeEDmklJ3lC/2PRYn3SBEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTzDxoIH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ad135063so50763935e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776155261; x=1776760061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vAoerfiNNrWz161JIQ3021f9av7AFwKNdNb1czdX2oQ=;
        b=OTzDxoIHnHjGrJIglReSS+op8d69c7NjA/dUE2vUrftByBUm14vSKtzDXeDcfuBqrQ
         uZpvg+LgvHIhQ78pBI0BC+d3saDQ73MkVrzbSMiWHh5C2QbNXmgsI2ryD/38hGLob87u
         AvwG716H2XN/dxBJrUuNB0viLHltyJvL5N3ivM1PN5oMhD6pfJ68g/TDar1PZ026MiSb
         tYqNBt2z2gjsQdiHsta01bl8X3uV4lYiJzHA/AMxZ5EbEExJaGXzsoMiDZUkPNrnfrP4
         bAZqBnnEEd3k4xCSBWh966LktyGiZFaNaKyOM702s2o/iKzT/218SNyPq9uB1vmCzQkk
         kIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155261; x=1776760061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAoerfiNNrWz161JIQ3021f9av7AFwKNdNb1czdX2oQ=;
        b=eFnIxk6hgI76x37+sZKZG57of/RDfp+SqzAO1qG0B3NM6zaB9neGxPBkSML2JBGQJs
         Vf9+6klmTDUowlUf6uDhh5aGm6aLdN6jWxrx0LtWMUnAovXKdj6LEr/vtVWfn3Kl3Nrd
         pkXwubYjaIZZ3leKacxoaYGlqzSexqEJL299c9qSBTP62Z4vEqzvReueT/jAn6eKrpcQ
         g/cz025FqFy3xJcNx3hobk1KvyHDHzpIflNYONMK2I4+7j3RQcJ07QS+fav7XOS6n9gc
         4h4oL2EK8EAPyjHK4dqvyJvqFR3dz8GUuwu/5SPwnUNGx+PTE+LtTRFTVi5/0T0Wsa5B
         ecQg==
X-Forwarded-Encrypted: i=1; AFNElJ/oXmm9dnHa054XaM7DwZLGR/43zLrpSetCdR3ciL5lqIbUQGiechth0BYGhPTfZkZ+F3aqnnar0PHPrHkF@vger.kernel.org
X-Gm-Message-State: AOJu0YxC8hBdfUrcpyLFnWYgVlx4rO+h4G2rArsS7CMO9MB55uFik6OB
	r3SZFEYUDDmjjSnI0dhdb9QydN/TUokGUjlIlP7WjdmiPyLE77hVOlNqaW9J2F4hon4=
X-Gm-Gg: AeBDiesaA9UBiUVtLyXYYVDdVKQco0iQ9A8rHehNWkFmDphHRSDRugTZsTbKHtdVmYI
	IhiYuIk3ImFujLL69BKJiMFUcUkGw1yUTlTgwyp5GkpIIPyBq9dvWmrFYIygm58OwYK4teRAsWe
	9FNhTaZJ+Mod1us6jzjm/8EPpmcHxSNj9OSOk+GUZD3SYpVeitx/+CU5H43pXpFD8y7gnmmQ+5k
	042RSjWs3sXesMin1VZdgpW9gjGBXgVfo3Isjv8cJyDVJOefRCIKt9ybcX4PztXSM5g2lZn7wYl
	pJC08VyUi6to57IMvdOnZCnpJyDCWOiN+0gb6q+fv78+Nlzuj2InpRS5Ox4v1AB2U95LHgWEEyd
	0ILGOdTyxA2nLJVPcDM9O6n9JnfufsDHEDhYDbTfM0XKaHnJW9OMHRCOyqs6gMBr+Oi2AOsbrC3
	Hn0etRjLA1YfeJU8U7GO5t+QcppIk=
X-Received: by 2002:a05:600c:35c7:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488d68b27d6mr248949515e9.26.1776155260781;
        Tue, 14 Apr 2026 01:27:40 -0700 (PDT)
Received: from linaro.org ([77.64.147.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488eddb9751sm54594395e9.0.2026.04.14.01.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:27:40 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:27:38 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
Message-ID: <ad36erdhcvnIvFMH@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
 <adkF7EY1KVRNO01o@linaro.org>
 <c6a9936b-9f44-4bea-93a1-17d145e64eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6a9936b-9f44-4bea-93a1-17d145e64eec@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103070-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 1256C3F754C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 11:23:50AM +0800, Jingyi Wang wrote:
> On 4/10/2026 10:15 PM, Stephan Gerhold wrote:
> > On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
> > > For rproc that doing attach, glink_subdev_start() is called only when
> > > attach successfully. If rproc_report_crash() is called in the attach
> > > function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
> > > be called and cause NULL pointer dereference:
> > > 
> > >   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
> > >   Mem abort info:
> > >   ...
> > >   pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
> > >   lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
> > >   ...
> > >   Call trace:
> > >    qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
> > >    glink_subdev_stop+0x1c/0x30 [qcom_common]
> > >    rproc_stop+0x58/0x17c
> > >    rproc_trigger_recovery+0xb0/0x150
> > >    rproc_crash_handler_work+0xa4/0xc4
> > >    process_scheduled_works+0x18c/0x2d8
> > >    worker_thread+0x144/0x280
> > >    kthread+0x124/0x138
> > >    ret_from_fork+0x10/0x20
> > >   Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
> > >   ---[ end trace 0000000000000000 ]---
> > > 
> > > Add NULL pointer check in the glink_subdev_stop() to make sure
> > > qcom_glink_smem_unregister() will not be called if glink_subdev_start()
> > > is not called.
> > > 
> > 
> > You mention the actual root problem here: Why is glink_subdev_stop()
> > called if glink_subdev_start() wasn't called?
> > 
> > The call to rproc_start_subdevices() in __rproc_attach() makes sure that
> > all subdevices are in consistent state when exiting the function (either
> > prepared+started or stopped+unprepared). Only if all subdevices were
> > started successfully, the rproc->state is changed to RPROC_ATTACHED.
> > 
> > In your case, attaching the rproc failed so the rproc->state should be
> > still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
> > shouldn't stop/unprepare any subdevices again in this state, they all
> > might crash like glink does here.
> > 
> > We know that subdevices are already stopped+unprepared in RPROC_DETACHED
> > state, so I think you just need to skip rproc_stop_subdevices() and
> > rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
> > below.
> > 
> > @@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >   	if (!rproc->ops->stop)
> >   		return -EINVAL;
> > -	/* Stop any subdevices for the remote processor */
> > -	rproc_stop_subdevices(rproc, crashed);
> > +	/* Stop any subdevices for the remote processor if it was attached */
> > +	if (rproc->state != RPROC_DETACHED)
> > +		rproc_stop_subdevices(rproc, crashed);
> >   	/* the installed resource table is no longer accessible */
> >   	ret = rproc_reset_rsc_table_on_stop(rproc);
> > @@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >   		return ret;
> >   	}
> > -	rproc_unprepare_subdevices(rproc);
> > +	if (rproc->state != RPROC_DETACHED)
> > +		rproc_unprepare_subdevices(rproc);
> >   	rproc->state = RPROC_OFFLINE;
> 
> In this case, rproc_crash_handler_work()->rproc_trigger_recovery()->
> rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() is called,
> "rproc->state = RPROC_CRASHED" is set in the rproc_crash_handler_work
> before rproc_boot_recovery is called, so checking RPROC_DETACHED can
> not work for this case.
> 

You're right, I forgot about that. I think we need a more generic
solution for this though. rproc_stop_subdevices() should not be called
without a prior call to rproc_start_subdevices().

I think there are a couple of options for this:

 - Add a bool "subdevs_started" to struct rproc and manage that
   separately from the rproc->state.

 - Track the rproc state before the crash separately (something like
   rproc->state_before_crash) and check that in the stop path.

 - Add a new state RPROC_CRASHED_DETACHED to make sure the states are
   unique.

 - ...

Does the same issue also exist in qcom_pas_stop() of "[PATCH v5 4/5]
remoteproc: qcom: pas: Add late attach support for subsystems" [1]?
There you check for pas->rproc->state != RPROC_ATTACHED, wouldn't this
also fail for the RPROC_CRASHED case?

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com/

