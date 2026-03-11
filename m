Return-Path: <linux-arm-msm+bounces-96818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL/sB8TWsGnLngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B964225B12F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2382E302653C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A87233E368;
	Wed, 11 Mar 2026 02:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="l0+/rtHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BEB40DFB7;
	Wed, 11 Mar 2026 02:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196994; cv=none; b=TZXW6+a6argAUjdevVneXyCM42lHhANHlv1xxWUSY/S5fiQsYV9EjW3VzPJZxeg1auETMRH6WTDQIIg0yAHOT5OTBef7oS8cJWS84wTDZj2KfeOTRG0ZdjsYJddrcVZ+Q9DRmO8bfOQfmyRXuKmgiXOiPBtfOjFcUuOuSAWVGDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196994; c=relaxed/simple;
	bh=yMHxa4pmvxtIlDbTeBp5GcwOJAqTHdUtt0ghKYBNUdk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ixNiNeCrbYj5htE5oo8QcGod1W6QxC7SfX+BA9VKYilWkGtCCzQTVfvldLUPvhmdpqvv0Ag2Rnh9F895lzB0NkrCXB+WNUeZLjUInSUXMZBcayXfKHwtK3Vr6oteKxxCxzOq5PGaFijwFdjc5DyEiTDAvSblW1w3+1CGObgUcXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=l0+/rtHC; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773196990; x=1773456190;
	bh=qL3fvApNpdMl3dFcTvTI4xfe3FEIDVnyru54KNVqhEw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=l0+/rtHCXNg5fAuuKz1P0eLtMAddWb3+/A//FaqG61oZQ1vP31vpeSRQrqY3K73Ay
	 lzz0KtN/cTW2YavyqYkrfxekxvxz1jwodDw5UreWnI0pzppPUsjUti9Rp8Pm2Epo66
	 SA8zFiDDJLsudfaLMD8S3rJfcECl9hSBiTAtxXSsUIwwJGwQQV+56CKJCXmynmwnwp
	 ma7pCMjdqUhRFXi8hKdtpIce5XfhQI6uDiZkwpaKuBMII+Sm+cYX60d9IwGMx/jhlb
	 +Ir7KcmnCwFTI7GZp3/joZwflhVoiDefx97cZjzE8nXo1hEf4N0IjOm3p6zvHukSoV
	 6VqC1sQ1bnEag==
Date: Wed, 11 Mar 2026 02:43:06 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add support for the ASUS ROG Phone 3 (SM8250)
Message-ID: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 3e7e95b505ba79dd186033437702272479de2566
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B964225B12F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96818-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add the bindings & devicetree for the ASUS ROG Phone 3, this is a smartphon=
e
based on SM8250.

This submission depends on some other changes that are currently in review:

Tianma TA066VVHM03 panel driver [1]
Support for dsc_slice_per_pkt [2]
Support for V4L2 device tree properties on OV8856 [3]

Additionally, full USB functionality on the side port (usb_1) depends on a
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

[1]: https://lore.kernel.org/dri-devel/20260308-tianma-ta066vvhm03-v1-0-869=
fac443b20@pm.me
[2]: https://lore.kernel.org/linux-arm-msm/20251001135914.13754-3-caojunjie=
650@gmail.com
[3]: https://lore.kernel.org/linux-media/20260307-ov8856-v4l2-props-v1-0-76=
77b4c658e4@pm.me
[4]: https://lore.kernel.org/linux-input/20260228-gtx8-v2-0-3a408c365f6c@ma=
inlining.org

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- property-n/property-names order fixed
- Moved cpu7_opp21 to sm8250.dtsi
- Added newlines to ports to seperate subnode from properties
- Added additional supported boards to qcom,board-id
- Validated debug UART functionality and added pinctrl & comment
- Added a default state for the USB2 mux between pogo port and bottom port
- Link to v2: https://lore.kernel.org/r/20260309-sm8250-asus-obiwan-v2-0-ed=
f7d07b32af@pm.me

Changes in v2:
- Fixed From/SoB mismatch
- Changed qcom,board-id to 50, this is MP, mine is PR so it was 40.
- Dropped reserved_memory patch for Dmitry's suggestion
- Grouped root node children alphabetically
- Adopt preferred regulator naming
- Add gpu_zap_shader label in sm8250.dtsi to use in sm8250-asus-obiwan
- Dropped default dr_mode=3Dotg
- Dropped side_ovp_acok_default from pinctrl (left in by mistake, for qcom,=
typec rfc)
- Clarified comment on usb_2 around USB 3 presence on board
- Moved endpoint connection for dp to sm8250.dtsi
- Moved usb-role-switch to sm8250.dtsi
- Updated bindings commit message to satisfy checkpatch.pl (also ran strict=
)
- Updated cover letter to fix typos
- Link to v1: https://lore.kernel.org/r/20260308-sm8250-asus-obiwan-v1-0-3c=
72941eb796@pm.me

---
Alexander Koskovich (2):
      dt-bindings: arm: qcom: Add ASUS ROG Phone 3
      arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG Phone 3

 Documentation/devicetree/bindings/arm/qcom.yaml |    1 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts | 1319 +++++++++++++++++++=
++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |   13 +-
 4 files changed, 1333 insertions(+), 1 deletion(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260308-sm8250-asus-obiwan-1c1b63ce121c

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



