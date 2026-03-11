Return-Path: <linux-arm-msm+bounces-97027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPLkG1OXsWnkDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 17:24:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A1267465
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 17:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 777E030391CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 16:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073123DCDBF;
	Wed, 11 Mar 2026 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="XBIHS5sR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96E175A8F;
	Wed, 11 Mar 2026 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246273; cv=none; b=VUVySoO4pWphb3nfU6yidS8mSYt0WS5KEC8wRchjKgfhqdxYTDRRa2v7lvGasBaLU7IbfU3avsQRvpeepXIkXfthobBmG/K7+F7aA7E1Gi08hgLjpVIz5wYH1GDAQs6FDfYzVkUabfnY2crjbSGkKl/zBfSY3Yx2jMV+8udI12Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246273; c=relaxed/simple;
	bh=3RuMPtg/RVvPea6MW0G2XHf/DB6HivyTSRuRLqaYjlc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OG6KDAiVnF/nLrAYAPRmXYZZ9r9iVS+mjvbbgB3ICEWP96C9b5+Pi5UCM4bYFwD2qVNOAagc12dI7/RAPEDkPQ8VSFfC/X7ZkWgqQ7n/cJs9lNIJv5ewktJNUHUzSV23j4qXZNnAKDdht/bIjj4ax+XJzbsjyUxW0J7+HgCkN5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=XBIHS5sR; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773246268; x=1773505468;
	bh=3RuMPtg/RVvPea6MW0G2XHf/DB6HivyTSRuRLqaYjlc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XBIHS5sRTkcx/wTYRSqnhUSDyJUdnzOf+/tR1+XjyrLSU5l8y76YT8w6Ltw4RnTBl
	 uKy04YAQZAllp0eYYhz3vxXiK8fcLcU089lBLhFgyvumHWRFUtwUROefeSGfgb2qW2
	 5ggXN0xZ8BLBybmSsHmaLp9hOthUHHqS8hLj/gpOybPj58K45jLYJxz7Y2zQbXFmHw
	 fTy74k1Bzo4nzoEETjyruOGDKMyMkc5EKN5+TWSxiEcXq1UuSKnm2MnqciNYfmkEIE
	 h9lEHkByU9Z4ZR3AtKurmKHj7a6Qrz9H3sYRy5qgBrgk+1oZ1tLAxmfN5Oy51cmAGX
	 yLbzvtRKH0meA==
Date: Wed, 11 Mar 2026 16:24:21 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN VBUS detection
Message-ID: <oF1T50gf631F5puExIsmCok5PDcTsoQYoSt6WUVomFscijNjeTHK-n0_qz5xUWoG3zYwaj1OPX5biBT3jyw0D0zSf1AGuwpcORy0xlwkKqk=@pm.me>
In-Reply-To: <5304144a-0907-4b7e-8c65-d0d37e74e9f8@oss.qualcomm.com>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me> <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me> <5304144a-0907-4b7e-8c65-d0d37e74e9f8@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6a370b9c9a64c0b3acc4eb62e3bbd966af628c6b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97027-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 0C4A1267465
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, March 11th, 2026 at 9:02 AM, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:

>=20
> I thought the intent here was to have 2 GPIOs, one per port - could
> you please shed some light on this?

For the ROG 3 there is a pm8150b_typec and an rt1715, the pm8150b_typec is =
the
only one that needs this workaround as the rt1715 has it's own CC detection
mechanism that doesn't get confused by the shared VBUS.

Although there is a GPIO to detect VBUS on the bottom port as well, I just
found that I only needed the one for pm8150b_typec atm.=20

>=20
> Konrad
>=20

Thanks,
Alex

