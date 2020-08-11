Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6165D2419EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 12:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgHKKu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 06:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbgHKKu1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 06:50:27 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEB0C06174A;
        Tue, 11 Aug 2020 03:50:26 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b11so6395363lfe.10;
        Tue, 11 Aug 2020 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=itXXXyW5i1H7kJa+q7FRrhS32KPXcWAeeqv3XPQhNJo=;
        b=It7IO5oPi05wwwGQhoKst5i0BiFfurtyCO+dkAQ7DZaG2EZuQLZjEvLD+NwLvyyv4i
         wISREV9XWj5I0XEa3TNPTLwpwScKy0cTveIaRzGFOqxKf6YsUM2DNjyqZbTBHzCkrD0L
         ONzGb/lus8eMLtKDc8yWbNJhxjd7vBmvdxFooycc7wlLgqaU2p6tKhv15lRRNM/LCpMR
         /0d9k+WAK0hbOT7RAM8P9+fSkL6uJ6LdlH8OLNe3/ia0T7R7ZuzNkmvpPTHm22gai47j
         CEGeJUW1Pd21quHX9wmbVP9g4L2NaX7nxfN/9mwtACqmHuGTsBszoGtfqW75p7NhZ3t3
         8DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=itXXXyW5i1H7kJa+q7FRrhS32KPXcWAeeqv3XPQhNJo=;
        b=cIIicv6S8JSHss0aRYlRgL4iJ0a/uEQ/vh23I3v5bSvizrtcTzhOd1oelnux9n2SWr
         sFwQFcpyEQyl08dVzwexT9/40A801CHXewJ3ao9izIWoaHDQ16XMirApmEYr8zVkz2jT
         sdfS7ZfP7q2cUzU9C7081OK0ctB9SREJATKji3Gn3pPld+eTok4L+wc70EzhJLOiodvB
         ZM74PldUEcJ3G5v7AT7GH9tomRLjvQz6iavxhkE1WTqdo+O2G7sHg8ggeBIs3BwwVjIM
         z6ZOOUfs/SNJzt29i7CEIoVVu5jigyVtH1z0gxH3XkKEn87MIgY13pdC/fCF9ojzBLeO
         lz9w==
X-Gm-Message-State: AOAM531KnTQK1w3P77TmeAkyUZJOJj2FSIU1B0PeBgkvOP0zeJW5UHo/
        wjR0dTWTf1ki7WQp+FeGcNg=
X-Google-Smtp-Source: ABdhPJzBQkgcMck8wo0i1wUSYyiTkVCmJeEjNsemCRe808B9HyYMG2Phjl8ePTDM2XdHogFpyzVI1w==
X-Received: by 2002:a19:102:: with SMTP id 2mr2940050lfb.54.1597143025007;
        Tue, 11 Aug 2020 03:50:25 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id u6sm10006959ljg.105.2020.08.11.03.50.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 03:50:23 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Paras Sharma <parashar@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paras Sharma <parashar@codeaurora.org>
Subject: Re: [PATCH V2] serial: qcom_geni_serial: To correct QUP Version detection logic
In-Reply-To: <1597131794-1076-1-git-send-email-parashar@codeaurora.org>
References: <1597131794-1076-1-git-send-email-parashar@codeaurora.org>
Date:   Tue, 11 Aug 2020 13:50:19 +0300
Message-ID: <871rkdpic4.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Paras Sharma <parashar@codeaurora.org> writes:
> The current implementation reduces the sampling rate by half
> if qup HW version greater is than 2.5 by checking if the geni
                    ^^^^^^^^^^^^^^^
                    is greater than

could, possibly, be fixed while applying.

> SE major version is greater than 2 and geni SE minor version
> is greater than 5.
>
> This implementation fails when the version is 3 or greater.
>
> Hence by adding the another check for geni SE major version,
> this problem can be solved.
>
> Signed-off-by: Paras Sharma <parashar@codeaurora.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 3aa29d2..a9f92d8 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -995,7 +995,8 @@ static void qcom_geni_serial_set_termios(struct uart_=
port *uport,
>  	sampling_rate =3D UART_OVERSAMPLING;
>  	/* Sampling rate is halved for IP versions >=3D 2.5 */
>  	ver =3D geni_se_get_qup_hw_version(&port->se);
> -	if (GENI_SE_VERSION_MAJOR(ver) >=3D 2 && GENI_SE_VERSION_MINOR(ver) >=
=3D 5)
> +	if ((GENI_SE_VERSION_MAJOR(ver) >=3D 2 && GENI_SE_VERSION_MINOR(ver) >=
=3D 5)
> +		|| GENI_SE_VERSION_MAJOR(ver) >=3D 3)

it looks like having a single GENI_SE_VERSION() that returns MAJOR and
MINOR without STEP would look better here. Then you could use:

	if (GENI_SE_VERSION(ver) >=3D 0x20050000)

and it would work for any future version. Not a strong opinion, though

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8yd+sACgkQzL64meEa
mQZtng/+ME8/MzGicCyBG2nyh/gkrqd24TNxjGISKjkK1uQsWLFOC6SnVdop1Dk9
o20Wyp1hqcLebKQ5QKXagqYc7Wc8w9NxyeWeaqiJ+QX23NEFyQ+EKrgG+KzcyhuF
90UNVhDlimcHlpUzNJESKgh4bHljYEJIrz0nODIUA5ipuvCfHL1SSEoZrFOBiKu6
WJSAsELXv3DcKICvND3JqW8kNXkX/eAbwmfEoWuytdd8KnNmSv0tCvFGN2GNXpI4
mrFrbtWBfBR3DYsP38dVT9VFMEhvUadj1bBaIoUW+wLR3Vmqc+tsq/Kg/C+vKrkN
6ynWj6cvkmZANY3x9i4tTLc3eZN+I7ic5BQFR2ecMP9B9jVdiS+Y2sMgnoIGPpKN
EAJtOZXAdmc8eLMYKPabvQTcdlLZ0d3I1/SCI7vLbmnOW0Mlq4KPfQPwjAPjZ89C
CeeCDQvTHqc4kB3um9216CGT2gXEgZ7VpRQ96FI37o/uqSnw3HGc1fND3XmAwKeQ
U8cfrdozff1KXLZTHQN3Oei7N/dNURMBbqwwSdpz9j6ryI0ONDeBmAesx/waOjhK
UpCk9OgJZ5QwmAN/ycA4F+3703rWZw8rawFNrfBNAFZ3U1wS4QY52lSfr2M5TF/0
bjhkNxaxkLW+l+WMNzC+dTqNLlmfmFDQ+NaRyp/wUWuUP5VDseA=
=wvqF
-----END PGP SIGNATURE-----
--=-=-=--
