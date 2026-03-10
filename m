Return-Path: <linux-arm-msm+bounces-96458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGJ4HrKIr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:57:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB624483C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEFEE3035D41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03013B5846;
	Tue, 10 Mar 2026 02:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="GkN7UDAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389D3392C45;
	Tue, 10 Mar 2026 02:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111439; cv=none; b=jJLrV93Y7eKULUrA8vjwRgsCVUCEvSJkQqGrRD5Rrw519JmdDVEAZfL0TyFJ9+Wv8ulw4u1s/30bcYV1TTGTxB2agjijzkCsS4qRBu9HLDrOQrUU+mXX53kr1XV7nnCs3BA8A23ADivpmpRqxFmQAXb8EC41dlwgzNfc4s3IHyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111439; c=relaxed/simple;
	bh=A7zTK4PlFrsw7a5TtQne9fOyd8+ftcNolVyUFZOj9iw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErRKLufVd7gYKUgjrv9xmL5heXplClcZ8aYqf9tz51l3PCpK0aZOllDsspGEIipVA4xrpR3UD9KPfQ0ZT/dD5ZVpfr4qHqsIN4PkhQTwBuq735LJJQeVRXbUlOJUBhUrzDzh5W5LJpCFyeQldUHtOtuCwmHNAT6NYA4Kr4JZPFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GkN7UDAF; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773111436; x=1773370636;
	bh=A7zTK4PlFrsw7a5TtQne9fOyd8+ftcNolVyUFZOj9iw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GkN7UDAFSrEAn1LoTLDzjTsa74IjzzDbERCM9c5lfm/sbgu1C2BkNUUvd1Gz7k09x
	 pX0NzrjpHDNYxpGBqGoAk/YuNSRHHBKarJFSogQWXYXmzpadDfOsqfOq5IdSJUWdwD
	 Lqfb78kTa7FkY0PYvWYVVxbEjqcvQU99bcsqK0h6sW+CkhoKR63OMiMNFi4UwUsHkA
	 FwtvbxITu2iJaoQ0ODJkZdwxYvdN0s9rmv+FJB113XwacsMIJmRTpdQSiDaQO+XOjq
	 ETwxP2NdIdVA9VUBGNQLH/KKwbEWEmP467xvN1qB9KmjG9dv6Cqm8nqFmK3/aBLFNg
	 yTPi5sAYJLLoQ==
Date: Tue, 10 Mar 2026 02:57:13 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3
Message-ID: <TTd9O1RN8B4tl9ogFkEYOLpb0iuA2NkOP_3RVkPfnEPntd7f33LU8zzKfy1ICXQ1M-TmDVht5GxiNsMDCu8O2odbZUBcU4lEzg-wyq22ZxM=@pm.me>
In-Reply-To: <pu56z7dorbujx57yzfclcncrj4zwgtv3gshntnlpxcpbunxsiz@2rckwcyjgetg>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me> <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me> <pu56z7dorbujx57yzfclcncrj4zwgtv3gshntnlpxcpbunxsiz@2rckwcyjgetg>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 69a089652abcc95718746560eb40725da33e7a32
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 20AB624483C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96458-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:dkim,pm.me:mid]
X-Rspamd-Action: no action

On Monday, March 9th, 2026 at 4:34 PM, Dmitry Baryshkov <dmitry.baryshkov@o=
ss.qualcomm.com> wrote:

> > +
> > +&cpu7_opp_table {
> > +=09cpu7_opp21: opp-3091200000 {
> > +=09=09opp-hz =3D /bits/ 64 <3091200000>;
> > +=09=09opp-peak-kBps =3D <8368000 51609600>;
> > +=09};
>=20
> I'm a bit concerned about this one, I haven't seen it in the downtream
> SM8250 DT.

Should I leave it out? I tested for a bit and seems like I can boost to thi=
s
speed, seemed fine at least.

> > +=09=09qcom,calibration-variant =3D "ASUS_ROG_Phone_3";
>=20
> Just to check, was it submitted upstream?

Yes, though still waiting for it to be picked up:
https://lore.kernel.org/ath11k/PqqPCfIvgme9VLMd4Q91JxMhlc4JOTjuWhwXupf3_0cZ=
XUvRy0wijwNfy7lAY6fiIXHXU_buPPbpDM_Uvht3G26146R4szD7Hvp57m7Totw=3D@pm.me

> OKay, this answers my earlier question.

Updated the comment in v2, since technically usb_2 does have SS lanes on th=
is
board, they are just not routed to the port I have configured atm.

The board design is a bit special, the HS lanes for the bottom port are sen=
t
to the pogo port when accesories are in use, and then that leaves the botto=
m
port exclusively for charging. Haven't gotten to modeling that yet, I'm not
sure if there is a way to model that in upstream atm. Would need some USB m=
ux
binding?

Let me know if you would want to see USB 3 re-enabled despite not having a =
use atm.

>=20
> --
> With best wishes
> Dmitry
>=20

All other items have been pushed in v2, appreciate the review.

Thanks,
Alex

