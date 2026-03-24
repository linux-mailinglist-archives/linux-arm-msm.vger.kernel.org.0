Return-Path: <linux-arm-msm+bounces-99516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN5wM0f1wWmmYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:21:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D10803011C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C50B0300E697
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DB137D110;
	Tue, 24 Mar 2026 02:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="GM8RWgcu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2851A6812;
	Tue, 24 Mar 2026 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318436; cv=none; b=AzB9kl6hFDI5zx38jAMA7/ezYZzFNV48knOmpFUPnZUDwOJvzYiKOeNd0Ieaj4TG3+YbqRoiqhi6OIcUzzLP0/qtukhZhGm3+srUEYQV55u0IMQgvaggZL65DTDvRHFXUlKcnJfN4R4bUxRV1Ekk7+tsteNNPnJqGSwCtimMb+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318436; c=relaxed/simple;
	bh=xeQxLlrBXpuxbToMd3AOVtEVo6G2CAr8TarzqnIQPAY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=c9hpoYnb+BJ0VsZwmLXJksMTDuzQaoFJ01t+/+70PO6/chXTnTNVc5Ib54jX2ALzNidaKCvDQsaiianf2smS2kqSQQOmpzDk1VUNXCd2ItYYOed0fxevT0AMNR6L3mDV5+ePDKL0SH3/IObIwZEYGBgRBsub6nPtKzYgXS4zZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=GM8RWgcu; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLVA97sb+DMvRH2mZiChOooR2AWGttzoMijQPaiwaBA=;
	b=GM8RWgcuC3MPcmWfLWGK6RKBCHmR09kzxmQG7K4CEBk+VDjqVSi/wO0r2kgZ0I1U+rbh+g
	8gIVJ8ejl+PDtwuKawEMVXskocD3BtGCux5Pu6PG94dqcT1XQiY5XMBUMsZ9Wxcs5nmAMX
	o8f8Lz/regxBb7zWaGNxKcrfsAI//6/lUV530vEVSNU1/kZMZko+ALegOREnZaeKWf5ZPX
	a+zO+0avQbu6gyNICG9LYB51Km0C2gU+S1DFB3ldG2TXCt9eBU+QPrErz6hbyIj1N3Ez0G
	mVUB32mCGBR3rGwqVs0nkTpI6ZbytLVqfRkGMr7be4sLUhUMi2DDFc3nIWhBvw==
Date: Tue, 24 Mar 2026 02:13:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v6 00/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, "Amir Dahan"
 <system64fumo@tuta.io>, "Christopher Brown" <crispybrown@gmail.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Amir Dahan"
 <system64fumo@protonmail.com>, "Pavel Machek" <pavel@ucw.cz>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99516-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com,protonmail.com,ucw.cz];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tuta.io:email]
X-Rspamd-Queue-Id: D10803011C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

b4 got rate-limited by my email provider for the last 3 patches, I'm not =
sure what the best way to send just those is now :/

March 24, 2026 at 2:06 AM, "Paul Sajna" <sajattack@postmarketos.org mailt=
o:sajattack@postmarketos.org?to=3D%22Paul%20Sajna%22%20%3Csajattack%40pos=
tmarketos.org%3E > wrote:


>=20
>=20Rollup of improved hardware support via devicetree for LG G7 ThinQ
> (judyln) from sdm845-mainline kernel fork
>=20
>=20Notably, this patch-series enables full DRM acceleration and wifi,
> among other small improvements in individual commits
>=20
>=20after this patch-series the main things that remain to be worked
> on include touchscreen, audio, and modem.
>=20
>=20Depends upon panel driver patch-series https://lore.kernel.org/all/20=
250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b=
6c03100e984a26a0ffc2fe2002
>=20
>=20Co-developed-by: Amir Dahan <system64fumo@tuta.io>
> Co-developed-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Amir Dahan <system64fumo@tuta.io>
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
> Changes in v6:
> - Mistakes were made with b4 and branch was rebuilt, hopefully correctl=
y
> - Split more things that got mixed into the sort commit (qups and venus=
)
> - Added more backlight properties from downstream
> - Framebuffer added back in
> - Update compatible for panel
> - Add qcom,te-source
> - Reference memory region in framebuffer instead of reg
> - Correction to rmtfs_mem
> - Set lab/ibb to 5.5V
> - Fixed flashlight/torch
> - Update commit message for gsi-loader=3Dself
> - Update LG to capitalized in firmware paths
> - Remove qcom,snoc-host-cap-skip-quirk dependency (break wifi)
> - Enable dma controllers
> - Link to v5: https://lore.kernel.org/r/20251203-judyln-dts-v5-0-80c1ff=
ca8487@postmarketos.org
>=20
>=20Changes in v5:
> - update system64's email
> - reduce lab/ibb voltage range
> - status should go last
> - remove rebase leftovers
> - fix flashlight
> - Link to v4: https://lore.kernel.org/r/20251125-judyln-dts-v4-0-a5a605=
00b267@postmarketos.org
>=20
>=20Changes in v4:
> - add panel identifier in addition to ddic
> - make sde_te pull-down
> - fixup flash current
> - remove framebuffer reserved-mem
> - remove manual lower guard
> - depend upon https://lore.kernel.org/all/20251110-skip-host-cam-qmi-re=
q-v2-0-0daf485a987a@ixit.cz/T
> - reword commits
> - Link to v3: https://lore.kernel.org/r/20250928-judyln-dts-v3-0-b14cf9=
e9a928@postmarketos.org
>=20
>=20Changes in v3:
> - change firmware paths to lowercase 'lg' (matching dt-bindings)
> - fix signoffs
> - add wifi dmesg to commit message
> - remove regulator-always-on from ibb
> - remove framebuffer
> - remove msm ids
> - don't continue commit subject into commit messages
> - split bluetooth node
> - add sbu uart details to commit message
> - change ipa gsi-loader to self
> - Link to v2: https://lore.kernel.org/r/20250916-judyln-dts-v2-0-5e16e6=
0263af@postmarketos.org
>=20
>=20Changes in v2:
> - sort at the start
> - drop unnecessary labels
> - drop unnecessary gmu
> - multi-led
> - split fb-panel changes
> - expand upon firmware commit message
> - use qcom,calibration-variant instead of
>  qcom,ath10k-calibration-variant
> - change firmware paths to include "LG"
> - remove framebuffer reservation
> - add lab/ibb
>=20
>=20- Link to v1: https://lore.kernel.org/r/20250913-judyln-dts-v1-0-23b4=
b7790dce@postmarketos.org
>=20
>=20---
> Amir Dahan (1):
>  arm64: dts: qcom: sdm845-lg-common: Add LEDs
>=20
>=20Christopher Brown (1):
>  arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger
>=20
>=20Paul Sajna (13):
>  arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
>  arm64: dts: qcom: sdm845-lg-common: Enable venus
>  arm64: dts: qcom: sdm845-lg-common: Enable qups
>  arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
>  arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
>  arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>  arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
>  arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
>  arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>  arm64: dts: qcom: sdm845-lg-common: Add camera flash
>  arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'
>  arm64: dts: qcom: sdm845-lg-{judyln, judyp}: reference memory region i=
n fb
>  arm64: dts: qcom: sdm845-lg-commmon: enable dma controllers
>=20
>=20 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 228 +++++++++++++++=
++++------
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 129 +++++++++++++-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts | 2 +-
>  3 files changed, 295 insertions(+), 64 deletions(-)
> ---
> base-commit: 674feabdc26e80c4dbc884d7b6e2d2a4b93919e6
> change-id: 20250911-judyln-dts-17c41e59dc0f
> prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postm=
arketos.org>
> prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
> prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
> prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334
>=20
>=20Best regards,
> --=20
>=20Paul Sajna <sajattack@postmarketos.org>
>

