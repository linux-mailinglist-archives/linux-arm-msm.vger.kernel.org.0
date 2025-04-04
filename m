Return-Path: <linux-arm-msm+bounces-53251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB2A7C070
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 17:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CAB9189BD3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 15:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4EC1F4E21;
	Fri,  4 Apr 2025 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbeRVOpb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D521F3BA8;
	Fri,  4 Apr 2025 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779964; cv=none; b=SjbzD1OWFViHDd39YXCaOJkdSkfc25DPbZiydxoq3ZcTYTlhtwHDwp3rdX0IjGOZP8b8xYcRX8MAn3chPW3CMqn9dWaIAv2KrtbN0OJpTM0kzVdiHXraEviBKEmcXBWkiO23FAhopojIIqXaFQZY5pdV+UvHQ+8Ypqv60tPrRuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779964; c=relaxed/simple;
	bh=Xr9jXvezucw+9GAAJLda5NvJK+z/kHdD7h+oYo5bzG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taE+n3VUkAvilnvjPBwLCVQrPrFZES6V2J7SQ0KDy19nKQitte++JLi+aYJmrJA8IoiP/THVfXGMvUwY4phPjRygC6xGT65g3dDfk0J6jwD1JZ6LksGEGRgFgqIAn8RGjA7PHLk7QrVnnzrv0XX02Km8fDT9Uww0SxEou2lcbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbeRVOpb; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-30bee278c2aso33997651fa.0;
        Fri, 04 Apr 2025 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743779961; x=1744384761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7iWccUiw/ID8NYLVkhb9PSyPwcEt5/Y/IQ2ZtQH16c=;
        b=XbeRVOpb/c+ffdckV6hAMPjVDMLrXHU5kmTm6m5Us1FZJQ26rUFD5bMr0o/h2uDRuV
         9JjhyiUagIR+2qGMmCzFGD5sdDdvwjqcfBUTHQm9fDJthqoHbOrqpUotoqofSPnJMlfz
         NewegDjOHY4tppPcHDjDpm/EUZFo13W2fY8DerDqsrqIW54DCbt9Yvu2MQ80+dAUVb7l
         0b3lnZwJGR1wk/lisRbMrhMB+pUMdDiLeSbmQsITxffAZGUGFmW/XEj6LsU+qNLy20Yi
         kCp8BvpOkON78qBhzR7NCeOan7cPwJCVhGc7CNpartuWHXbU4Ly360JkZCORIPl/6jNi
         a/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779961; x=1744384761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7iWccUiw/ID8NYLVkhb9PSyPwcEt5/Y/IQ2ZtQH16c=;
        b=bT/l72uyAIym4vEFB0S7qXMIUD/fypqxb1R6khppSMFdTtaJMXG+kZ5kdzHQ4Imbs8
         VH8/vQywwbkN0HYnc3CsWxP1CBJ144J4jNx1pNTS2rtA/tQkvG/uFtqNhngpumJiRv/m
         2j72gxpMLr2CwSgOUNZAuJFEqMgckJTcvEHEIZTDsjRKrkerQzqL8PAB9BaotLdsZVo2
         Fng6lB6Dw9y4As3e5OA0gFhKZkpBdacarps6MccGSgN4ImbfuuinS6Wd10K8s8pjk2M5
         7f73242J6109Vt+ePSOHyiVvygrG2vSLj9tPXuuWCQGXsjKr2fOTTzq0W90t3kLiHZMs
         VHLw==
X-Forwarded-Encrypted: i=1; AJvYcCVadcIfH69Yc39Lmseq/oF1NJqK+7IMYmbSIO4acZ/7ihrji9Q7Es1yEh/xPqHzwNT+XSrF3LMwb2uL3fOp@vger.kernel.org, AJvYcCWbd3+qPD7GOf8M+QYXqjQk0yf8Kd4BhELySI53e+itGXra586A8L/vTf1KYXJ2T2g6toMtiVMZMgkYvu4=@vger.kernel.org, AJvYcCXmGmkOIy927aBoiD2ANi/jNqweRizYykbKgqCrc6gKaFqlhD79izuzbhLHBQiUVN1zSEfUo7/ABP+4BzGX@vger.kernel.org
X-Gm-Message-State: AOJu0YyPevizb3BofelzxNCF7dG8LfQyWoYPusnduz+Nm2Q+6C6mekuG
	23KdmoRu+I5il8Yh+fOV5qeKI59hm+zUvyuJBHp4nDidgILiMILi78+MCIewKTMdGMKBrxmFfmm
	q+2kwkoE8weopLRgYSbciEQOzbx8=
X-Gm-Gg: ASbGncuPwk5MlXwV1+P9yhIsYSOx5tHkIcGBNkPqe3BQoXfAa+ZOHvvsHzYNneFiXOA
	bmlkrzi6ExZzYkamRJUn9p3enr3zMBUPKtZ20BdcUUSZFVrP52hHzc6JEeciO+ItawrCLvCiSAu
	lmmpbOrAnLWoA/dDujR9rbi3kbyuU=
X-Google-Smtp-Source: AGHT+IEXx6acthjgAn6//pGGjgLYBD1HWjhVlOep3HaA55zS/PUR37+AJSk2OPFw/dPZLEdIcG0O31KhRGxGnR7OnQE=
X-Received: by 2002:a05:651c:1449:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-30f0a6672c6mr13405141fa.7.1743779960600; Fri, 04 Apr 2025
 08:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-uqpxcge0J99IPI@aspen.lan> <20250401091647.22784-1-bsdhenrymartin@gmail.com>
 <174377951404.402191.3996310155954584937.b4-ty@kernel.org> <20250404151300.GD372032@google.com>
In-Reply-To: <20250404151300.GD372032@google.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Fri, 4 Apr 2025 23:19:09 +0800
X-Gm-Features: ATxdqUEtLv1VLfi6vRSrJH5UTl_kVLlPCY8-xy9xcLIwMYM5iu9pWJ5-wcimQ4I
Message-ID: <CAEnQdOpWrZPor9WMtEfub5qJFT98rrsN_A6jb_a-JqSjd9tihw@mail.gmail.com>
Subject: Re: (subset) [PATCH v4] backlight: pm8941: Add NULL check in wled_configure()
To: Lee Jones <lee@kernel.org>
Cc: danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Noted, thanks for the feedback! I=E2=80=99ll send subsequent versions as
independent patches in the future.

Best regards,
Henry


Lee Jones <lee@kernel.org> =E4=BA=8E2025=E5=B9=B44=E6=9C=884=E6=97=A5=E5=91=
=A8=E4=BA=94 23:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 04 Apr 2025, Lee Jones wrote:
>
> > On Tue, 01 Apr 2025 17:16:47 +0800, Henry Martin wrote:
> > > devm_kasprintf() returns NULL when memory allocation fails. Currently=
,
> > > wled_configure() does not check for this case, which results in a NUL=
L
> > > pointer dereference.
> > >
> > > Add NULL check after devm_kasprintf() to prevent this issue.
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] backlight: pm8941: Add NULL check in wled_configure()
> >       commit: b0fdeb96ead46de57a6226bc3a3ac7f9b50c0ace
>
> Next time, please send subsequent patch versions independently.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

