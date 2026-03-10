Return-Path: <linux-arm-msm+bounces-96638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLwiHm8hsGmCgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:49:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14C250D67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09CC43143438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61F13DEFE3;
	Tue, 10 Mar 2026 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qqzhxbMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3D3D810C;
	Tue, 10 Mar 2026 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146615; cv=none; b=qMXWyYAyDxRqoR8vjbRMBwNXZt3PG2avp5eCa6sj8c6ji0TRFdq+94VinkNQIn8FiKSjZUxR0VKw5cC/yIhaTvr4Q41Vh4e+A/rz3KUHXQisEefRG+KXXMbT1Aun3Kf3NtSTnkJgRSdyPYZYgpVbikTIu4MaBA6I5LBATnh99Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146615; c=relaxed/simple;
	bh=LVPNiYTqGtHPeL+FR4qA9NYw3ULapGvTze4WNtxtu64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdTimgD7BC8W6vDtIFFKZR3PswF2NY1hC3n5hxzdt2H0oXrnHGVUIqYtLeg26sQD1MkGQoRjkvBAUFhjZXU8los07V2iNahWlGmWuVW/6FDLSQtNml8AoZDhQo4MYA1kEUGHKsTnEyE3LFHM3WJSrhxgCbqfFKJvxDf8EBzGaEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qqzhxbMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929AFC19423;
	Tue, 10 Mar 2026 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773146615;
	bh=LVPNiYTqGtHPeL+FR4qA9NYw3ULapGvTze4WNtxtu64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqzhxbMwKN74gphIwNVxc4uFq3iclMN08wc6YRPjCwHSD9/TW3uDaOPEli993Jc0S
	 0XaymFQMQ8CDOuo30GkusxQ2X8bjZTd3gYYqQ1ef4ZrvFdEe94jwn/KcG4vuIKi4g9
	 y+kbmWD6JYym7d+RCmPu9oKxRxvbDp5hnTOUpyMI=
Date: Tue, 10 Mar 2026 13:43:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node
 for a faux device
Message-ID: <2026031034-blazer-equal-871e@gregkh>
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
 <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
 <2026030921-dwindling-tarnish-6141@gregkh>
 <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
X-Rspamd-Queue-Id: 0C14C250D67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-96638-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 01:29:53PM +0100, Bartosz Golaszewski wrote:
> On a completely unrelated note though - Greg: I think this patch could
> still be considered because we now have quite a lot of functionality
> put into software nodes and already have some auxiliary devices that
> use software nodes as a source of device properties/config using the
> same API as platform devices (fwnode). I think faux devices could also
> profit from it and not necessairly use custom struct. If that sounds
> good to you, I may convert one or two faux devices and send a series
> with actual users of this.

I don't understand why a device that has a fwnode would ever be a "faux"
device?  Why wouldn't that just be a normal platform device?

faux devices were created to be not platform devices, to take away the
abuse where platform devices were being used because the api was simple
and people wanted a device in the tree somewhere, but there was not
actually any backing platform device present.

So the use of a fwnode here feels very odd to me, what am I missing?

thanks,

greg k-h

