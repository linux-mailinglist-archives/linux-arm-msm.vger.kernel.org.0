Return-Path: <linux-arm-msm+bounces-79223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C619C15A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D11BE566ED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7435033290A;
	Tue, 28 Oct 2025 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ksuUqZ0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E452B2367B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666536; cv=none; b=nv8y0v1TlitXHnXCzx/Rar7kMZi/fYjL5XJRf8xmuKwL4Goznjj163mWmGDDalUUp/6U46lTbPPkeSZZyi6Wf1jornhPx+LNhjSBljERWWpRtEmyRZOJGYZuLEiBU7SmU0nA7tU7B2T0H5vTzqoqt2HgnllLyEdvPgJsjk8M8bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666536; c=relaxed/simple;
	bh=k8I9h+2k6IeAyl3/Vc6zs1prRM4rel0Sjd0zv9duXjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4yCrK/S85xrnDvP0UeCRk47xtxQF0AIpmWyc8E8t0ciYAnu/Oe9ePMku5KXkk/m4qTwSTd7TzTXhYTgNkt6j0eipsV2OdL8mvMSThPOuzXeTImNYXbJFRGgF0qv0UYg+ECTjydxTbglHruKcsLZk9aiKrSThyha1m3ZWnUcUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ksuUqZ0Y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-58b025fce96so5306756e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761666529; x=1762271329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwnCWAx8OAVXDxRLd+WdlJJdVlnMbvByJtUaS0y34MA=;
        b=ksuUqZ0Ypzyeyx4wH585OL1Kw2LbSuTiBo2MRICReaYuuSEND/RtKHtCyzwAhD4UqP
         tF+2gfp/B8Qf0MiR9QZEvZr/YLKGHhePhe4ap8Uee7mEkAW2wz6LEESQiGQqGQZl2/Mo
         z39AD1wnCuZLlDhRNv/dFi13d82/8ofXGtWT2mputn9eeZ/ej9qU0NjLufzhph9o+zHp
         h5We5NPUFgs6KwtWlWfZDZ8enQBZl6xN2KF2O1NvHtahiqDtESJ/d0WI7ajrVRk/Zio4
         TP68X2lL+VaHMqvzhWka2GgnsdgsjFCN8oEZ7feQDT3eyMT3V6PbYvFKZVp3DOSEfM/U
         u0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666529; x=1762271329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwnCWAx8OAVXDxRLd+WdlJJdVlnMbvByJtUaS0y34MA=;
        b=OZO//leMtpoa8o1bqZ+Do2qMHROU2gcYewDRxuz91P+7rDWP5uQhUfNhBa/8yzgeaT
         wsY3mvLBWlcVDtSlu+hqScxXunA/ftgHa8U9foRRFKovQ5V97lsnC2jfLur3MxxCHSO9
         HAV2PkoWZkscKHEHyt881J2tpUpvjZcwQ6paQx9uwTyVHphSmwFlzaTZtUoJlfQUqNf/
         p/j1kEE9vS+Ac7gPKgHrntJMFIHQRTyYDv+GvCSyQH38mWrC2A1Wo+KWSkMnXfybsspz
         BQOjYLVMnKazCraxS245KvXKxEWGQ8uHKJD97GIa9m+kNU7uSFLphYUid16lryknci0J
         3nsw==
X-Forwarded-Encrypted: i=1; AJvYcCXx9mAKDEJb7vNKyv0+kKS4HZK9bW9Df6HGPt7ZYbQdRoLbnprPiAFbnUpGkk7sQp731AFoXd5SS953FEhr@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYSmtdE7zaUgLu8b6Z/FSE9qh9wJ98Z/HkdecJ70W+NrCxTef
	2Pr5nRG99+0oG+2ehipwIFjHWDXNNDj+9wp3/XNjgP5f3ujzEhbHdAJjVsSxezHJ7SdmGiLB+GV
	XRXdk3zeNTcYlKiTNt8g0iFlPRhbRS2lsTmviUxvKVw==
X-Gm-Gg: ASbGncvCKsE2jMo3iw6Lg9ONAJg68gfmiLcxSTrEx6P8w7q2uRQdWQysO7DsxcQhiu6
	Q0CjiYkfA2sSl6Q1mnM2Pix0q7uH2Ss9Jax7wElYFHjOqu0lnySXLhn3U/J9iS0lJ3jbIelgDgR
	v0MFs6LYsHT2BQDb3E2tYPYqg5cGJ8bWYS1XHrfIAGqECalSLioxdLZxGQqwTPCYdlfnqB/FWQh
	98D3fyfSM/Z2d9He6jahrIF6B+6lcYLdI2ymI3sbdgpEQqQpBFa0uuHyLhjqGcDWRBxLdolLT45
	1QR9Bne0SdL3aJnt9dj7p640L7c=
X-Google-Smtp-Source: AGHT+IHHQJDBFfYRgVJqX8xhSBA+9GpHTt9NgT260wr0JACLtpxb1RyGaZnV1bwmlzp3ct/hmGOguYUodPiD3cQebnM=
X-Received: by 2002:a05:6512:1095:b0:592:fc21:bc17 with SMTP id
 2adb3069b0e04-5930e99bc4emr1498445e87.3.1761666528580; Tue, 28 Oct 2025
 08:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
 <20251028-dt-bindings-qcom-bluetooth-v1-1-524a978e3cda@linaro.org>
 <CAMRc=MdqAATOcDPhd=u0vOb8nLxSRd7N8rLGLO8F5Ywq3+=JCw@mail.gmail.com> <bd5bb1f2-a8ba-4828-9d04-2e1d433ecadb@linaro.org>
In-Reply-To: <bd5bb1f2-a8ba-4828-9d04-2e1d433ecadb@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Oct 2025 16:48:36 +0100
X-Gm-Features: AWmQ_blgYmNnJtX1_PVoBYu1p1yrIy4vMPH61Mm6WV-4oL23HbeoCUDP69m6qE0
Message-ID: <CAMRc=MdL4yqY2em5myZO106FEzRF1RQuYroc74Qt_iHm-KBn-A@mail.gmail.com>
Subject: Re: [PATCH 01/12] Bluetooth: MAINTAINERS: Orphan Qualcomm hci_qca
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 4:47=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/10/2025 16:43, Bartosz Golaszewski wrote:
> > On Tue, Oct 28, 2025 at 4:33=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> There are no maintainers of Qualcomm hci_qca Bluetooth driver, so make
> >> it explicit that driver was orphaned and no one cares to keep it
> >> maintained.  That's also indication for future removal from the Linux
> >> kernel.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  MAINTAINERS | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 8abdc0e50699..be637b9dc7c0 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -21146,7 +21146,7 @@ F:      drivers/net/wwan/qcom_bam_dmux.c
> >>
> >>  QUALCOMM BLUETOOTH DRIVER
> >>  L:     linux-arm-msm@vger.kernel.org
> >> -S:     Maintained
> >> +S:     Orphan
> >>  F:     drivers/bluetooth/btqca.[ch]
> >>  F:     drivers/bluetooth/btqcomsmd.c
> >>  F:     drivers/bluetooth/hci_qca.c
> >>
> >> --
> >> 2.48.1
> >>
> >>
> >
> > Actually, I added that entry so that the arm-msm list can get Cc'ed on
>
> Ahaha, nice :)
>
> > patches. The fact it didn't use to, caused some regressions. I have
>
> It also points out that drivers do not have a maintainer.
>
> > done some work on it, so I can take it over as maintainer.
> Sure, I'll send separate patch for that replacing this one. Shall I add
> you to the bindings as well? All or only some?
>

I'm more familiar with the C part but sure, why not.

Bart

