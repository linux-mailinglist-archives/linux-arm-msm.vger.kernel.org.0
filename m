Return-Path: <linux-arm-msm+bounces-109185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEH6NA8AEGqLSQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:04:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3B5AFCDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EE2530022AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C881A683E;
	Fri, 22 May 2026 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g+LRjRqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5875F17C203;
	Fri, 22 May 2026 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433483; cv=none; b=UNaBS9fnaqltfCHjmJeR0nDuKMn42QsBcfrKfuWt/amX0aiIuAmjPyin4XCldoFJZajp3nZNT9QTGutmdA3II+IJYwjitb5ckObK2ifI5q7MPKdTmGk5AYIPQ53GMUmAEcqCq/vPi+HasaQtGK9SggCVHAUET0ATIkXXRKNpqRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433483; c=relaxed/simple;
	bh=pGaPkRJjLBU0ZVMzRH7aiXFvgHtcAb7Pw7vhovvBTYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeSDghTCaZnl1lJMaLmWPBk745DLNgoPSpsMOW/xT/RY2u3PE4TWV+SkpSikNAW6XEyzOv1ryQ+p755EgtoETPFN25JfoEVHMZ6D7+PMfQFOlZxEHUFkDQnqAglq9RPaFZ+rksKY7PLiJAYikXZqWBtdYDS/F2Lim3gassKi+mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g+LRjRqL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4C51F000E9;
	Fri, 22 May 2026 07:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779433482;
	bh=aFp5GDZmJgiIz0hUR1vPVo/q1DoBP8S6Nw0YpoABK1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+LRjRqL9V4us3qiJHeGWbdbJcgKA0FSAShBwseH6gotRLQlycgsX2jt6pwa/xM6l
	 gpbp49qOghmC5nVkhqqIVx2+KBoiniPm7ySsSQYZMT6kd9i5bYx9n23uHUnNP4B8jY
	 2Pr4mgqfRr/Wbs4OgBBVxE9ZWv1OrcqfwT3Y4jUc=
Date: Fri, 22 May 2026 09:03:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	amahesh@qti.qualcomm.com, arnd@arndb.de, abelvesa@kernel.org,
	jorge.ramirez-ortiz@linaro.org,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
	stable@kernel.org
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <2026052211-pavilion-compost-5fcd@gregkh>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
 <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109185-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 66F3B5AFCDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
> 
> On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
> > On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
> > > From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
> > > 
> > > fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> > > getting removed from the list after it is unmapped from DSP. This can
> > > create potential race conditions if any other thread removes the entry
> > > from list while unmap operation is ongoing. Remove the entry before
> > How can it remove the entry from the list?
> 
> Multiple threads sharing the same file descriptor may invoke unmap concurrently.

multiple threads sharing the same file descriptor is a horrible
userspace bug.  If you do that, you get what you deserve :)

thanks,

greg k-h

