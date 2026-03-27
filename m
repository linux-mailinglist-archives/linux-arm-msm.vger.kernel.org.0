Return-Path: <linux-arm-msm+bounces-100193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LMqJ6wQxmnwFwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 06:07:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D7A33F364
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 06:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37C2930379E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 05:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B870346FA8;
	Fri, 27 Mar 2026 05:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxhoOU5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C6EEBB;
	Fri, 27 Mar 2026 05:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774588069; cv=none; b=I234lhCfxCoGOuAh/6x1kZDTaOr7Y2b8R2An+pZ2wFAiyEd3fQ8efoEWxnSiHAAo8nyCe1fIcvT56XikIk0VAofXYhqK5QOW6nDHT6cZATIBk4fjFTU6H168bewQi5jy51VgPB36ySg7+xafaphHioFrZR2+OfDDlFTO95glXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774588069; c=relaxed/simple;
	bh=foyfzrQ1xblJ+uKERe5imDS8DSIRt3u5tExHq8ZHtuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+8pBw8t7FKuBNO3E+jkaHa3px2xZ/OZR/HV/gyn0ksjBvPH4F77ZdpP4KTEQv/jcQpeBGEwThGr5UvEkgMJ5xtePGIBlmDhAWdX+2d73sU/iSnfWPv8KGCZhj07IMtKyqB8cAIVmiK/qGD1Co+88abn+mDR+h0txqZqI9mWwA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxhoOU5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B001C19423;
	Fri, 27 Mar 2026 05:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774588068;
	bh=foyfzrQ1xblJ+uKERe5imDS8DSIRt3u5tExHq8ZHtuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxhoOU5Gn9wujdx8qZ18UHU/0v+DMRePW3ZbybKA9tjR4flnT0BHDJsSj1NWL6rQr
	 8crQacM65bL9SxH9w5pIKW+jbo9jxgZ59n/LKPyAt4JPbAY+CIw4zNzzDFPYMWsGLG
	 /Ze2bu0dm2PpNNdat28mBV1SpMtY6gVAtZonYiZ5KwNZhT2gXbdMeSHa94zn0RsUhR
	 eNRj7DD3kt4bloOfluHvyNlOi03PZY6jIgeB8+QJZZY+4jrURiRWOdHKGXY58W/iIj
	 a4GgGZWviXWE1OX/FnoJuJi5b/wWrvUQJKAa0pQZji01uu/dVjzqAEniQIIJS6LrQM
	 Aa5Vr9rUTfjcA==
Date: Fri, 27 Mar 2026 10:37:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Simon Horman <horms@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: fix endian handling of confirm_rx field
Message-ID: <hcxmfaai3qekgvh2vihnx7qdprungsrpmeu6vzz6mmxywjzifh@tzmmcx7olpxt>
References: <20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com>
 <jwqcbxfhnzbxn3iwvoe3shtfttio2pjsah3pkwknzqvjx4xfp5@nmfkkgrjxkhk>
 <20260325180737.GM111839@horms.kernel.org>
 <acTV86xU6piDih4B@FUE-ALEWI-WINX>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acTV86xU6piDih4B@FUE-ALEWI-WINX>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100193-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[westermo.com:email]
X-Rspamd-Queue-Id: 99D7A33F364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 07:45:07AM +0100, Alexander Wilhelm wrote:
> On Wed, Mar 25, 2026 at 06:07:37PM +0000, Simon Horman wrote:
> > On Tue, Mar 24, 2026 at 01:28:32PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Mar 24, 2026 at 08:50:33AM +0100, Alexander Wilhelm wrote:
> > > > Convert confirm_rx to little endian when enqueueing and convert it back on
> > > > receive. This fixes control flow on big endian hosts, little endian is
> > > > unaffected.
> > > > 
> > > > On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
> > > > apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
> > > > in native endianness, so the conversion isn’t strictly required here, but
> > > > it is kept for consistency and clarity.
> > > > 
> > > > Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
> > > > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > > 
> > > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > Sorry if this contradicts my review of v1.
> > 
> > But as this isn't strictly necessary let's target net-next
> > and drop the Fixes tag.
> 
> Sure, I will rebase onto the latest `net-next` repository and send out `v3`,
> without a "Fixes" tag.
> 

FWIW: Adding Fixes tag doesn't mean that the patch should be queued for -rcS.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

