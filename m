Return-Path: <linux-arm-msm+bounces-94876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHfLKBdupWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:01:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB051D717D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 729F13020FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A9A2E2663;
	Mon,  2 Mar 2026 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zxtoyy6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F535DA5C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449179; cv=pass; b=hMopxyGpV44j4ZyrxfnxnpmhbPaBJM+pARswKPlqP1qqy/yyCPXrnze/jaoil/gvTkxplo/QV8EUDUnogApuuHqBlii/0j4dyAXUX9QInhuyz8ncUCO/Z/BZn8IhY0/YOTCZa2V2KUICXoj+ruRH6nen3TN2fP3Xnq7KUKUR7uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449179; c=relaxed/simple;
	bh=DOlMsHbMVLndF4FYMYvBm7QWT7c+r+O4d0gh3fB6Nu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SigQ5Ew+w4jxbZHcZdb2sMyFRfEit9RvMHik7rDxXuB8Jd+e8m8jECV33t/jA5FjWFkLA2J4BkBmLAbq0vTkhHKhfSYpJZ4YlscIglm4GTO5F15P3GM4KRBxgwfx2SvOU4vDzXYm4UUwsZm3GKLnr0PjJfMlya7MAn1hDJN7jhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zxtoyy6J; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d513bc15c7so5921298a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449177; cv=none;
        d=google.com; s=arc-20240605;
        b=Aj7DgM+JP8ofLPijaU8HgePct25qmCCa93089InKGTTYwUYOtMk9K5lmL9eqh9UBQr
         zYi3roVVUS4WvPzDuK46TnwD1/YEDr6xJp+y7GV1TPWeB+uFQWTXIlbU+6z/+KRjarXc
         Y9iWY8WEd38lULGqYazJmavQhEyfkrcj6Rb+SXMwwhYRvEVOF4KOIk0d7CReabZrxfn/
         eRWvmYeECbmJh0+uk3px2EIT6iEVISSnloQ1TI58NBUfYDBC9kCrK4Nf6IbKpxMlqH8Y
         L0ji/Q2ldgq3hF+BKyp1OAugLMAFyGsCulxxvB729CUDYbGNM69tC0YZSX9tg9Q0rnBU
         00rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        fh=v83tYZ7M7ZEqx5W9j137KS0WW0MdHAxZZ6p1KV9/KwA=;
        b=f7meyXqY3/zw4ce4zINtWn2t5W/L4Jgs8uUyuZYrEZvYBmiICUg7RtcL6wI9K3pt6k
         p3+lHlv3CIQh1MNFzhk9JZ0jD4rUzJN4Rzq1tglpDGGNXSFrQhZbH620/TY+jaLOY5ii
         CFyREjoCRjLd3o8+ArOrtLT03+jVvvSGveByY43OOSCA/pbYCn5k9vAA9Kcv4oKhrO3t
         EHgpLcjuM/04T9E7eiEOAta7war+rwxLtyS3GKAm7PHPW58u8kY11I9A1oNhbC32YOPP
         G/8bOjl86YxhelRBTH5Sqwex1zuySNn3O6P+bC9zTkvAF1hbdBTNbux0BOebZkz9v2Wm
         nLJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449177; x=1773053977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=Zxtoyy6JwMN5kYDszE+N6pvLZvnY25i0Ly46fy/Hap5GsNmsIVLeSz8VjmrfLDPaLX
         QzeOzFZhrjGenyvgpbeXv8F2eyiilQBtdWIY7DRG0c7BI0D0b+Z57gh7tbGZC8hRAhu8
         H3PALdg37i4yUpjRh1OtE+kPNtFBXCYEuCWlFRqflIje2iVlGlvfBYomu6yGJlvzs3/N
         2jwPrhmRkQrdfnTtTVzBARR4Vx/F6ZQVuwFEYHYMlQ4bV0LVCL0/zNtjQ7RAji5EuX66
         ecqA24GWTUnzCOAQzLV3xVZJdg3MeATec5Y4b1XoXjQuKCOr13rYbAcQtADrCHj2Bb0Y
         ugTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449177; x=1773053977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Epvo5wYm+zeVxTVz8aEQhOjvw8UhIQfhH+DB/G3qjuc=;
        b=n1Ry8mGltq8GzO5VznBgBnI+oGjgehVqnKSSmtnQZtJoQjbTDr8i86V1UHAoLennu0
         pUTqVjCZSZsHH+pLTQFBsNyOjDzj+cRjbKEs4EZL1zBeBjVxX1Z4lSpLCuY0sszE9cCg
         Bl50w7Be5GlnwUk01chQwFBhdJIMJCVe6zVTi8+Z+qsS3Ej/hSRytg/KCYkQxMx8EThz
         /Zoo75QuGvyXeObhVZaSMaQ0nYi0ij96895KDBJ4Y1hkOFaeQ+IrUoDglV1D4Ff3ECyQ
         fQnexrzxq8sBtJjPSNr8nzYKOtyXLfUJhD2vyHIpSLinjMfD/c/ihPU9UC1zdTbxODQQ
         BHxA==
X-Forwarded-Encrypted: i=1; AJvYcCXTkZOar/BfOT7MWKy9WfLJbTOL/YLDqgB5+hySIbO7KAsN4+XEME8NIShGy3mwZM0zD/yULD55OX0pTsCV@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCn1OtKm5qsuFh5oDoTm57Ubed2ZDf756sPhpY78Jt2ZH2RpC
	8kLGQpeYKaJrR0Zt58NgJlHWnZAtY1Ue989NXq8CSYi4lN7DauvAfLMlc6KjuFakqj613NVS7DL
	qnNrxtyG+Yo+Ltc302IHEjo9qoM/zHJw=
X-Gm-Gg: ATEYQzwUOi5OUPhaTDhM117lE75eaSARsNHvKX+84Udn/HjXFHUBfLdI3VveBrDp8vZ
	8Zq2Tii1VoPPo9Xc1LY2V9J7cJ9micSRt1hs+GWMJPE86OSVG+g+tpocGXpsUQED90LM42GyXJV
	B70CTPp7c2eRlr+Xdy2C2+EUJA47u63GMOvNxYc+edfezJT7lWkjL8YTIo9xoYmMO04CxaeRuMA
	9rFMWKg5FA46ObZ9tdsVMfmldtKqrwuM48u/7QNk/JGjeiioQidxT/QgNB2qp/w+avLo8oNlca2
	hr54FX0sG0iTmaoYqYLOln96egtZgG+lbAMOGvh40uxDKZQr43kO1WBL+cAJ3Ec76k6Mom4XZuA
	=
X-Received: by 2002:a05:6870:3234:b0:36e:8381:db00 with SMTP id
 586e51a60fabf-41626d6496dmr5836181fac.9.1772449176906; Mon, 02 Mar 2026
 02:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
 <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
In-Reply-To: <DGS7SQHM3V5U.2DNQV68AMSITF@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 18:59:26 +0800
X-Gm-Features: AaiRm50vW8aIhDL5VGmJOu5lxfmc5lcpsegRPt5hsmjpSbqi9ltnncK92dntUuc
Message-ID: <CALbr=LYMgWXcj0QkQYv-68gX2mkzyKrE2BJFeXbnoVXKW=F85g@mail.gmail.com>
Subject: Re: [PATCH 0/3] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1EB051D717D
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 6:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 10:41 AM CET, Gui-Dong Han wrote:
> >> Danilo Krummrich (3):
> >>   driver core: generalize driver_override in struct device
> >>   hwmon: axi-fan: don't use driver_override as IRQ name
> >>   driver core: platform: use generic driver_override infrastructure
> >
> > Hi Danilo,
> >
> > It looks like some usages of platform_device->driver_override were
> > missed. I found them here:
> > - drivers/bus/simple-pm-bus.c
> > - drivers/clk/imx/clk-scu.c
> > - drivers/slimbus/qcom-ngd-ctrl.c
> > - sound/soc/samsung/i2s.c
>
> They should all be covered by patch 3, no?

My apologies, I got a bit confused here.

>
> > The good news is these can be easily updated to use the new APIs. This
> > is required to avoid breaking the build, since the field is removed
> > from struct platform_device. The previous build likely passed because
> > these weren't enabled. I will use allyesconfig for testing going
> > forward.
> >
> > I scanned for similar cases and most fit the new APIs perfectly. One
> > exception is drivers/xen/xen-pciback/pci_stub.c. It does
> > strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
> > drv->name. We might want to change device_match_driver_override() to
> > take a const char * instead to handle this.
>
> xen_pcibk_pci_driver should use the exact same define, so we can just con=
vert
> this to:
>
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback=
/pci_stub.c
> index e4b27aecbf0591..301207b4a30dac 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -609,9 +609,9 @@ static int pcistub_probe(struct pci_dev *dev, const s=
truct pci_device_id *id)
>
>         match =3D pcistub_match(dev);
>
> -       if ((dev->driver_override &&
> -            !strcmp(dev->driver_override, PCISTUB_DRIVER_NAME)) ||
> -           match) {
> +       if (device_match_driver_override(&dev->dev,
> +                                        &xen_pcibk_pci_driver.driver) > =
0 ||
> +                                        match) {
>
>                 if (dev->hdr_type !=3D PCI_HEADER_TYPE_NORMAL
>                     && dev->hdr_type !=3D PCI_HEADER_TYPE_BRIDGE) {
>
> I.e. no separate API needed.

Thanks for the explanation, you are absolutely right.

>
> > Besides axi-fan, I didn't find any other drivers that need to read
> > driver_override. This is great, as it means we hopefully won't need to
> > expose a read API at all.
>
> Great, thanks for checking.

