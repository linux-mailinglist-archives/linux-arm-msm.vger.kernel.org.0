Return-Path: <linux-arm-msm+bounces-62093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F1AE477F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBD02173565
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D55D26C3AD;
	Mon, 23 Jun 2025 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gnTl0/vu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80026B2C4;
	Mon, 23 Jun 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690204; cv=none; b=pFtVZTUjuYlO8zeahg6tlgTaPbLdltF3eWY2iMAupf05r+8nRIU9dcSs/EdZuKbr6qJQYW7LJvtqnPn5i1A3GSSnEv2YzkZ4msmwPa/2cWb9uEU+3EJySxemEdnCouaMbw9O7lYvd1YVoxbww6ic1GBSqOscMqq82517CXJWA98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690204; c=relaxed/simple;
	bh=TtNo+/+tyUtNoLQIqc1zZABemHwPcIubro1rF9vrPA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fzSKg6KQ9Gg7YrLjwQfLaDOxysHAwkAysQw45qoWa2dienrs1am8aeyHmzZ2VwynJzZ9HFzUo8MB8vMA+DgBM4Em90JMM4oCTW2Juy+ywHlkw8wf1Cm/wRWVUeATgUWiTp/SezbO/0oXO80ZVmEzTyrhjqlyy2xjGpyX66WdvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gnTl0/vu; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750690199; x=1750949399;
	bh=TtNo+/+tyUtNoLQIqc1zZABemHwPcIubro1rF9vrPA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gnTl0/vuX5ied98fmL550w4RNnLTcQa0gnffVWaw5w6b5LxzlZwdwsRvHaNHwD5t9
	 THGF9aGY9nTkFjZcRd3AGYpxfQHYjUyq8wWE3zI7dJ3HWH/7CSqf50D/Sot25BPtFu
	 PFjKkhr5BSmSeirndD359TWneLBGD7wjQcO6TIazIc/glW7rYIfTVUSaHD+XX58dlv
	 IqsgLj/FmC7uJ8U+4DTnZWkjJe2WzIT5Dm+EfbxIPO+wLKyuib3RF9I8stu9o7BURv
	 87JxXcc2gJU4Kl23hFbJ6Rdg7oD5PV/L1pKPon01YwRIpm/Zu/EYDMIuFNgel6U8TP
	 jnI6lOc3HAMeg==
Date: Mon, 23 Jun 2025 14:49:56 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
Message-ID: <K0VOX_o4DQFENShBki5YS11cHp90jAhtOYFT62ycGgps8JLh6a_SyDqoXyVaPhMADabNwpGyn1px_sAgxeMCJFNSDjyagcqk6DrNh9AECE8=@protonmail.com>
In-Reply-To: <92f1d1c1-e62d-4f77-b55d-110d8ad56a06@oss.qualcomm.com>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com> <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com> <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com> <Fp48ghZvedurtk8ta0jccDkZvg7whZFgX0Ra7_AQuMwS12QxAxHqgcOMP_SbXsnLNme2LWWz6ZshoGFTQT6nVvfe-4B_v-2hkRxpgcb9bq0=@protonmail.com> <92f1d1c1-e62d-4f77-b55d-110d8ad56a06@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 3f74078256d045281d640df567f4ce31f5b3efff
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, June 23rd, 2025 at 12:11, Konrad Dybcio <konrad.dybcio@oss.qualc=
omm.com> wrote:

> On 6/21/25 9:31 PM, cristian_ci wrote:
>=20
> > On Saturday, June 21st, 2025 at 12:17, Konrad Dybcio konrad.dybcio@oss.=
qualcomm.com wrote:
> >=20
> > > > +
> > > > +&sdhc_1 {
> > > > + vmmc-supply =3D <&pm8953_l8>;
> > > > + vqmmc-supply =3D <&pm8953_l5>;
> > >=20
> > > you should add regulator-allow-set-load to these vregs
> >=20
> > So, do you mean I should add 'regulator-allow-set-load' property to 'pm=
8953_l5' and 'pm8953_l8' regulators? If so, should I do that for 'pm8953_l1=
1' and 'pm8953_l12' regulators too (sdhc_2)?
>=20
>=20
> Yes
>=20

ACK, I'll do that in v2. BTW, since I've not such references in my downstre=
am devicetree, IIUC what you mean, 'regulator-allow-set-load' property is n=
ow required in mainline for regulators supplying sdhc_{1|2}.

Also considering I've transferred every value _as_is_ (except for max and m=
in microvolt values =E2=80=8B=E2=80=8Bof one regulator - after the kernel l=
og complained =E2=80=8Babout =E2=80=8Bthat) for regulators/rpm_requests fro=
m downstream
devicetree to mainline devicetree, since other msm8953 devicetrees seem to =
share the same situation of 'rimob' (I'm referring to
'potter', 'daisy', 'mido', 'tissot' and 'vince'), I wonder if it's not the =
case to standardize all these devicetrees in the same way. Any thoughts?

