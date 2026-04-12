Return-Path: <linux-arm-msm+bounces-102862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL1WAvHU22kzHQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 19:22:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B633E5111
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 19:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E4D1300130C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9049336884;
	Sun, 12 Apr 2026 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gqynRjIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C714315A;
	Sun, 12 Apr 2026 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014574; cv=none; b=D/VnWB61Co6hu+J5qXMHJH6YycVbzHuyKJd88TQ5DBNzwJTFTjO9SQ3vGR55OZH88Gx5r5PHdN8DeEw8AAX4eywQ9yyadLyOdWXBjlTBMI4/T5GHOjndkCbCNQQ0n7lcKnNVzjdK0r5zHreFipJYgVkJ+y1F6hdGYq8/DboJhH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014574; c=relaxed/simple;
	bh=OwFWta0g/GEJ6q8bzULCPgU4qEXMQFCslTN9h1+HDcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJMI8KcRkBp4irJZ/lrk+/sOoLnFf10J+2mExuiby+ecAeYIXcMtGCHOdTGfJFXRHlqpcz+yIAAJd8y8uFCuYZ/7d0+P6OwSyactXGPUR6RJQAzM0Co4H1vv0xJC5rRYQqNGBHbJ4Qp4GM2RTUFtaLhm9sSaNB9BI1wXDAv2oD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gqynRjIs; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776014565; x=1776273765;
	bh=mXf6/B/4Z09mzAF9S7w6/KSwBIS2b3smcc9NSEpc7PQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gqynRjIsjxAXGOfRlPpFmMoIbU32OTNm2bzBWAbg30LL1ebsD+fwnwMhASqQdDTjT
	 d/6AhFExzVfVMIF6V0ll/qaXWZpoVlTdUu+yANh1Hfgv2lpDy+tV1HNUqx6Biyau72
	 DTzbCgEQQ20EEvs1sLNGgfQqIoozEe69UWhbPsn5KuWAOSFeCu/jAjGnR3g6teIsbf
	 xAX6AvLc4y5U28FJUd1IUgIkSCo+e//b5weDGDNSMKCZNfvVrtI1LK9RLRS/nxjxqd
	 2wisHlmsNd+oHn3jqaMrXj197rBFuZLQ7Xpn7asgMt2EtcF+r6jzzt0oeykWQw4YGC
	 ASq4Bgn8F5uEg==
Date: Sun, 12 Apr 2026 17:22:42 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "clk: qcom: rpmh: make clkaN optional"
Message-ID: <sJgETAmiFV2D25pzG1pG4FKJAr6yyOR92mYFerv8Lg8gsk0zLNywGGzStk1SfD1Kad_BYDYkDXXPXv_18o5_mYToBEGgjNZVNekSg6rh_5Q=@pm.me>
In-Reply-To: <rxjdw5cc3zn3d65md7ebztk55rmziifqxlctvn7ptfqmt32zls@cy3j3tkfpr5w>
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me> <20260412-clk-rpmh-vrm-opt-v1-1-37c890c420ff@pm.me> <rxjdw5cc3zn3d65md7ebztk55rmziifqxlctvn7ptfqmt32zls@cy3j3tkfpr5w>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: bb88e9dac3b4763f7768ef1e4f97b72db93995d1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-102862-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A8B633E5111
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sunday, April 12th, 2026 at 1:10 PM, Dmitry Baryshkov <dmitry.baryshkov@=
oss.qualcomm.com> wrote:

> On Sun, Apr 12, 2026 at 03:30:52PM +0000, Alexander Koskovich wrote:
> > This reverts commit 166e65bc6ce317be41368d9340b870edbdbaa2aa.
> >
> > Reason for revert: Better handled by just marking all VRMs as optional,
> > instead of needing to mark for each platform, done in follow up change.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  drivers/clk/qcom/clk-rpmh.c | 11 -----------
> >  1 file changed, 11 deletions(-)
> >
>=20
> If this gets landed, then between this and the next commit the tree
> becomes broken, which is not nice if you ever try running git bisect.
> Either squash both commits together or change the order, so that the
> affected VRMs are first marked as optional and then you drop the
> clkaN_optional handling.

Got it, will fix in v2.

>=20
> --
> With best wishes
> Dmitry
> 

