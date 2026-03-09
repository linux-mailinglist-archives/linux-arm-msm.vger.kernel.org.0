Return-Path: <linux-arm-msm+bounces-96302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J77DcburmkWKQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 17:01:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A823C564
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 17:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E128F302C5DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751693E0C6F;
	Mon,  9 Mar 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j8IyccC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192E31AAAA;
	Mon,  9 Mar 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071738; cv=none; b=ZuSy3xDsTX4Tpe9f3M6Oufjp/Zv6SYau2lBzGq+a5QVm6kbRP8s2e0uKqMQQN93r6HqUIFLwikyNrlWhWPDoQ8KfW/coSTvcjecQ153EueOHwxj/n48pUHpOx6k6acyVczrdqhHDAKwm6V7hjVP/CHgRHZGuiYAfy/U/qCVFQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071738; c=relaxed/simple;
	bh=qXIJ+MnaMru8TxrmXBo3FzWMx/CodwsE3gYGQJwSBLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHkiNCFeaa9fj2vVWatl1FsNHVAbfNT1XKeUNEXX0CVrn3zaWBYWIqaIj1Xn0G4NdZ4o+77ApI8cybAYGLtVSYsi/WvHijwOTyWVh8a7rS8eKVX1Mk6sv3VqkUa9jTMgSJypPoAKrXYKGErgDr2imOtbgKc5YxLFKM7HeeDMIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j8IyccC3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AAEC4CEF7;
	Mon,  9 Mar 2026 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773071738;
	bh=qXIJ+MnaMru8TxrmXBo3FzWMx/CodwsE3gYGQJwSBLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8IyccC3leEcgtuq4KmLVPBMUW0iVnX6sLM2xG0Z0vDpGy8ek1c2UJzR4INNPsjXv
	 En4HtDUlFLmcLOXMhP8aHCcFJgoHm79tl4MD/QNq5PMXPtDUNpibzFnoebwFcjEjVr
	 NiTdSPPsnvzq70W2Fzidl9TXF7m31PZEiD/Z2riM=
Date: Mon, 9 Mar 2026 16:55:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node
 for a faux device
Message-ID: <2026030921-dwindling-tarnish-6141@gregkh>
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
 <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
X-Rspamd-Queue-Id: 7C3A823C564
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96302-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.223];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:16:19PM +0530, Shivendra Pratap wrote:
> 
> 
> On 06-03-2026 19:54, Bartosz Golaszewski wrote:
> > On Fri, Mar 6, 2026 at 3:13 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > 
> > > On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Mar 6, 2026 at 2:54 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > > 
> > > > > On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
> > > > > > Add a new variant of faux_device_create() taking a firmware node handle
> > > > > > as argument and attaching it to the created faux device. This allows
> > > > > > users to define and read device properties using the standard property
> > > > > > accessors.
> > > > > 
> > > > > Why would a faux device have firmware backing?  Doesn't that mean it
> > > > > should be a platform device?
> > > > > 
> > > > > > While at it: order includes in faux.c alphabetically for easier
> > > > > > maintenance.
> > > > > 
> > > > > Hint, that should be a separate patch, and is never something that I
> > > > > enforce or require in .c files I maintain :)
> > > > > 
> > > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > > > > ---
> > > > > > Hi Shivendra et al!
> > > > > > 
> > > > > > This patch is related to my response to your reboot-mode patch[1].
> > > > > > 
> > > > > > You should be able to use the new function like:
> > > > > > 
> > > > > >    faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));
> > > > > 
> > > > > What is the fwnode handle here for?  Why is it required at all?  What
> > > > > resources are involved that would want this?
> > > > > 
> > > > 
> > > > Shivendra creates a faux device that registers with the reboot-mode
> > > > subsystem which reads the reboot-mode definitions from devicetree. The
> > > > faux device needs to have the "reboot-mode" OF-node attached. In his
> > > > current proposal, Shivenda had to bypass faux device's probe() because
> > > > he can't have the fwnode attached before probe() is called.
> > > 
> > > Why would a firmware device be attached to a faux device?  A firmware
> > > device is, implicitly, already part of the firmware "device tree", so
> > > there should be something for it to be a child of already in the system.
> > > 
> > 
> > Shivendra: I rememeber there was an issue with using any proper
> > devices like platform or auxiliary with this but - as the series is
> > already at v20 - I can't find the actual discussion. Could you please
> > describe what the issue with driver matching was?
> 
> reboot-mode node is a property of psci which defines the reboot commands.‌ As
> its not an actual device we wanted to avoid creating platform or aux device.
> few references here:
> 
> https://lore.kernel.org/all/rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofpdio6cwe@innio7qvotye/
> 
> Till v17, we were exposing an explicit of_node based registration in reboot
> mode and then registering it from psci driver.
> Post this, Lorenzo suggested to move this outside of psci and use a faux
> device instead.

As this is a "real" device that talks to hardware (i.e. you have a
firmware device representation), please do not use a faux device, that
is not what that interface is for.  Instead, as it is a firmware device,
just use a platform one as you already have a representation of it
somewhere in the system, right?

thanks,

greg k-h

