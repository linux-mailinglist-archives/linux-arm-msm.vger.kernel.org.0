Return-Path: <linux-arm-msm+bounces-59723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20055AC6E65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD1471885669
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1B228DEEF;
	Wed, 28 May 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2FfohYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AE28DEE7;
	Wed, 28 May 2025 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451051; cv=none; b=i7XjpUJcHHVWODxy7hCpIH589KHsI4s1JTshFmxDK3N56qArNy7raGGsLbtU+uiy3FWrJn7Ux6UV3x7xPQXIIp32yDfKi+gk/ByFx37FObsictlPzqBqP9R9/1oiZzez02mrNrtWt3gU3b3qkbdb8Hve0g0Y6t4GgRh6nnY378A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451051; c=relaxed/simple;
	bh=RbkjYOsYWlR722Gz7CEkkX1aONv3ZqPZKrwis+AcOYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XF8QmjH+oPbMXWwdY++dyEakRH/Hkj6N8UcB7v3am1Ldv2LWRySVBHGz7IRU5zzQ9+1xsPU1ZJlZcdzgF75fh4/PC+EGUh3SfczUmCNTCkQcT+SEnPxF0oHycGl/USoQ6OdigATzQaRWY4Sp3bGvu5DR0YmTwEx/xLE6xi4/OYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2FfohYO; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc6b2a8647so162285ab.2;
        Wed, 28 May 2025 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748451049; x=1749055849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mLSfvvzNdOkPMdQtfbrJhi5GREToG8+aqY66T7Y+nY=;
        b=H2FfohYOYG62EyXVhmW8z4gx4PwgWa27NdrVtq+0s7Hmau1bqfqfnejb4C73Xk0qQc
         psOwOKazzkdFF5qDrdtNLGUW8jBuahTYsRS+RBWgochhIlqMUQx/HN/XrTjL0X5+pC4g
         unPT2NgfneNnFL3Lj/5NQLFF8mzABYbr54221B7tm68VgZjnIzLscsq6n7PFe21Ss2Ck
         fgJLD4g8CSWY5oJU5/vV1psCfqwXW9X6ZQd6jdpMWUulhA2ymBzljpS+z3m7y9njz3b3
         NoYiff7z9RfmTXVfENoSPPzeX321uKUhLzNefzRSUQoPk2QvuVOZNqrbZP6iP8l0GZcg
         pusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451049; x=1749055849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mLSfvvzNdOkPMdQtfbrJhi5GREToG8+aqY66T7Y+nY=;
        b=u0Bz6hYW43S6Eb9o/sKDzH6/tn9yoSDXosLDR+jTtxIGeR8exAO2Yh+iq9x7levWo7
         QK1s8rEnCbrdSs26Um3adEtU+F7O8Wqe3KV0d8aImGuL+xRtjh7qHbLyGPSIzlDUra4h
         IOpv43zsrfZDuxFcNURwNX5/1fjccGSRS8NCcthEM99de/ZcrE/REDM4K5xyeCo8qja/
         C7YdGfrzdE4x5iogWTLSQY5loz0tlzcp8vvYfZa8dE/SHM9wii+bkspC4otkRZ6H3XTZ
         b68uwRY6DqVtbSlslJLdgJdlSeRJyOxsabBKY507v4wQ5eadf1/aN5ndqGfFLBCRZEXJ
         LOfA==
X-Forwarded-Encrypted: i=1; AJvYcCUrt+hQ75EJMrAiJuEPrTGaJbCbnu9Fd4ofUPzfWBSRS4TfCBi+4uNa4reOUfRxoha9XOWpkLwNQsnF@vger.kernel.org, AJvYcCV2PU3acarpew7doHzuuQfMWUckCm3y98o6bykoc6DEPY+fip3PvqewqzEvv16vDjNJz3VvfXXQcBse1BYP@vger.kernel.org, AJvYcCVi3g4luj9CpbR3R5CfszfQ7Qf1q2ZSbCcZzLBpF4YTrD50rfrXnuj+6F/bzIm/wnvNu9aaPmbrl+2E@vger.kernel.org, AJvYcCXu4s6zScGFt+OoONlA+OPo1od9bl3WRWvbLmabzICWS3RjOsm2qbDtBre2UKaDZShT/7zbCy4soKX1bXTaGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRhtimIRqKegdvzU0bWo89jmwRHXFxV6n7/CPLUUxgnCZk6S3
	M6N8aQxTa6fAp1swnSc5ehZMmwD/Z4HK1xEVFEcKgDkMl6RqdMswDlD2KYjdDKVZcfmWf3HfrPy
	EwJZLCmJbzIrILociNxXQ2gAh4UsQyUk=
X-Gm-Gg: ASbGncvn27SMKaXOkR35ashwzg90h6wVfi2pE/QoRhhS4dsqj/wODEKN3pj00/DufqQ
	TAQBWflQjaK6u/6UxekxF8V0USiMxc96MgKUj7vZsa9M0kyyQVjtAq34OBkW5Qp7KTWIN3+rFq7
	cDPjE0NeV1SEDTQp0ZzDjUtJhdgDbhtw9Mqoqml6ApOsvQKIc7OgwWfjlYiPPMqLa2
X-Google-Smtp-Source: AGHT+IElCD9X0MUXc0KEJ35rGa0B2HBelp6NlkIwYIdR4AR+DIEjxBH8j0THx1Zrl04nM1P9nG1x7zntR3Atn44k4xE=
X-Received: by 2002:a05:6e02:2193:b0:3dc:8667:3425 with SMTP id
 e9e14a558f8ab-3dc9b70f000mr157653325ab.11.1748451049219; Wed, 28 May 2025
 09:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com> <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
In-Reply-To: <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 May 2025 09:50:37 -0700
X-Gm-Features: AX0GCFtYvoKOHGtMqf1X52z4CG5iI44YIX8TXD4Lf5SvSxvLMNmudG51MafUAOQ
Message-ID: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, jens.glathe@oldschoolsolutions.biz, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 11:18=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> > On 5/26/25 5:28 PM, Rob Clark wrote:
> > > On Mon, May 26, 2025 at 1:36=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote=
:
> > >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> > >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>>>
> >
> > [...]
> >
> > >> Yes, please. Don't set okay status for the GPU until it gets enabled=
.
> > >
> > > Drive-by: Shouldn't the dtb describe the hw and not the state of the
> > > linux kernel's support for the hw?  Ie. if bad things happen if we
> > > describe hw which is missing driver support, shouldn't we fix that in
> > > the driver.
> > >
> > > (In the case of the GPU there is the slight wrinkle that we don't hav=
e
> > > a gpu-id yet so there is no compatible in the dtb yet.)
> >
> > My two cents are that it's okay to enable it, at least in this case..
>
> That would most likely make display unavailable as DPU driver uses GPU
> as one of the components.

Hmm, perhaps we should allow the gpu to probe, but just fail to create
priv->gpu, similarly to how we handle missing firmware?

BR,
-R

