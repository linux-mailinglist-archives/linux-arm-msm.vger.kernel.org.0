Return-Path: <linux-arm-msm+bounces-49205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B685A42E5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B143B3B5EC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B8525C6EA;
	Mon, 24 Feb 2025 20:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foY8LVKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF1A25C6E1;
	Mon, 24 Feb 2025 20:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740430415; cv=none; b=g+B3nPDA32uCcCcw8hWy2bthYsAncDmqiZJDWNEhcDXxaTeeX55KjH8pvAX106ckvBLu80CXkt1rvriWZ7TA5Wv+11XTtyn3oGxoeArsyjGtfxWUuT3y/YLFwAeCGPxmfnmyWIMsE2DavzpXERegRuT3Ayd6sU2SSOKKMsbKl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740430415; c=relaxed/simple;
	bh=uZyQHPDnonWQZDQ1SEf6e6QMou1qYC6LzN4cHLq76kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNjYDKTFOPs2wIBtlhvjKFEL31KNYxbFWy6o07LzNne6mdQxxdAT0rUdrMbsaP7WOu4KSKV3SDofdXQV9zvpEKygnA3JKO5RRsTj7FcvLIZdDfjBB/jv6j8GQp+5cPN9TTIvvX1br9k/3Z3ndr3F2Nufc+yaDZKBeg3X+Wf9My8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foY8LVKe; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30795988ebeso50361501fa.3;
        Mon, 24 Feb 2025 12:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740430412; x=1741035212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLKxgOzGNXH6/e7tjAoJ0ON1VeUWEbBjNUFSuEbog74=;
        b=foY8LVKeKm6sAwESvbKBeCJpwDArGlrdZPP5ta4qhFAG/PHchA92t6gUHbkOtb6Hk1
         NluZ65e0/STPGQ1WI0F5FHrCmIQHORPtE3/jf/Y77v4hLRQahhK1ATvJACJ4mmu53AU+
         IucWpiOzWZn/NS0Whbr8W2FXUuwUlok6ZBueWCAk2twuMgHDtkoaeQEpTEfg04NTI1hM
         uN4jLlH6xiRrDyK8LR/js0miP1VZjDjHcTlacAfP6ItqZS4hmkZDR8F/NKLXHnQciLcE
         OboV88pGYQ7OdljSvDGcwQJ5YQasTewNOEyOGcb7eZfHPU8WvqzDM+IAold9fuFHOHJU
         9IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740430412; x=1741035212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLKxgOzGNXH6/e7tjAoJ0ON1VeUWEbBjNUFSuEbog74=;
        b=ohAcL2I3iblM/ppLSGKqCOjZ7vRODaG8i8Q2HQOwew8zrgPxTaGlLNQZM82JqOFAjT
         EcmYVOT6JtOyR+hykNT5FGf6ND2cnkW9hxNU9CXTyA+dtP8jGSeTR7ZLgjn3Gx2gA8Mu
         2j2a4nZV93oMNK4FNAoaRK2MBIXXuQKnb6pzPu/RlX2CLjjQJlMGtphlo6o4R81x9qXg
         EQvHuuANuMCLCTpj8dOORKnt31muFbg53f6RV9pf3LI5Rj2J/b7jGDzifZpWilzA4QCp
         y3NQrOYcue5wpFs5OwvEYh+V+YnaB279XL9wFZ3wZXHVNm4DIIP4ooDs/LGUW98+PJRx
         Ed/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdMbOyQ+cj7lTM5ZqSXedjE6Q6aI5qOuVZqmvzS6omJOpTVd70BYjja1gt+zaf39Lj2IQIBDVvJ/rt@vger.kernel.org, AJvYcCVxRNzu2znJhny/OoYKB+ouIUOmFup7BwkbTzLR4GjetGrCL+I9pVsuvAdMtWigI91PDrdXFuH0if16Jww9@vger.kernel.org, AJvYcCXeh2OPRLIkdfW2JW4SIyWosAs2rABSuFEL5VAU32zC98Ia4UvjALsiSuU0Ej7IVhmJ7lB/1T9KmHmU7sQTxg==@vger.kernel.org, AJvYcCXkVduzsFcu+eSrmPX5DfxMt8fJCzKPU426FnsHHDIi9vJ7MGs8+5no8btSgFnqv0OQ/QvTYXLJPWXQC4TZXvsP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Ws+uH8BqreDBl4oTeh71Umo9IojLTvQlJ5KhbXJqIQDbOt41
	AmZpEYpDeC3sPwmw8+08dhFiB/0yJsMVvNURkAOVejNaMhgI3toN2LaQ8fmpeEkOPp7Ds9tcMVg
	RFoKMXXSj1PLv5USunPgC+1uCEAGbMmw8EoYRvQ==
X-Gm-Gg: ASbGncvZXtDNWrLgpU05AWGGrwUrq2ijTWcigGElZm/HoGs7xezYbxQo11V77+fr0Om
	1fFnJDkKhSrgtGV8bPhujD4rnpVCZgLWee3q8IyaOeTuu5uq2j1qAQyyKl3KoSundBMWO8wQ7bs
	h2nxeHFQ==
X-Google-Smtp-Source: AGHT+IEf3bVx23OWBARjkI8H1RLewElDpkAnGSVB0hLm64N4Ek8MKkyGLm7MI0cb0+QKlYgijWwscg5NcyVoDVHNSxA=
X-Received: by 2002:a2e:a413:0:b0:308:f39c:96b3 with SMTP id
 38308e7fff4ca-30a80c9944dmr2379071fa.30.1740430411781; Mon, 24 Feb 2025
 12:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org> <3s36j75eoqszm5hiftia543h2a6nxaa74wubrr6nq4akzq4hta@wyuwa5onjauz>
In-Reply-To: <3s36j75eoqszm5hiftia543h2a6nxaa74wubrr6nq4akzq4hta@wyuwa5onjauz>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 24 Feb 2025 15:53:18 -0500
X-Gm-Features: AWEUYZkha0uiyECkrWx3ELuzdjA3i59S1y_7pjEW1mQg4U_t9hN_M4Z6JYV6X_E
Message-ID: <CABBYNZ+mKZV6qwCcECueBfRy4_XBw5LD0TnKs4Dzdpr7eYjL_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Fri, Feb 21, 2025 at 8:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Feb 07, 2025 at 10:41:14PM +0200, Dmitry Baryshkov wrote:
> > Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
> > of BT/WiFi chips. Add support for this member of the family and enable
> > it to be used on the RB1 board.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v4:
> > - Added empty line before status property (Konrad)
> > - Reword Bluetooth commit message to follow linux-firmware changes
> >   (cmnv13t.bin and cmnv13s.bin were merged).
> > - Link to v3: https://lore.kernel.org/r/20250202-rb1-bt-v3-0-6797a4467c=
ed@linaro.org
> >
> > Changes in v3:
> > - Mention new firmware files.
> > - Link to v2: https://lore.kernel.org/r/20250201-rb1-bt-v2-0-fd44011749=
bb@linaro.org
> >
> > Changes in v2:
> > - Corrected QUP interconnects (Konrad)
> > - Added /delete-property/ interrupts and an empty line before status
> >   (Konrad)
> > - Enabled downloading of different NVMs as required for v1.3 of the chi=
p.
> > - Link to v1: https://lore.kernel.org/r/20250201-rb1-bt-v1-0-ae896c4923=
d8@linaro.org
> >
> > ---
> > Dmitry Baryshkov (6):
> >       dt-bindings: net: bluetooth: qualcomm: document WCN3950
> >       Bluetooth: qca: simplify WCN399x NVM loading
> >       Bluetooth: qca: add WCN3950 support
>
> Gracious ping, these patches have been sent two weeks ago.

Looks like it doesn't apply cleanly to bluetooth-next anymore, please
rebase/resend.

> >       arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
> >       arm64: dts: qcom: qcm2290: add UART3 device
> >       arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
> >
> >  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 31 +++++---
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 83 ++++++++++++++=
++++++++
> >  drivers/bluetooth/btqca.c                          | 27 +++++--
> >  drivers/bluetooth/btqca.h                          |  4 ++
> >  drivers/bluetooth/hci_qca.c                        | 25 +++++++
> >  6 files changed, 157 insertions(+), 15 deletions(-)
> > ---
> > base-commit: a1d1e1f2fae5fcb5f2e43b81afa9596c606e683d
> > change-id: 20250201-rb1-bt-cec7a314991d
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
>
> --
> With best wishes
> Dmitry



--=20
Luiz Augusto von Dentz

