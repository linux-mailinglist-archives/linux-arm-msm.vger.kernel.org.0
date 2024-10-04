Return-Path: <linux-arm-msm+bounces-33146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B9990F86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 22:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDCC71F23E09
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 20:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602411FA24D;
	Fri,  4 Oct 2024 19:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmHB+6+y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1EE1F9ABD;
	Fri,  4 Oct 2024 19:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728068680; cv=none; b=ElaLe8W4GR9YRIJ+YdCidlJdPFAOjC6dvtq9csBvwlm1bg0KUkgxN54huXchnmJjTdSyU2k6ByFnZ+FTSVXvjlYMRypN8kfj1TRtvHiedh5mbeZL/T1mXbId7f+MUm7tXVwPfin0+QQ6/ffWR2W8TfPmAgJ8sshFPVUUKOGf8nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728068680; c=relaxed/simple;
	bh=dg2TEPNt6m3xvH7rSPBqehMHHHswR0bUQaAIRYJds+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWSQoyMZkYA2vwYsM1H+eOK8EUBZEJ6myBYM8vBjVkZAmXfynGTZx5ux+uBw0RU3VIWvb8ZB9omQv6l7r6WomrhWfJvaz3ndgJTERdsA1G/EAP9hxOeZfcDBcyiwJkk2QN1Fki/7Rg12BqXtnQr03bUg9OBg7V8Dkph5+QeQwvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmHB+6+y; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6de14e0f050so20180547b3.0;
        Fri, 04 Oct 2024 12:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728068677; x=1728673477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=;
        b=LmHB+6+y5me57h2Jk+M7zorgLBLfmL4lbkatp2t3LUeC3pVz7J+H4dpKFDKHcJSSaz
         EekHA4TmlvuNo3y55Bsli43rvvFYgUoUx2dgLsH0fM/OV19h02yPoQexGrNgafiwE3jL
         J6yfPeZnoyGbn6ll2KteKWQtNiapYdXz+AwKFy02aKQr3G7jgl30IT8T5qQbbJi7kUND
         Ddt5Lko8xuZ5okuD0yMfozBlMQym7So+zqr2r4IAu83IOWHNYQ8TMMnk+LJFuRhDcQac
         LJNfRPjw+cRPL3jpbAe1NoxCpcTBQWkj+ogTqr6uwXvwaAA2oeBd85p53hqOzVH+gT5R
         aR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728068677; x=1728673477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=;
        b=CEVNcRkRYm1dadIdoZMW/UZJl4mDZRcxBeLmZK0+1nyRa2Js5aGT3lLg1ePwD/qGN0
         n60p5Z6YpT6LwpRW4IhwxJXb4lH8VKhP8vaAgzKTsg2zP3ak2Xio4Y1OBQaLr38UyEa8
         rdEywqEQigUBAekFfS8meRlec+QoUiBS3efBTsYymA7r64ZRmEFhRebGDbQ4B/sbA5fa
         tToR3jJmDRx/9O9KSI/fQmmByrlKWkwtAxhwGeed+lixwGvAxAqVrWuCfGVprlphRaB3
         1HLh2YT0zkJu/Y0Bdy/hGZNa6hmE2Z77t++pABAf/l+/W81uW03Dg9c0kFqitZ/g16Fy
         vk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbLlQKH0pBe53j9sM2WJf9nGM2xgwDdohp5nRpn8QmEz6JhBQiu7KY9riY5WGY15jEsoHMSVMBjRGf5Tcy@vger.kernel.org, AJvYcCVYfE4tKprEzFA9Ew9X6oplWIYkdajE6anDvdKzqwnsyLTpnUuZRxQ7VdrQ6EVuw6E2kmZ7Hh1B@vger.kernel.org, AJvYcCXeIhL2Rru3MGaykU/nSFE8m0nYHsxfP/HOttpaAOa8oqQB2TbI7qOI25IHLXnp+OBkw2UX+THO4XiYNy2u@vger.kernel.org
X-Gm-Message-State: AOJu0YyoB0PzttdmvOADSle2f/BSOvYnn0apuEn1oqI3QSd5o3ZUIXVp
	OhybWp5XLjWLZQIx2/qD3hjErPbwPkQL2g4fzP918qbMDjVcm+hWsHvzVZmcK7h41TeoTI09FA6
	iqeZbj6lKniW7ulc/pBYvFXloyVI=
X-Google-Smtp-Source: AGHT+IH9scQLWNqJQHayBVbx3/oOvir8TuLyhF6I1u9sp0NdVUUfeeiiIOFw8tGmDwqe/ZpBUA1tc6SRGklljrBAiUA=
X-Received: by 2002:a05:690c:6813:b0:6e2:2600:ed86 with SMTP id
 00721157ae682-6e2c72f779cmr34932837b3.45.1728068677613; Fri, 04 Oct 2024
 12:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004000015.544297-1-rosenp@gmail.com> <20241004000015.544297-6-rosenp@gmail.com>
 <39dcfa4b-1a22-4296-b190-ac39480d034a@kernel.org>
In-Reply-To: <39dcfa4b-1a22-4296-b190-ac39480d034a@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Oct 2024 12:04:26 -0700
Message-ID: <CAKxU2N9-DxfsANMfT8DZ-LuKJ3bqjckyfd=+Lg_qtRn985BuoQ@mail.gmail.com>
Subject: Re: [PATCHv2 5/5] documentation: use nvmem-layout in examples
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"moderated list:BROADCOM BCMBCA ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 11:25=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 04/10/2024 02:00, Rosen Penev wrote:
> > nvmem-cells are deprecated and replaced with nvmem-layout. For these
> > examples, replace. They're not relevant to the main point of the
> > document anyway.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++++++--------
> >  .../bindings/net/marvell,aquantia.yaml        | 13 ++++++++-----
> >  2 files changed, 19 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem=
-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-par=
t.yaml
> > index 1c2b4e780ca9..8ae149534b23 100644
> > --- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.y=
aml
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.y=
aml
> > @@ -45,17 +45,20 @@ examples:
> >              compatible =3D "qcom,smem-part";
> >
> >              partition-art {
> > -                compatible =3D "nvmem-cells";
> > -                #address-cells =3D <1>;
> > -                #size-cells =3D <1>;
> >                  label =3D "0:art";
> >
> > -                macaddr_art_0: macaddr@0 {
> > -                    reg =3D <0x0 0x6>;
> > -                };
> > +                nvmem-layout {
> > +                    compatible =3D "fixed-layout";
>
> This does not look right - the binding still expects nvmem-cells. I
> wonder how does the nvmem-cells.yaml work if the compatible is being
> removed so it is not being selected.
Not sure I follow here. You mean replace nvmem-cells.yaml with
nvmem-layout.yaml ?
>
>
> Best regards,
> Krzysztof
>

