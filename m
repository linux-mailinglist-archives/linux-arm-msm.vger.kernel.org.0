Return-Path: <linux-arm-msm+bounces-99922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iARoOLskxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:08:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918D32A4DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28BC0302C319
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F54441C2ED;
	Wed, 25 Mar 2026 18:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4IzPVN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CC40F8C9;
	Wed, 25 Mar 2026 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462062; cv=none; b=SThug/ADY6S7acdxRyr8lZTOuN8We15OlgZqjycaUT6Z1q7Br3DofqUkvrgy3nY2p4WpOTil7DIhystSgoB7aebariF1+s5j5VoenDyCn9g68NrUNofrYABEeYfM9Ei7ptuQY8hcTAYTDhQnDPSKtLxwTRFTw7N9M58hzbbg85E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462062; c=relaxed/simple;
	bh=VrERmH7NL2hhZTiixHtA35OHq9oJ+IK5B/o7+2UsP8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfUP/JmYCvvUMDIH3BvI3qgB0J67LEFM/G0phgG6WXZoXkfPbHWmfQxXAWBM+C7Ih05w3NnsHcQJ6SjgrnjlbzzlXu5RJOQgNwMVoztY4b9dCqblHfk2CN1I2mw6kJ8Ee/1/pjhsqusfIOZpYGE0G/3qQIQfLJ8ivMyf5ZYhBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4IzPVN8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75670C4AF0B;
	Wed, 25 Mar 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462061;
	bh=VrERmH7NL2hhZTiixHtA35OHq9oJ+IK5B/o7+2UsP8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4IzPVN8Bdfh8y5p2WBPwl4Vic0lUV72G8SC1GJbnGj6Rn6oUG+k4rFEquBmIGCaH
	 qAbJ/w/xTTgTnrCXnN/SEyifpyKaCV15V0fsw0nj/ElQYF9Ut0w/eSvlPpxWGrTXhc
	 FyrnPVC6/GW8HtaELt5kwZGcPp8fN0jN485BGhj9G2NIl+IvDLJyNntZ1r788P3I2I
	 ZmYaYdMrcnDou5KPQ48jIbYiizg0z/X4vRv2Iyg5uwhqDHWhPDTbotAPTp2/IXLZD0
	 Ndg9YVMO08zEm+e9PsLlThv7RwWcCfqHecy+Z95alvKukjt2iSjR1G1Cm0GLGnzICf
	 I/nvVJmHFpdCg==
Date: Wed, 25 Mar 2026 18:07:37 +0000
From: Simon Horman <horms@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: qrtr: fix endian handling of confirm_rx field
Message-ID: <20260325180737.GM111839@horms.kernel.org>
References: <20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com>
 <jwqcbxfhnzbxn3iwvoe3shtfttio2pjsah3pkwknzqvjx4xfp5@nmfkkgrjxkhk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jwqcbxfhnzbxn3iwvoe3shtfttio2pjsah3pkwknzqvjx4xfp5@nmfkkgrjxkhk>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-99922-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,westermo.com:email,horms.kernel.org:mid]
X-Rspamd-Queue-Id: 8918D32A4DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:28:32PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Mar 24, 2026 at 08:50:33AM +0100, Alexander Wilhelm wrote:
> > Convert confirm_rx to little endian when enqueueing and convert it back on
> > receive. This fixes control flow on big endian hosts, little endian is
> > unaffected.
> > 
> > On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
> > apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
> > in native endianness, so the conversion isn’t strictly required here, but
> > it is kept for consistency and clarity.
> > 
> > Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")
> > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Sorry if this contradicts my review of v1.

But as this isn't strictly necessary let's target net-next
and drop the Fixes tag.

...

-- 
pw-bot: changes-requested

