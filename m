Return-Path: <linux-arm-msm+bounces-91444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOVYODdjgGml7gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:41:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085FC9BE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 09:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89010300118F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 08:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A47B29B216;
	Mon,  2 Feb 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ap1dMETn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0F27145F;
	Mon,  2 Feb 2026 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021683; cv=none; b=gp98mzp/R4gdkieuh2PPGDNZ7QNEwWmXjAZ4ajv4VpOJoIKn7WGyK+imSi0SC94ivOGrMPpD9ML0LlI44tr+NqE5X7cmsOqfQzRGkqUWFNUYFB4ycTYKgpG9hiS2fKCXPhS0DqPWiomyCPfLtaCWEh/nuBP38nVIkRM1lcPBwCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021683; c=relaxed/simple;
	bh=VWE624fnqfngLIjj3E6rni5Z4zk7NcQkiYtzuCNihhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXCTg1t3AI4IlIda52N2tBv/uEBuPURh5n0l/Qh/9+DXgiqwh2ey5TqnI2TAbGDzltETNO4sxveA9lzwfANiTAz7CjTsHyJfsqkDjDYPin5PdJUXRJ/QJ9gqsaA7a6xqDZoecSJfnSlDlZuRyHhEumWkVP5YI/ddDdu4PSsNgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ap1dMETn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC40AC116C6;
	Mon,  2 Feb 2026 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770021682;
	bh=VWE624fnqfngLIjj3E6rni5Z4zk7NcQkiYtzuCNihhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ap1dMETnaV2kOMozl+c1GfWWGUBsB3q+c45vsyYZCdH3WWdDw4tGP3PB7Bm39Gi0C
	 PgF7HWz1MNrk8nG1MS0P4dgOf0B6wc8+19KaCh7+fExkFkRQB8HCnR8tnR5wzjgjqG
	 vk6Ekp9WzLrnBtVgbs4uPTMzZNIAMP9lXQ0nHXgA=
Date: Mon, 2 Feb 2026 09:41:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	linux-arm-msm@vger.kernel.org,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	thierry.escande@linaro.org, abelvesa@kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <2026020245-catalog-outburst-f805@gregkh>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91444-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1085FC9BE6
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
> 
> 
> On 1/16/2026 10:49 PM, Greg KH wrote:
> > On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
> > > From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > 
> > > The fastrpc_buf_free function currently does not handle the case where
> > > the input buffer pointer (buf) is NULL. This can lead to a null pointer
> > > dereference, causing a crash or undefined behavior when the function
> > > attempts to access members of the buf structure. Add a NULL check to
> > > ensure safe handling of NULL pointers and prevent potential crashes.
> > 
> > What caller passes in NULL here?  I did a quick look, and see where the
> > callers check this properly if it could be NULL, otherwise it all looks
> > sane to me.  What in-kernel user is causing a crash here?  Why not fix
> > the caller up instead?
> > 
> > thanks,
> > 
> > greg k-h
> 
> It's a saftety coding: to eliminate NULL checks on the caller side, as we do
> in a lot of other kernel API.

But you do not do that for all functions in the kernel, otherwise the
kernel would be full of checks that are never hit at all.

> And it was pointed out in the v1 patch discussion that this change was
> needed:
> https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/

Were the checks removed from the caller side like was asked for?

Also, your changelog makes it sound like this is a real bugfix for
something, when it is not at all, which is what I object to the most.
Don't make scary changelogs for things that are not actually happening.

thanks,

greg k-h

