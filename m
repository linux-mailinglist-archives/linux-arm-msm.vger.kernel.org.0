Return-Path: <linux-arm-msm+bounces-93399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEXOG/4Tl2nWuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:45:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81A15F356
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 862613019CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E5229CE1;
	Thu, 19 Feb 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoaomqNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EB3CA6F;
	Thu, 19 Feb 2026 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508729; cv=none; b=W7bqr28MNOYlmtA2CgvqZzS4k3UVzq3KTRaxrbIK3Lc6q2WSE7ifuXqV3Vt0hMouEEvx4WC2REyKNv+uPcRncJkDVLv1bGsx/oXwjymqUMtJclnK/AZfBm4OEnu9CjS8F/GjNBZiSYlpeWw3xS38dakvyxGsNhd142owwjnjCnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508729; c=relaxed/simple;
	bh=YNhO5Ar2EvZfD+jNSpkur8t2JjgD5F5KFNpP+al4NSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFccK24IJhqtKROGVN/dnZDRzwWRQBG35k+Hci9ET214VL79xxNAlug110H9/osZ50wRpR6NOKQdYA6PxyxmK3MZ28lWbFlDSvXctx1PdR+6QB2v1dxMmX72ECaiXppu8bpQ/S7LyzoWty8bWnFn5D73wAwyG+RFhLgCbFEWj2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoaomqNf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551C2C4CEF7;
	Thu, 19 Feb 2026 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771508728;
	bh=YNhO5Ar2EvZfD+jNSpkur8t2JjgD5F5KFNpP+al4NSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QoaomqNfKl5dE/L3S0IJ5q5qwRKsGNgjqxKICtkDVgc8Y3YiWO2z6RybGxQ2s/dk0
	 DHbnzA9idwGFAiZ5ZgBwf/MM4Cgxv2lENCZ0P8eHcI9dnXGfMZ+Fz2Hrkp85beOtZ6
	 locSoQ/8WbJnfBY/WhJIOcuzfvVuqBC5ecCa/WmI4KnY/uYMvRzclvqsNgeastPXTC
	 P8shbDMXsiEiohi3A5vdZXr4hblcUNds2srGUrD45AnCD8HwRhczEubmIUaZwlM1iT
	 c+J0EPf2BUbHAmXEi8V0P8TmNTM/NujOx3SgDBkBT0DDa8xDNsjHgduT9ern3PaSXs
	 vayYfKEaqlGZA==
Date: Thu, 19 Feb 2026 07:45:27 -0600
From: Rob Herring <robh@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: andersson@kernel.org, mani@kernel.org, krzk@kernel.org,
	helgaas@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com,
	conor+dt@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	lukas@wunner.de
Subject: Re: [PATCH v4] schemas: pci: Document PCIe T_POWER_ON
Message-ID: <20260219134527.GA2438773-robh@kernel.org>
References: <20260205093346.667898-1-krishna.chundru@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205093346.667898-1-krishna.chundru@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93399-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: CB81A15F356
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 03:03:46PM +0530, Krishna Chaitanya Chundru wrote:
> >From PCIe r7, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
> minimum amount of time (in us) that each component must wait in L1.2.Exit
> after sampling CLKREQ# asserted before actively driving the interface to
> ensure no device is ever actively driving into an unpowered component and
> these values are based on the components and AC coupling capacitors used
> in the connection linking the two components.
> 
> This property should be used to indicate the T_POWER_ON and drivers using
> this property are responsible for programming both the scale and the value
> of T_POWER_ON to comply with the PCIe specification.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Applied, thanks.

