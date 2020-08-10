Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653872405A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 14:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgHJMOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 08:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgHJMOC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 08:14:02 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB11C061756;
        Mon, 10 Aug 2020 05:14:00 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k13so4571404lfo.0;
        Mon, 10 Aug 2020 05:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=2zpgXHsKMxHRy+CTgH2l0F8HPiOlelNzEHmaBlOocK4=;
        b=H4EKnd2/IMOPN7QcPZaBTccnrrrH8e3ffZ0cWvlnNI+gKP6k5M2RtjcjEdBqkveAoE
         x1iiqe+BvWXG+Sfx3Yfi6y84aj2/Q58qAGkFAldO+N/7aSFs63oQ4e6HhsNJHVOmM3x2
         LLR1HiZlOo/6m7N/9cc0m8JfOYuEArfmM8Ic5JZ5ZYWFFvl+pgNS8feZY7B7uCvFYt2N
         u8ZxRj1VswVraR6vmsED9V6EW2o/4pAffRTnP9yMiO4skrHgpjhnhi6P41alsesMqJl8
         +Te1H3uwktnxWReKRjeUaEaFmVfmvdAi9q55tiKWGVqcPffB0+j0+UwT+jfgaDnVQWgP
         XzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=2zpgXHsKMxHRy+CTgH2l0F8HPiOlelNzEHmaBlOocK4=;
        b=JgDBI3qJrp/DPpYGxnjJbRbXNKFKzch6nbWJpZYys/UI58lLAGfa997RWkHRfLiRVv
         dMep78LxjilzSz6dV1E1xAn5fIFzqhZIjwsFwBCMWztJh8YRqPLkG7/3eenj8hKw+2q9
         TlPQzAPmHhaXrqP4V7rbPwGr3h+fkp3+ws4pOXUBgEpUkMZIMvJwHgRS4I6nM6slrzWZ
         gTnpFleO691EgFIaCuZculPoPy5GIDo4tYgaxQ0qzV4m91fT7TB2zCn67iqy8/Hog32c
         g2QzK6l7gBVPskhmI6Nql001z3I/9z05pVuB75ZoAuNLU6SOsJ2SgljPuqadW+pNieJk
         s2NA==
X-Gm-Message-State: AOAM530wxsFoUim8eqZzIgNszKLGImUy1c2WPrngn8PNEE0OlRXib68I
        zWxNhhP338CuEL5ti1wsB9c=
X-Google-Smtp-Source: ABdhPJxIaVuL8YZg7Ejoa7FxGJp7/UUKqnY1VC6gXHFiza3h/gnhOJscPbwlFx9mDc1J7KJMkckN4g==
X-Received: by 2002:a19:8644:: with SMTP id i65mr384598lfd.20.1597061638305;
        Mon, 10 Aug 2020 05:13:58 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id a1sm10592918lfb.10.2020.08.10.05.13.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 05:13:57 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>, bjorn.andersson@linaro.org,
        kishon@ti.com, vkoul@kernel.org, agross@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH 3/3] usb: dwc3: dwc3-qcom: Find USB connector and register role switch
In-Reply-To: <20200731045712.28495-4-wcheng@codeaurora.org>
References: <20200731045712.28495-1-wcheng@codeaurora.org> <20200731045712.28495-4-wcheng@codeaurora.org>
Date:   Mon, 10 Aug 2020 15:13:52 +0300
Message-ID: <87ft8upukf.fsf@kernel.org>
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

Wesley Cheng <wcheng@codeaurora.org> writes:
> @@ -190,6 +195,73 @@ static int dwc3_qcom_register_extcon(struct dwc3_qco=
m *qcom)
>  	return 0;
>  }
>=20=20
> +static int dwc3_qcom_usb_role_switch_set(struct usb_role_switch *sw,
> +					 enum usb_role role)
> +{
> +	struct dwc3_qcom *qcom =3D usb_role_switch_get_drvdata(sw);
> +	struct fwnode_handle *child;
> +	bool enable =3D false;
> +
> +	if (!qcom->dwc3_drd_sw) {
> +		child =3D device_get_next_child_node(qcom->dev, NULL);
> +		if (child) {
> +			qcom->dwc3_drd_sw =3D usb_role_switch_find_by_fwnode(child);
> +			fwnode_handle_put(child);
> +			if (IS_ERR(qcom->dwc3_drd_sw)) {
> +				qcom->dwc3_drd_sw =3D NULL;
> +				return 0;
> +			}
> +		}
> +	}
> +
> +	usb_role_switch_set_role(qcom->dwc3_drd_sw, role);

why is this done at the glue layer instead of core.c?

> +	if (role =3D=3D USB_ROLE_DEVICE)
> +		enable =3D true;
> +	else
> +		enable =3D false;
> +
> +	qcom->mode =3D (role =3D=3D USB_ROLE_HOST) ? USB_DR_MODE_HOST :
> +					       USB_DR_MODE_PERIPHERAL;
> +	dwc3_qcom_vbus_overrride_enable(qcom, enable);

could you add a patch fixing this typo?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8xOgAACgkQzL64meEa
mQZ8Zw//eFsuJ6NPTaokHR1rlrCmk0sslHZNSmcQ+J0h1dnmc+FW8zVN2fueQMEt
OvRZKCsoo069xcAKRcD15GIphiAjqcX7NsqVCHnvASV3ts7Lk8/OLe2HydDAwuS9
vavlIfjGUBofKSFS24p6nGva5lH+QcDbSaQEX2AMRP8O4rrIMNjkwB4luCiSUDMn
py0FVm7eSuSDbuB0oZftw385e4BrS6pXdX8HYP1EBHbcYT5H6Z0WO9lflb5PgkM8
uA+pc9UM7kbJrbd++J+siVJ6kYI8Nd9OZDQZjc/5+EqIsQsK384ewpigxs9dXwbB
Mzu1izAeahlLdYXBbhRGCDL5xtfGMbmZ6D/8op9EEJDCZ4aOmSm5LmJCtax+rrsF
6J7bjat+viFQT1n04gyZCpiEQrV1T+TWhuxRVOpwRxx9aN1pygJ7w4o9ieAiBZnA
ubSjkygnQLcMUh24iNTWSg10CI8g35T9E0hatDWOnTJon1gTRC0ScPif7WpC3MPh
rabVNAFq+suuDVcHGxNBbMO8OGOrTLgWeUtf92bAtaaD/e2ZAM8/GNtKR/Ru3E5g
naw4rb4PsfCANjf9j7eEqsKJZmzBpGgLzjc16hAiZSbmZveoF9gDI8B/1F9sqilS
tLulenKhCkwsmyjB+AJgMi2R5bebRSukHlcHkiM8X3Mkdc0uuWc=
=Do2q
-----END PGP SIGNATURE-----
--=-=-=--
