Return-Path: <linux-arm-msm+bounces-75379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF53BA5E9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 13:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7934C4F16
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 11:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5866A2E0412;
	Sat, 27 Sep 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="R+KLWN6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A627380A
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758974379; cv=none; b=NrWIKdrbmm3pWKUgH12ti9VVAyOhNaYuA2Fdyx8AYwnJ8SAjZoEVYXIz1KoxWk2/sinLALPP4rfVOaPw4qitG43Jq25c8JZkdYIlk+D7QyGqtqPAaoYbv454ioCvXS/RQxkLI32bY8Pfj+lCZ+d1wpGzQUP8X8yT8ZniHda3ub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758974379; c=relaxed/simple;
	bh=j3KBdBzIOzFAeywBjLt3G+eodchurrcQPb+koMKRbjw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFSDCGOLc3Cl5kuprtXyBEkdP5rc8cnxnV8M60q1+dbYWhzwF7jFYaknB+f8aJ51Mi+Ig4y3N+buKfaZjE2lxbN+cyzBKiUhXzSRDRr4QMYNAnJH9ESuR485GAcs8gCOXUpjtGScYUgi0GOH/VLRBYGXQ9pEwMGwkBCKwUP+1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=R+KLWN6C; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758974367; x=1759233567;
	bh=j3KBdBzIOzFAeywBjLt3G+eodchurrcQPb+koMKRbjw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=R+KLWN6CichFI60BzxuEo/zPcZnoJjm1pjATIxEi7KckAw0E6BGXdspWd0tXMNdak
	 wekiffBTSR1pajeXvyxGs+g16iMFOSOr5O6+X7gDsXFR+FNHKvR8ukTNBxQMxDTsBg
	 Lo2quKeYUcOC6QfPU54MUVrA2hCnLLHr/DDMSf7PFNr7ZCBqRf9COiURyReZi/qi/h
	 PKTFY74eDwvctVLT2/q+xQLBAx+MYR0VYA/lLUUP4Ee+qhpmBdXM2L7y+unS5znGph
	 rU0K5oqAPIn/cuNfyMP0vZz9sFr55sYlNDZjPCx6JxH5gU5h2K143KqSRrwjDNYUPj
	 Xehck5MUAKRSg==
Date: Sat, 27 Sep 2025 11:59:23 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
Message-ID: <oVKFPC4z3p0Jkm9UXaUCszvghc54lbXJhAq5VHGVhw1vVmEvDPhVE3VKKaYnWWeycdYZRzzcffAv8mamuh8lvWOVmVtP3uVVoyI2XUyRTms=@vinarskis.com>
In-Reply-To: <nemvj6vyk2mj255l5fi372677znsptawkkhx4zlcsty5enpy6a@fhtpf2c6v4v4>
References: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com> <20250926-zenbook-improvements-v2-2-c0b512ab6b57@vinarskis.com> <nemvj6vyk2mj255l5fi372677znsptawkkhx4zlcsty5enpy6a@fhtpf2c6v4v4>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: a0ef6100d16c93032cf822017a4179baac111598
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Saturday, September 27th, 2025 at 00:32, Dmitry Baryshkov <dmitry.barysh=
kov@oss.qualcomm.com> wrote:

>=20
>=20
> On Fri, Sep 26, 2025 at 09:08:53AM +0200, Aleksandrs Vinarskis wrote:
>=20
> > The laptop comes in two variants:
> >=20
> > * UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panels
> > * UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels
> >=20
> > Even though all three panels work with "edp-panel", unfortunately the
> > brightness adjustmenet of LCD panel is PWM based, requiring a dedicated
> > device-tree. Convert "x1p42100-asus-zenbook-a14.dts" into ".dtsi" to
> > allow for this split, introduce new LCD variant. Leave current variant
> > without postfix and with the unchanged model name, as some distros
> > (eg. Ubuntu) rely on this for automatic device-tree detection during
> > kernel installation/upgrade.
> >=20
> > As dedicated device-tree is required, update compatibles of OLED
> > variants to correct ones. Keep "edp-panel" as fallback, since it is
> > enough to make the panels work.
> >=20
> > While at it moving .dts, .dtsi around, drop 'model' from the top level
> > x1-asus-zenbook-a14.dtsi as well.
> >=20
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > Co-developed-by: Jens Glathe jens.glathe@oldschoolsolutions.biz
> > Signed-off-by: Jens Glathe jens.glathe@oldschoolsolutions.biz
>=20
>=20
> I'm sorry, but I think the order of tags is incorrect. You are sending
> this patch, so your SoB should be the last one.

Checked the docs, you are right, will re-spin.

Thanks,
Alex

>=20
> The patch LGTM.
>=20
> > ---
> > arch/arm64/boot/dts/qcom/Makefile | 2 +
> > arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 7 +-
> > .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts | 8 ++
> > .../dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts | 62 +++++++++
> > .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts | 133 ++---------------=
---
> > .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi | 138 ++++++++++++++++=
+++++
> > 6 files changed, 218 insertions(+), 132 deletions(-)
>=20
>=20
> --
> With best wishes
> Dmitry

