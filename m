Return-Path: <linux-arm-msm+bounces-14588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55874880384
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 18:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 784E41C21F0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1960F25632;
	Tue, 19 Mar 2024 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fj5TxPY/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795B32031D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710869639; cv=none; b=sLR+TdcrK3Vgxj6NeX0PO7voI6HsxLs47Ed16j67wV6L67rGvCviY/nbeNv4FbdRCKRyyHDy0Cw+cCPQ0k34BGFvSiaCdmYdjP+tkuAm2onqU/OjDPSkYMwDvMvtAAsvfOid4aqbqO5tNQfYp41wtufGzBQBjCQlaJsF3LdwiC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710869639; c=relaxed/simple;
	bh=2cv+uOgViz5td2LtyB9BpL841aRXxlirwrFqlMFbk68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEjnvSqIBDBlJ+0DMzJBopz4WdwmxwNlnc/a+8f1Yabu0MVI85hXGdTukcyzeW9Pna6F2aapy7mSlFli+GjQ3uzWG2u6WKQjQ/47YNetNYOOCZ+TY9ob7mtfAWXfuyOEY9Vzd3pMELIq/h9hnyhyx6vUeXfbKCJOckNL0uHmmdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fj5TxPY/; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-789e6ceaff1so11001585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710869635; x=1711474435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cv+uOgViz5td2LtyB9BpL841aRXxlirwrFqlMFbk68=;
        b=Fj5TxPY/0KGW0UbxVRfCdSWPR18h4keDawp7x4xjnG/9AlsLf/tVw4i0lHdCg1nf3N
         2+9EAads4SbiaVp69h2PoAr2qqs4yXEkjK0v5wgQP1QY0yKqMemPZvrZct/TiPiCdtjv
         suT4mIuzFegh2zOvHoRfGDIWKdRzM1ZEevcPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710869635; x=1711474435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cv+uOgViz5td2LtyB9BpL841aRXxlirwrFqlMFbk68=;
        b=M+B694Tuc3LzwpNMouzZ59TarkicCZMu/cBKTSV+lSWt8AX8w6mdcQMYYwDADeASL4
         sdHeaZzPm6vh1Z2tiNoRjhr/Ux8P/J+8KsYHk0h/jl8ocr5VqwNv+4u58pkUABYxxPhm
         VZy/NbDac/DssjTnb8a8uzToYzlewAlrY0W0acXVVoKjt88UoRJ+pYx/7C8pCgljeF9j
         VXPjvOP1RTpIlu+7Vo+3kR2lT3qLGSzen7lqOhK8ZRbOaqniq7qan+ZyE313YcQryFRe
         jZAOlz29E2RZvZY9hlDauXszJz63Lg5hHUr3p+YKZMnJFsFBWMxWcw3uHIxwsw//wpok
         mBeg==
X-Forwarded-Encrypted: i=1; AJvYcCUTLaEuS+UFjiklwfMvlvJrgNNPDF0fmDxBczQq/NNUU2cwwisW89nJ3AIcHBx56ReM0WwrvZaE3KDFFKocB7Vimutz4+TaCQgonDZrdQ==
X-Gm-Message-State: AOJu0Yxg/k5J2ktzpi41UUzwadQvkk1e4PdUPMZOyNeDhYLIp8Jy51Fy
	JkivxGBtC0mGuc2kty0PROCSpKjvdfM/2fEZVPhdt5XnpyiiZW/yJad8bknJtchP3mYDYlIF5po
	=
X-Google-Smtp-Source: AGHT+IH8/lrOdtgIr+UVvVCe/QGypYXoifsRrWAw3aeGGLqrmYhn+hUGXcINADWws06riTmCZYfl3g==
X-Received: by 2002:ae9:f40b:0:b0:789:c760:176e with SMTP id y11-20020ae9f40b000000b00789c760176emr174187qkl.20.1710869634986;
        Tue, 19 Mar 2024 10:33:54 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id k18-20020a05620a0b9200b00789fe83b050sm2233172qkh.78.2024.03.19.10.33.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 10:33:54 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-430e1e06e75so37201cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:33:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQCmS0QKQ13aB0UsE0Ka/FH7hHR1oPsJbl4IF+HN1IX7utFMu5S4+22uqr6HOPkAnZlgOvmUJFeAg8DMs68Njq6jCypWthiYLhR1mAFQ==
X-Received: by 2002:a05:622a:2293:b0:430:d723:aa66 with SMTP id
 ay19-20020a05622a229300b00430d723aa66mr20279qtb.16.1710869633686; Tue, 19 Mar
 2024 10:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319152926.1288-1-johan+linaro@kernel.org>
 <20240319152926.1288-4-johan+linaro@kernel.org> <CAD=FV=WqwY07fMV-TuO8QMRnk555BJYEysv4urcugsELufHr4A@mail.gmail.com>
 <Zfm_oFLNgPHqJKtG@hovoldconsulting.com> <CAD=FV=UgCNmeWJiwWAGj_jm78eeTNoo-_bx7QrqLfyDMJwRNKA@mail.gmail.com>
 <ZfnLKC7B9o2reC8x@hovoldconsulting.com>
In-Reply-To: <ZfnLKC7B9o2reC8x@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 10:33:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ujx+f3SxTiuhBGUypwfvHqTO70jy-8EgLUGA93SON5Kw@mail.gmail.com>
Message-ID: <CAD=FV=Ujx+f3SxTiuhBGUypwfvHqTO70jy-8EgLUGA93SON5Kw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] Bluetooth: qca: fix device-address endianness
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 10:28=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> > I guess I have a different opinion on the matter. I often end up
> > cherry-picking stuff to older branches and I generally assume that
> > it's relatively safe to pick the beginning of a series without picking
> > later patches because I assume everyone has a goal of bisectability.
> > This breaks that assumption. IMO splitting up the Qualcomm Bluetooth
> > patch into two patches doesn't help enough with clarity to justify.
>
> I did that in v2 because then the two patches had to be split to
> facilitate backporting as wcn3991 support was added later.
>
> But the big issue here is taking the patches through different trees. If
> Bjorn could ack the DT patch so that everything goes through the
> Bluetooth tree, then I guess I can reorder the DT patch and squash the
> two driver patches.
>
> But waiting several weeks just to make sure that the DT patch hits
> mainline (and the binding patch before that?) before the driver fixes
> can go in just does not seem worth it to me.

Personally, I don't care quite as much about them going through the
same tree. It'd be nice, but I agree with you that it's probably not
worth the hassle (though I wouldn't object if Bjorn wanted to Ack the
dts) and it's fine with me if the patches "meet up" in mainline. In my
case, though, I could imagine following the "Link" tag in the patches
and arriving at the mailing list post. That's where I'd go back and
look to see the order which I should apply the patches safely. ...and
I'd prefer that it shows an order that lets things apply safely.

-Doug

