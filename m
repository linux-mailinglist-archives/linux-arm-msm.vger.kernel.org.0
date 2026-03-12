Return-Path: <linux-arm-msm+bounces-97117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMRIBRgssmleJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:59:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 172AB26C855
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D597301169C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7D637C91D;
	Thu, 12 Mar 2026 02:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="CK4cCD3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CCA33F383;
	Thu, 12 Mar 2026 02:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284370; cv=none; b=otziKuLAO0JDdK5lD/TvmbIyz3K29ciKVQ/AL/z5vy26oGSWFO8UkstRQW2Fc2OrWCpGtLVI3zxjKs2HNEenW8aAITykrKWmzQOHeNC/4v2zre04XKHTkUXNu1bi46C/QTgLPCcM49zLk8/erHNfMK5m22ye2cmTmouSuCaKR3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284370; c=relaxed/simple;
	bh=E4F4oRB4bIjXP+Rvzu6quj6jj9n23SFkD4aJtqjacaE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ft0HIVGqDxQbMdq1ADwmVyf7nqJvfLQqPQdFki6omlGOKFQQJIdyWlwDoij5BzEBnvh165aBilvqMN5glhK8GyC8G00qEDgJi2yO/rOVtKYs12FeQsPzhez5qvmwCv+ckXWUlRE4GE06KBx2Vk820xs1ZkGNIE793rSLy5kJR9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=CK4cCD3I; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773284366; x=1773543566;
	bh=cY5yIwTTANhf0ZaEkdOQp3wtgZJLoLIijH3LqL+zf+s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CK4cCD3IS1fFuPCwj93eZx7CvY5yc/4oy6RLW6NWFgkxkKFEq9c5TYvhCx0SY5B7r
	 FI/JFSk9dT6947XaXd2fzwmSrN+iuFHNaKnWAHvZ3LRQoszLTDoO3t/nM1KynW6d+T
	 BNN/2i2tSUGXxBv2VXbWWAYSjagKIJM6+8wB0RLbbwp2YhZBs4cPKm29JeJT0Pb8A2
	 4rrgpUDJ60XQ+HjCXLFq57Q3IoxKhC9W2Txk9g0p0zaGKgOZa0+nJTA73OZimGDwWa
	 6/VvthM2i5mJJYbT37h/PdAwUcB35jLTov/ci3wzIsmksG0dEVUwXE2SKcLz9+PUyD
	 hiW1AZpTPnELQ==
Date: Thu, 12 Mar 2026 02:59:21 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: usb: qcom,pmic-typec: Document vbus-detect-gpios property
Message-ID: <5ZThs21yPOC183UvNzHZU9U0iOt5GIjsRC75wOLXfzcmqAKLmsRhemi7xlFz_xLyhsWDI2D90fpeBhB2CV2pXjR_nzK_Rsyc51PQOe0m1H0=@pm.me>
In-Reply-To: <m326m6tjiiatutb3s7jhr472grmlvkbg25cqf5gijusioaszxm@6bkxef6s3pyy>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me> <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me> <m326m6tjiiatutb3s7jhr472grmlvkbg25cqf5gijusioaszxm@6bkxef6s3pyy>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9bb284d9461966e2782d3f3995110f9115e303cf
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97117-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 172AB26C855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, March 11th, 2026 at 10:34 PM, Dmitry Baryshkov <dmitry.barysh=
kov@oss.qualcomm.com> wrote:

> On Sun, Mar 08, 2026 at 11:20:27PM +0000, Alexander Koskovich wrote:
> > Add the optional vbus-detect-gpios property for devices where the PMIC'=
s
> > built-in VBUS detection is unreliable.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml=
 b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > index 6d3fa2bc9cee..f45bf3e34c03 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > @@ -78,6 +78,12 @@ properties:
> >        - const: msg-rx-discarded
> >        - const: fr-swap
> >
> > +  vbus-detect-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO used to detect VBUS presence when the PMIC's built-in VBUS
> > +      detection is unreliable.
>=20
> Can we use vbus-gpios from the usb-connector instead?

Didn't see that! Yes definitely, will update v2 to use that instead.

>=20
> > +
> >    vdd-vbus-supply:
> >      description: VBUS power supply.
> >
> >
> > --
> > 2.53.0
> >
> >
>=20
> --
> With best wishes
> Dmitry
>=20

Thanks,
Alex

