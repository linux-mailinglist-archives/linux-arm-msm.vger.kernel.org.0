Return-Path: <linux-arm-msm+bounces-85979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF29CD1E25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 21:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9682300FF94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 20:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC2733DEDF;
	Fri, 19 Dec 2025 20:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaaSyuTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DA2329E46
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177786; cv=none; b=iAZrh2WfZHyOpIzGOV2VMLhEbq5EOLLf/gub4a37NhXvF7qiasgs/YTshPZfMql3uSBT/kDTfXh7wCiF4UiUqOmbV7yTyJTZk+jHGs2pT8+GH0uJnXS2zjeAC5dtWV2snIueXm4P1/WlpRwP4/ZPk4ItwHhBVNXMYYKXFd5wklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177786; c=relaxed/simple;
	bh=i3Vnb75W8CfJzDnDxCk3fIRFIT3WDMCJ1BDdD071/aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqyrQsKVxfVSp3jVzMmiRPrJ5wL15as5EONsyIR6lzL1G2dgnd60H0/lpnkpt6wADbXcxNtUAsnOQC4tYRNP5/G9jm24NTn6nr9T0FO3FnH7Y5e2FFc25T601YTOHgzijNET6e1VUlLsQFzlhvQpUzG4tUW5sCR6MOZT6orTpMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaaSyuTT; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a347c424aso25839576d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177784; x=1766782584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3Vnb75W8CfJzDnDxCk3fIRFIT3WDMCJ1BDdD071/aU=;
        b=XaaSyuTTgjeiPXXr+5iCBGk+qrr6tWD3XNCE0Z/P8donYTHVj7XCPNsb412WZqAZU5
         o/cHLQ/jYP65srDFn1t3sSv3rAXo7VTtITTyIUf9n5m10XEun9NoGbf8PeKUtE5cSUfp
         syX3FEbAdllnLjCZKMCnAe0iRFRFyMartIn7MJSu5fvwnTn4R3x7ExW+c6+shm7mtAA9
         4MAPlzeG1quQ64gX9KTIUAYMuhU7uS5T01l7c63su5ZXHUNye/5pXlxsmUoJ4zS0yhZ6
         csUt6P42T2ZGZgMb9uNG0qLBrKF0yEss9bOtzp9CFG4s0lzdoLKejt0NqZ4XIenHkV78
         Pd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177784; x=1766782584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3Vnb75W8CfJzDnDxCk3fIRFIT3WDMCJ1BDdD071/aU=;
        b=SvpqChSHibm6q5wxOrYj/LNpK4RSUIJVoj6Xb/v7kj+jM1f6FpZTi6wu97nA+LClHW
         gel6/vlDhtRFUOhdM/TFG3/MsdD6W1wSl7nZMV1cvweSUZItxXr3mycflenKFmYGfhXC
         XXeRRP8/NEsdKoSRX+YrYRDWMIxpZu8t8IkNj3/Hef0INd25QEgk+7n6it+hZl3qptET
         wI+i+eNe4R7qfeaDdDEKhQExLL/0lhjSZcBMJzMYiuQsbZ4dAjIFTuTw6ZbS1lXdpbAb
         VuoCV3hNcf5QY8GwIJFUgJUYLCCbkCfu1swz0E23VW6DZBoLvgk4zhdMgjXQ2JcQBB6L
         b2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU8v/J1cXj4fN0jLfbNWdG4kMJHyyNrqpOBe/n3htjprN3KyONSHWDuw2FCcrldVAaSYp+zXREu1ArFqOtI@vger.kernel.org
X-Gm-Message-State: AOJu0YwibczloAyBbGO7Qq08t8UGB2fhIVdywUOoJrlutQz/v7Qf4WHS
	pSGU+51qOrXgtb9pxHD3gSCd6QXVzDPkn/K3unPyFfU9aeHLkCiGQVQiTBkZ6AWu4/xZQ/yUlLT
	YEO8LtP9iTyFcvxHovX9UAnLrr8ZBZQ==
X-Gm-Gg: AY/fxX42OoGwt0Uf16fqRm270/p1K5rv3wpJYMDc7vh6J89sjWrAKSuF05L12z7ofHZ
	8qJpKD+3htrBUia76SVH1Ex99JF4GNJHm5JPjLr7rN/m3Emc+BzY0avT3dGNBSZOEcbh1JUq7GD
	+b/ONr8b02sy0vuQFJDFhJXTwM8OsUaIzmlCclGEPJytULOhH3vME4u+YHXmNGgDdH5OtplGR2H
	swnbBQPZTQrIlJefXbc4cEstzy6RogcEVS69aVNydY3XiS7sN9U6wZm8bU7RzJAh8N7Ge/+cI9v
	srCP+4wxuywfd+OmuePET32d48c=
X-Google-Smtp-Source: AGHT+IGQH6VIaRGaIEOqpyUgjkUaKG66oDPn1z9oy8qj+n60mmZ/JwdsKN6CJzkL/LLNCeXKogbMXa71ZR0FC4qCU1E=
X-Received: by 2002:a05:6214:4e85:b0:880:47e0:19e8 with SMTP id
 6a1803df08f44-88d83792f32mr72964826d6.42.1766177783822; Fri, 19 Dec 2025
 12:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-5-7bcf83c1504a@gmail.com>
 <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org> <d4a87f75-92a3-4c09-9f9c-e906f0b7ae70@gmail.com>
In-Reply-To: <d4a87f75-92a3-4c09-9f9c-e906f0b7ae70@gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:55:48 +0100
X-Gm-Features: AQt7F2qYuzcLI8NAKl_7FuywvK75_EKSOb3h7eO67Yd-AWYZh8w_fOHJFdfFDTk
Message-ID: <CA+kEDGGbfXYXwkQcouLJHF3uBv+sPKdG8BE8PEGvVzgwWn_nYw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: Dale Whinham <daleyo@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 d=C3=A9c. 2025 =C3=A0 20:27, Dale Whinham <daleyo@gmail.com> a =
=C3=A9crit :
>
> On 19/12/2025 17:47, Krzysztof Kozlowski wrote:
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights res=
erved.
> >
> > How exactly is this copyrighted by Qualcomm? I don't think Qualcomm eve=
r
> > prepared DTS for this, so can you point us to the original work?
>
> As mentioned in the commit message, this device is very similar to
> Microsoft Romulus (Surface Laptop 7).
>
> Its associated device tree (x1e80100-microsoft-romulus.dtsi) was used as
> a starting point for SP11, and so I felt it would be courteous to keep
> the original copyright notice there.
>
> If this isn't appropriate, then that's fair enough and we can remove it.

Dale answered for the denali.dtsi file but your quote was for one of
the 2 .dts files.

For those 2 .dts files, it was kept when splitting our initial single
DT into 3 files. Thank you for pointing this out, I will only keep
the Copyright from Dale for them in v5 (if I understood correctly).

> --
> Best regards,
> Dale

Thank you,
J=C3=A9r=C3=B4me

