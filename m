Return-Path: <linux-arm-msm+bounces-102883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCQyBGai3GnMUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:59:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2B3E8A40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4761C303B7EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 07:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9BA396579;
	Mon, 13 Apr 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nHUP825+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE72396D1C;
	Mon, 13 Apr 2026 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066757; cv=none; b=TgX75zuFmD000FM4aZU/YHPfX6KhyNYAjzSrljlqtQWhflB9K8X9AlVapsA/ubMwHolqDUAMarraLFWWzGdKrRHiu0SZgzHCh6467Vg27NMceUWgcIrhCplPDsLltzop0FIbII4OBw1tkVNl1Vi0nahKUFFm25bH0+hM2/mRHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066757; c=relaxed/simple;
	bh=4Gq+oNNP8x1wOCoL/TysQiyAFahXgDjzDVGrIdL6U2E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R9Kr5Pqbx7Lfy5vpnj34v8a6LzKYWxXjxgonPrqRW8gF9AFZDIAKkohaeKDA0qwA1jkt0XSg4oIl0nTmULiRWH9wJPqks9w4q03Ovl0y16vOCf5QeSOUUlnk4jKDlmynnnUucHALBhP89zg2plZHsFmYqc/5kuOBy9SjF+KP5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nHUP825+; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776066752; x=1776325952;
	bh=x6mc2cLNsFMcIljt3Lxl537fzfyJVxV2IgcMOpdvKJY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nHUP825+gRtc2hEElXTC3tbPhz3J8t0q2Bb0zOtE4dnSnoyQs58h1HjAMsgctxOtl
	 OqtYBVPH99d5Zu/VzZMuzgag9rrcsQ7uVJZyzA3ua9lLSAwtTUqPm1VWYSvM+5ysb8
	 7jTgKsQugdj+JNVSda/frvcb3AB61T40k0tamCF1vHUY8usMoRinvC0Vdbf/K9R3Fs
	 CViBS7Tp5Ic9P+6fCUNXN0lqdMDkqHjfFHGadlQx9NLzGCsIT0Aaj/roySSp4sReOd
	 Sb8b6liM/qH89g9ityJqYvxvAZWlIfElgLTBSGDBP+61VNHt7R0VfiQ2PtJCFFYWv6
	 e83C7zpglTsjQ==
Date: Mon, 13 Apr 2026 07:52:27 +0000
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support
Message-ID: <adyfWzVHsg3qo9cH@prism>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1ac19ac2b13a0670cd11ef74bfe343c9670d88d2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102883-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim]
X-Rspamd-Queue-Id: 5AB2B3E8A40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 01:37:24PM +0300, Abel Vesa wrote:
> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
>=20
> Describe the port and repeater, and enable the USB controller and PHYs.
>=20
> Also specify the ADSP firmware and enable the remoteproc.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts=
/qcom/eliza-mtp.dts
> index 90f629800cb0..c31f00e36eee 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -6,9 +6,12 @@
>  /dts-v1/;
...
> =20
> +&usb_hsphy {
> +=09vdd-supply =3D <&vreg_l2b>;

Shouldn't this be l7k? Looking at kera-usb.dtsi I see the vdd-supply for
eusb2_phy0 as l7k. I don't see this being overriden by anything else
downstream either.

Just bringing it up since I copied this part for another Eliza platform
(USB 2 only) and USB failed until I fixed this supply.

> +=09vdda12-supply =3D <&vreg_l4b>;
> +
> +=09phys =3D <&pm7550ba_eusb2_repeater>;
> +
> +=09status =3D "okay";
> +};
>=20
> --=20
> 2.48.1
>=20


