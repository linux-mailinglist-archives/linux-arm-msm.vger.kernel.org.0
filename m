Return-Path: <linux-arm-msm+bounces-116934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jA6bFZHqS2ohcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:49:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C7714127
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:49:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=ftB2jAFn;
	dmarc=pass (policy=quarantine) header.from=pm.me;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116934-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116934-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1F3B3339046
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CA63FA5E7;
	Mon,  6 Jul 2026 15:37:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A343F65FB;
	Mon,  6 Jul 2026 15:37:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352235; cv=none; b=UlaVWsF8L9nfXWZZwC1j2FooQFM9W9SLM3cYRlulW7ElSZw05rcgDe4zwjrUZ+4i4ImEp2IyNwAkAlHecS5TfsFKo+rqlM4cfzW3TuNo8SxbUituSpJUYZ0ZpEBxLbOttDmgh3cOmTDZLyxQdoFRmVlzQsrGUgZBQbhzHponeI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352235; c=relaxed/simple;
	bh=LibtmSSu6cFPGtQaaj3l9JusqlhIyF5fm6XvXa0dtgk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeKIml1Ujr+IlI8OqPH7PI3Fw+dApEFiUUFYOtL3++Udcepa88e1xsWQlR9yYnjqHvTr7+DpQtbDcv/E/tQqY23aLDWfo9ybAosyGPTinJl/cmFg2GeVY6+/EgP6tnLsofyAvGq3UOkvDAg+KoHFYEJnaQN7JnyFSgzr+X8Ob6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ftB2jAFn; arc=none smtp.client-ip=57.129.93.249
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783352218; x=1783611418;
	bh=F4U2LcEhz5eIMAeA+g8UYI78YWYXfUIQEsBnQQueLq0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ftB2jAFn3fGERg0fm9w9x98gQaM9GqyuCieseKnApQGgH3Hlqq7Lzv3evmhd5yFkn
	 Rh7yHlDcSF+2gEjlQO+cxBGuJSVMgyDIFFWZTn0u2XVnQKT43p9tuYpg5OaZ6VNEJT
	 DZBMRGQG1sIDhHQIkafLypoQ1RW6Gvr/wjzVKt78u6oltQRUmIO6XMIW+M/741AnoF
	 X2VTZEB6LviIpU/obkyQxDSC13fr+ADIHRStz2Ppic+/ywgD6ieovCJ1BWQRMWZhFD
	 /9TTUkzrEAMh0V3gnN+yCimV3bMClderEsCTNILbL45U0gDP9pxk4nfuQCewC1I6H6
	 feZmWxxIaZ7bQ==
Date: Mon, 06 Jul 2026 15:36:51 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Add support for the Iris codec on Milos
Message-ID: <Ke9vE4PniJAR9EMGHrVHRjwIR4ORxH2S0ZUOD_fqimjGEKsVbH98YBkWtExYuRqnzLfyFwoVJcO73mZRSChuNj0b4mQCT2XADK3xRe5cDDc=@pm.me>
In-Reply-To: <2eguh5xk7ykfbpwnjly7e5gkupxgteqimdnpbxdddvs5zfhu6s@orfjibovsg3x>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me> <2eguh5xk7ykfbpwnjly7e5gkupxgteqimdnpbxdddvs5zfhu6s@orfjibovsg3x>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fcee93885eac3b97e3a111637c90af305f1f231a
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-116934-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A13C7714127

On Monday, July 6th, 2026 at 10:44 AM, Dmitry Baryshkov <dmitry.baryshkov@o=
ss.qualcomm.com> wrote:

> On Sun, Jul 05, 2026 at 10:10:18AM +0000, Alexander Koskovich wrote:
> > This series adds the bindings, nodes and platform data for the Milos pl=
atform
> > for the Iris video codec, allowing Milos to use hardware=E2=80=91accele=
rated video
> > encoding and decoding.
> >
> > Ran v4l2-compliance and some fluster tests, though a concerning amount =
of them
> > failed. Attaching v4l2-compliance output and the full fluster results b=
elow.
> >
> > nothing-asteroids:~$ v4l2-compliance -d /dev/video1 -s
> > v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
> >
> >
> > nothing-asteroids:~/fluster$ ./fluster.py --no-emoji run -ts JVT-AVC_V1=
 -d GStreamer-H.264-V4L2
>=20
> Could you please run the tests against the full test suite and submit
> the results to https://github.com/linux-msm/fluster-tests ? There is a
> script to run the tests.

Will do.

>=20
> > ***********************************************************************=
*****************************
> > Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2
> > Using 8 parallel job(s)
>=20
> -j1 might also be nicer.

Yeah I did run -j1 for VP9, but I kept the other two at defaults since I wa=
s
trying to match the testing done here since it's another vpu2 gen2 platform=
,
and assumed there was a specific reason only VP9 was set to -j1:
https://lore.kernel.org/linux-arm-msm/20260529-kodiak-gen2-support-v4-v6-0-=
9a81bfa797d9@oss.qualcomm.com

Will make sure to use -j1 for all of the tests going forward (assuming the
script you mentioned does that).

>=20
> > ***********************************************************************=
*****************************
> >
>=20
> --
> With best wishes
> Dmitry
>=20
> 

