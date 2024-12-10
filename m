Return-Path: <linux-arm-msm+bounces-41336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B69EB55C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8766C164C2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 15:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBC720767C;
	Tue, 10 Dec 2024 15:49:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9219D060;
	Tue, 10 Dec 2024 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845746; cv=none; b=XX477iNq1+KgSpBfb6V2jlp44MVkjL2730xrsdDxYHlUzx1uF7QnwGD2WCT7jyKVh72eZ7yQK/3RYypbY08bi00lgqgmF+0OLxb0+cDrU9nwV2uzUq4K4Va+EKVdmU+cFouyr3l5vs06+L5y5dSi/Zd6GacZHWhxFdP7R8Do5Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845746; c=relaxed/simple;
	bh=peHE+DJbLeZLy74+idXHUoT1cVdhbshNNIJ0NAsfJy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bc4+TBLsn23mOoFHnAXdTXVhd1Ko/rCC8q9rFx7DcsLhfj4bEyKPdzGkGLbAMjUapA4qxPbkbUD9b/cdeW2OlRcq5Bxa5mINoQA/fT/iNiwYkFkjnoPCGsiF9vQbYklcwiPYI0ydBXHcXyP5m1dHSeAIMsZs/ovCGESYnBQ8o+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5187cd9b8e5so639240e0c.1;
        Tue, 10 Dec 2024 07:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845743; x=1734450543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/Rwez1TpZi0OQAp5ylPL1NO7to/Przt1wcc1OfzevU=;
        b=O1nE0J8v0UFlD48KVKrzlls3XhziD+AxASLc+9zzZYQYYaQZyYYDW4zbnID1mI+UkT
         zjD2XjfSoGLuPGcowRhMwAWu0RhlWDiCJeX4ooFq7bQsAdO9TMZPRGZlydKuVNTBqPqz
         3KGR36DFhrnWCI6MSbqgdGK+xGrGJ1/uLBvA03FQVYr4bYA+siYioRDalnxIs8UXcdYp
         uxsMz0ZlQajeXBKz/7o0Gzu/T5jQY5VKupIWAg2ZUzoYSY0yayFRQodu0JEp7m+4cJ6P
         H0ZqEW269Imz1oOrEFshbel3PYdHscGmPvSfwCz0d6TaLG7SdgjQFHsf+N9u7/JZGLV5
         MUlg==
X-Forwarded-Encrypted: i=1; AJvYcCUqeE+QGs87Ce5lyos52IJ3mpHmoCFjaNtweO4qA5KD42OxWYHvZXxTbe/fGlrgcxDB/ooMbkXtEM36Qr9N@vger.kernel.org, AJvYcCVZv1B9KUwVSuwnu1LZ+3A5ff9F52o/PJeP7uYLgxh3gCRF55UgK1aMeU4G1/D/TvIAqbVV9/ohLKE3W/3z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3cgXgofDivCCkYz4Q/O0zJkc+DlekvmoBXywFKZVJYpHq3DE
	CXwMBomABC+UWONzd0p4DFlvMEE5u2+JViW176dcKxvBXRYJ5HIbJL8xyp5B
X-Gm-Gg: ASbGncsjc0nW9J2FHhO0Ue+XONSZYz80MhIqzn9SSIt131+sNIMj+nuvF1Gobr3QFtI
	9zjl2uEO+uvv4DdpT8KzuicLjowaWd/+19VBhq/OmBfTKpVE1iL3ulUhij1LzDHMdS6+AEOqT/1
	9BDhoH9F6XD6z8e5A2RAqNwWFvuq4NrQAFEOstmEsYdXKYy113NCgJEYwxsfPXjbZ9l3dHz6dE8
	ILp02f09rHs+2hCcBDzAHwScl2vcUJHoJVR+gkKuXWjRiKx7lRgNSggez32shokXZ/7n5w0HpvU
	9Os7Fjwp0fJ/HUhb
X-Google-Smtp-Source: AGHT+IFAmbUgg8c9/53gYmcUQuhJWQmkxebLELy5nmWvMoktgAOdMnIEerSEhuJAqxrxK428wDDUuQ==
X-Received: by 2002:a05:6122:46a0:b0:515:d38a:e168 with SMTP id 71dfb90a1353d-515fc9fcf79mr16829781e0c.4.1733845743298;
        Tue, 10 Dec 2024 07:49:03 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-516244bafa8sm516481e0c.26.2024.12.10.07.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:49:03 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4aff620b232so764515137.0;
        Tue, 10 Dec 2024 07:49:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxhT31kInDs9U5k5L6GxLTqqu37UYfkwVcWAxvEl62El6c8NpD+1oCYVgKI3hp9qH37zRY94dbbogUsZFw@vger.kernel.org, AJvYcCX0DCN8VlHe1bwhCiHhvvPxlgZrkjMpunzHYBLE86wifb+WL/UN+8xQOpn/uAl3U+s0828h9XP5+boaHH/n@vger.kernel.org
X-Received: by 2002:a67:e916:0:b0:4af:d487:45ef with SMTP id
 ada2fe7eead31-4afd4874811mr12030637137.5.1733845742841; Tue, 10 Dec 2024
 07:49:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a779f3f44c24716d783d782c935be9fe4f410bff.1733238060.git.geert+renesas@glider.be>
 <6392704d.c158.1938d27f38e.Coremail.00107082@163.com>
In-Reply-To: <6392704d.c158.1938d27f38e.Coremail.00107082@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:48:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTSnHnO7wm04TSBKPu+-aAO9JehW6rK5y6D0uBWu+6Pg@mail.gmail.com>
Message-ID: <CAMuHMdWTSnHnO7wm04TSBKPu+-aAO9JehW6rK5y6D0uBWu+6Pg@mail.gmail.com>
Subject: Re: [PATCH] genirq: Remove leading space from .irq_print_chip() callbacks
To: David Wang <00107082@163.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, Dec 3, 2024 at 4:34=E2=80=AFPM David Wang <00107082@163.com> wrote:
> At 2024-12-03 23:02:31, "Geert Uytterhoeven" <geert+renesas@glider.be> wr=
ote:
> >The space separator was factored out from the multiple chip name prints,
> >but several irq_chip.irq_print_chip() callbacks still print a leading
> >space.  Remove the superfluous double spaces.
> >
> >Fixes: 9d9f204bdf7243bf ("genirq/proc: Add missing space separator back"=
)
> >Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> >--- a/drivers/irqchip/irq-partition-percpu.c
> >+++ b/drivers/irqchip/irq-partition-percpu.c
> >@@ -98,7 +98,7 @@ static void partition_irq_print_chip(struct irq_data *=
d, struct seq_file *p)
> >       struct irq_chip *chip =3D irq_desc_get_chip(part->chained_desc);
> >       struct irq_data *data =3D irq_desc_get_irq_data(part->chained_des=
c);
> >
> >-      seq_printf(p, " %5s-%lu", chip->name, data->hwirq);
> >+      seq_printf(p, "%5s-%lu", chip->name, data->hwirq);
> > }
> >
> > static struct irq_chip partition_irq_chip =3D {
> >diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> >index 4783ab1adb8d953b..a3e88ced328a91f1 100644
> >--- a/drivers/soc/qcom/smp2p.c
> >+++ b/drivers/soc/qcom/smp2p.c
> >@@ -365,7 +365,7 @@ static void smp2p_irq_print_chip(struct irq_data *ir=
qd, struct seq_file *p)
> > {
> >       struct smp2p_entry *entry =3D irq_data_get_irq_chip_data(irqd);
> >
> >-      seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
> >+      seq_printf(p, "%8s", dev_name(entry->smp2p->dev));
> > }
> >
> > static struct irq_chip smp2p_irq_chip =3D {
> >--
> >2.34.1
>
> Match with my check result against .irq_print_chip implementation under d=
rivers.
> But I think "%8s" and "%5s-%lu" should be "%s" and "%s-%lu", otherwise th=
ere would still
> be leading spaces when the device name string is short.

I believe these are present for alignment of later columns within the
same irqchip.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

