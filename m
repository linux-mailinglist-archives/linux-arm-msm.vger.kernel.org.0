Return-Path: <linux-arm-msm+bounces-91727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJUgGmVpgmmETgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 22:32:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4DDEDE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 22:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B37C3020ECC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 21:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91FE27BF7C;
	Tue,  3 Feb 2026 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntX/TJBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A924E4D4;
	Tue,  3 Feb 2026 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770154336; cv=none; b=navfvO7aYq9Zh1d+WF7P1eDfRR56zjhYMIsTKuJUE95sWavLZ1oZWrV4/52+rQVqDqciyK/NH88yYks4iymLV/enLLfIplpnjs0vzPwHGeBCjr+qS3whO4D2+0ox+ZXmvoapwITZpFxnRchZK+4yAFIeo0RLN8dgNxfEUvMSjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770154336; c=relaxed/simple;
	bh=MOjgqFKXh/fQ/B1f8Urt+Sxf5Ukj0uExqn+Nbmv5YJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0475Sa5zb0EFlNMMgymjpJulE26O565KgT8ZLQ12mGUmMXmuQ08MMBk31I7hsF+rjLKameAsJU/OVstqmp+loOenlgbfT73nHH7VF4cpie18p4sfymf/bUc6nHXlpiZSQXdZ5REqhztfIvPBgzOxfbneKXqlYqRi8h7OntOf4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntX/TJBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492A5C116D0;
	Tue,  3 Feb 2026 21:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770154336;
	bh=MOjgqFKXh/fQ/B1f8Urt+Sxf5Ukj0uExqn+Nbmv5YJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntX/TJBcSeANnWcPMjreSrLRdExnI1nfuFFFeVd59O9wKgJ/yNEsJMfgGs+6ulUAw
	 DiLMECu0+9eaVBMFW5CL88GKHZIRG7PxQmCduX/wPP3Q//7jjWLrHC1E7sIJFb1425
	 tjltx+1p0nrxNVOXGVjhKoNXxeE3tOWOqf4KI48t6srQfQUr53GLwlHqdZ0jZOOuy9
	 WSGEsqUH2YMRe9EVVMwGw/twpMpcmKT/b70ozHR7nuXxoLH6GaAqMMdYC54g6Qf28o
	 Lgg2SF9/pU047uXA7kUUe1iU2iSgjR0S8xXDFV2clauEnThDG7bZ7l5tqyRCbMLjrF
	 QNowBegCCQl6w==
Date: Tue, 3 Feb 2026 15:32:13 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jianping <jianping.li@oss.qualcomm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srini@kernel.org, 
	amahesh@qti.qualcomm.com, arnd@arndb.de, linux-arm-msm@vger.kernel.org, 
	ekansh.gupta@oss.qualcomm.com, thierry.escande@linaro.org, abelvesa@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	stable@kernel.org
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <gjmq3xbu567ymkj5lc5u44pbehbn5spyshqj3wgi434q2ing75@lztciattj5pv>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
 <2026020245-catalog-outburst-f805@gregkh>
 <592129fa-cd8e-44b5-a18c-1fb6c6ed102b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <592129fa-cd8e-44b5-a18c-1fb6c6ed102b@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91727-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9D4DDEDE6
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 08:08:16PM +0800, Jianping wrote:
> 
> 
> On 2/2/2026 4:41 PM, Greg KH wrote:
> > On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
> > > 
> > > 
> > > On 1/16/2026 10:49 PM, Greg KH wrote:
> > > > On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
> > > > > From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > > > 
> > > > > The fastrpc_buf_free function currently does not handle the case where
> > > > > the input buffer pointer (buf) is NULL. This can lead to a null pointer
> > > > > dereference, causing a crash or undefined behavior when the function
> > > > > attempts to access members of the buf structure. Add a NULL check to
> > > > > ensure safe handling of NULL pointers and prevent potential crashes.
> > > > 
> > > > What caller passes in NULL here?  I did a quick look, and see where the
> > > > callers check this properly if it could be NULL, otherwise it all looks
> > > > sane to me.  What in-kernel user is causing a crash here?  Why not fix
> > > > the caller up instead?
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > 
> > > It's a saftety coding: to eliminate NULL checks on the caller side, as we do
> > > in a lot of other kernel API.
> > 
> > But you do not do that for all functions in the kernel, otherwise the
> > kernel would be full of checks that are never hit at all.
> To clarify the intention: this change was not triggered by any real crash in
> current callers. The motivation came from the v1 review discussion [1],
> where it was suggested that a NULL check in fastrpc_buf_free() would allow
> simplifying some of the caller paths.
> 
> [1] https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> > 
> > > And it was pointed out in the v1 patch discussion that this change was
> > > needed:
> > > https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> > 
> > Were the checks removed from the caller side like was asked for?
> 
> Currently, I have placed the check inside the API and removed all the checks
> outside the API.
> 
> > 
> > Also, your changelog makes it sound like this is a real bugfix for
> > something, when it is not at all, which is what I object to the most.
> > Don't make scary changelogs for things that are not actually happening.
> 
> You are correct. I will modify the commit text that caused the
> misunderstanding.
> 

You should then also drop Cc: stable and Fixes:, as this is no longer a
bug fix. And make sure you don't put actual bug fixes after this one in
the series (i.e. it probably shouldn't be patch 1/4).

Regards,
Bjorn

> > 
> > thanks,
> > 
> > greg k-h
> 
> 

