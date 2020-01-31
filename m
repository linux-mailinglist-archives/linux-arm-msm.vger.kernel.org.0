Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E4F14ED37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgAaN0I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:26:08 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39755 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgAaN0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:26:08 -0500
Received: by mail-lj1-f194.google.com with SMTP id o15so1543740ljg.6;
        Fri, 31 Jan 2020 05:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=/c35QZGHP3wzzfzd1x43843LuPeL6Rq45DIdrlBE0UY=;
        b=T4xSWxnjzqX2zDS6cCDbw6N2RoWYe98ru0BPySY459U+cLF+D9giJ3Zpxynhzwtklw
         pUzktittY81x8Opy7kDWJJQo5aLueGP54C6qhI+NHtGJAJsIStOU72QeMyDHsSwQq/Or
         sam9rYaci06x5JamRVye0+sd9y+lCQWgzFrRdQnEhVako++K7NAVS6HwTILcHNRI+HOo
         VdBIGa3jYCks0GPGUd83QsBFt+XWGDbd0deEQe41AeRXuFN0k7Id3PwkIddyTS2l7m9f
         8JhJDAhefkSBm31P85wfEU6vUtVN2hD6vF+O9TUm9x9R9x74wsjOi2BHAFMYAGLC7N4u
         reHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=/c35QZGHP3wzzfzd1x43843LuPeL6Rq45DIdrlBE0UY=;
        b=LYV/Ak9ecq6drsNVFDep88NB3KMfqYhFgqOsRPkFtGerE4IOcDYu3Amu/Oj5EnsNvy
         ySzEQnG2SvK6JYHoZMuEZXqX8MXhHLozYBdXXRFXmzj/x+BbwNoEJoUHQyVsvqiG2cY6
         6Sv/Gi63JS3j/drFQ1WO6DvksqKkNRDuUJPHI0BaH1uW63uzK4WLReOt7fDuQzd240AY
         7JNt4skCZbTcWNhFA2zJwcLYw4Q6O5ga172dvhDYigGF1cooA+l7Dolo9IQZVOTnmYQB
         RBcFNOdF298STbioixBbfWUhaC4NBNig/6e7X+OnLQFGMkZiXKDNIbYrL+QVZjtUopox
         KFJw==
X-Gm-Message-State: APjAAAXtSur+ufUk5yd16FVp/+p398JOw6/0+3msDoGFmwm2lvFNenfD
        8UwoRQGG0AyfaEMFha6LxH4=
X-Google-Smtp-Source: APXvYqw90RofYlxPiJVaN+aei/fYQnEBbO7MgOQGhH7P77f9LVAoMdiw8xCvvvGQofPiEQv/1/CitA==
X-Received: by 2002:a2e:5304:: with SMTP id h4mr5953525ljb.75.1580477166093;
        Fri, 31 Jan 2020 05:26:06 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id t21sm4568925ljh.14.2020.01.31.05.26.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 05:26:05 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 09/19] usb: dwc3: qcom: Override VBUS when using gpio_usb_connector
In-Reply-To: <20200122185610.131930-10-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org> <20200122185610.131930-10-bryan.odonoghue@linaro.org>
Date:   Fri, 31 Jan 2020 15:26:00 +0200
Message-ID: <87tv4b7o5z.fsf@kernel.org>
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

Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:

> Using the gpio_usb_connector driver also means that we are not supplying
> VBUS via the SoC but by an external PMIC directly.
>
> This patch searches for a gpio_usb_connector as a child node of the core
> DWC3 block and if found switches on the VBUS over-ride, leaving it up to
> the role-switching code in gpio-usb-connector to switch off and on VBUS.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

assuming it'll go with the rest of the series:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40KugACgkQzL64meEa
mQbYqw/7Bn/YEhhlrjS0YkABiFc7jMoQ1ZBEdVYhumTL+cT9lRX/km55RWMG482d
FFHJPEjuZsbl2VeBe93sKDGDwk7cQw+Eo1MODT4weYuZ8SSgbEJfehXZF0+QetqY
TTC6ry7PKj4TSLizmUmT7nrkWulBJzn1Wa8F72XnEsRfr60fTMj9E6wwfd3qpc+m
C1Ui5p0MRlTNiQyEaz04Upw+W8Gwzg1Q5nWrbr5/YT+MwQTxLtpCiOWfwRM3E88O
MrGpJnY4q4V/kYANenNfo8LsaORfszmEpktvpm5dTBu1AyIPH/keDh600/3tABXq
3ScLhi9qSt/ueJ4JXUyl1VQdhCvqn31ZVw1d6z/khV436eHy5QSeHuChzbO4r822
b2BjacWzYJBv8cPwWzo61MldMFmGmAJICO8j8YtXrjQJmvxcXQb0/uO9ez/TScz2
grZWvs/CyXEgqzb8aHCz0GNgwriksnpCC7XWAe4phiVdEGsvfdAvQhzZ2xuG46/L
flhgGQaHaHSL9ganqsO/VX9piC75i181K76NlF21iv69UKTOFkoKlj8o1pjMqXUw
8kwDycZ+kRUUx+qCEN8VuK67Ow6yBK0LiSKDeqCP+lRWMREAY/dST7QEn83AhOjA
0VLYDVj0F1D6bx261TiaCC7AwmnSfL8FzhHoxexubdf3gyckpB8=
=kQ6p
-----END PGP SIGNATURE-----
--=-=-=--
