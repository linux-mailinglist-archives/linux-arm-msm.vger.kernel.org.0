Return-Path: <linux-arm-msm+bounces-112694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x3ntEPSGKmoarwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:59:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7ED670A28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:59:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=F0xJHPul;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112694-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112694-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44CF832F8B82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49D43C3C0C;
	Thu, 11 Jun 2026 09:54:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E33BD63C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:54:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171693; cv=none; b=WbvlGA+YVB+yaKK35MM04r4NqoB/rwbGhNJgiXA+0suacHdLu3kx6CVTKWvglHKOF7GDqwbFNGuZDDKN8p47GXditubYGkGSWKmSyo+tg3tgJW+1Ij0XQF8e5768KUANvuY6uu3nOQM6r2mV3BfNR073Xn+17kJXtdzJQPEAZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171693; c=relaxed/simple;
	bh=1+3ass01TybJsEp30cS9q0b/F8f1AoaZFRv0UmsyJYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8+N17vkfNr1r1J7Pzn+TWSeENEtGIrmiYwAvI0KfeK9VkxkhqL0rjK+WipUIkQS3KZXSkEY8U636YL0l0OLOolzC/UD4/uj9OB+n4gfKfdoV2m9EI8zVRFkcq9P1Y3QdwksDILqVwFSQKCHMFQJW84w0H+iEEaT9Oq5wOnms08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0xJHPul; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so43471635e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781171691; x=1781776491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=F0xJHPul8KKbkFh1xHEQ8qciZ3tvo/vsQeaag74H0Tyxetj5fZz3OEvfmkKF1umcks
         LQn0Zyuym7E3AH6wb6ReNWKulQzjM6LUSr3nCoZv6Uo5m16vEF3b+UYFMv5sYMP6b3xV
         pS5hAUi+nfZUT9wCogzX7ivncczZrLKZTwW2t5UdvpWrF/z4jJvRgSk/k2uUJiIDYPIc
         QupBYL0O2kUma0+OSjzMO5A+xa9B9evhAFBolXkLE4mSAclBVdE+lX+Gp/tVGq6vH/PT
         thy/kXlAr8q4oWjY5SkOrioYt29iplAQbL5BDSJKBHOwgKc6ySu2foZnVp4iiybpH34o
         iEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171691; x=1781776491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=JYw615wqMr+ShMx0iitZ+pkB+uZVdJsi8qIDCi3hZT3MpsvbNlv00L0P3TmpQaLcwC
         izlc651crTYrwR5uNVCfwTvGcxDT+CoGGbIw/+GeXs7ancnebF/ptxhdgNsfmIhq7uJe
         /V5RjJcA3r/HwLtRV5iehMWJCkpZU89Y51Nw6AgjypBjJYAAzXaYzCKmDpJjWeqoGlUp
         97ed0Ya/R0BN+ZZCVQGvF4P3b1UtZk/nAowKxUvWF/nbRz7E9LTzKPenmp6f4tzycTBJ
         35eSW24LSh0kPY1DhEy3d0L7/bd62qcPfwKPZ7X6BEsHGT768QkC3rmPH6aqGEQdYphL
         ttNA==
X-Forwarded-Encrypted: i=1; AFNElJ+PccCBrPCzr8OJv2/P0WeDY+e1DhX02EzQmEzHGbugeExoAHuwWYw58XtYGt1Akb9myKTMf7vpE52lsGmP@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7SOIQmTi6csAihW5MqKLu2bMoCF7LHhlMRSGxjh4FXoPGwaR
	IUYPKLWo3CTyZhAF9Tmorat2DX0zemM83kY9Ms7lKmAFgl2RUKeLn8lHqjJr9JC2/1I=
X-Gm-Gg: Acq92OHtM/mmEAiVXBo44BReHdCQHubIBMZd5+hX+UYSGUPfiIW3BDTUzAjMOAGw3wa
	ntcJQ/cO6bhr2LWYa1QFcyTAjEB8BDoqo9i1rMZx8aOZ3wDK1sWqM/1/EZE13Wzu+84Uj6mufAy
	gobC5pFmcnlr2fP4wuTkR5iTvMxS/ElFZb1+jRoslo3jzJQLIIByd1VZ4fNuXEJYie8lM+9qqoW
	+nNcrhZG04i8zz7AdcQezkt04OLxlcYUFPIQjbGuXsqP6fFFHvwOlv4PnH67ywZbSNKDJn9laYK
	3u3TZj+920WtxYrXQlRdzqPU5qtB4rL2NMVXmxeVF17DuSsyG8hjc/Ntussdcp8btiJWAT0d4ns
	ZqomH3yYAQRo9vL+oLdgmi6z39tKeC4nwAVnW4XN9LtO/xis2iJ7h0L2oUWVyMe5p98Od4ixBbE
	sMj/CUny44DQthDjp4WoQ2wj8cADqLDEthvf0JdLFhmfPxDw==
X-Received: by 2002:a05:600c:c0d5:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490e5624838mr23357035e9.31.1781171690745;
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52ac9aasm36942655e9.4.2026.06.11.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:54:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <aiqF5mh1PvWpH3L5@linaro.org>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-112694-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D7ED670A28

On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > If a subdevice fails to stop, it indicates broken communication with the
> > > DSP. Continuing to stop further subdevices against an unresponsive
> > > remote processor could close rpmsg devices that could remove the memory
> > > mapping from HLOS and in case if remote processor touches those memory
> > > can result in SMMU fault.
> > > 
> > > Change rproc_stop_subdevices() to return int and abort on the first
> > > failing subdev. Propagate the error through rproc_stop() and
> > > __rproc_detach() so callers are aware the teardown did not complete
> > > cleanly.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > But what would callers do about this? If you abort the teardown sequence
> > half-way through you now have an inconsistent half-stopped state that
> > neither a new call to stop() nor a new call to start() could recover
> > from. That doesn't sound much better than the SMMU fault. Or am I
> > missing something here?
> 
> SMMU fault result in device crash while other is non-functional remote
> processor. From Linux side, we do not know the state of remote processor
> when the timeout happens..cleaning the subdevices can result in the
> debug data being lost for hung remote processor.
> 

Ok, but how do we go from here? Do we expect that the system would have
some userspace monitoring daemon that would collect the debug data and
then reboot the device to make the remoteproc work again?

With these changes, I don't see how you would start the remoteproc again
without fully rebooting the board. Calling start()/stop() on the
subdevices again would lead to crashes because some of them are in
started state and some of them are in stopped state and we don't even
know which one is in which state.

Thanks,
Stephan

