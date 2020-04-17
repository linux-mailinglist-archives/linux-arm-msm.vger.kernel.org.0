Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E9F1AD9DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 11:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgDQJ1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 05:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729987AbgDQJ1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 05:27:49 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C341C061A0C;
        Fri, 17 Apr 2020 02:27:49 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g10so811008lfj.13;
        Fri, 17 Apr 2020 02:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=z9TmZCPSYHLbADZtDk6utvoUiFo68AqRFtzXP1rnqCE=;
        b=MvBk/l4Fv4PIGHuS/p6vhpQW5a7nV5pWTle6H/XQgHKCK90C3c+nRLMthbaPZt55Dc
         XFUldyExOul3jWHUdr4fiIgp3W4dqedm7eZf7zTh99SRSq9yBniFulzQbr5Q9ebRr2oR
         SYLu8z+JLw5oqXg0nEoPUsmuvU6tiA4JwswOE9TaNhF+Ezt1kmzh2cGmLjvr1iYdK+Jo
         Dzvw2ry5wZ6lj9yv7iD7f1tO1t+fNlR2DIynnb1x6jryvZd7AHvQCcSARqT1kChLA1ox
         5iJJoCPblDOz5+EJkn0P/fN+rqxH6sy7xmuFmUhYXBstY1I4mQOAC9QFR5L90adRXeUN
         ixWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=z9TmZCPSYHLbADZtDk6utvoUiFo68AqRFtzXP1rnqCE=;
        b=XFwlsWD8HsC1xBERGX4ksDxhk/399xBAfSUIO9m8jgeivoD67dJEIilLvKQVh1FME/
         KxusJti2HeOP23+fs8FJyxoMm93HZNpnljSa/YVZBzgYyqvd+pK4r6r6n8SAMp5pobEh
         Ac5Ydq1COTaPAyg2Yt0lV//DGugENibgwVXMnSikwndPKcNuzavwLPm0E2n/+e/74l1a
         MnDShbm4H4IjFmfRYX9Htk2hXwYi5IYDTWDFTpNCva2gSUFfwcVHGXgkQ4cCjEmwVwoo
         zgV/mcs3sy6GW7kywepboDHnxxehCz5bpAvIkITGbtKgTaK5JguUoPXzw0KkZz0ir3hc
         uGbw==
X-Gm-Message-State: AGi0Puawm9LHmaVgUv5vzNOnPvt/yZEI2ZbdvGLIHR8rgaN2vcvPjNOC
        O2COUdIbLpItkz97uf4mRVkUiE4fcSuKzQ==
X-Google-Smtp-Source: APiQypLrIi1dWDIOyFkDvv+ij+G6A3tYJRL5zY1ih24KqVVQuButGDmZGkxwR0p5LkrNgt3WHSRrug==
X-Received: by 2002:ac2:46f9:: with SMTP id q25mr1493930lfo.149.1587115667392;
        Fri, 17 Apr 2020 02:27:47 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id 25sm17492628lft.68.2020.04.17.02.27.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 02:27:46 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 28/35] docs: dt: qcom,dwc3.txt: fix cross-reference for a converted file
In-Reply-To: <24b30222392569e7aa5d61d46642a4c38a964512.1586359676.git.mchehab+huawei@kernel.org>
References: <cover.1586359676.git.mchehab+huawei@kernel.org> <24b30222392569e7aa5d61d46642a4c38a964512.1586359676.git.mchehab+huawei@kernel.org>
Date:   Fri, 17 Apr 2020 12:27:42 +0300
Message-ID: <87h7xicvht.fsf@kernel.org>
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> The qcom-qusb2-phy.txt file was converted and renamed to yaml.
> Update cross-reference accordingly.
>
> Fixes: 8ce65d8d38df ("dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bin=
dings to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Docume=
ntation/devicetree/bindings/usb/qcom,dwc3.txt
> index cb695aa3fba4..fbdd01756752 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> @@ -52,8 +52,8 @@ A child node must exist to represent the core DWC3 IP b=
lock. The name of
>  the node is not important. The content of the node is defined in dwc3.tx=
t.
>=20=20
>  Phy documentation is provided in the following places:
> -Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> -Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
> +Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt    - USB3 QMP PHY
> +Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml - USB2 QUSB2 P=
HY
>=20=20
>  Example device nodes:

Should I take this or will it go via e.g. trivial?

In any case:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6Zdo4ACgkQzL64meEa
mQYUGw/+LzBLQ94ktYWYWxyCitvz+XIYayQ1/iMLn3p3cDv3jEzTF6PO9XWWyxsr
9X6rmbmlmy0C9cohEthIzKVc1borij4pvn+dERuCAHNXSRkIQdIuiXBWgwSHJjdm
iiSHotQboyX21IJbd1rbE8DHuGeQ7FX/57srSji8fs3WBxzdwG94uOnP8HmXnppg
ZHVCj8V5EQPwjV3iyN5VjvTEb/54e5Levmn5RVkMJJxJT7AIkClVoOuqLvfUns+r
fEEL3OGOVuoqj3DR/0uqaAdxkUJExGp+tmeRbomH6s9ygt9rby4LdC1b8J5ZlDF2
PqxV+zromTmWBjZ4RjYQLR2iUvMamhwidrsqravshl2A/WYcpcF4hxkQHFs+oiZ+
3YeGftUNO5yzxZQ+RznmgY9Sw7MLarA+F92Fxa1SaxW9eohUBr6BZo1gb//2izNR
GO6elpHcMWuaBX/F/R9eliyY96jwjbmQZIe6XkctF8wJGahUlTpWAA1FDYwmSpBQ
9TOybuw65rpSO14+CzmXUsovXn1bIzsvE8dYXJPQ77lgaAvivV65wZdCaBZJvpLT
oc9uXg18N090wrdCCcxHodk/iKIW0Aamy6zBs9eXVX2zVf/830J6IcAjmkAyoDwa
IRBcHPBI/8UXwVKqkuKL/+fSUXCCtv9b1c9h6E5WO6OhKgdVv20=
=aXc/
-----END PGP SIGNATURE-----
--=-=-=--
