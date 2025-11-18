Return-Path: <linux-arm-msm+bounces-82336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFCEC6A078
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A6D822E67E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6B7359FB2;
	Tue, 18 Nov 2025 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Lq4z7uIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC035C1B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476206; cv=none; b=sZLZFky2EWvEd6CjL9mqTii6yMV0lUaLX1s6VKzKAouV9GgiCDgsQoFOsgPDqcvXkUW006p2HaXQMFI7QO/9S9fIXrCbCg48aN9Rvz5xjx+lvlI/oEnprZc4s2UaxxNt5+TzZJtSaRmgGUdWu5Lm5QNzKxbAlH7biHpiM8XakqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476206; c=relaxed/simple;
	bh=812u0/kE8U6KIifXA4o4gTvauRi/MWbHZ1WwZdLX1Rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7eBykUMRwC5oe5zz9g4tKGCPd0IRUDWZWOeRYfynNAH05IDWV/G2pMJn2dZgFheyRslc5W9LUqpJo8UGDCg0yaJVgRPzr6YBbGPQdAawQ/wCoTmprVS2Yy9kiZKvr730hSrogA1j17LfOOp25H+sCPmVTCRkc+7pFUVCtmd9JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Lq4z7uIo; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-591c98ebe90so6022922e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763476202; x=1764081002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPuRb3+haxxFSoGOZ/Vv3ClCGfszWqWGAZKDKrczFMg=;
        b=Lq4z7uIoHwX+T0oZpnQeE7Sgq9N1okHHPsxFDCimKWGvAYYyd1L3RkOxAFX6qqwgAK
         n7bdZ81LqGV1aeevTqZ8wYxo8zm2fcmodj9xNDXKeQJspHWeAezhpEaV3ItXy5cPjLX4
         6lleapZWGYLkpOGJxS/+B70xq3sqzhS76pnHvh3KpwGhTjAk0fG5Bfaevs8HoAynZMpF
         6Y9f9b3Bef5JuVIba38qaCDqJwveVXQ19CNrRhMaBrwVBCOxUcjdGZbK08iPRuO8sCQ+
         nlyYi9cr1Cu3HHRMrga2WbosxHKUD2ZvZJFSImC9bw3VIP1RTXdGahqstC5GX3Xx94Lo
         LSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476202; x=1764081002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JPuRb3+haxxFSoGOZ/Vv3ClCGfszWqWGAZKDKrczFMg=;
        b=Rpl5mmB3SnYMwqEU6ExdBPRqAwe2attgcuhcjvnvHS3uu6k8RgdRO19gq7hn5NKPIU
         uEs46H3RB1CgHS5J696C0WeMe/unRwG+UoNvOvJDQiJwd6KapchYGpEljLxN1fT5ZFx/
         71Ax+XkmUgE6wZxQl2U4wLNKaVzQvh4AhN156b8EhwQmOrazutnYsgy4iR5KpekzFORg
         UKWtgezKyhnHK7ZG6LoZ5nRaV1hIjhT4GEw+pRiRC0Oi3FmU7iE2bi6Vcsvh8fVpUSr0
         skEOy+VEgBVhitshc9g8DHekGe63hMMKWtLxlIptaMrglyOm8Y8LALHkoocZi6eY07rv
         60kg==
X-Forwarded-Encrypted: i=1; AJvYcCVR2nhbbuENm5JjWTwbm3TI94NP5f7ItKGYg6XgndJjETkvxzZn3Rdmq9bRDYGrLfmRTu0qcias3jSSb5fY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9X6czoX+0a3tDepKUzYQe35n4x1+wbdwuxO/NID+TwdCDDOD1
	t36qYXz8xMg0GXEbXOkJorW/HNBP6W7h+l2Y9EuQlBS6255/isS9Ja5Ofo9nsnB12lcANVka4uz
	OSdGEnQ8Ycgj+/4RUF8lULRxdOooaxguY1+aPDkT37w==
X-Gm-Gg: ASbGnctw9xgtKx+l+/JjILk+lr+9424iM7CKiEd/WE0II+ilUgjwMmMsHvGpnZBxce0
	eni/kRGo5MewSStkTf+LtqbR12NaIyrC2eNMUUb1Gm/wVqUfWk9U6rQPVzi7XUzVpG8XVwoFIpp
	hf9IQtVlUaJKQhWlV1/nJwhZZtg1iKKsjmTHuNsEC0hy2F6GhzdDBYv/DhXsXv6l3B+bcORUzTB
	eilseR2hl70t3ZnZQRE1gaPotWg1YBBv4WoSnOiu9zb0ac5MDguXXqpRX7fCwwqC5ilsDBiJBV7
	SNqCim29YAIBVsP/0Eg9PD/l0N68MpDxdQzO
X-Google-Smtp-Source: AGHT+IG/8x599leRbcc55AKG5x7ewC54AAGqLK2r1ZPyGFLtbdnyvhRmFu7yQc8cTfZdSXpR6fRtj7AIKLBehJrw2m0=
X-Received: by 2002:a05:6512:3ca2:b0:57a:2be1:d779 with SMTP id
 2adb3069b0e04-595841febd2mr6716947e87.31.1763476201587; Tue, 18 Nov 2025
 06:30:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-pci-m2-e-v1-0-97413d6bf824@oss.qualcomm.com> <20251112-pci-m2-e-v1-8-97413d6bf824@oss.qualcomm.com>
In-Reply-To: <20251112-pci-m2-e-v1-8-97413d6bf824@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 15:29:49 +0100
X-Gm-Features: AWmQ_bnS7J2LiofnEnjv4l_cFHHTAIWcbKZPMExzLrGKBD6vTSaTLBGi1oU52Ic
Message-ID: <CAMRc=MdRw+spjN0ySJ7We_GJ8GaDU2Nb4unaxcnr2ZLjLOeSrA@mail.gmail.com>
Subject: Re: [PATCH 8/9] Bluetooth: hci_qca: Add support for WCN7850 PCIe M.2 card
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 3:45=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The WCN7850 PCIe M.2 card connected to the UART controller exposes the
> 'WCN7850' serdev device and is controlled using the pwrseq framework.
>
> Hence, add support for it in the driver. It reuses the existing
> 'qca_soc_data_wcn7850' driver data.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/bluetooth/hci_qca.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4cff4d9be3132561ee9bae4ddf2c8ac0bc13ecd7..09bfb3bba93698f496947775b=
f6b31f2f20279f1 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -26,6 +26,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/acpi.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwrseq/consumer.h>
> @@ -2344,6 +2345,9 @@ static int qca_serdev_probe(struct serdev_device *s=
erdev)
>
>         qcadev->serdev_hu.serdev =3D serdev;
>         data =3D device_get_match_data(&serdev->dev);
> +       if (!data && serdev->id)
> +               data =3D (const struct qca_device_data *) serdev->id->dri=
ver_data;
> +
>         serdev_device_set_drvdata(serdev, qcadev);
>         device_property_read_string_array(&serdev->dev, "firmware-name",
>                                          qcadev->firmware_name, ARRAY_SIZ=
E(qcadev->firmware_name));
> @@ -2384,6 +2388,15 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>         case QCA_WCN6855:
>         case QCA_WCN7850:
>         case QCA_WCN6750:
> +               if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))=
 {
> +                       qcadev->bt_power->pwrseq =3D devm_pwrseq_get(&ser=
dev->ctrl->dev,
> +                                                                  "uart"=
);
> +                       if (IS_ERR(qcadev->bt_power->pwrseq))
> +                               qcadev->bt_power->pwrseq =3D NULL;
> +                       else
> +                               break;
> +               }

Did you by any chance copy this logic from commit: db0ff7e15923
("driver: bluetooth: hci_qca:fix unable to load the BT driver")? This
commit is wrong and it flew under my radar during the summer and I
never got around to fixing it. It doesn't take into account probe
deferral.

Bartosz

> +
>                 if (!device_property_present(&serdev->dev, "enable-gpios"=
)) {
>                         /*
>                          * Backward compatibility with old DT sources. If=
 the
> @@ -2740,6 +2753,12 @@ static const struct acpi_device_id qca_bluetooth_a=
cpi_match[] =3D {
>  MODULE_DEVICE_TABLE(acpi, qca_bluetooth_acpi_match);
>  #endif
>
> +static const struct serdev_device_id qca_bluetooth_serdev_match[] =3D {
> +       { "WCN7850", (kernel_ulong_t)&qca_soc_data_wcn7850 },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(serdev, qca_bluetooth_serdev_match);
> +
>  #ifdef CONFIG_DEV_COREDUMP
>  static void hciqca_coredump(struct device *dev)
>  {
> @@ -2756,6 +2775,7 @@ static void hciqca_coredump(struct device *dev)
>  static struct serdev_device_driver qca_serdev_driver =3D {
>         .probe =3D qca_serdev_probe,
>         .remove =3D qca_serdev_remove,
> +       .id_table =3D qca_bluetooth_serdev_match,
>         .driver =3D {
>                 .name =3D "hci_uart_qca",
>                 .of_match_table =3D of_match_ptr(qca_bluetooth_of_match),
>
> --
> 2.48.1
>
>

