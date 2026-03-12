Return-Path: <linux-arm-msm+bounces-97134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDW8FSVbsmngLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:20:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D799C26D935
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 07:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A916230789CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 06:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9393C342CB6;
	Thu, 12 Mar 2026 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VeoEbx0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162BC30EF8F;
	Thu, 12 Mar 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296327; cv=none; b=dgipUYwOECDyUwU+PR5P5irnu/i3Xwv0b61qNNasJuk5/mguR3dj/TkigsHKBIe11lxW1HcGQacjDQ0tVIam0Bvqf7TJAjLZ+PmyH0ZUNI2hgnOQ3czZtjSVPbDmfL5dWQlltyIQtHUhMHBnzBX57uFI7zUcbY3NN/pq0jflOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296327; c=relaxed/simple;
	bh=GGEG/iXcpX15qUuubohwdpntNlJn0sLBn6ojdxqc81k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hX7dpiT/2MQU7qnHHfkEsj5f6HFll9Jp0TZQ/rtfpXexBSpQtwrRTMA/Qz7zrtnKCo/gum0+kU9NFugiWKcr8Ajr8V7y6TO/3cvGDfF3IxrsXBjR7X/GsYHMPie37dFdXq84bcpRfFZ8GytOwYHS1NE7lvHLqAanh943WfcrxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VeoEbx0Q; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773296317; x=1773555517;
	bh=msKiFDEI7WW9jpJXjs5mIiIQtN0ui9UCxytc66kG8mc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VeoEbx0Qa52sJUotNe1muW5U5DuxCcQ8bf849dIfLlYGZi//CBDRUUL7WhrGaPNvY
	 VonDKN8vEDePXMuB1T1X+nW/xL6LeUfise/JI0T9vL1ISQtfyjAT5jc9fTzmp4/O6z
	 BhxnANsbIqoH9svjUg24dg4kMRMI1XPiE47GRdOSo52i77TdmuHK5NJz1taw01xhZj
	 j9A4xOPki/9YovCjBo0oByL7PGRycEbhsi6rnjmc77coKS597FLTTena+KLT/ZrBXg
	 GqCzL5I8U396nYH7KAf/3IUjAdTR/YQXqVESO8Sz6PfTSvkR42UPCnH18AEPJ8W7vi
	 dg5/ebpVff7Sg==
Date: Thu, 12 Mar 2026 06:18:31 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN VBUS detection
Message-ID: <0_Uzay_JH2Pb9Ff9XJ6VD5Y1EgtfjUQPIK7JPpYzBS9te24xw6JEs5XH2TDzIvGHmDk0ke8AuDKXYZWhQA2mMtmVkpnpXAMCePPZgAQqLZ4=@pm.me>
In-Reply-To: <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me> <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me> <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: c35c85aff5daf4509ae0e410cfad3f3ca9bb8ea7
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97134-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:dkim,pm.me:mid,linaro.org:email]
X-Rspamd-Queue-Id: D799C26D935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wednesday, March 11th, 2026 at 7:06 PM, Bryan O'Donoghue <bryan.odonoghu=
e@linaro.org> wrote:

> On 08/03/2026 23:20, Alexander Koskovich wrote:
> > +=09if (IS_ERR(pmic_typec_port->vbus_detect_gpio))
> > +=09=09return dev_err_probe(dev, PTR_ERR(pmic_typec_port->vbus_detect_g=
pio),
> > +=09=09=09=09     "failed to get vbus-detect GPIO\n");
> > +
>=20
> I'd prefer if this was bracketed since it is over more than one line.
>=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Uploaded v2 but didn't carry your Reviewed-By since there's a fair bit of d=
iff, can you look at v2 and check if all looks good?

>=20
> ---
> bod
>=20
>=20

Thanks,
Alex

