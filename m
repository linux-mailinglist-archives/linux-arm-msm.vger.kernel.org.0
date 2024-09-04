Return-Path: <linux-arm-msm+bounces-30807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7FD96C9CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142C4289394
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B66517623F;
	Wed,  4 Sep 2024 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C8B4Pu7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972001741C0
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486696; cv=none; b=Y1KH3YF4HrHZ21dEHcTdz3dYkqbPjTBglj5PNcu3+UDKgrkM0e/kZGZet37zMnnfA2S0eBwZ7NNjpMM3OKWYkb1l5CF8Uj4HHVCmkwm75q+6CBX2//iiqe56u+Bj9FU8RrnMwWQldp8xPbw3lEXv5eF2r7jthoMmM4cMRYJ897I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486696; c=relaxed/simple;
	bh=52OavEbDbnnXzGVYj1cdimeK3fNcZ3tbnsTSFU90N5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvH6UCD564eUfSvTVJVPPDCWhHaClKoc9Ra9D3zSnigLHacIsh15uHh8uDoPpP2tq4nfT588+f31qKv3fjlyR+L3o1tpR2M7V6udTwVFYFiWN5pOOJBzMQRzz7SzstvuBZXvgYFkdqH9TM9sxQGX6flGq2DIdVb7XZAhxsIVAWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C8B4Pu7m; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3df687c6623so44267b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725486693; x=1726091493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEVB0OaxtEANZF8G4JgUXQ7IBpjIjKgmyEACvOZxq44=;
        b=C8B4Pu7m+yGIBipLecwld/aykc2j6fT05QvwJUKZtzO/gjHu4lqFiM8aCcNcrr3Ayl
         hTAu+A/hSofKApJOjdK5zRnjzBm/UfVzSeNBHyxXnVlPGuLxJ/tPstfRycF8mo3/gYjF
         Rz+gkJVntXToufnGfBlMIAd9F0iiMKm9BFflo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486693; x=1726091493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEVB0OaxtEANZF8G4JgUXQ7IBpjIjKgmyEACvOZxq44=;
        b=J38vjecSlHupEWghnLhQ6/DSyo1eU/jBFJ744zvKHPemwi8pbVkd1P0rzhtPivsLHb
         cEsuSueur2XbJYkctVl+yzzqhOZeVY11ZRbwwXb13Fg3eNWHcZOWTRWCCZX1wF7d7qVq
         EoQJqX8fAPCyu1zu+A0NzR5R4Kc7P3Wa20yc7sXLB9Ap4cGiSn8hfhT9IRLTYurwvCVg
         Fs0wHJSn/hSHcP3ofUU2Vq6PZdqDoLxQrzU8EUmpWtM4/fbTV52OJG/lwmLiztaEY9kA
         F/lQYVvXx5t8FRiJFC+oXh3EojUXPzAP70ROfeqbfnRUNiBV/U8SIeZjTRWzmRz6MQWT
         +HFw==
X-Forwarded-Encrypted: i=1; AJvYcCVDIz1I8ZkVEKMuoLFtr7NSyZU9UG1R97u6Nri6QSZmzXZRPEs2aGNhLBWJzBmCq3dniPUUrl3hbD1jXDZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YxC78QISD4B2GDtYTRa6ihHwrHHo3F5glCG+oTEcgxRFDtmkXwn
	aWgNjcoLdD+EZ8e8RCZ4Yqsb2bpJICOua7KubNeCO83xes8cgkXsrwuP/D+ZG+opNW788JUd0Do
	=
X-Google-Smtp-Source: AGHT+IGl6shKHj+T36S5JzfGXriwYiOKa6kODpNQ9si5iegTARLrP1sK7GYaw5o8H7LOfs0ojRpIlQ==
X-Received: by 2002:a05:6808:1385:b0:3d9:3f72:715e with SMTP id 5614622812f47-3df05c461b9mr27440344b6e.10.1725486692877;
        Wed, 04 Sep 2024 14:51:32 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3df11865a3dsm2990908b6e.45.2024.09.04.14.51.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 14:51:32 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7091558067eso66909a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEqtKjd4ALZ1FZlndOqqAZLCbYkDJveURowM5TTzXACPpPsgjVYa7w51H/wNwKmjvJOzH7IlXooaOCppEL@vger.kernel.org
X-Received: by 2002:a05:6830:6d08:b0:70a:988a:b5fd with SMTP id
 46e09a7af769-70f5c406907mr29012888a34.24.1725486691455; Wed, 04 Sep 2024
 14:51:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902152451.862-1-johan+linaro@kernel.org> <20240902152451.862-7-johan+linaro@kernel.org>
In-Reply-To: <20240902152451.862-7-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 14:51:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnpPnSToWV3f2Z-DWm2-1rdgYmDZeicGGRQD-_YjS2Bw@mail.gmail.com>
Message-ID: <CAD=FV=XnpPnSToWV3f2Z-DWm2-1rdgYmDZeicGGRQD-_YjS2Bw@mail.gmail.com>
Subject: Re: [PATCH 6/8] serial: qcom-geni: fix console corruption
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
> +static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
> +{
> +       struct qcom_geni_serial_port *port =3D to_dev_port(uport);
> +
> +       if (!qcom_geni_serial_main_active(uport))
> +               return;

It seems like all callers already do the check and only ever call you
if the port is active. Do you really need to re-check?


> @@ -308,6 +311,17 @@ static bool qcom_geni_serial_poll_bit(struct uart_po=
rt *uport,
>         return qcom_geni_serial_poll_bitfield(uport, offset, field, set ?=
 field : 0);
>  }
>
> +static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
> +{
> +       struct qcom_geni_serial_port *port =3D to_dev_port(uport);
> +
> +       if (!qcom_geni_serial_main_active(uport))
> +               return;
> +
> +       qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GP_LEN=
GTH,
> +                       port->tx_queued);

nit: indent "port->tx_queued" to match open parenthesis?

...also: as the kernel test robot reported, w/ certain CONFIGs this is
defined / not used.

Aside from the nit / robot issue, this solution looks reasonable to
me. It's been long enough that I've already paged out much of the past
digging I did into this driver, but this seems like it should work.
Feel free to add my Reviewed-by when the robot issue is fixed.



-Doug

