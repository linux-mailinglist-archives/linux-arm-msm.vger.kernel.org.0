Return-Path: <linux-arm-msm+bounces-111956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9qssIv8QJ2pYrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:59:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D4659EBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:59:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=GWjiu4rL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111956-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111956-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=pm.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0707C30B9755
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D07382F26;
	Mon,  8 Jun 2026 18:41:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9403E00A8;
	Mon,  8 Jun 2026 18:41:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944117; cv=none; b=s5brzuTydEuJoV002v/O1erudiJpqGzgHpbBnYJteu8XN7fSFbBwPx8UTwSpl/p9rc9O4ok39f/3lwct48/882N5le2taDTArSBRupaTrGGRPuiwI6BeTdebhert8wMervSrZvDfXrCHaIXqYQISL7LaF/sOTbrXZqyaWM+qB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944117; c=relaxed/simple;
	bh=ZwyEUMEOfM/0mmzF8Atph1lJly4AXCn5lXCQOB6eLSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQbwPynFr6eRTUPf/9YghIGRoSz6fVyYUAQVXcRLyibJ98B88AeSPBHYIucZFqjro6FXW+qo774CZXDU7YnO1LiQEiSAVH7EfpdffVUuQfHC34h+sZuzTCnCMWycrHN4iXLJv8lmc13UjiFJB+nXST1hHjA+MJuosyAYHe8trzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GWjiu4rL; arc=none smtp.client-ip=185.70.43.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780944108; x=1781203308;
	bh=ZwyEUMEOfM/0mmzF8Atph1lJly4AXCn5lXCQOB6eLSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GWjiu4rLv4im+6zF4mkdQg9RickmvcTpBcLZcCgU/wt5KvNwDSj5MyoBiIKeDc2nY
	 Vxv2VeEWpvRySyfVoGzpyj2didAUXxdZTO26eBddWfrZ16TWT5Afzy1khBRFIckmHe
	 w5f64lJGfNLL35QEHGMIYmvmHVVEMEaVwlPdrPL1+E8IdScZrSkTq1bfssY254fxFl
	 YJQY6GDGwl3rU3FLqdlDCqDUGQnNAjUSx5MYri3tU379PH0NnJ6CWTn0/lXtiCTKp6
	 6tf7f99yKy4UjeuQHoSdhjMcv3VUx7tmPw5VlJ0Z4drh97TyGC2n+zgGhUkvY8dGWs
	 69pWQdTKNN6qQ==
Date: Mon, 08 Jun 2026 18:41:45 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function slot
Message-ID: <U4Ou8tzXQzd_9s7-BdFTARdlOQdxQ2P7o9Lx8kaqvvbPd-Jm16U26MFqvYUFkEGiOZ_yhO0GNref9oLmgbtMe9_8yUodoRODhYxWH_0c2Z0=@pm.me>
In-Reply-To: <109ad54c-f17f-49ea-9d7f-54e13dd367da@oss.qualcomm.com>
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me> <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me> <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com> <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me> <109ad54c-f17f-49ea-9d7f-54e13dd367da@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 38d0253f63c8387cc43af2a5001ae1a4b982a297
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
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111956-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD4D4659EBA

On Monday, June 8th, 2026 at 7:55 AM, Konrad Dybcio <konrad.dybcio@oss.qual=
comm.com> wrote:

> On 5/28/26 7:24 PM, Alexander Koskovich wrote:
> > On Thursday, April 23rd, 2026 at 7:08 PM, Konrad Dybcio <konrad.dybcio@=
oss.qualcomm.com> wrote:
> >
> >> On 4/23/26 6:51 AM, Alexander Koskovich wrote:
> >>> The hdmi_rcv_det function was placed at alt function slot 2, but the
> >>> correct mux value for this function on GPIO 19 is slot 3. Move it
> >>> accordingly and leave slot 2 unassigned.
> >>
> >> No, 2 is the desired one per docs
> >>
> >> 0 -> GPIO
> >> 1 -> QUP2_SE5_L3
> >> 2 -> HDMI_RCV_DET
> >
> > Is it possible that CQ7790S is a special case? The pin assignment I hav=
e for it
> > here is:
> >
> > 0 -> GPIO
> > 1 -> QUP2_SE5_L3
> > 2 -> N/A
> > 3 -> GP_PDM_MIRA[0]/HDMI_RCV_DET
>=20
> I was reassured that my source has the latest information
>=20
> For reference, does your reference doc have any 80-xxxx-xx-like number?

Yes, the document I am referencing is 80-97791-1A, though since you've doub=
le
checked likely just means this is is incorrect?

Thanks,
Alex

