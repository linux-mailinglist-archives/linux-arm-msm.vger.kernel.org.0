Return-Path: <linux-arm-msm+bounces-95822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNB3BNDcqmkZXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:55:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0152222CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A4753049513
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 13:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D3032D0DE;
	Fri,  6 Mar 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fQlPkydE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2B3128DF;
	Fri,  6 Mar 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805252; cv=none; b=kO+9mCTenMhVoc690SpV8tfB2oFTNoozk8iA1SUVPyKrsh1IMP3v+EjBNCJdDj89NDcUabvDoTw02bi3VgwIfoE/0cUG+mRnZt/yyC8SafB84WfZ89wvX9gCWqCH7a8QuO0CYOxysMJgQ63blxIWbDDBMDKgHalM7Q8da2TEzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805252; c=relaxed/simple;
	bh=QK20wJ7vAN6elUgA6Rrsu8MYEpvqGJelM3EQs+d5oYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4M/NdjMGlI1Lufs/KnMLtuUbE3ymrV4Aq2S+zpIMi+fM/H52vGRojY+I9KVDx/qsZu+wWVmDmpyPskyahHp0P/FGpt4qbiWGSvuQ4nHUKYPqtzF33sReReMIUELr0yw1ctXljr76Oc9UzieCBd6nAiGBsKe+b+30WPwb5XkQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fQlPkydE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4927BC4CEF7;
	Fri,  6 Mar 2026 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772805251;
	bh=QK20wJ7vAN6elUgA6Rrsu8MYEpvqGJelM3EQs+d5oYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQlPkydEjR6GZoL2byjlhrnRHmzJyIN1k34lQ3mWvimNYF6oU2ca5TObEUJigl9vx
	 FK0OHsvuHUPM+xXxGqMnabjGP8hd/T2VUfzg9aLXwoR0Z40MDu06yLvogaJLnh2eQD
	 s8ZK1P5m4XiXpADyC4WSY267MUWNqdM7EC5R3r9s=
Date: Fri, 6 Mar 2026 14:54:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node
 for a faux device
Message-ID: <2026030649-evacuate-emotion-422c@gregkh>
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
X-Rspamd-Queue-Id: 8C0152222CD
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
	TAGGED_FROM(0.00)[bounces-95822-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
> Add a new variant of faux_device_create() taking a firmware node handle
> as argument and attaching it to the created faux device. This allows
> users to define and read device properties using the standard property
> accessors.

Why would a faux device have firmware backing?  Doesn't that mean it
should be a platform device?

> While at it: order includes in faux.c alphabetically for easier
> maintenance.

Hint, that should be a separate patch, and is never something that I
enforce or require in .c files I maintain :)

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Hi Shivendra et al!
> 
> This patch is related to my response to your reboot-mode patch[1].
> 
> You should be able to use the new function like:
> 
>   faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));

What is the fwnode handle here for?  Why is it required at all?  What
resources are involved that would want this?

thanks,

greg k-h

