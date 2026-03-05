Return-Path: <linux-arm-msm+bounces-95644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKJmO5WIqWki+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:43:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28272212B4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 14:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9D0930879C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 13:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D333A1CEB;
	Thu,  5 Mar 2026 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6NTIPzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE111A704B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718222; cv=none; b=cLj/qX6jPC1eg7gczWcXYtHjNhl+FbCYXlZCEZJ9RKVMvs+rhkju38o9h/oL8oIlvcDuQlI90qrts88gFYCw69NgTvpAhkoL8Fm3jr1ObO41nhC2kOJZUE6E7jqk6wMPBDxRPcNb3riJQJaioy3KuynzEMmX5uYTi7o5//WOQMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718222; c=relaxed/simple;
	bh=HM8oIQ4Gc+cpXMqGxUXGIs6+1o5nvkNDglwNlY3B8KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXIwsIeUDfIoCIovOQ08cvmSHbdbU1m9ic7xO91dJpuTTOjguPFmuamtoQSr8dZiWCiPG2whMoElL30LohaAZOv+icpTXSG0eX67JIFrKcR5gHb0cAxq5dJ01hH31krdKg5BTfNlCv6H+7RB61uru+fFYTNJEbc4EdLGlORpJhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6NTIPzP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48370174e18so48283245e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772718219; x=1773323019; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=grtuVtzx4dqYeuDSNsG3zL/G5fmjx189tw7ngaV+0gc=;
        b=k6NTIPzPPFB853DPJHeDxAyYaI5x8GIXeCATLTryh9iJGnH30nXYvcx3z6Z6TLGaAU
         pZPtBBHH0PDjc4JBAIkikFV2y5yDIB6m/+08Z5zYXJ4dM2fI+ksgDEw/ZvzNCREV/txX
         RPt5LmJaP1bzy3lZ3HgfNNt3qnuQxOgz7kkBSXDQEHPrR2gCukDLWUQ+WWT+E2OH+gqT
         hW2nFmQIVk87wWDyK5O+ZhxygyTuKcqvvPdXVaCJq7z9pWGDgklUNyoVRn+IUsQpjBZ4
         IgV3gF5wBTc4F/EYaDmzNfaCN9F/csr8F4vwR/upP+yZKNcIjQXxvktst8UoE2sdmgEf
         ID4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718219; x=1773323019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grtuVtzx4dqYeuDSNsG3zL/G5fmjx189tw7ngaV+0gc=;
        b=o++pNcLD4EU0MZphYUlsvpgUXRDotc8TaDDD1Jz2b1VMt0hVd4gp2+qhhCLbEviKch
         jrTsSZpUOa7+L9UaAolMjrCHI+xIKwzl5gCaLOn2mgAoO1pOmjADwok5bz0AZs4je/E7
         xbKT+upfiAPdSIfMpgWO0cvBPwYhBms2bb4baYq5rRpBuZxJDU5nGlY8AL9DydWr/lg3
         O5hV2FWxezB8IpLv7jBXItvbRl3n1nCmSZtWUNRKVGhZOF9tutpTr5PgMxpIUMzidIAV
         d6T5PJLw61d1gJ/kiBTigHzos1XZW2eYboVSuf6udUT1drRWY1r7ZIDIe9WwR/tvGnnj
         ga5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXjXAvKHVTVpcP0I0tZAbMeignI7I0GfvbWTuKGXs4sVy0ScTqXGxCMx5jhnC5XZDyS199thLW/EyPEC1W@vger.kernel.org
X-Gm-Message-State: AOJu0Yzko0DYllbIk4oDV/H/o6FFTOnspHzfWMPmBdcIe3bb/v8LiJ6V
	vpfXFGgue1k3lcSkireln5iKsmbMdDHgKmNQvYFUH8UidDbGLImOlHMwXl0ekmW37JQ=
X-Gm-Gg: ATEYQzx+zQJRB06T3N/+fRIV05ipsL2V3UkK22zr7D2Q7DU/NwwfWf2HYqV0KE5IW2K
	jS4KuEPqal+4bTeFBnKvtuMPh+qQDgHvdwr5LuFPugBS/ZNElL0N0jKHodkpBQhcLJGsLlUf6Mr
	TQIig+/qFOuXwwLFNb41HI9QcUcM+wNW9LtdF8xYt0MvSg7BUomYBYT312g2AR3fxjvuDQQFSDA
	XwBCFRZEVN+wD8AJpIig2IxN7gkO75PBO14b5gldHvl6VjHV7HhtHo0dRzyV2p858EGtXbfsFtg
	/y6sW5Lzh9hm/cEAK/lQujzInR2t4AGSswZVRXo8EulM6N3CFjg0+qja41IWQMIzwLLA7W0MUTK
	E6EonN18yxmUSoWYOTMmQWQH9NUgHjdbmfmuTMvifDhm0Js7kgci0m/iq8p5Fc+LMj1uj41UuM9
	jFo6TNldbP60hJ9CEGJko58Zy8XEm+Pew7vyw=
X-Received: by 2002:a05:600c:8b5c:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48519871622mr110409665e9.17.1772718219395;
        Thu, 05 Mar 2026 05:43:39 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaea1sm35241535e9.10.2026.03.05.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:43:38 -0800 (PST)
Date: Thu, 5 Mar 2026 14:43:27 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM
 locking and use DMA for register I/O
Message-ID: <aamIf8JethKzLW93@linaro.org>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
 <aalwMwN3qMlzrql5@linaro.org>
 <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
X-Rspamd-Queue-Id: 28272212B4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-95644-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 02:10:55PM +0100, Bartosz Golaszewski wrote:
> On Thu, Mar 5, 2026 at 1:00 PM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Tue, Mar 03, 2026 at 06:13:56PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> > > > NOTE: Please note that even though this is version 11, I changed the
> > > > prefix to RFC as this is an entirely new approach resulting from
> > > > discussions under v9. I AM AWARE of the existing memory leaks in the
> > > > last patch of this series - I'm sending it because I want to first
> > > > discuss the approach and get a green light from Vinod as well as Mani
> > > > and Bjorn. Especially when it comes to communicating the address for the
> > > > dummy rights from the client to the BAM driver.
> > > > /NOTE
> > > >
> > > > Currently the QCE crypto driver accesses the crypto engine registers
> > > > directly via CPU. Trust Zone may perform crypto operations simultaneously
> > > > resulting in a race condition. To remedy that, let's introduce support
> > > > for BAM locking/unlocking to the driver. The BAM driver will now wrap
> > > > any existing issued descriptor chains with additional descriptors
> > > > performing the locking when the client starts the transaction
> > > > (dmaengine_issue_pending()). The client wanting to profit from locking
> > > > needs to switch to performing register I/O over DMA and communicate the
> > > > address to which to perform the dummy writes via a call to
> > > > dmaengine_slave_config().
> > > >
> > >
> > > Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver. It looks
> > > neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs to perform
> > > a dummy write to an address in the client register space. So in this case, you
> > > can also use the previous metadata approach to pass the scratchpad register to
> > > the BAM driver from clients. The BAM driver can use this register to perform
> > > LOCK/UNLOCK.
> > >
> > > It may sound like I'm suggesting a part of your previous design, but it fits the
> > > design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but it gets
> > > the scratchpad register address from the clients through the metadata once.
> > >
> > > It is very unfortunate that the IP doesn't accept '0' address for LOCK/UNLOCK or
> > > some of them cannot append LOCK/UNLOCK to the actual CMD descriptors passed from
> > > the clients. These would've made the code/design even more cleaner.
> > >
> >
> > I was staring at the downstream drivers for QCE (qce50.c?) [1] for a bit
> > and my impression is that they manage to get along without dummy writes.
> > It's a big mess, but it looks like they always have some commands
> > (depending on the crypto operation) that they are sending anyway and
> > they just assign the LOCK/UNLOCK flag to the command descriptor of that.
> >
> > It is similar for the second relevant user of the LOCK/UNLOCK flags, the
> > QPIC NAND driver (msm_qpic_nand.c in downstream [2], qcom_nandc.c in
> > mainline), it is assigned as part of the register programming sequence
> > instead of using a dummy write. In addition, the UNLOCK flag is
> > sometimes assigned to a READ command descriptor rather than a WRITE.
> >
> > @Bartosz: Can we get by without doing any dummy writes?
> > If not, would a dummy read perhaps be less intrusive than a dummy write?
> >
> 
> The HPG says that the LOCK/UNLOCK flag *must* be set on a command
> descriptor, not a data descriptor. For a simple encryption we will
> typically have a data descriptor and a command descriptor with
> register writes. So we need a command descriptor in front of the data
> and - while we could technically set the UNLOCK bit on the subsequent
> command descriptor - it's unclear from the HPG whether it will unlock
> before or after processing the command descriptor with the UNLOCK bit
> set. Hence the additional command descriptor at the end.
>

I won't pretend that I actually understand what the downstream QCE
driver is doing, but e.g. qce_ablk_cipher_req() in the qce50.c I linked
looks like they just put the command descriptor with all the register
writes first and then the data second (followed by another command
descriptor for cleanup/unlocking). Is it actually required to put the
data first?

> The HPG also only mentions a write command and says nothing about a
> read. In any case: that's the least of the problems as switching to
> read doesn't solve the issue of passing the address of the scratchpad
> register.

True.

> 
> So while some of this *may* just work, I would prefer to stick to what
> documentation says *will* work. :)
> 

Well, the question is if there is always a dummy register that can be
safely written (without causing any side effects). This will be always
just based on experiments, since the concept of a dummy write doesn't
seem to exist downstream (and I assume the documentation doesn't suggest
a specific register to use either).

NAND_VERSION (0xf08) might work for qcom_nandc.c (which might be the
only other relevant user of the BAM locking functionality...).

Thanks,
Stephan

