Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A934914EDC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgAaNq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:46:27 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39870 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgAaNq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:46:27 -0500
Received: by mail-lj1-f196.google.com with SMTP id o15so1610897ljg.6;
        Fri, 31 Jan 2020 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=RtkEzH/NPfYvzoCEvzwW4b1vZP1InjqaI4R/KSdo5KQ=;
        b=fJFfy2OOqxLRHf3Ca3QBpFs9KusTaAadFCN5plMI7Cy+oTqL9mEK2iSVEH2zyna+zN
         Qj5hVhJsi7lx9Fq9mFo7XDD/7aHKDaF2EvZBPsFPawHYiRecw5fxzaS0iL58ne4TIHD/
         sEwDSy2g0W4B1YzyfWf7uox3YN7Cze0xhZxM75/V0NfyKnJ2NZJxesqvOy/et0APYdum
         uhbwSFbJHo19lRo6MCeD4KUAiMNkjEHR0QEePfse/gP9qfb2WWCFb694UlJhXj5+yU/Y
         ePoBxOIVa8KTW8+TB1tj3gwGeByx91Ko+5dig4g9xMLknkt9dFrXZ0itfIHvArct+4eS
         QRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=RtkEzH/NPfYvzoCEvzwW4b1vZP1InjqaI4R/KSdo5KQ=;
        b=qfrFmwKc2VyPxWHoSSeuadOl3eTGCGjuoHwAtMxVbjA37V9sK8NHeglkYjHlF372kT
         f3q5VWCAhWz7GWGBTG15YIk4hVWhmF3oPzAVpEUV7dqP43Vb9KNQgNLgf76w6GVwzDwh
         moCJPAaDk0U6Wl+KKqIUezCzE5nZZ+XMsd/B7/eAYDEkR5pBLhGlr5tOYl2ezhYmOx8/
         yHdHqG1d+V43CEc6gz6XdgWfWmOcF+4g8ungpOqoKfSsWjaaW+vnOfDuKlG7KaMu09Ig
         6/noYA/d35KEP/tE2dBMFcHs95HKCpi105P5hYrnj7vUod1zTgcqQpLqLD+lgG7G60Zf
         nGGQ==
X-Gm-Message-State: APjAAAVKDA4G3nRIdV5hyTepxdn71JKHebJuPtpaiQuMCx3/JSdQNAth
        mPd0jX1Nr/hCNqpaCLRIedXSsfZ4yVMyLw==
X-Google-Smtp-Source: APXvYqzmafVK+vxqbcreyk5cvKHFyCBbYzHnCP72ObvJwaKm+HnF4zBgOkUAaElpKT7ExDPjdlGiCA==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr5993120lji.93.1580478385082;
        Fri, 31 Jan 2020 05:46:25 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id b4sm4631642lfo.48.2020.01.31.05.46.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 05:46:24 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 10/19] usb: dwc3: Add support for role-switch-default-mode binding
In-Reply-To: <9b95478d-5ac7-3dfa-a70e-1dd881bd5b2c@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org> <20200122185610.131930-11-bryan.odonoghue@linaro.org> <87o8uj7nzj.fsf@kernel.org> <9b95478d-5ac7-3dfa-a70e-1dd881bd5b2c@linaro.org>
Date:   Fri, 31 Jan 2020 15:46:19 +0200
Message-ID: <87d0az7n84.fsf@kernel.org>
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
>> Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:
>>> From: John Stultz <john.stultz@linaro.org>
>>>
>>> Support the new role-switch-default-mode binding for configuring
>>> the default role the controller assumes as when the usb role is
>>> USB_ROLE_NONE
>>=20
>> per specification, device is supposed to be the default role. Why isn't
>> that working for you?
>
> Speaking for myself - its only the role-switch logic I need. This patch=20
> seemed to go along with the the role-switch stuff but, now that you ask,=
=20
> this series can probably do without it.

Oh, cool. Then we can defer this until we find an actual use for it :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40L6sACgkQzL64meEa
mQYaog/9F0ihBA8UNMURPG5FuCJ3t472XX/LTvkLpJQrdf9SBtq24F0n7qIahs98
/7bZqioMyHxQioP9i+c0bbvdXu43cpaVA4wq1RMJUjl1MFs4fUOiRGK6w/cYI6zq
FzP5+pGVY5X+AZoxffzCQCw5yjTzLHs2wD3ml5+mTrcQy2Lv8Om7Ldzp7lmAbGP/
zzeCO+HoPoTK6NHPkDdloaiY8YT6lMYZpttIOY37sxzUEdjkDQwzZEPFrMa/cHW4
4xY7tuMundNoxlM9HfkYA5yb/2GnwIARNElH2JF2ALuM5QJ3sGwQjfSFIBKW2wcx
Ooo12pWMydg11wvXh8ZeQCUGlKdzArDCx5rlxk1ne8JtK9qFfS5Zt7wcds86Y/3t
mXTZKjsLWNfHeFWaONGqfFDNW5ysCxy3QsnRocCZzeFG7foGMGF1wlln8j0OUfby
1wY//IZLI9RqAofKk3ZnbN7tlcE1j84HZqUJ6yjSYLkfIWobRtqjJF2KocMqkucG
LckF6wBNb2TZL3THLbizMxofEc/+3nUW3xvRJe17aBfsjbKA1eOx1WmQY+G8EXLN
pGRN4YWQtIIlxX2P9IrQFIoLvnx4rr6AGNv8/SKL9wVBACfmUEs4sr9x9m2Qi8+4
OqIL1C2W04SJjR2opFGtQ1/S/BBH88RRpMk1XfuiMEpg+r/f0MM=
=SEQ9
-----END PGP SIGNATURE-----
--=-=-=--
