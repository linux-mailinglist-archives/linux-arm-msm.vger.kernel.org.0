Return-Path: <linux-arm-msm+bounces-95837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJrTEDDiqmkTYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:18:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD622277B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4F013034B36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB09138228E;
	Fri,  6 Mar 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y07jjYhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C142FD696;
	Fri,  6 Mar 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806388; cv=none; b=WU+vLc6S6KysZYNY7vLZYYHKUDyXekgVUYFJ07g6izmkW+WN3T1H1dTY4/dLol/cfaljqFF5mxVr8eJfhf4ULkb1F3w2qStMLagP9g1aCOyV6DdUUdj7GrttmWdwbQz+sfchiPbOPSt3/mj1EAukY5IASY7FJrjMjxU83bJmDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806388; c=relaxed/simple;
	bh=glS9a5KAnQB+pTfvnRgn1OE3EipDlPi6MiWlJwPCAXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDMsG46rez1yS7yd/+koQX3DeDegjAynuqrv6HFvPjutftSS42wbCdZ7S5rnFIx5JWYwqwUCURB2oeMEYWQzRWi557nNfzAq8Gm5cLB+Vv62eJjUKgyw6ud9OuaVOJBtwKEoNvgRHAZ38N1mElk5Z7VzE6kSX7OKyJ6K1zkBxdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y07jjYhF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0430C4CEF7;
	Fri,  6 Mar 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772806388;
	bh=glS9a5KAnQB+pTfvnRgn1OE3EipDlPi6MiWlJwPCAXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y07jjYhFp63gGG2Q3093CQENKPkiJ9T4/SQEo//45TN+fgKz8IWiylflZlIfV5yzJ
	 RDfQvaM1a2i2sVRnqH2u3qwQ/neey2Cilana96QMm+rhV1TVNG6YjOpC4BPAyyAy3o
	 V+V1uUxj2KoZ/b+bR2AisZmFXkSysBurx6B/7hHw=
Date: Fri, 6 Mar 2026 15:13:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node
 for a faux device
Message-ID: <2026030612-collapse-empower-285f@gregkh>
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
X-Rspamd-Queue-Id: 3EBD622277B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 6, 2026 at 2:54 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
> > > Add a new variant of faux_device_create() taking a firmware node handle
> > > as argument and attaching it to the created faux device. This allows
> > > users to define and read device properties using the standard property
> > > accessors.
> >
> > Why would a faux device have firmware backing?  Doesn't that mean it
> > should be a platform device?
> >
> > > While at it: order includes in faux.c alphabetically for easier
> > > maintenance.
> >
> > Hint, that should be a separate patch, and is never something that I
> > enforce or require in .c files I maintain :)
> >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > > Hi Shivendra et al!
> > >
> > > This patch is related to my response to your reboot-mode patch[1].
> > >
> > > You should be able to use the new function like:
> > >
> > >   faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));
> >
> > What is the fwnode handle here for?  Why is it required at all?  What
> > resources are involved that would want this?
> >
> 
> Shivendra creates a faux device that registers with the reboot-mode
> subsystem which reads the reboot-mode definitions from devicetree. The
> faux device needs to have the "reboot-mode" OF-node attached. In his
> current proposal, Shivenda had to bypass faux device's probe() because
> he can't have the fwnode attached before probe() is called.

Why would a firmware device be attached to a faux device?  A firmware
device is, implicitly, already part of the firmware "device tree", so
there should be something for it to be a child of already in the system.

thanks,

greg k-h

