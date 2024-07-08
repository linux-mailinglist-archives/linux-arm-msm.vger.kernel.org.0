Return-Path: <linux-arm-msm+bounces-25538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7C92ACD3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 02:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FFEE1F21D2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 00:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E211514F8;
	Tue,  9 Jul 2024 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N0AlmxtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E6779DC5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483216; cv=none; b=TjED8KKm/tlm+svDbiCndFcteuAEDfLjw4XVfcz0c4VAf4hZF0Net8j75KSNI4WhYFM5iNqrx10OLNHwvC7Zf/jLp1eAv97K8iHvc4ulQ6QAtvgXo5R6EY6IwEJexqERQ29apH9lCN+twUlMOheDszlygaM7cTwrXDiDKXU31m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483216; c=relaxed/simple;
	bh=/QOqCulkZsfJOvKr8tAyY6TDc5VsuMJQgVKvIy7i6Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOn5BiOQOeZQKYKLnKDh71xuDR9DWoSPM7tqi8B/ZB/CVe63jQ1NGBo+eg4KdFpHcMbC1gqw6wjKx9pON2JwrlWT/+wxsjHLPPy0J71UxM96f17yU+CVKEnEYFHX6jIiYqYIX1klF8UHq23LmtCOqqC/Vl2Wb2BFQKwsZL0LfQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N0AlmxtG; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-79f16cad2a7so53980285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 17:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720483212; x=1721088012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osmmEbE4YrUJJsgw8B/lNsRFY328cYQyEWy+PHmk7lU=;
        b=N0AlmxtGWogx00M0ebnvDMXvNXVOHpbM+JeaXuuGff3UujfIEnv+9HSLzz3pSVrIJ4
         /Sau7eKa3zFTzlwbNuOzL9ZVcp/jViZmsIwbR85VgcFQ0/f6zXnrH8BlmofulgqTnB7z
         cn7AROibVXQm6cHNRA6O7oMdKZNZ2il9bMm5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720483212; x=1721088012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osmmEbE4YrUJJsgw8B/lNsRFY328cYQyEWy+PHmk7lU=;
        b=Dx095CLCn8HLC2OlPVwY8p/6QcUvoR6kSaqlJiFhgXx73qjak/uYyLSyagd+Bv/S0w
         fcgTrW+CKwAJbdEQQnQyyGwx4ARvrpIpOew4fkmF13nZEggKvrXHEqlRjtEVyRmq2ej8
         W6juNJQJEh8sxswIpxnUCJFLDITWTV/fyLShDudaCrxRwVfy2W/I/Q9Ept0Q0ukg7DHP
         SQU/x4EvuDL/0mYQ5GX7X1YDUFDjhGxvrMtlPLTEcah6dfKtZc+rJtIm2SXlNEleK/X6
         7c+lBwEGei1Fq0gQAhYbpcXdr0BGG9lMx0nXGv1r+gEqVjr2hPlHQPuitiQpd9gauF5D
         1y2w==
X-Forwarded-Encrypted: i=1; AJvYcCUmzUS+3NGq4FfRxd/q3qCGKZLmggs+z6g+gYwC21cVuWpDsXz16YwJeNaZZ6DmubgWlyCpwLAlXzSjM9hyUGaFP/PWO6LBSS2irgleKA==
X-Gm-Message-State: AOJu0Ywye773HYGLti9DZvijr8xFKg35+iplr309t7IjelduaKrLWdlm
	ma2weVZThacibThoLHtFwipvEJ4U1s3pufgC3XZKcxOYcsNPBOna8SyK+Jqqf0/l6ZO7Ng0PSTC
	UL1QI
X-Google-Smtp-Source: AGHT+IEaXaEplSjzmEJRQt/KMVj3oAX18ok5pselyDAM/0qJAz6P4C2L/aRv8OVr8MhPtqx/jpoqYg==
X-Received: by 2002:a05:620a:3f97:b0:79f:15ca:b782 with SMTP id af79cd13be357-79f19a6867fmr143600085a.35.1720483212558;
        Mon, 08 Jul 2024 17:00:12 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f1908973dsm40287385a.86.2024.07.08.17.00.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 17:00:12 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-447df43324fso77051cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 17:00:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8jGvkbodGy4JwKY+BAFcUjF9Jb/whXrE38u/dfdAJJiaaKzk5+XC5a0Fyt404AdlrGRK7THDLu82kGhzHYQrGNOLBqAZcOBpaUxRd4Q==
X-Received: by 2002:ac8:74d:0:b0:447:f21e:4d5b with SMTP id
 d75a77b69052e-447fba68a15mr1320821cf.18.1720483210739; Mon, 08 Jul 2024
 17:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704101805.30612-1-johan+linaro@kernel.org> <20240704101805.30612-4-johan+linaro@kernel.org>
In-Reply-To: <20240704101805.30612-4-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 16:59:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHOTQKNNbkWX17o57weP_wTm__MCSGPhFHQ+uG1CD+Bw@mail.gmail.com>
Message-ID: <CAD=FV=VHOTQKNNbkWX17o57weP_wTm__MCSGPhFHQ+uG1CD+Bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] serial: qcom-geni: do not kill the machine on fifo underrun
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 4, 2024 at 3:19=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The Qualcomm GENI serial driver did not handle buffer flushing and used
> to print discarded characters when the circular buffer was cleared.
> Since commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
> this instead resulted in a hard lockup due to
> qcom_geni_serial_send_chunk_fifo() spinning indefinitely in the
> interrupt handler.
>
> The underlying bugs have now been fixed, but make sure to output NUL
> characters instead of killing the machine if a similar driver bug is
> ever reintroduced.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index b2bbd2d79dbb..69a632fefc41 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -878,7 +878,7 @@ static void qcom_geni_serial_send_chunk_fifo(struct u=
art_port *uport,
>                 memset(buf, 0, sizeof(buf));
>                 tx_bytes =3D min(remaining, BYTES_PER_FIFO_WORD);
>
> -               tx_bytes =3D uart_fifo_out(uport, buf, tx_bytes);
> +               uart_fifo_out(uport, buf, tx_bytes);

FWIW I would have rather we output something much more obviously wrong
in this case instead of a NUL byte. Maybe we should fill it with "@"
characters or something? As you said: the driver shouldn't get into
this error condition so it shouldn't matter, but if we have a bug in
the future I'd rather it be an obvious bug instead of a subtle bug.
I'm happy to post a patch or provide a Reviewed-by if you want to post
a patch. Let me know.

-Doug

