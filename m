Return-Path: <linux-arm-msm+bounces-103208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK13EoOF3mnjFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:20:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B3F3FD941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F1D3024531
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AFD310645;
	Tue, 14 Apr 2026 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hk/br5CO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15233093CF;
	Tue, 14 Apr 2026 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190319; cv=none; b=ChK+VKQWZaG0nzqGVegUJ+JQKsOHe4Qr0VKe4aAMSv1CRL1eQUo39ll2biWuc3VpBdzBACdRJ6BxVbUmHoFgwVF/w50sOB/EoU3msh3/b3B4curYvwzTCU5ByHLo7hB0m/W9yG4vzkbosQPavmhmdQrxFzn327lejplo7+gHOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190319; c=relaxed/simple;
	bh=2o/jtkQyiN8PHqLFozxGvSyuzCc8+5rGSoPCjwukGXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNxK5/utXa3bRapB86HQWxqpUjUEaUA5xSiSM2pDM84m669fjKsafNJLZOtYTJENMGy5ahg+5Xcmg9LKvAon66km1SmJ15t7GetJiXkqyjOuMibofwvQbP7wKXpJ7Oz14XYEudahl/j5HtlafjA2xCgU8/F5vKksprWG1rXRRBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hk/br5CO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21830C19425;
	Tue, 14 Apr 2026 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776190319;
	bh=2o/jtkQyiN8PHqLFozxGvSyuzCc8+5rGSoPCjwukGXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hk/br5COS2J3E48yRv8inA1457ZKNbs9X/UY/MEwNzqf92h71rV1Dn/Q39y+Fganz
	 tF5chWqUDnADEM2rukYHb/TUHyJphD23m8bish/mgImx+cQZRuzfQmgVRVzTKoDfSs
	 mrco6SFKO2XMzNsAFNqC/QcA1+ymh/4/DC4gDskZjDYZCfBoP4urUA1X06qJUwsKY4
	 EbVwiyAwgRx0iAVH0Ne2XLVD38nBEjm/ZrV4XaNkFDPyjGX4ZzxuxNDwTklI8CH5wa
	 m6Ohxx5p0+f0eveoW24wsFr5iAPcRmamcmhtQbNi0Q7CviNz0vZD8RTBq7R8O9BeF/
	 gPZjEvBSYFIeA==
Date: Tue, 14 Apr 2026 13:11:54 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with
 a function pointer
Message-ID: <ad6CykQ9F3N2jogF@baldur>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
 <adm0X2ybeG5McXVv@baldur>
 <20260411062343.moksimqxjomts44a@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411062343.moksimqxjomts44a@hu-mojha-hyd.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103208-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78B3F3FD941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 11:53:43AM +0530, Mukesh Ojha wrote:
> On Fri, Apr 10, 2026 at 09:43:10PM -0500, Bjorn Andersson wrote:
> > On Sat, Apr 11, 2026 at 12:10:41AM +0530, Mukesh Ojha wrote:
> > > Now that the two enable paths are separate functions, replace the
> > > pdc_version global with a __pdc_enable_intr function pointer. The
> > > pointer is assigned once at probe time based on the version register,
> > > moving the version comparison out of the interrupt enable/disable hot
> > > path entirely.
> > 
> > That's what the patch does, but why?
> 
> I thought, it was odd to compare against the version every time during
> enable/disable instead of clearing the path to take at probe time itself.
> however, I don't have data to prove how hot this path is ?
> 

No immediate concerns about this hypothesis, but please start the commit
message with this problem description. Then if someone measures and find
that your assumption wasn't correct, they don't need to guess what you
where thinking when you wrote this.

Regards,
Bjorn

