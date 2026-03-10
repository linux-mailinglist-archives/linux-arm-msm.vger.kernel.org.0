Return-Path: <linux-arm-msm+bounces-96432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ+TJ++Fr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:46:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B116244564
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C6243028B26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B403B3AE6EE;
	Tue, 10 Mar 2026 02:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YHIuTjqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC63ACEE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 02:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110764; cv=none; b=E7iw8pbA4xNI9494fp8ExkomtUiYOnBu4jp82Rch3qRmoG46WiUIzf+FPSbPNjI5dITcUS2lCG3IAxBmZJwGWQb4Ao02Pj2d4/PvxneUHTiClNsSPWMclCQGHE8scxTdF5r0aflW5qkWPGE6rVMezdo/3BQYVG0ZuWewGZcpzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110764; c=relaxed/simple;
	bh=J+6C18iDp8Ieh4w9YHxTMZi9xoZ6sRzcr1Ste5BpzVA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MdX/MmTsIMOJZeETyS+V4DveqlyBGNqljJ8R0JWS8eIYXa1Q2PQL09m5Ll5fOyjnDVpE1vbM2uXEUNv9VfJ9wI1N/yFK3vIJIjcmxVMyqvcKxdvfC4Q+JyUAcrByJV06/ZoRQqc6W23atfDGnrbgwrNR4ZZuDTPxf/gigpToy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YHIuTjqF; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773110760; x=1773369960;
	bh=tIeUxT/+2LjyP/1+EUHSCXJsfGeXlg+MB62DZ4BGYo0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YHIuTjqFU+6BDxjVWbx/EcUyx5v2iJpDVxhIx0G5VgDEVtbMBPc1PMn0SD+D94mrV
	 E2aABuKZ8ABxOI3faoRhZnTSTj7yOsJ8Wm4XCZLacCSJxITyKAcfuJZg0UfiNaZTeY
	 chH/xlFuq/2wLaF2zjZtKZfitjVh0CzZXXx3RALR8AZaWRsZQVm/0YTBxM33zTXUM0
	 ghHvctupdBZbbTjiMG2dDaAvVbltjMJWtx0syGNG6i88L6BhXy6ioyPBkhec5dCFKJ
	 S04F27l68JhoVCd5BsDrXwac7GoTrtKtkOe9JhG+uAPfck9qSwPIgQStqKTG58HvMX
	 ttI/f+H4Adpfg==
Date: Tue, 10 Mar 2026 02:45:54 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 0/2] Add support for the ASUS ROG Phone 3 (SM8250)
Message-ID: <20260309-sm8250-asus-obiwan-v2-0-edf7d07b32af@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: aa812fae8852300b08110f67efb48b4b9d2ea0ab
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0B116244564
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
	TAGGED_FROM(0.00)[bounces-96432-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
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
 arch/arm64/boot/dts/qcom/sm8250-asus-obiwan.dts | 1298 +++++++++++++++++++=
++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |    8 +-
 4 files changed, 1307 insertions(+), 1 deletion(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260308-sm8250-asus-obiwan-1c1b63ce121c

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



