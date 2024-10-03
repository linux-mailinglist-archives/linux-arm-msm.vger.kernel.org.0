Return-Path: <linux-arm-msm+bounces-33048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D5898F7E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 22:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B5192830DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 20:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAE51BD01F;
	Thu,  3 Oct 2024 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gdr/54s0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0223145B3E
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727986027; cv=none; b=r+vt+CdqH71ni2YnqkV8NiVPtSbK1RbU99nuxQRNI7dpEIp1WjHYm8dIuCyxq+kGBOtRN71WNa2yN1JNlmVmtstZCHk2nWrRgPO23cZDY2WhDzUSdvlSD9lfo6Cs1crGWjBISb5LChZ/RNFkkpCe9bA5d4Qb7r4rrgpQsDx72eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727986027; c=relaxed/simple;
	bh=TnhcYpa/NRBNowU8LjRQnpY1dIEz8TtqcanEbYw8s+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZq2XKrIG6Jk90Gxi4aX2M4XOty1Yg1oT0Q5doNmU8pG4e5PgYTuyunQOXI9p3ux2X2bHKObX8r8xv5IeCRGPcZ9sxo01FI0TlbtMmAROQvkYRoUP4J2Yj19b3nK9tzI210lh81RG1TKOIerXyt78bfV2HKybBb96hiQtWOYc7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gdr/54s0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5399041167cso2386154e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727986023; x=1728590823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKF05LoiruBsD6AHIRVSBunf1dIpsE0purL42isX/Q4=;
        b=gdr/54s0HGNH2PUy0Xg8VknnNSfMbjyHBZwPZcVu/DwikKlOSRCHIkI7bC3SXiO1rP
         cX4rvXHMGSyfySUokmcI9III3GzDrGlUA4FOMCKu995I+NAC+fbHtmuFWRpgZrRCaqUg
         1TMGwJpVdoSrhLmF/9YUvaIjehb9ORUshs9BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727986023; x=1728590823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKF05LoiruBsD6AHIRVSBunf1dIpsE0purL42isX/Q4=;
        b=Ht7DtZH6HKRLdYp16M97pxaH5X1mc1Rw/Vr7viGlvzgTxLsk+Rd6aH/0hVl+c/EBej
         rAPnOGeXRa6c6aD/xJ0MDWCN71Uz++yL30byyuFeq6ipMsPJg9o5COxPevtFXF/iYuAK
         qFUSur7LQjxr9ZkucF7E7vi4TVVq2zpBFSZtwkf6fKXq0tH5D9Wya/pAZ5kENwGuUo0G
         hPVsxjoD6i8U98lEAYfzlsLyoUJch0HcefD+WcutJ/JDuntSiQgw+X8ZqOcKiBjWP7ZH
         X6M4c9sKuCTQhFXkfGjeYD5EyayVLOyEmg2hI8oBjvpkUUOP4pPQBNlDwUy0MRQlczIr
         mpBw==
X-Forwarded-Encrypted: i=1; AJvYcCVy1H9XP0M7ZHnM6k5huCI2rVg+tLri1o+VIxDiDZBoTyjizK6GKbLPr5aDD4YKupZT5rKGWLRTx127bsjH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtceu2GnNkvVm1NfPILfH60Oro+/i7mQEe5egVQkdJ+89J3Vux
	NrD6GLX0MIBApOzZU7Nqs5EPOrHf4TgPrwUdVXBmUtECywUUxlWYDK0crkOLL/yHTy+Yu9Mv1r8
	NRlGW
X-Google-Smtp-Source: AGHT+IHmF1tO3IDbp6BgBBprePc4aQHY5NS9HQeq/VCNIygEVT5bVX16ga8WssOdRyPWvoSWSmkOpw==
X-Received: by 2002:a05:6512:3192:b0:533:483f:9562 with SMTP id 2adb3069b0e04-539ab9cf3c3mr387303e87.42.1727986023346;
        Thu, 03 Oct 2024 13:07:03 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82a38c7sm250869e87.227.2024.10.03.13.06.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 13:06:59 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398b589032so2278630e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 13:06:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFJx/zCeFwc9ronlXVdLoADhAAOginH8E+dXmKx7AbEMQy0Za31esanaqr+dtfcemeS1TZ4/zRT6JmeAF3@vger.kernel.org
X-Received: by 2002:a05:6512:3d07:b0:52e:fa5f:b6a7 with SMTP id
 2adb3069b0e04-539ab8659c5mr452850e87.13.1727986019089; Thu, 03 Oct 2024
 13:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001125033.10625-1-johan+linaro@kernel.org> <20241001125033.10625-7-johan+linaro@kernel.org>
In-Reply-To: <20241001125033.10625-7-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2024 13:06:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9fEQ-g_LWK18SfZq4ZmFN_QbrBCwKRx3BTc0i-UXEcA@mail.gmail.com>
Message-ID: <CAD=FV=W9fEQ-g_LWK18SfZq4ZmFN_QbrBCwKRx3BTc0i-UXEcA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] serial: qcom-geni: drop flip buffer WARN()
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 1, 2024 at 5:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Drop the unnecessary WARN() in case the TTY buffers are ever full in
> favour of a rate limited dev_err() which doesn't kill the machine when
> panic_on_warn is set.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 5b6c5388efee..8bc4b240bf59 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -570,9 +570,8 @@ static void handle_rx_uart(struct uart_port *uport, u=
32 bytes, bool drop)
>
>         ret =3D tty_insert_flip_string(tport, port->rx_buf, bytes);
>         if (ret !=3D bytes) {
> -               dev_err(uport->dev, "%s:Unable to push data ret %d_bytes =
%d\n",
> -                               __func__, ret, bytes);
> -               WARN_ON_ONCE(1);
> +               dev_err_ratelimited(uport->dev, "failed to push data (%d =
< %u)\n",
> +                               ret, bytes);

Not that it really matters, but since you're fixing the type of
"bytes" to %u you probably should fix "ret" to %u too, which means
changing the type of it? Officially tty_insert_flip_string returns the
(unsigned) size_t.

As a nit, I'd also say that your error message shouldn't assert "<"
unless you change your "if" test to "<". It seems safer to use !=3D so
IMO the printout should also say "!=3D".

I'd hope you're not hitting this error a lot because it means you're
dropping bytes, but getting rid of the WARN_ON and changing to
ratelimited makes sense to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

