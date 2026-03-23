Return-Path: <linux-arm-msm+bounces-99158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ppz6I14KwWmUQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:39:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C90602EF341
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6524F3037F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5583837BE66;
	Mon, 23 Mar 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="Bg/MHIke";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="bqtMl3Oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8338552C;
	Mon, 23 Mar 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258493; cv=pass; b=YzyiI/WHKyVlLlyFy7xOVUo2ixmG/aremPMUyX6X9Fun0/BDj5SIWkuBXdGSpZums5voTl7FAhWqhsEjJ7ndXuGdf+16srLjYZij0g8/E8cWicmOLfhYf75WcncC+orFLC5GOag+s+xYBX8JkFe92+zCXn8M7TQaetIxAupQQXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258493; c=relaxed/simple;
	bh=EOBZTyy7P2fUsm3DWAIgwJcevLfcgSH2iv37mH6w8Gk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HSkLZvOySsz0y2SIjmuvpn+bcqJlKHg/2mqBU70V3nZmphPeJGdRo1IdkoFuy8z/6sHRAlf+fJUIBV5Vzu7m5bdol1mf9AL/Nwv6C4XGNd2b8D5X5fYHVJRmKXUS6LSHhg2PjpBjNXyPsgjA0TRw0EEN7UF+Lnp63L6lmhUpCjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=Bg/MHIke; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=bqtMl3Oc; arc=pass smtp.client-ip=85.215.255.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1774257763; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=i3cEr+ieRD0g2F0GFa0uV4E2vEDPbchI4LOKvJjkFnBnFrcJjGpC9kotl/IL5lTDkL
    /D32e8J/5EkvcDT+KS8NHXAtZ5x74Db7G6cgk7sGiq89Q+70th64dTynfT33UvgpZ4cO
    DsgqzxtJknrKybuvZMabpWwiYDNQXxR8jZ4d24k1fbt5i+xRiP0Vem4X1Fn0kjNyUni5
    FulIVVhNgEcSppOh2VT7bDO7Cg4M0eZq5jMk/JTvZgypvogTBnjiL4j4h0cZtiF6hSM+
    Mt4jcfD79QcwZOkDnwkicqHv9WbWnryQk65DrQ9uWV66XsN85i4EHdhJdxvJj4Q/A2N9
    bR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257763;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=EOBZTyy7P2fUsm3DWAIgwJcevLfcgSH2iv37mH6w8Gk=;
    b=qm4hFCYdK2Oa/UYsABQcz2ESFSkI4VyhxSTcnmQqP1ZUB1AyaTCyTLOno15j2RdRUN
    D8+JMqgdO2u8mtXbUTRwx/QNv77ALeqNVN+JDOZ7hsIGQ+8YB8xS4z2aPGan0/tUUcOu
    G6tsNgaPBC7itPp8tH9l+xyzshWRiIyAppsqn+n/JOz+WFtA7EMPYN/DSxsRot8TVM0H
    knvIi/TvsCb67V1m/RXJvN7oRJ279RGkIOsPqslWCCqLoB90u3UrksXuqe3edskfpwUV
    w9nh73JL+UZe9Y17zRWBtRNe900xnfAHx/OKhf3bPm586ozzKGYd1tnY8ttOYw+YCJvy
    pFoA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257763;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=EOBZTyy7P2fUsm3DWAIgwJcevLfcgSH2iv37mH6w8Gk=;
    b=Bg/MHIket7UzSZvOj4BNlVGP8hA0MOJ3P1f315lRPY/c+XwSR20zXP4DPuiImuBojt
    UB7chW7BSC0ZNsuY1hxl5pSpsFkEsy1JzMEkKzedVXoY8bvMizkaw3pq38uNMWg8valg
    XBQtDm1OgwaTiM68qVrP/iyvJofWl7LmqPCwII5AjO4UAxymXkAJUSnA/NPzbPfdyh6W
    oHcI9MWFS4rEEcEfwNfh/IHaocG8UxMXEUc/FUOwbOZC5uY73uxgpAVd0dC3k6IGPPZC
    1st8zcWx3LE/oYm9cClGLTs0Wk7sqc4VTOTsoYIAVvqpiR8qsonDax3P7Rt6l8wnhfm2
    0/kA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1774257763;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=EOBZTyy7P2fUsm3DWAIgwJcevLfcgSH2iv37mH6w8Gk=;
    b=bqtMl3OcS4pghvTG4yJ3c3gevGFnMAWb9BFKyhwKhjBmWZZ8B4cpvJOnqambYuoc/v
    7uK6KHJgbQ4U1PfHvuBw==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522N9MgQO9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Mar 2026 10:22:42 +0100 (CET)
Message-ID: <6798b2f971457051e842a48df93e738b01ef6c41.camel@iokpp.de>
Subject: Re: [PATCH v4 08/12] scsi: ufs: ufs-qcom: Fixup PAM-4 TX
 L0_L1_L2_L3 adaptation pattern length
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "open list:ARM/QUALCOMM MAILING
 LIST" <linux-arm-msm@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:22:42 +0100
In-Reply-To: <20260321031021.1722459-9-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
	 <20260321031021.1722459-9-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[iokpp.de,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iokpp.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iokpp.de:dkim,iokpp.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,micron.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: C90602EF341
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-20 at 20:10 -0700, Can Guo wrote:
> If HS-G6 Power Mode change handshake is successful and outbound data Lane=
s
> are expected to transmit ADAPT, M-TX Lanes shall be configured as
>=20
> if (Adapt Type =3D=3D REFRESH)
> =C2=A0 TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 =3D PA_PeerRxHsG6AdaptRefreshL0L1L2=
L3.
> else if (Adapt Type =3D=3D INITIAL)
> =C2=A0 TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 =3D PA_PeerRxHsG6AdaptInitialL0L1L2=
L3.
>=20
> On some platforms, the ADAPT_L0_L1_L2_L3 duration on Host TX Lanes is onl=
y
> a half of theoretical ADAPT_L0_L1_L2_L3 duration TADAPT_L0_L1_L2_L3 (in
> PAM-4 UI) calculated from TX_HS_ADAPT_LENGTH_L0_L1_L2_L3.
>=20
> For such platforms, the workaround is to double the ADAPT_L0_L1_L2_L3
> duration by uplifting TX_HS_ADAPT_LENGTH_L0_L1_L2_L3. UniPro initializes
> TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 during HS-G6 Power Mode change handshake,
> it would be too late for SW to update TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 post
> HS-G6 Power Mode change. Update PA_PeerRxHsG6AdaptRefreshL0L1L2L3 and
> PA_PeerRxHsG6AdaptInitialL0L1L2L3 post Link Startup and before HS-G6
> Power Mode change, so that the UniPro would use the updated value during
> HS-G6 Power Mode change handshake.
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Please add my reviewed tag for this patch:

Reviewed-by: Bean Huo <beanhuo@micron.com>


