Return-Path: <linux-arm-msm+bounces-110979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /TfzDwgxIGqRyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:50:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B146383EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:49:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=nXoSgNsL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110979-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110979-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=pm.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70AB93006921
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6C83168EF;
	Wed,  3 Jun 2026 13:39:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B13128D9;
	Wed,  3 Jun 2026 13:39:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493960; cv=none; b=E0TJIg6qLZPa8X8yNr4MEzSQrQobWQR8NL+/CewvpZumIeDze6iiQPxP0fwsv87l1fp9JJruIv8dgFVbzTPVVLvnLNvzRtXZ4ghGFck/LonzJqNu3p5e27pBjreZ4fVSO0de73N18Gukc1eCsbOxofzhvh+Iv998IyyC0wqayb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493960; c=relaxed/simple;
	bh=JcvdzGfndVVnJar+huUhyB/yHq6aA5KVpzELIZHaeFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y88TzzlMCJExNh42nzSp7XlEg2CsFadL2EnGAPqp/O5Whs7zrnUXU+C/2zObcm5+rdP1SStxaJH8/StRm4B+y1dtCh13er0oQ6yXqLsE9LK/RWyvpO0A4TI/rbRSEawkUuXg2EnZDom/IdZA6IwJTLmsDtEZpTifxAyYDE7pMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nXoSgNsL; arc=none smtp.client-ip=79.135.106.29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780493955; x=1780753155;
	bh=JcvdzGfndVVnJar+huUhyB/yHq6aA5KVpzELIZHaeFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nXoSgNsLZ/Y262TMtSpHLxtBSpsLSGhtouWr6B3y028vXlGFYHTQE8bIwmjViLauY
	 NBD8nXD7vNOIMHgv9PQqdoyQtAiOqD5SFd1Ja3QKwT7uxfdf5gjc6Ge2j01vKpSY/w
	 Y435b6nYum9GDJQ726o7GwoFa+y8M/Goa9MYyEtUnP1+VwvyuWGuF82Jy8gqCCl5c2
	 HVTHeUBNdy+twxPoiFn3iXOgGsi6U0jYnzLFG9wTrdhkT3eB/T9fa2asCMJaBFh1fL
	 DQ1iffuynsRCFqDDvUoos6KvjJSbLnwGz/upTKEg9HxOCr4eGhUgzq+YmgAQXg6N/o
	 /orDKAEifNIWA==
Date: Wed, 03 Jun 2026 13:39:10 +0000
To: Rob Herring <robh@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
Message-ID: <v_gzn_KoQPa_5JCT7xrvQyv-AZlsKVq0sI3QS32kfcoqLyVvI7kUClz8mXo35TbQ9nXU-mz6MWfHm6s4OsZBwAF3pVM7zcb1y7rHL-dIb3g=@pm.me>
In-Reply-To: <20260602224420.GA1290244-robh@kernel.org>
References: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me> <20260323-asteroids-v2-3-1a35fa9e178a@pm.me> <20260602224420.GA1290244-robh@kernel.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4433180bc5c3a08973f81c3c856e10cd01bad00c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110979-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:luca.weiss@fairphone.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:mid,pm.me:from_mime,pm.me:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39B146383EC

On Tuesday, June 2nd, 2026 at 6:44 PM, Rob Herring <robh@kernel.org> wrote:

> On Mon, Mar 23, 2026 at 01:55:05PM +0000, Alexander Koskovich wrote:
> > +=09=09=09panel: dummy-panel {
> > +=09=09=09=09compatible =3D "boe,bf068mwm-td0";
>=20
> This is missing documentation and gives a warning. However, having a
> panel node here is not valid. Either define a complete panel node or
> none at all. That should throw a warning as well.
>=20
> Please send fixes for this and any other warnings you didn't check or
> ignored.
>=20

Sent a change here, though realize I forgot to add 'Fixes:' to it:
https://lore.kernel.org/linux-arm-msm/20260603-asteroids-drop-simplefb-v1-1=
-34d73477c9d4@pm.me/

Thanks,
Alex


