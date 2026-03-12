Return-Path: <linux-arm-msm+bounces-97261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIDFOtDasmlMQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FD274584
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F58C3217F52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE09E3845CB;
	Thu, 12 Mar 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H9Q9X2T3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799CA3845B9;
	Thu, 12 Mar 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328884; cv=none; b=ZpYMbL3kK4XhAPOZ/kX1rKyji8/eSHJAGOXUq5QkaqwUSI1eQLcH3CHedOHn1FPCDwgtgw8xdnOv1O4oLLWKP31TsCm9/PTOy4/ZI+Rz+41eAkIM0xh2bLvt7YdHKLNd9B7DDtFiIk3y/a4IAOCyMkHxkpmCiXBFec6Wliokx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328884; c=relaxed/simple;
	bh=YTAxrKfaWlpyf0/MK7MHIXvdGyAf3SGdE+RVhDUnn4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cctAT8BaCIYDl84OjHPi4uoxMxHrGOW48u7ToIYVMH52rrl+q8AbbaJ3xjkPVxYmRrTHyvZYCAoOeNuOZJ6bhJqQpMcYueE4l2WeLs6VxBWPrbR9GNxR8pv1LKSiWh4/RH5wvhzUaat1pANAHYjk/NsFIihnwFqt27DfsyHabjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H9Q9X2T3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A01FC4CEF7;
	Thu, 12 Mar 2026 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773328884;
	bh=YTAxrKfaWlpyf0/MK7MHIXvdGyAf3SGdE+RVhDUnn4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9Q9X2T3SiKNqN8iRSmDM2YLLYjtuMVcUUEgGBorB2p3By5rIVUWBVkHKRrccuaK1
	 AmHkVUXLmmm3QX1mxuG5EGKkoxKrI4B6D46oXzR5d/qXCINt3gjp4P1p21uUJU/xRc
	 7G5wmia3BsnaRZZBII3WDSOtyYry38I/7UO63WB0=
Date: Thu, 12 Mar 2026 16:21:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp,
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org,
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 0/4] driver core: generalize driver_override
 infrastructure
Message-ID: <2026031211-landside-subtype-5750@gregkh>
References: <20260303115720.48783-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97261-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 878FD274584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 03, 2026 at 12:53:17PM +0100, Danilo Krummrich wrote:
> Currently, there are 12 busses (including platform and PCI) that duplicate the
> driver_override logic for their individual devices.
> 
> All of them seem to be prone to the bug described in [1].
> 
> While this could be solved for every bus individually using a separate lock,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
> 
> Thus, move driver_override to struct device, provide corresponding accessors for
> busses and handle locking with a separate lock internally.
> 
> In particular, add device_set_driver_override(), device_has_driver_override(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to
> declare the corresponding sysfs store() and show() callbacks.
> 
> Until all busses have migrated, keep driver_set_override() in place.
> 
> Note that we can't use the device lock for the reasons described in [2].
> 
> This patch series includes the migration of the platform bus; patches for all
> other affected busses still need to be extracted as a follow-up of the WIP
> treewide patch in [3].
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=driver_override

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

