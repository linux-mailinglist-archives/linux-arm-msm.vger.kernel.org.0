Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6323714ED25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgAaNWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:22:53 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35099 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728566AbgAaNWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:22:53 -0500
Received: by mail-lf1-f66.google.com with SMTP id z18so4871300lfe.2;
        Fri, 31 Jan 2020 05:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=R/r0MkhJmy8WKxVLMV0Jvzi1Aq0WoGmSqQ5lRPedXO4=;
        b=pIaT0b9Qd+4jkE1fkwMkX4pZO0yQhKJOO71b2et3q1rT1iC/jQjRwWfwU/AXqWwB3p
         ENbCxggJF2BGfFYIpwRDYUm1bGTiWPbvrsaEpYZmpDEQB4zOIFPsxngQ/6H6M2USTVtf
         Vve+M/a+QXj9ZHXDq0iQXpLrsy1bkhIKW91in13kumaND7ifTb2VIjQRfD8vT+Mda02I
         XLQWhJ6v/rI8gZmlPw9/viYAdoUB6EeAn5qw5JLd+WNaoQTLSjKeuz9ULalWUglV8Zba
         f2+8HvwfV/XW0XZEeotpLoBjkKuCZpUYFljUlZm2OiN7ZNtF74No0tJpuoYnHnRgXqne
         Nfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=R/r0MkhJmy8WKxVLMV0Jvzi1Aq0WoGmSqQ5lRPedXO4=;
        b=JHV+bV9El2QOETV5Zrc8Iu1te/4Z1IJpyCthKH6FAF5fVnJi3rCcoSn79CQMm9a9/m
         klFmfsmVYhR18MkNHZsv+vHHhVRAIwqlYba9fpyBHe1RNwukWD3T/pBOZ6OKDXYbbH9h
         CgV9qmKuCGeGvJmn2gesiAmIruMYSftaDEYgYY0WS2Pmx3MlxD++YPh8SJp2FjJjZMnO
         sLIMhyC9li8L95Rze/kHGt1nBSx4AHImXToE0/0UZ/YAgm1bwNQ7pNpOVV7OourpkZb6
         VgfNcuiiTogHuWElmaU3vfH8NoH7H2o1Be/rOrQVkhF/1JwX9HbEnFjmUDFMmf8lSPaH
         dYEw==
X-Gm-Message-State: APjAAAV25EeMAj8sxfL8RhDK7+m2XCO4bLMs1Bu/o7hukL76a9HQWQ7g
        mglGrIeCu8ybWd7Zbu7dJEof31r+MYz/Ng==
X-Google-Smtp-Source: APXvYqzWwcCbOKCFh1HsdRYKRkmzRO5iaW1wDQodZvRcZcxHxE/w0zpfSzIX/lAO18wKHHtdYGphEQ==
X-Received: by 2002:a19:dc14:: with SMTP id t20mr5415708lfg.47.1580476970640;
        Fri, 31 Jan 2020 05:22:50 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id d22sm4593737lfi.49.2020.01.31.05.22.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 05:22:49 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector description
In-Reply-To: <20200122185610.131930-7-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org> <20200122185610.131930-7-bryan.odonoghue@linaro.org>
Date:   Fri, 31 Jan 2020 15:22:44 +0200
Message-ID: <87zhe37obf.fsf@kernel.org>
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

> A USB connector should be a child node of the USB controller
> connector/usb-connector.txt. This patch adds a property
> "gpio_usb_connector" which declares a connector child device. Code in the
> DWC3 driver will then
>
> - Search for "gpio_usb_controller"
> - Do an of_platform_populate() if found
>
> This will have the effect of making the declared node a child of the USB
> controller and will make sure that USB role-switch events detected with t=
he
> gpio_usb_controller driver propagate into the DWC3 controller code
> appropriately.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I'm assuming this will go together with the rest of the series:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40KiQACgkQzL64meEa
mQYVaBAAx9WmHAADAAgq27OlaDx5snDPwLIuAOLo7kYBkfcIatnvmX3XLlgEk2+T
92MrgOmZVnbwpdtEManQBiY9UvQQ61VT7ixFNRbODPcruGlszZWsKWts4Ejr3LF6
7Nc6IIe/Xjkzw+aYR+8mugwLFc+/jMi/4cLBD4bCviLJMF1y0+aMhrqvPtwtuwm2
WcTcSByy706oswRV32NwB8jUPcNHKEs9QodVF4e7QVPgscl5pIqfe+jA6L19/HQ+
NqB8jFvFT3ZQmvhAU8PRLd0R3+XNpDHek4RS4StzDzeyF5YiJJx7JmuQv8r+ddtJ
OGKN5q5Q7eH89m91d5YUU9TDvI9DA0vtjDXPn6skjtXajq8boXg8fNMXrJU//f7S
lkbwCiOYQ7rsIWf0e/LWc+aPE4wogqKQf64fmZCZSV82uQf3bVdyGp6R2iArKLLA
B8nQNe6sWdZy8DG004QW+AV+OCvxiqNhUGyqqRNQWxZyg3FRtuXBri9yTFUBUUPE
8O7R9Sj2Bjqbs3isf2TQ6e2h/GfHfIE/otHSSnEPfdKu7wVfZlukskyjU4C5sXBR
LkpRupe6gzbS2qts4lPthcExdjMR76HWmsBWhINXOUxCj+p3WqEoliR7/riGbYnx
Y1Q1HP8oc8AtJC7ekoq5UJx2yxuQZsJIHuSUSU6xsTlAQf6uQGU=
=UWt1
-----END PGP SIGNATURE-----
--=-=-=--
