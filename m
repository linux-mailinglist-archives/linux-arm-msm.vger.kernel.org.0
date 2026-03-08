Return-Path: <linux-arm-msm+bounces-96081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGdPE8verWnE8gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 21:40:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982D23226A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 21:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FA5B300F520
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 20:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAAB346E46;
	Sun,  8 Mar 2026 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aN6digRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B272F1FE4;
	Sun,  8 Mar 2026 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773002440; cv=none; b=ZnbPjzF8g5sGnJTXTi4ERSuK1cgB0slWRVd5C6rqs8xYh6L/uaNyJO1M2Yq7QgoHgbU6VO87ijF9pluBv8TVcNqko+EoegZgVIqqYBfOnZ3JxsPMXYzHbSR47T+bZAl2zpeNeBBEyuLg8wSycRsJN6UbPfm/g7XKIGGOyBGSJIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773002440; c=relaxed/simple;
	bh=CH/JoRPT2IdP0i7T8W+ujKfT4YzVnd8n4o8um9P0AUc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V4RqlCX0tl0IZGk7YppnvRDDbv+MW7h5fb1pEW6xx+Fh6J8mIWOgl1jjHpv+mAiyQ8uDGEKtQcGa6dkYv2jevZmn96vgWfvsbe3v02S5G8O1o+4KA691wmhJgFHFwxeJ88uWaKqFkPGVE6T/hHOW3FRT3qcWn1xszOAbB7sDgwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aN6digRl; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773002435; x=1773261635;
	bh=cAN3XFEo+/rZSOoYGezNxKT9wWpjAf5IHBJH/jITwVo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aN6digRlBgdfvjzXLBW3DRRO8jj/Bx6SD34FLgp+u6eEdApiwXCtmhk4fhJSrSJrD
	 yVjuuNnAP+RFv8zs2hooUBO4w8v72Xkd6cZbhSNtCb3uGMR9NxMhzHMM3QX3+9tKJU
	 6+sURKgdQSpYrwek6qM0Wmn8VPjAmXyqdn4lZ/IcSSYjjCbnPq0Uy7c9as2a2UZQb3
	 0Eu02GlvjkK6PwT8zart2tjhcUPxdA4JBeplT2S47SwxnjFynjb55DW/vpno7XjU9H
	 ozVG1APbfBi5RmXzoI+o3YLFXpv6Wy/dcbDgRXIB7r0FrDdGMXCvQlTBGWXJ1za5Ye
	 DcumEQWYRO2xw==
Date: Sun, 08 Mar 2026 20:40:29 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/3] Add support for the ASUS ROG Phone 3 (SM8250)
Message-ID: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 7adda08c4947f9f2d4f22ec353de7fa065c977a2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9982D23226A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96081-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add the bindings & devicetree for the ASUS ROG Phone 3, this is a smartphon=
e
based on SM8250.

This submission depends on some other changes that are currently in review:

Tianma TA066VVHM03 panel driver [1]
Support for dsc_slice_per_pkt [2]
Support for V4L2 device tree properties on OV8856 [3]

Additionally, full USB functionality on the bottom port (usb_2) depends on =
a
vbus-detect-gpios property for qcom,pmic-typec. This device has two USB-C p=
orts
that share the same USBIN input, which interferes with the existing driver'=
s
VBUS based CC detection. Will submit an RFC for that change shortly.

The end impact of this is that if you are plugged into a PC or charger on t=
he
bottom USB (usb_2), you cannot use the side USB (usb_1) for USB flash drive=
s,
etc.

I have left the GT9896 DTS out of this initial submission since the driver =
is
still in review [4] but I have validated that the touchscreen works with th=
at
driver added and DTS updated so can update once that is merged.

I have also bundled the changes from [5] in this change, I have just put th=
e opp
in the board specific DTS as I cannot validate this on another SM8250 devic=
e.

[1]: https://lore.kernel.org/dri-devel/20260308-tianma-ta066vvhm03-v1-0-869=
fac443b20@pm.me
[2]: https://lore.kernel.org/linux-arm-msm/20251001135914.13754-3-caojunjie=
650@gmail.com
[3]: https://lore.kernel.org/linux-media/20260307-ov8856-v4l2-props-v1-0-76=
77b4c658e4@pm.me
[4]: https://lore.kernel.org/linux-input/20260228-gtx8-v2-0-3a408c365f6c@ma=
inlining.org
[5]: https://lore.kernel.org/linux-arm-msm/20260307-sm8250-cpu7-opp-v1-1-43=
5f5f6628a1@pm.me

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (3):
      dt-bindings: arm: qcom: Add ASUS ROG Phone 3
      arm64: dts: qcom: sm8250: Add label for reserved-memory node
      arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3

 Documentation/devicetree/bindings/arm/qcom.yaml |    1 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts | 1328 +++++++++++++++++++=
++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |    2 +-
 4 files changed, 1331 insertions(+), 1 deletion(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260308-sm8250-asus-obiwan-1c1b63ce121c

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



