Return-Path: <linux-arm-msm+bounces-108981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHEVO7HKDmovCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:04:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6855A1CFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A9913035315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F9E367B8A;
	Thu, 21 May 2026 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="R0D0zqrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680728B4FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354239; cv=none; b=U3YIZULVI8FORuTC+JvPd93VSnk6OeFixdQLoQatGFuRCESyLsN4mWnWUpKtPKSFFux4wlFKovLa/BnnzE+PP81HUrwVkAUsalyNR9ZWq3p8F9p5stqApix06Mp/+nk2MdrtxYg0mo6wAsVQGUf6X4QQrVrs6NFezfIJRjAh/Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354239; c=relaxed/simple;
	bh=uo3iznA3qGTNsqeYpRVqpMPW/7iAZoP7T3DeD8qyWwA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLmtXyytLkDTkoVu1h+hInKkqkl/WNjpC9VffM3rUr9iQG0A3zWeZ5nGcvnuhcwtqFNzRd7g6nxu0ygY+MtC7fj+Z2hJNndpp1CVBmsXRHVml2IndITgXleOvuGRoooujg36DSizix2QhUSwN+ZUZ9hA/yX8J6KmXg5OB/MMjNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=R0D0zqrj; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779354226; x=1779613426;
	bh=XUOs5gzGAQsfeLUsJnVftHR4Vb5FftuYeGY6rn8jz0E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=R0D0zqrjGCyWsuQ6b9mypJwIzOF8Y0katgLZRMiayBuusZ0iwdIgcEklFemG/r6tn
	 DwOpvWS+xBHsTAGXriTQVw16UnvuKxUo1fTLEQdePQaG7F1SBf79LAGCU/tVVxXVtF
	 bi8B/KrAPytg3vhJ6siZDTKxsQXs+OGtQV0B+F+WLOhMy8ZVvICSJfv9X+kmL8LjIe
	 hGWL6dK7LQKOXbGlMIB6Or+W/pONfjNt8mlruAF1mqxe3vFozCaMJooPFUBPuDnNs3
	 2ORvA1FpgkABj0dYfpHo8mc173r7mCmgk9GtFhsyAQDUq8CWFG21zZB7OEe4sy1HfM
	 Ok79cjNyWE0zg==
Date: Thu, 21 May 2026 09:03:40 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
Message-ID: <B1J_l5TEAq5VkrzIONy8jR64syCY4emf6nfv6_oisI08IblhzeBv7meOvwVNFxknOEtVAA9QZKkG1eUtMlsCU4vJeYit4gAWYI2J5p-U6tc=@pm.me>
In-Reply-To: <efede04f-b2e2-4fba-8247-f92eafa2b381@linaro.org>
References: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me> <20260318-dsi-dsc-slice-per-pkt-v1-2-1bd66b7f9e0c@pm.me> <w74ctaczp3ty7wil2sfkztc6wvuppgpyff4tw4dze34irvfmlx@e5f36rzqmp6i> <efede04f-b2e2-4fba-8247-f92eafa2b381@linaro.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fb4b6bed8fc43b6f3108e2d4f609f11792d1cd57
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
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-108981-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9C6855A1CFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, May 21st, 2026 at 3:50 AM, Neil Armstrong <neil.armstrong@lina=
ro.org> wrote:

> On 3/18/26 10:39, Dmitry Baryshkov wrote:
> > On Wed, Mar 18, 2026 at 07:33:03AM +0000, Alexander Koskovich wrote:
> >> Some panels support multiple slice to be sent in a single DSC packet a=
nd
> >> this feature is a must for specific panels, such as the JDI LPM026M648=
C.
> >>
> >> Use the MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag to derive slice_per_p=
kt
> >> from slice_count, note that most panels are expected to just work with
> >> just one slice per packet.
> >>
> >> This change was originally authored by Jonathan Marek:
> >> https://lore.kernel.org/all/20231114174218.19765-3-jonathan@marek.ca
> >
> > This is a wrong way to give attribution. Either please retain the autho=
r
> > and Jonathan's SoB or use Co-developed-by and still Jonathan's SoB.
>=20
> Please retain `Signed-off-by: Jonathan Marek <jonathan@marek.ca>` since t=
he only
> major difference with the original patch is moving the drm_mipi_dsi.h cha=
nge to
> another patch.

Yeah, made sure to add his Signed-off-by to v2:
https://lore.kernel.org/linux-arm-msm/20260318-dsi-dsc-slice-per-pkt-v2-2-0=
a1b316f8250@pm.me

>=20
> >
> > The patch looks good to me.
> >
> >>
> >> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> >>   1 file changed, 10 insertions(+), 15 deletions(-)
> >>
> >
>=20
>=20
> 

