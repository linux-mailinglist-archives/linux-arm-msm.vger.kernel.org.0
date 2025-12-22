Return-Path: <linux-arm-msm+bounces-86257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E30CCD6E9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 050353003B18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310333358C0;
	Mon, 22 Dec 2025 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lJ6IpMax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E832ABF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430194; cv=none; b=EYAmF4/zmx3UTURParnJbPM5NciKjCNLkv3KTUEsiXmMD3Ao+Ql+6xZYND9UfKdEf+hWMf6PNF0pHSH9LBdltRnhDtZJRwH7QxeTvOOwhIwtZu1YilapK65xgasLj3Gkh16aOBGM+UriPjUrjBv3h5Fn7ykMi9e5ykWcAiLQx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430194; c=relaxed/simple;
	bh=PaF7GyI4rezprjUtIYvkxxp0xmLg4R6QoreSIahZw+A=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LculdNiWG/U2cCd1gFNrl7d2LELHTcCqcbIp9F5AWi9YATqgXhfXvsn4H9MVOs22nCxxLLeKYeCbztW8yUtaoAfUYckGWCbGj9hyho3HtHyB+Lboq3Nke+u3FUL0TwIFG3+Om6gsVcUFSlGqvGHrLaz3mW8SWx2t0TrBVXQtr8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lJ6IpMax; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1766430183; x=1766689383;
	bh=PaF7GyI4rezprjUtIYvkxxp0xmLg4R6QoreSIahZw+A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lJ6IpMaxuhkaRcR6shvwPCYk2EmxuWU1PfrRm1BmVc3ef+H1r5Gxm2D6uJNnbuUez
	 NQjF3UY1fiRQun6SRo6oL8wGPggnMDgMPo51G38s8rY59FQxv/pN47JMBkUYnl3mLl
	 EAKM5nRwtDi1i7jYQt9WF7d1S79tUQZbAgB1y7QggC8buPQDDLG9LaOFfp6FSwcqc4
	 QxXLe9bTshiIzLPF5bgKW5v5jhB2sSVe7KzHmpM36ydkdWFaygCCbHWPIV+xJLjpqS
	 tJxWuQgbwkHdvEYD21JHj0tzUuFta1AD5MoIeA5cnR2S/BLV/ekakFY1UvV2HVvKbb
	 Du/FvRI8u3KCw==
Date: Mon, 22 Dec 2025 19:02:58 +0000
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, hrishabh.rajput@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
Message-ID: <b105810a-63a8-4d81-9ad8-b0788e2e1431@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ac44ac6cdc9c89879847125c5270ee70225b687f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 9/4/25 1:05 PM, Pavan Kondeti wrote:
> Thanks for asking this question. I believe the overlay part needs some
> discussion here.
>
> I have tried this series on 8550 MTP. The overlay failed, so watchdog
> device did not probe. same is the case with 8750 too. It works only
> after applying this patch. I will test and report my observation on 8650
> later.

Hi Pavan, was linked this thread after seeing what I think to be the=20
same issue on another platform,
but issue is a bit more serious here since bootloader fails to find a=20
DTB at all, not just overlay fails.
When the "arch_timer" label is missing from the base DTB on Milos,=20
ufdt_apply_overlay in bootloader
will fail and it looks like the DTB memory gets corrupted. If you are=20
booting without a dtbo image,
then you don't see the issue. Couple logs from bootloader when it happens:

 =C2=A0 =C2=A0 ApplyOverlay: ufdt apply overlay failed
 =C2=A0 =C2=A0 Error: Dtb overlay failed

After this happens, the DTB memory seems to get corrupted:

 =C2=A0 =C2=A0 ERROR: Invalid device tree header ...
 =C2=A0 =C2=A0 Device Tree update failed Status:Not Found

But it doesn't seem to have anything to do with the DTBO image itself=20
(despite only happening with one),
as it happens even the dtbo is effectively empty with the exception of a=20
dummy fixups so the old version
of libufdt in bootloader doesn't fail.

This seems to have only started happening on recent versions of the=20
proprietary hypervisor (don't see any
dtb handling in https://github.com/quic/gunyah-hypervisor), since I=20
don't see the same issue on Blair but I
do on Milos.

Should the label be applied to all QCOM platforms that have a timer node=20
to prevent the issue from appearing
elsewhere? It looks like it's already applied to lemans & sm6150.

Thanks,
Alex



