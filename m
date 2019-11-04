Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7F4EE6A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 18:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfKDRwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 12:52:12 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43322 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfKDRwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 12:52:12 -0500
Received: by mail-pl1-f194.google.com with SMTP id a18so6771856plm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 09:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:from:subject:to:user-agent:date;
        bh=3CHrSHD37ZopVTCrhzgKR9E8ooKOmK/8OxMVDS6vwuI=;
        b=aLtOeSffc2ESdeStgh0gvZWVGC4SVaxngt6L3IAywqqZTvFkn+X676dv17c4L6eGba
         SnLWjpu0qWDl8sFS8//6SiqVNR9FxZ1NRQCXVSYm1+GH1eGC3imZpqxJJVpp1zDsB/n0
         qT2qm86muT+AU+DwWe6nV0XwIj9ZbPbZlOtyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:from:subject:to
         :user-agent:date;
        bh=3CHrSHD37ZopVTCrhzgKR9E8ooKOmK/8OxMVDS6vwuI=;
        b=n4QV+zcGGhZQRX6wpDJfsTKLkinF29qkWSLaGDJKWybT0OcIPsfZRmdGhDTalFRTSJ
         3NXc2JCA5iB6j6xPX8OYs/0zR8rQSOKZKkHrrT4AHmwGJI3lZkpSpIHlHbiDwM1Eneyr
         45n4064BwDIhrcP3uAPQNsLrUoGkh9oahdRMIeKJJjm2+e8qoXbpJDLq0D5+iwlU4iXl
         7K0X2ypUP5gILJjNNsOKAxD+ZKgXN3cPt85mFEgNt9fxaLm4i/ryYS92saMrLSAMdxfd
         sIOULPLjTqo0/ymbxn81An04YiONTBHmbGbln7odzHze2CLHiyNwQ9+ToX4ccMu/NfQp
         zj5g==
X-Gm-Message-State: APjAAAUHhYViL4aLDdPRWMIibOdmmy0rbIH67KWU19OS7+STzBTA3olh
        zAjEww190cWUQWX4XHhT1rfbcQ==
X-Google-Smtp-Source: APXvYqxrYy0bhV9BstiDpY6WoRWDrnAIP8w3jFR5/bWWHdykonSQNVFdZDTiO5WNLjo1Bbf3S55xnw==
X-Received: by 2002:a17:902:16b:: with SMTP id 98mr28484214plb.154.1572889931654;
        Mon, 04 Nov 2019 09:52:11 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f2sm14089155pfg.48.2019.11.04.09.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:52:11 -0800 (PST)
Message-ID: <5dc0654b.1c69fb81.5f215.8c24@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572591543-15501-1-git-send-email-kgunda@codeaurora.org>
References: <1572591543-15501-1-git-send-email-kgunda@codeaurora.org>
Cc:     Kiran Gunda <kgunda@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH V1] mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l
To:     Andy Gross <agross@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rnayak@codeaurora.org
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 09:52:10 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kiran Gunda (2019-10-31 23:59:03)
> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
> found on SC7180 based platforms.
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 2 ++
>  drivers/mfd/qcom-spmi-pmic.c                             | 4 ++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> index 1437062..b5fc64e 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> @@ -32,6 +32,8 @@ Required properties:
>                     "qcom,pm8998",
>                     "qcom,pmi8998",
>                     "qcom,pm8005",
> +                  "qcom,pm6150",
> +                  "qcom,pm6150l",

Please sort on compatible string

>                     or generalized "qcom,spmi-pmic".
>  - reg:             Specifies the SPMI USID slave address for this device.
>                     For more information see:
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> index e8fe705..d916aa8 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -34,6 +34,8 @@
>  #define PM8998_SUBTYPE         0x14
>  #define PMI8998_SUBTYPE                0x15
>  #define PM8005_SUBTYPE         0x18
> +#define PM6150L_SUBTYPE                0x27
> +#define PM6150_SUBTYPE         0x28

And on macro name here.

> =20
>  static const struct of_device_id pmic_spmi_id_table[] =3D {
>         { .compatible =3D "qcom,spmi-pmic", .data =3D (void *)COMMON_SUBT=
YPE },
> @@ -53,6 +55,8 @@
>         { .compatible =3D "qcom,pm8998",    .data =3D (void *)PM8998_SUBT=
YPE },
>         { .compatible =3D "qcom,pmi8998",   .data =3D (void *)PMI8998_SUB=
TYPE },
>         { .compatible =3D "qcom,pm8005",    .data =3D (void *)PM8005_SUBT=
YPE },
> +       { .compatible =3D "qcom,pm6150l",   .data =3D (void *)PM6150L_SUB=
TYPE },
> +       { .compatible =3D "qcom,pm6150",    .data =3D (void *)PM6150_SUBT=
YPE },

And compatible here.

>         { }
