Return-Path: <linux-arm-msm+bounces-95671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIafAtesqWn+CAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 17:18:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D6215528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 17:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2149230804F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 16:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB91B3CE4A2;
	Thu,  5 Mar 2026 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Go+Pv1ib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A723CE4B2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727394; cv=none; b=WL2uy06/ZkfIhYznqioph4f6QmIsSYsFfguGIeDg382L26ppMhkeTB2rKFsWm1uM+jrP1cbDUUoD7Zy0Ye+H/n+bKziXsy2dPQ2ym682IbbPlan7Nza300A6xx8eMT7pF6wPy9vBxIleiIfb3yT1ip1tqgg7g3l4HTN/nCFutUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727394; c=relaxed/simple;
	bh=OyXn7u04gURNhHmDyflhOHXJEe2t/LqnNgA7VgcSgiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyqkSDzusAMa1LUf0nOsyaImej/XMDfwFJv9X8qU8ZlY8wTPK0E55WDo8PGDf5Kj2U2iWo5HsG0BwZrOwotsoKC9hC4trgbLXJGRIE870vLKXm6o7UGwZ03d+zF4rxYhR04tC3GiARoSGTHXyrN3j4PuXZDyYi2dsLDCdItSjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Go+Pv1ib; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371bb515eso122700265e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772727391; x=1773332191; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yx4AyhOAgyJue9ackXDxB6qNVZ3mjjFPXiVKLeWDVo0=;
        b=Go+Pv1ib0IlacQVXuCFjAE8f9U3bQ9y771xp6u8SE/RXBvdB/O68hwuduZnxmfmq3r
         FXxSXrO1C046wnGJA6ZXTHhGW/s+9lZjXeKNgwtORQRdRCWFgsw1XSVKMJVy0vLKN/No
         774B3pSxWIyN0Wb68C0ACHXGmPIPib4rM5jPZK8LIcjR/yIDl5ldDyZviIySaGtnnZwB
         irP1R9zzCaBI6Ikj5+zgMGIfNx6HCZL9NKWBQ3q38nU48t7EyVFvBJmAXmQjs4eLSiCC
         B66pyEEqnrUSDTtTEB57PzQvIUsVNfwvPmR+LaVT7NWPlg34S88zmyV6Ux7CMGM0u61j
         ILZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727391; x=1773332191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx4AyhOAgyJue9ackXDxB6qNVZ3mjjFPXiVKLeWDVo0=;
        b=cNo6BYlZDSLP3Xtm3FHVysnK4QLzjlZgUIeoZEqBOX1ZSFBAnHItdPiJuN/Na8MYSS
         VlRF6bBEHe8wi1nK8VcgKOFpAKYQRAY9bFymFzqYMc8LI6Gq+J212le9o30Rfjms0a+w
         udSILTJ6l/XbTMF+31sDVONVG0Jp9NqNcw6yYVFe6y7g3cO2Y4Azo1lKnKri05EmCi0A
         7d7ojpFgEXVXFL7k6jib4nKdbKzMzDjlq+izJAYx3oTVSByKVb0UBRKSmfN/xTlJvPyD
         WNW4XKNQd9o4VKlxmXHOYgt9BB7tqBnzHQ2B1Zr1sbfINAWOd312ZMFF0K97q1Gkrd4W
         yUpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsk5Njt4M9Zv+6wNrxaJ5sidjpyHOtY+tkTVLMhZOAS+NyAfF8SmxJr9LbVbq0lX9nYRmt37PC+YlCM/Go@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYHfg4huueYjihtK2WPQ6Nwmr49blEaUXzmCvJ9UQg725g5gD
	Wrw7KrnEEicItoyiBZ/XbbrbUvfOcWEeKAPYeuty4AUvCW5X4fHt1y/olHdUNUcKCFw=
X-Gm-Gg: ATEYQzzOTh/f2RZ+4GZybmcwYmtHCWrsAq5JJcqUOnWVcnG6AbGnksFMXNo81UlXfAL
	66wlBkLeBsLI6Tsomf2yA2E7UghjVVXlp93o9E95h/qrk9y4Sr2o9lA4ZJRa0N5pnm4M6UrH0Co
	cddDDPkpZKoMlUNpacWUUekl4ImkZDNODlgb7qpdjaXvjsiOOiwQ01Uu/lzJLxoz54yOWsWDu4h
	ICOf3PV/ReKozy7e0KpIAyZxb7U3VHg/cDjLrCQNlDz1xcZ/wqdqhJQSqB22wU+ue5tTK4lymdw
	6TUzSbrLMUqWRVXpJFDahBH/qTDCAFDU8SgtPmmDhB5w789Erf0X3ybxEUd784tDXJSOlG+j1jv
	4BvMTXWGMjl+GskZdKMGD9klCg38s8ZHdirwxZVGYAw7ChGA+h/L9iQl+Ezc+LbDfHlP6rmtSff
	w4HZFB5S+wF13FMdRfVeAmIpsawpa9
X-Received: by 2002:a05:600c:1f13:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-485198bab53mr105777125e9.34.1772727390462;
        Thu, 05 Mar 2026 08:16:30 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8d64dbsm55344325e9.3.2026.03.05.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:16:29 -0800 (PST)
Date: Thu, 5 Mar 2026 17:15:43 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
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
Message-ID: <aamsL4uh58Fv5een@linaro.org>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
 <aalwMwN3qMlzrql5@linaro.org>
 <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
 <aamIf8JethKzLW93@linaro.org>
 <CAMRc=Mf=NjCqf0eqmM800Q3MEUC48V_DZ3ts6+4=qMCtrbvzzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf=NjCqf0eqmM800Q3MEUC48V_DZ3ts6+4=qMCtrbvzzQ@mail.gmail.com>
X-Rspamd-Queue-Id: 736D6215528
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-95671-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 02:54:02PM +0100, Bartosz Golaszewski wrote:
> On Thu, Mar 5, 2026 at 2:43 PM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Thu, Mar 05, 2026 at 02:10:55PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Mar 5, 2026 at 1:00 PM Stephan Gerhold
> > > <stephan.gerhold@linaro.org> wrote:
> > > >
> > > > On Tue, Mar 03, 2026 at 06:13:56PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> > > > > > NOTE: Please note that even though this is version 11, I changed the
> > > > > > prefix to RFC as this is an entirely new approach resulting from
> > > > > > discussions under v9. I AM AWARE of the existing memory leaks in the
> > > > > > last patch of this series - I'm sending it because I want to first
> > > > > > discuss the approach and get a green light from Vinod as well as Mani
> > > > > > and Bjorn. Especially when it comes to communicating the address for the
> > > > > > dummy rights from the client to the BAM driver.
> > > > > > /NOTE
> > > > > >
> > > > > > Currently the QCE crypto driver accesses the crypto engine registers
> > > > > > directly via CPU. Trust Zone may perform crypto operations simultaneously
> > > > > > resulting in a race condition. To remedy that, let's introduce support
> > > > > > for BAM locking/unlocking to the driver. The BAM driver will now wrap
> > > > > > any existing issued descriptor chains with additional descriptors
> > > > > > performing the locking when the client starts the transaction
> > > > > > (dmaengine_issue_pending()). The client wanting to profit from locking
> > > > > > needs to switch to performing register I/O over DMA and communicate the
> > > > > > address to which to perform the dummy writes via a call to
> > > > > > dmaengine_slave_config().
> > > > > >
> > > > >
> > > > > Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver. It looks
> > > > > neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs to perform
> > > > > a dummy write to an address in the client register space. So in this case, you
> > > > > can also use the previous metadata approach to pass the scratchpad register to
> > > > > the BAM driver from clients. The BAM driver can use this register to perform
> > > > > LOCK/UNLOCK.
> > > > >
> > > > > It may sound like I'm suggesting a part of your previous design, but it fits the
> > > > > design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but it gets
> > > > > the scratchpad register address from the clients through the metadata once.
> > > > >
> > > > > It is very unfortunate that the IP doesn't accept '0' address for LOCK/UNLOCK or
> > > > > some of them cannot append LOCK/UNLOCK to the actual CMD descriptors passed from
> > > > > the clients. These would've made the code/design even more cleaner.
> > > > >
> > > >
> > > > I was staring at the downstream drivers for QCE (qce50.c?) [1] for a bit
> > > > and my impression is that they manage to get along without dummy writes.
> > > > It's a big mess, but it looks like they always have some commands
> > > > (depending on the crypto operation) that they are sending anyway and
> > > > they just assign the LOCK/UNLOCK flag to the command descriptor of that.
> > > >
> > > > It is similar for the second relevant user of the LOCK/UNLOCK flags, the
> > > > QPIC NAND driver (msm_qpic_nand.c in downstream [2], qcom_nandc.c in
> > > > mainline), it is assigned as part of the register programming sequence
> > > > instead of using a dummy write. In addition, the UNLOCK flag is
> > > > sometimes assigned to a READ command descriptor rather than a WRITE.
> > > >
> > > > @Bartosz: Can we get by without doing any dummy writes?
> > > > If not, would a dummy read perhaps be less intrusive than a dummy write?
> > > >
> > >
> > > The HPG says that the LOCK/UNLOCK flag *must* be set on a command
> > > descriptor, not a data descriptor. For a simple encryption we will
> > > typically have a data descriptor and a command descriptor with
> > > register writes. So we need a command descriptor in front of the data
> > > and - while we could technically set the UNLOCK bit on the subsequent
> > > command descriptor - it's unclear from the HPG whether it will unlock
> > > before or after processing the command descriptor with the UNLOCK bit
> > > set. Hence the additional command descriptor at the end.
> > >
> >
> > I won't pretend that I actually understand what the downstream QCE
> > driver is doing, but e.g. qce_ablk_cipher_req() in the qce50.c I linked
> > looks like they just put the command descriptor with all the register
> > writes first and then the data second (followed by another command
> > descriptor for cleanup/unlocking). Is it actually required to put the
> > data first?
> >
> 
> Well, now you're getting into the philosophical issue of imposing
> requirements on the client which seemed to be the main point of
> contention in earlier versions. If you start requiring the client to
> put the DMA operations in a certain order (and it's not based on any
> HW requirement but rather on how the DMA driver is implemented) then
> how is it better than having the client just drive the locking
> altogether like pre v11? We won't get away without at least some
> requirements - like the client doing register I/O over DMA or
> providing the scratchpad address - but I think just wrapping the
> existing queue with additional descriptors in a way transparent to
> consumers is better in this case. And as I said: the HPG doesn't
> explicitly say that it unlocks the pipe *after* the descriptor with
> the unlock bit is processed. Doesn't even hint at what real the
> ordering is.
> 

Yes, I think the transparent approach here is reasonable given the
design of the Linux DMA engine API. Since Mani commented "It is very
unfortunate that the IP doesn't [...]" I mainly wanted to point out that
this is probably because the main use cases the HW designers had in mind
don't strictly require use of a dummy descriptor. The comment about the
dummy descriptors might be more of a side note than an actual
recommendation to implement it that way (otherwise, the downstream
drivers would likely use the dummy descriptor approach as well).

> > > The HPG also only mentions a write command and says nothing about a
> > > read. In any case: that's the least of the problems as switching to
> > > read doesn't solve the issue of passing the address of the scratchpad
> > > register.
> >
> > True.
> >
> > >
> > > So while some of this *may* just work, I would prefer to stick to what
> > > documentation says *will* work. :)
> > >
> >
> > Well, the question is if there is always a dummy register that can be
> > safely written (without causing any side effects). This will be always
> > just based on experiments, since the concept of a dummy write doesn't
> > seem to exist downstream (and I assume the documentation doesn't suggest
> > a specific register to use either).
> >
> 
> You'd think so but the HPG actually does use the word "dummy" to
> describe the write operation with lock/unlock bits set. Though it does
> not recommend any particular register to do it.
> 

I guess the documentation I'm looking at (8.7.3.4 BAM operation in the
public APQ8016E TRM) might be an excerpt from some older version of the
BAM HPG. Is also has a note about "dummy" command descriptors:

  "NOTE: Pipe locking and unlocking should appear only in
   command-descriptor. In case a lock is required on a data descriptor
   this can be implemented by a dummy command descriptor with
   lock/unlock bit asserted preceding/following the data descriptor."

This one doesn't make any difference between READ and WRITE command
descriptors (and both are documented in the chapter).

Personally, I would prefer using a read over a write if possible. Unless
you can confirm that the register used for the dummy write is actually
read-only *and* write-ignore, writing to the register is essentially
undefined behavior. It will probably do the right thing on most
platforms, but there could also be one out there where writing to the
register triggers an error or potentially even silently ends up writing
into another register. Register logic can be fun in practice, commit
e9a48ea4d90b ("irqchip/qcom-pdc: Workaround hardware register bug on
X1E80100") [1] is a good example of that. :')

Thanks,
Stephan

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e9a48ea4d90be251e0d057d41665745caccb0351

