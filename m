Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C4614ED32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgAaNZS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:25:18 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34102 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgAaNZS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:25:18 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so4890213lfc.1;
        Fri, 31 Jan 2020 05:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=On0qhhXBlYOtCeZtcZpo7aig8lY5SX+e5KUg+9BbvQY=;
        b=rzISzmgQveZw+9LaOEzmO8qO3ql0FAk6Al0ixRQc7Mq68CR2K8k18Kxa0iwqPm8ubG
         7ERq5f85UdfPjryX5mEX/3e3aEwhDf15scWg8crfc4d7tv3hyjzckHU0RH1KjI8s+/yY
         XmeCDUhH2X+E1MC+ovO76ZlUZlrZbfsH0Xr8BAjA5Dvn36yYXaX32ya/SiSM+ZU/HcFX
         8j0xVpPx5zTv4E5qTzrwIiLcZ2YXn7WI2LyVJ3V39nvSa7wNnC87cd2U6d6MwduF27Y2
         Fd9iAD49+Nd2gFWraDCxrIp63koZQHaX8LG8YLmB/1aW8rGI4H36/kcsd5lchcEXbk8W
         VmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=On0qhhXBlYOtCeZtcZpo7aig8lY5SX+e5KUg+9BbvQY=;
        b=S7n1ICXjNm7BeRhV33ZDRhg3CPrjcFBSYenKvfzZvYBaJYpTZCuPY5lRYJ2OqheN3o
         Mx6ilzUuFh+W91ricy3spaD8X20GDKZ7G7zv+BAKNlicfJBQ424FYYbN6vbUZoKeGtdc
         VwTlmWUm+EZ/mHrO14iJuWbGVsBi8zadfKxjw0q1qSIuiVsZz5crEnidwGrDNQVKZVkj
         XFflBUpamdrRbuYa4qU2uv0tpsRFpTI4QdnyXYINyab4lm4sshRfCTEv9wISkNyjo3VV
         5Jrr/ZJ1H6HNvT+5WfvOPqngXrw3/gDwA36gtIbc79a7CvCutrrZcGumNAkJNl+M4Ob+
         4tWQ==
X-Gm-Message-State: APjAAAWvm8cvRwljJQIRk41VTYCPzQOuJJWzt8p4yQ6VpwmVxOe10zJv
        +6Fkf3FjCaYHLyS/3RgugV8=
X-Google-Smtp-Source: APXvYqzq/Q/pPQ4k0mOIIJJKuB00jX53XaxpQ4ZFAhWcIwROkDhtcm31B+U5CCUfOkEHEkVDyPWVxA==
X-Received: by 2002:ac2:5195:: with SMTP id u21mr5484358lfi.141.1580477115114;
        Fri, 31 Jan 2020 05:25:15 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id 126sm4578903lfm.38.2020.01.31.05.25.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 05:25:14 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, Yu Chen <chenyu56@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 07/19] usb: dwc3: Registering a role switch in the DRD code.
In-Reply-To: <20200122185610.131930-8-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org> <20200122185610.131930-8-bryan.odonoghue@linaro.org>
Date:   Fri, 31 Jan 2020 15:25:09 +0200
Message-ID: <87wo977o7e.fsf@kernel.org>
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
> From: Yu Chen <chenyu56@huawei.com>
>
> The Type-C drivers use USB role switch API to inform the
> system about the negotiated data role, so registering a role
> switch in the DRD code in order to support platforms with
> USB Type-C connectors.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> CC: ShuFan Lee <shufan_lee@richtek.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jack Pham <jackp@codeaurora.org>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/dwc3/core.h |  3 ++
>  drivers/usb/dwc3/drd.c  | 77 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 79 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 77c4a9abe365..a99e57636172 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -25,6 +25,7 @@
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
>  #include <linux/usb/otg.h>
> +#include <linux/usb/role.h>
>  #include <linux/ulpi/interface.h>
>=20=20
>  #include <linux/phy/phy.h>
> @@ -953,6 +954,7 @@ struct dwc3_scratchpad_array {
>   * @hsphy_mode: UTMI phy mode, one of following:
>   *		- USBPHY_INTERFACE_MODE_UTMI
>   *		- USBPHY_INTERFACE_MODE_UTMIW
> + * @role_sw: usb_role_switch handle
>   * @usb2_phy: pointer to USB2 PHY
>   * @usb3_phy: pointer to USB3 PHY
>   * @usb2_generic_phy: pointer to USB2 PHY
> @@ -1086,6 +1088,7 @@ struct dwc3 {
>  	struct extcon_dev	*edev;
>  	struct notifier_block	edev_nb;
>  	enum usb_phy_interface	hsphy_mode;
> +	struct usb_role_switch	*role_sw;
>=20=20
>  	u32			fladj;
>  	u32			irq_gadget;
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index c946d64142ad..3b57d2ddda93 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -476,6 +476,73 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc=
3 *dwc)
>  	return edev;
>  }
>=20=20
> +#ifdef CONFIG_USB_ROLE_SWITCH

it's best to use if (IS_*()) macros.

> +#define ROLE_SWITCH 1

this wouldn't be neceessary

> +static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role ro=
le)
> +{
> +	struct dwc3 *dwc =3D dev_get_drvdata(dev);
> +	u32 mode;
> +
> +	switch (role) {
> +	case USB_ROLE_HOST:
> +		mode =3D DWC3_GCTL_PRTCAP_HOST;
> +		break;
> +	case USB_ROLE_DEVICE:
> +		mode =3D DWC3_GCTL_PRTCAP_DEVICE;
> +		break;
> +	default:
> +		mode =3D DWC3_GCTL_PRTCAP_DEVICE;
> +		break;
> +	}
> +
> +	dwc3_set_mode(dwc, mode);
> +	return 0;
> +}
> +
> +static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
> +{
> +	struct dwc3 *dwc =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	enum usb_role role;
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	switch (dwc->current_dr_role) {
> +	case DWC3_GCTL_PRTCAP_HOST:
> +		role =3D USB_ROLE_HOST;
> +		break;
> +	case DWC3_GCTL_PRTCAP_DEVICE:
> +		role =3D USB_ROLE_DEVICE;
> +		break;
> +	case DWC3_GCTL_PRTCAP_OTG:
> +		role =3D dwc->current_otg_role;
> +		break;
> +	default:
> +		role =3D USB_ROLE_DEVICE;
> +		break;
> +	}
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +	return role;
> +}
> +
> +static int dwc3_setup_role_switch(struct dwc3 *dwc)
> +{
> +	struct usb_role_switch_desc dwc3_role_switch =3D {NULL};
> +
> +	dwc3_role_switch.fwnode =3D dev_fwnode(dwc->dev);
> +	dwc3_role_switch.set =3D dwc3_usb_role_switch_set;
> +	dwc3_role_switch.get =3D dwc3_usb_role_switch_get;
> +	dwc->role_sw =3D usb_role_switch_register(dwc->dev, &dwc3_role_switch);
> +	if (IS_ERR(dwc->role_sw))
> +		return PTR_ERR(dwc->role_sw);
> +
> +	dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
> +	return 0;
> +}
> +#else
> +#define ROLE_SWITCH 0
> +#define dwc3_setup_role_switch(x) 0

or this

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40KrUACgkQzL64meEa
mQYy7w/9E30MqVYLkohM1KHA8Tax73YNKaJaHkYFIDAWcpp1Cz+AoIKdMAXMxq/Z
Fa3Fe/GjDEQU/dgOBiWtJj3FQ+0ZZ78F0EpZkuevjRwi07QSKZ17h8QgaFFjHcIk
AwpGFLDF43fsrUMZxrkf5y3cSHHl2UV8GYI4PEsAivFfIvJVIqrwTcxv3ifsoRpj
GdyW9gwc4FqwCLWAD63PS6DLcmDzlasE7wyv5FKV2Rf0Bovqnpbg66i6yWf/OST0
j9Cwu1GTh6xV7YoeCALwvdjL1FmKxeQoFXlOfpKdBIHbVVCGL8e7qfimMSpbTp48
cEqQcbrlk+RqFuhixhW9tsMO8YSa+TxZnk7RWtsyV4kceM8ephMha1goui2kF8l8
btnM3XHZKDDasoynqEtTfMU2EW+UXTPjQybZ8Q8ryrWcZD77f4b0hLn8FmDeT1bZ
gAv5U+mLyeVvR3i5tiRFgaAqrDb2mmjzVXJpyL7vuJjU7VDrNysfBfdd+6Wjj0lJ
RcuMGXzC7GFPfH14v+JMfcX17fMFhyj3E9yQpqLyJcBsGBVjuii69fGBBJyVUreH
vhiMgWyU8gpU1PS2mOrPGzHyweA41IA3AfZtDAV4s3bb+dUuobhhXBh9lk2nIHxt
lghorQ3G23FXCRzNJep5DpIgXtQvjO7tbL7qqwrRyrbqHdkQ3pg=
=zM1p
-----END PGP SIGNATURE-----
--=-=-=--
