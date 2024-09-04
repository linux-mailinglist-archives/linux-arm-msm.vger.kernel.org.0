Return-Path: <linux-arm-msm+bounces-30805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 504CA96C9C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4314A1C2442B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4512A15B108;
	Wed,  4 Sep 2024 21:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RdHu6gXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7E014D290
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486676; cv=none; b=J75TDzbiECQ+3oCftngj5rGh1mZGQMy6xPklQIe/CKvjx85BAMVtF0Ffw0NhuvdKJtwsUwgFN2+nKAO3Z+LhNUioVcin8PLwIvt4lfddFAyuppj3HlyPKnaiFU6sD+oc8yXrRbuuqx2vtEqcA9TyGiAOSlxc+IAVndXe+2+NMWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486676; c=relaxed/simple;
	bh=HVv+636NymRBVBT+daSXGh0y1/tqpXcJ5SYAnkYRAJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUGkwQj7YJuL8DoAw81vcTjJ1HSMMbu7sr0USjVXQ7mlhWQrjmxBTFSXvjC1QYnxHlga6xSzUn4VVzzsVfaBqKsBOmceDO/4zwdh2T0ogkFxGYVbl9IZiHm+bDP5JSWJivs6BzNR42A9OkMn33SrdDImrc+NNaHMvHyYS6CSAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RdHu6gXl; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e1d06c728b8so185622276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725486672; x=1726091472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgfZmpFq3mNdiXjiUQCUbunCBLyKZQQZN/adM34E+5k=;
        b=RdHu6gXlFffpOSvHrAiUjDvXr+saffs7ATMi88dW2ZGknlK4R1QxfUlaozkA6f6qjw
         RxhFwmUxm+YbLm3w/k3QXzRxpvniSpYSsmqzfIATdVk9BxCZpGEkkz+0LUXoyBBWBDcm
         oMX0ORhcSo+0/6SHTPzp9PkrgHsGBwW/BsGMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486672; x=1726091472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgfZmpFq3mNdiXjiUQCUbunCBLyKZQQZN/adM34E+5k=;
        b=Xxhs6Ltj6GQluIxlFEareAcgEf8K5/G8H3JUj4XaEjpIjapH7QeJEWN0i68MHNA0KO
         m0i2xvj31uM7mLXuoGILcfxfin75AKz8BquhdaoIw09Lx5IQkolGVmUNal0EuE8VxGFo
         g13e9npSw3w8LyWv9J99jlgSZ0U9BWoucntv2hgScr6CT8M7ANqTuQShiwYMbfeBNOc4
         uUe5Aq0WvoWwl7MhcK/SSP03xPBJAI2TLR89UWrbPC6M5LnCGKGNq9dntepmU/Erdtld
         jSxHtaqLxbaUa77Jopq0TGDb1i4RC0wtqjISOHk+TxnpeGyoG7/LRdBrZuq8HmTMrcka
         tQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2qaCk3aFVrnKVHzgzL1vf7q3EvTcXe941fydMqJxQsrcbscW3WXLm4RfknYgM1Z3KJPpZHxwijyKYI1YL@vger.kernel.org
X-Gm-Message-State: AOJu0YwMs31nTVSfRJVtkRCXQf//yd4d/dRoBWkiy//Belp+hNL2ur0i
	OTqcH/ZLchADa3XzJMagDKgR6Ura+RgLoX4QF7Q9vz5tf9BI24wb85jDjtsZHOXej1hMevcls4k
	=
X-Google-Smtp-Source: AGHT+IG3+ucizllhKgh/85anBgEHsLx5p2oRFmYWKD6X8UbOz0nbuAHgIBsL+thCy7TFgkkJl26iNg==
X-Received: by 2002:a05:6902:2609:b0:e1c:f6e4:aa1d with SMTP id 3f1490d57ef6-e1cf6e4c10dmr7569653276.16.1725486672474;
        Wed, 04 Sep 2024 14:51:12 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1cefe6afefsm1065551276.62.2024.09.04.14.51.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 14:51:11 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e164caa76e4so165543276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJIupLiaHgof6N1bKHHpO91xW9U30Ui8EBbxvLULBP2YNbvfAf29OAAGUEG8pnZtkg/VDIro8/QL1XfZYD@vger.kernel.org
X-Received: by 2002:a05:6902:1b11:b0:e1d:13a3:87af with SMTP id
 3f1490d57ef6-e1d13a3892emr2954820276.29.1725486670922; Wed, 04 Sep 2024
 14:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902152451.862-1-johan+linaro@kernel.org> <20240902152451.862-2-johan+linaro@kernel.org>
In-Reply-To: <20240902152451.862-2-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 14:50:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WDx69BqK2MmhOMfKdEUtExo1wWFMY_n3edQhSF7RoWzg@mail.gmail.com>
Message-ID: <CAD=FV=WDx69BqK2MmhOMfKdEUtExo1wWFMY_n3edQhSF7RoWzg@mail.gmail.com>
Subject: Re: [PATCH 1/8] serial: qcom-geni: fix fifo polling timeout
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 2, 2024 at 8:26=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The qcom_geni_serial_poll_bit() can be used to wait for events like
> command completion and is supposed to wait for the time it takes to
> clear a full fifo before timing out.
>
> As noted by Doug, the current implementation does not account for start,
> stop and parity bits when determining the timeout. The helper also does
> not currently account for the shift register and the two-word
> intermediate transfer register.
>
> Instead of determining the fifo timeout on every call, store the timeout
> when updating it in set_termios() and wait for up to 19/16 the time it
> takes to clear the 16 word fifo to account for the shift and
> intermediate registers. Note that serial core has already added a 20 ms
> margin to the fifo timeout.
>
> Also note that the current uart_fifo_timeout() interface does
> unnecessary calculations on every call and also did not exists in
> earlier kernels so only store its result once. This also facilitates
> backports as earlier kernels can derive the timeout from uport->timeout,
> which has since been removed.
>
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Cc: stable@vger.kernel.org      # 4.17
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 69a632fefc41..e1926124339d 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -124,7 +124,7 @@ struct qcom_geni_serial_port {
>         dma_addr_t tx_dma_addr;
>         dma_addr_t rx_dma_addr;
>         bool setup;
> -       unsigned int baud;
> +       unsigned long fifo_timeout_us;
>         unsigned long clk_rate;
>         void *rx_buf;
>         u32 loopback;
> @@ -270,22 +270,21 @@ static bool qcom_geni_serial_poll_bit(struct uart_p=
ort *uport,
>  {
>         u32 reg;
>         struct qcom_geni_serial_port *port;
> -       unsigned int baud;
> -       unsigned int fifo_bits;
>         unsigned long timeout_us =3D 20000;
>         struct qcom_geni_private_data *private_data =3D uport->private_da=
ta;
>
>         if (private_data->drv) {
>                 port =3D to_dev_port(uport);
> -               baud =3D port->baud;
> -               if (!baud)
> -                       baud =3D 115200;
> -               fifo_bits =3D port->tx_fifo_depth * port->tx_fifo_width;
> +
>                 /*
> -                * Total polling iterations based on FIFO worth of bytes =
to be
> -                * sent at current baud. Add a little fluff to the wait.
> +                * Wait up to 19/16 the time it would take to clear a ful=
l
> +                * FIFO, which accounts for the three words in the shift =
and
> +                * intermediate registers.
> +                *
> +                * Note that fifo_timeout_us already has a 20 ms margin.
>                  */
> -               timeout_us =3D ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> +               if (port->fifo_timeout_us)
> +                       timeout_us =3D 19 * port->fifo_timeout_us / 16;

It made me giggle a bit that part of the justification for caching
"fifo_timeout_us" was to avoid calculations each time through the
function. ...but then the code does the "19/16" math here instead of
just including it in the cache. ;-) ;-) ;-)

That being said, I'm not really a fan of the "19 / 16" anyway. The 16
value is calculated elsewhere in the code as:

port->tx_fifo_depth =3D geni_se_get_tx_fifo_depth(&port->se);
port->tx_fifo_width =3D geni_se_get_tx_fifo_width(&port->se);
port->rx_fifo_depth =3D geni_se_get_rx_fifo_depth(&port->se);
uport->fifosize =3D
  (port->tx_fifo_depth * port->tx_fifo_width) / BITS_PER_BYTE;

...and here you're just hardcoding it to 16. Then there's also the
fact that the "19 / 16" will also multiply the 20 ms "slop" added by
uart_fifo_timeout() which doesn't seem ideal.

How about this: we just change "uport->fifosize" to account for the 3
extra words? So it can be:

((port->tx_fifo_depth + 3) * port->tx_fifo_width) / BITS_PER_BYTE;

...then the cache will be correct and everything will work out. What
do you think?

-Doug

