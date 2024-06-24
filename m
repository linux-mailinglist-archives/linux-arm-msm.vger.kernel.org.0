Return-Path: <linux-arm-msm+bounces-24015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390D6915587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 19:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7600B209E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90B919EEDA;
	Mon, 24 Jun 2024 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ML0Y+EyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F919EEBD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719250767; cv=none; b=EX+H+et32XxZDpbfx/76JxQ3FCvaFzktjiA1n0xbYm2WAJWyCOLsjce/a43k0/YopasBvxOVSc4OkRD18r6pHZlTlTxBrtwsA2/teEXIdGqvSKKJIIxBxPt7Pa1HTh1DRgGjU4j5Oin3PVU3S/1z2o1Ui6c7s7K9HrhumZs+enU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719250767; c=relaxed/simple;
	bh=RmWwBKqpQhgnS45GQ4aaZI6SvIbgoTYxZp32M5eQP5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chs8pavqlq9TcmyT18hGjaLcb7dmp/kuQ2qB3FiUnUVbnTDsSez9+2U9WgrOEEQCj+qEemZ3rifHYe0S3NIuzuVHYn+2gkUtWFDJXNe8ihGHgi4pX/ust0yrwuQrGc5ugLP5ZdRyl+BzXiUZlq9gTXn9Qc75PB7YWp83zYJFe/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ML0Y+EyK; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6b4ffc2a7abso37165406d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719250764; x=1719855564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bcigEvxElFnNf6XQZ1LGyn+920C2Rwm5nJUAotnto8=;
        b=ML0Y+EyKNiVdw+KpF8EYsjABUHPy2ApYl+20TlGRetEgKhyzKR1uVtdJQ1b6+78ea4
         1GmzoNFlLZXkd/28e1gra9helEvyM3LdVlJdyaEufFwizV+1sE5bh+htAt7hAxbvnz0j
         FoHFC4NweDvyltpghFKryt9BsG77nxUSwLQDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719250764; x=1719855564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bcigEvxElFnNf6XQZ1LGyn+920C2Rwm5nJUAotnto8=;
        b=fQBcByeAgmpw495JVGSzQ7lwZW4C2m9SWQQ6lD7L4Sl79tXpuGFnbFkvmXJs1a4/TF
         93TcKQ1HD9ycuWJVAfGn8q6l4Pb5udQdUabHFb3UqFz25zhDFiA1LHZuXRxshYPtVUjb
         tfOmiZprj3AS03pkpl8h/r6BFdF8AbVNTLalF+2YH9YX5Pve/YTm9skEmp1NRWlHbpIw
         B6IicZdPScNgdyTlmaGtf0pBpCdZbydLaP1R1H1rhY1/nQX2K3YzMKiVkxQxIAMI7lYo
         SAcX6qmY2V+UR2qlMKMqYQEK9n8s30Tkj8HZ8+a/dbW+bFIWarf5bVDnVEtO6Ae9j14Y
         EO3A==
X-Forwarded-Encrypted: i=1; AJvYcCUyOECE3E8J5N9NvRIHkDiFGqIAzWqRzVWKUZMefh8a+vIFbb1nW95TYQBdBrvZ1U/5cScLj/n2N/nN7Bqp337Yi9Tek8XJ73fj2h6qyg==
X-Gm-Message-State: AOJu0YxMArZEHRLhor4othSvZyeBeAXB9A4886T4lyAlD/4pWqqRX33Q
	CGfg2F7Tg7moluI6hpjKpiZ6UW3KS3447zYndxEof2J5/FMzzt4Nhs6qTiKWKJu/NPZT2hYceyo
	=
X-Google-Smtp-Source: AGHT+IGpG8XuiMdhQHx998M4nuRHHQSV8oEXWbnNOwEVkAAPZT5jI968nO8FyYA0KuqxF51745Q7Nw==
X-Received: by 2002:ad4:5bc4:0:b0:6b2:b32c:b89b with SMTP id 6a1803df08f44-6b531ff06cfmr94335136d6.9.1719250764282;
        Mon, 24 Jun 2024 10:39:24 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b52b16e9basm27452866d6.6.2024.06.24.10.39.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 10:39:23 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4405dffca81so12861cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 10:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfgwlM6j4pCTsf+qOEUfrrJfQh/O1qbyjHp/cBuGM8Gd5m3gAYahFKW9yA1Gie/g+/Gycawqzq+Dtz0OgkRYdzfT6Nv5fv7I8sx80NCQ==
X-Received: by 2002:a05:622a:4b18:b0:444:e11d:709a with SMTP id
 d75a77b69052e-444f2520e93mr65771cf.20.1719250762638; Mon, 24 Jun 2024
 10:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624133135.7445-1-johan+linaro@kernel.org> <20240624133135.7445-2-johan+linaro@kernel.org>
In-Reply-To: <20240624133135.7445-2-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jun 2024 10:39:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZXnnbwTNc6dSqZvyCUc0=Wjg9mvBYsA1FJK3xR6bDEg@mail.gmail.com>
Message-ID: <CAD=FV=VZXnnbwTNc6dSqZvyCUc0=Wjg9mvBYsA1FJK3xR6bDEg@mail.gmail.com>
Subject: Re: [PATCH 1/3] serial: qcom-geni: fix hard lockup on buffer flush
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 24, 2024 at 6:31=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The Qualcomm GENI serial driver does not handle buffer flushing and used
> to print garbage characters when the circular buffer was cleared. Since
> commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo") this
> instead results in a lockup due to qcom_geni_serial_send_chunk_fifo()
> spinning indefinitely in the interrupt handler.
>
> This is easily triggered by interrupting a command such as dmesg in a
> serial console but can also happen when stopping a serial getty on
> reboot.
>
> Fix the immediate issue by printing NUL characters until the current TX
> command has been completed.
>
> Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I don't love this, though it's better than a hard lockup. I will note
that it doesn't exactly restore the old behavior which would have
(most likely) continued to output data that had previously been in the
FIFO but that had been cancelled.

...actually, if we're looking for a short term fix that mimics the old
behavior more closely, what would you think about having a
driver-local buffer that we fill when we kick off the transfer. Then
the data can't go away from underneath us. It's an extra copy, but
it's just a memory-to-memory copy which is much faster than the MMIO
copy we'll eventually need to do anyway... This local buffer would
essentially act as a larger FIFO.

You could choose the local buffer size to balance being able to cancel
quickly vs. using the FIFO efficiently.

-Doug

