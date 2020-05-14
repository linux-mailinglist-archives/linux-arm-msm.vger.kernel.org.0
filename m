Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD5A1D2E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgENL3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgENL3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:29:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9559C061A0C;
        Thu, 14 May 2020 04:29:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u6so3090769ljl.6;
        Thu, 14 May 2020 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=aZUh5M8C4xCIdhCIBNG4+MSgiN9g9T+0cBtSXdRuzAA=;
        b=AnB5LTU1UnPEHRn3jH8GdEPOYR1y1ntXOEKMsFgjXqrYiJdeY1QAx1dBcMfOHe0ped
         pskLUgyRJKw2jnp8i+ZbQ3JUVIfYF8gnUqyqhSauBJ7YpXB/gXaM5vTcUJO7rnGsFcJj
         phnidUoZ7zOHcgHsQsXuyd8Q8+XjN7Q8I9yICKOAHOK3/dZ9FzI6CDhUjNl/qD9OWlns
         sehSif3Ul7dB0dPYKtSuTtsG73QwrQbSoh40N/VI4i3Zr6HIdsrVBIev/mUZqXzt0SAV
         h7gDOA4ij8IKfDbzF5glNYcNHAh8enREXiYTT8qgW9Oxh0/9WE8DBmIW3MoYBM9QSKiq
         9ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=aZUh5M8C4xCIdhCIBNG4+MSgiN9g9T+0cBtSXdRuzAA=;
        b=FErlio98oENcSUjKCv341Iy4krBnHfofFezkt51vek2Mo/Q9R/84Vr/1IWlrWtucHA
         xpZN390YMZ6FJDcQdtYbV70kw/4tC65L905qxZLCO4k3A/AeA68E1oPT67fx6QFGoaZi
         8QUaH2dMqHtf80v7cz7ewD3efNSs7iUWc1ZQ+zOTPuD28W+hcvxLvob7kvllCzGQQB/y
         KK07jqp3NrAkh/BNHm6Cw9V4sdoyKghShTNeNFM7f0rf+E8O1Xf3ZFUm59IQJyuGTH6/
         Cq6o5YSzuXnN4kgshg29M6/YU2UtV2lmRQkl9TyGzfs73k3TiZzymrRdRNJGR4tXJo0X
         P5pw==
X-Gm-Message-State: AOAM5333mGvEFGSnVvgqBjRgZm4jpU8M8ehdeKl9NY0um8Kgnbab65nQ
        aTTkCi4WbniXdc3MqQ69AuQ=
X-Google-Smtp-Source: ABdhPJxCRXpMeI5VGzKYeX4Cb0PWBtnxXi8wdrx4llBhB1c6Ix70JZCCdZkrLcSG0KWJQzDuD7yLLA==
X-Received: by 2002:a2e:b043:: with SMTP id d3mr2321630ljl.77.1589455760189;
        Thu, 14 May 2020 04:29:20 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id 4sm1671551lfr.66.2020.05.14.04.29.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 04:29:19 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
In-Reply-To: <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
Date:   Thu, 14 May 2020 14:29:15 +0300
Message-ID: <878shu4uwk.fsf@kernel.org>
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

Sandeep Maheswaram <sanm@codeaurora.org> writes:
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +	struct device *dev =3D qcom->dev;
> +	int ret;
> +
> +	if (!device_is_bound(&qcom->dwc3->dev))
> +		return -EPROBE_DEFER;

this breaks allmodconfig. I'm dropping this series from my queue for
this merge window.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69K4sACgkQzL64meEa
mQYJXA/+Ov/nCvG+76vWtewqpijWe9V1NsHKzHm3mBiXlbQmSBA+8IpWrppxApkh
JoUD1IjMEGCiUx69OzLnZlKGtkNmeygVBf780nk2eZ2oqWUJRbiOkeDOz8fwf7OM
HXX2sI2SqdIJ0MLbwcSMQu2rrRNxsCog4kgI6q1u9+og9cj4RIuZ5K+Jv36EK1pT
EAlZ3T+a2nMEcuOuS9BO0kHkIabL1ppTS3P7wgnj5iD+ZKbjNZeC5WNxYGRrucs6
EW/kNJyoGHZJ9pgoN1ZblbYj0XY0MWVf2IZu55QHfDgE/xB1oag2LuUsle2tRAAP
G5QSGW9yNSbPpOtLfaZ/XvieOYhaumL17HIKBnUqGqIIVhCfJwy3PH8/M57TDdV1
sGUsr2r6yOYaGiHceEqTkQCHgwIkNLaAXpL9MbflV9lymcomd5Hu1l+wlywEhgON
rKzbvjysZTsuZZer0eYLS+H+deqJdu/Anqqh7I/gnW2W02Hxz4lh0ujhgSpqDN/G
z/LfoxVP1s4YjEYSmnSkKDaPCqjjyr0WL7n8LE8xTKhvZUv2aa2ArbMSvlkcxait
G5fGYrIr7Jtu8l2B+0XfDPiJA9Ahwt3nG54x5cFpXyPs5u5QceSpGsx2hxZQlOjr
brk7eVmCHta9WZyIeGJAttJWqYeIxi/HZY3lJGZI02YFLvo0Osg=
=r7D8
-----END PGP SIGNATURE-----
--=-=-=--
