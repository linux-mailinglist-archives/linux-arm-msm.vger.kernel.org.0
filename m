Return-Path: <linux-arm-msm+bounces-111535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EqbPDt2BJGrX7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C23F364E3AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:23:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=l0ntZMmV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111535-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111535-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=pm.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D93A300E148
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 20:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AED02E1F02;
	Sat,  6 Jun 2026 20:23:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C2175A77
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 20:23:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780777435; cv=none; b=oHFEBp1VpDVVSTv8eMYYFAgQDzuNBzAraAaV6iLjQ2te8GLncYv6QIEcExbCQIi65zRhJkOue+3/oI0fAAwevAkmrsWGm9mjt6YihLnR9hisSHVDYLE+JNNvN9S1kChExiTWZIb9lVrIKDJibXXs9/DpcGDqgURB+4fWDNl2Hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780777435; c=relaxed/simple;
	bh=jcJgKWkR7ZYNXmZQ/2TOyoNRGSsz1U5CVTE5gVFMtwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6U4X4kPRCnt51F2/AWClxejy/JE95alMmQNvGy2427Xv2PSn35gIKFzKc/yajEZWirwE2/xuUyW/fxaxAgI0acoUCHTQGrLSzjMA9buNAS4W6wUO+f9A0B/HEiWNuyWxaV3i9hhWlsiSv6mpMyyaCWEoORch3HT27R+B4v2z4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=l0ntZMmV; arc=none smtp.client-ip=109.224.244.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780777424; x=1781036624;
	bh=jcJgKWkR7ZYNXmZQ/2TOyoNRGSsz1U5CVTE5gVFMtwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=l0ntZMmVSdi976sJnS4C2kwJM9vPX9wSGgidkLYyqcE5/fwfIivJKQXMnlxsoq5a3
	 tpqk0+T1ARn9GLEBJQJHQu+xy/uYq8PPU+LdbV2zif4fP+ShqyBZiLph2/5RlIoOBj
	 lW0QH8eSm8Z1k3JizogJTBTrN3+N6mMwrk9KJZOcOr5sb5Q3sJcsk6Jumf7EGAeB6b
	 inIGaTwHah05V1VZei/w5LVISZjzaXyYkQOhq3lwTemmZQbnEH91BtRTP2rju55Ryx
	 h9+Qp4sBWWaSD5AD+g1v9smdkrFiksB3gMire702GJhs0hSPKjgOu2zhYQpoCfPilK
	 afMLsiViqBxZA==
Date: Sat, 06 Jun 2026 20:23:38 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add flag for sending all DSC slices in one packet
Message-ID: <C7NqucjdVmZMexR2CNQfB4x8PqX_18JqIePxmtHqS3jeL5U1CFSZIpNqfH7zERiD3tIbRshVpnmok7akJWPrUCaoSCU1QD-rdQjmQ8cEw-c=@pm.me>
In-Reply-To: <kxbtfiizjbprs4sqkmtotbaeqmm5e3draavlmdskhmws2l6ivq@73r3hnghmmrv>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me> <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me> <rrgnyzpxo6g3ufjcnxnshexjotyq3riruc6wqjhirmcjo4qdta@gmwhs3mu2xld> <kxbtfiizjbprs4sqkmtotbaeqmm5e3draavlmdskhmws2l6ivq@73r3hnghmmrv>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b52e804e0ff33d68455a5fb9bab237e0bf7a4299
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111535-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:mid,pm.me:from_mime,pm.me:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C23F364E3AB

On Monday, May 18th, 2026 at 2:02 PM, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:

> On Wed, Mar 18, 2026 at 12:33:45PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Mar 18, 2026 at 09:54:04AM +0000, Alexander Koskovich wrote:
> > > The MIPI DSI v1.3 spec defines two modes for transporting compressed
> > > pixel data: one slice per packet or multiple slice widths in a single
> > > packet (Section 8.8.24 Figure 40).
> > >
> > > Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
> > > set to indicate that all DSC slices for a line should be packed into =
a
> > > single packet. When unset should default to 1 slice per packet.
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > As I wrote for v1, I'd prefer to get more opinions before applying
>=20
> Any comments? I'll apply it in a few days otherwise.
>=20

Hey Dmitry, is this series still able to go in for 7.2? Not sure if it's to=
o late.

Thanks,
Alex

