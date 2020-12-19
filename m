Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C355B2DF248
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Dec 2020 00:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgLSXsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Dec 2020 18:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgLSXsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Dec 2020 18:48:05 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D312AC061282
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Dec 2020 15:47:24 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id lb18so3667208pjb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Dec 2020 15:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=faCYXGNXT4iGBZboME4hSaXfQUHuq/UqJ24WhoWMqqc=;
        b=UokGDTrcU8v5YIGe6y7VO2RM2aBMUko0fbpGS7GOJuSfke5R7iE3+up0DTXIet+P8k
         NBreFlPNrnXlVaVGVxdPPGNLIkBwRYFSBz+z8FZSNdT58ZYVGg9lEDJ1x72HdXVXytdw
         mx4Mvzl5VCzwcmQoMgHv0U5zvOIkZRRk62nLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=faCYXGNXT4iGBZboME4hSaXfQUHuq/UqJ24WhoWMqqc=;
        b=ZmHJGgYq01WFMY+2tfm/SLoXb0WPHOBOu9G7nk5Uu2DCoXK6FVh5MR0vx2uIhsLnI5
         zIHHqNqWzsKNwvdfuvTrmCgRYgCLH/r5rH3oZuPQpENW0AtfJQazDxfugc0Gms3ToD4y
         aWVTr1UGIF+QvgFT+eX1/Sj5sdP88sIALpivyQ6jAXpdc6RMlJL+xjrSmSFXhOK6GwC+
         ORPnoKNmQAnjGH7QSNWPPeT1Jdhj9oFGphtwZz5v64FTvVu2gL0VaW3U7IBNr4F3sm3s
         0j2cLJWRwRRJ6x0zRiI9OUG9ZG1hp5bvEzZW4WxJ0rw3o/LnCuC+asesqk/CvIlNRqnw
         eDFw==
X-Gm-Message-State: AOAM531R7XCGg0wKq/abwXZbyA1jlUqUshtvDnWgYMyluhezy3fhucH3
        pDQf28pX4oOjxzpAn+SSAmapCw==
X-Google-Smtp-Source: ABdhPJy0ZnF3E7W8xCjBT8SUdC7OSGI8CDrRqR91LprhaHWlPYIBpsHaGVhEgyI3uUoiT+0F19q+Fg==
X-Received: by 2002:a17:902:ab8b:b029:da:f377:e7d7 with SMTP id f11-20020a170902ab8bb02900daf377e7d7mr10575415plr.4.1608421644095;
        Sat, 19 Dec 2020 15:47:24 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a19sm11865059pfi.130.2020.12.19.15.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 15:47:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1608279292-24760-2-git-send-email-kgunda@codeaurora.org>
References: <1608279292-24760-1-git-send-email-kgunda@codeaurora.org> <1608279292-24760-2-git-send-email-kgunda@codeaurora.org>
Subject: Re: [PATCH V4 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml format
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Kiran Gunda <kgunda@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, swboyd@chromium.org
Date:   Sat, 19 Dec 2020 15:47:21 -0800
Message-ID: <160842164192.1580929.12823359876682723808@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kiran Gunda (2020-12-18 00:14:51)
> Convert the bindings from .txt to .yaml format.
>=20
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  80 -------------
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    | 127 +++++++++++++++=
++++++
>  2 files changed, 127 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.=
txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> deleted file mode 100644
> index 79367a4..0000000
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -          Qualcomm SPMI PMICs multi-function device bindings
> -
> -The Qualcomm SPMI series presently includes PM8941, PM8841 and PMA8084
> -PMICs.  These PMICs use a QPNP scheme through SPMI interface.
> -QPNP is effectively a partitioning scheme for dividing the SPMI extended
> -register space up into logical pieces, and set of fixed register
> -locations/definitions within these regions, with some of these regions
> -specifically used for interrupt handling.
> -
> -The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and are
> -interfaced to the chip via the SPMI (System Power Management Interface) =
bus.
> -Support for multiple independent functions are implemented by splitting =
the
> -16-bit SPMI slave address space into 256 smaller fixed-size regions, 256=
 bytes
> -each. A function can consume one or more of these fixed-size register re=
gions.
> -
> -Required properties:
> -- compatible:      Should contain one of:
> -                   "qcom,pm8941",
> -                   "qcom,pm8841",
> -                   "qcom,pma8084",
> -                   "qcom,pm8019",
> -                   "qcom,pm8226",
> -                   "qcom,pm8110",
> -                   "qcom,pma8084",
> -                   "qcom,pmi8962",
> -                   "qcom,pmd9635",
> -                   "qcom,pm8994",
> -                   "qcom,pmi8994",
> -                   "qcom,pm8916",
> -                   "qcom,pm8004",
> -                   "qcom,pm8909",
> -                   "qcom,pm8950",
> -                   "qcom,pmi8950",
> -                   "qcom,pm8998",
> -                   "qcom,pmi8998",
> -                   "qcom,pm8005",
> -                   or generalized "qcom,spmi-pmic".
> -- reg:             Specifies the SPMI USID slave address for this device.
> -                   For more information see:
> -                   Documentation/devicetree/bindings/spmi/spmi.yaml
> -
> -Required properties for peripheral child nodes:
> -- compatible:      Should contain "qcom,xxx", where "xxx" is a periphera=
l name.
> -
> -Optional properties for peripheral child nodes:
> -- interrupts:      Interrupts are specified as a 4-tuple. For more infor=
mation
> -                   see:
> -                   Documentation/devicetree/bindings/spmi/qcom,spmi-pmic=
-arb.txt
> -- interrupt-names: Corresponding interrupt name to the interrupts proper=
ty
> -
> -Each child node of SPMI slave id represents a function of the PMIC. In t=
he
> -example below the rtc device node represents a peripheral of pm8941
> -SID =3D 0. The regulator device node represents a peripheral of pm8941 S=
ID =3D 1.
> -
> -Example:
> -
> -       spmi {
> -               compatible =3D "qcom,spmi-pmic-arb";
> -
> -               pm8941@0 {
> -                       compatible =3D "qcom,pm8941", "qcom,spmi-pmic";
> -                       reg =3D <0x0 SPMI_USID>;
> -
> -                       rtc {
> -                               compatible =3D "qcom,rtc";
> -                               interrupts =3D <0x0 0x61 0x1 IRQ_TYPE_EDG=
E_RISING>;
> -                               interrupt-names =3D "alarm";
> -                       };
> -               };
> -
> -               pm8941@1 {
> -                       compatible =3D "qcom,pm8941", "qcom,spmi-pmic";
> -                       reg =3D <0x1 SPMI_USID>;
> -
> -                       regulator {
> -                               compatible =3D "qcom,regulator";
> -                               regulator-name =3D "8941_boost";
> -                       };
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/=
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> new file mode 100644
> index 0000000..e458dd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI PMICs multi-function device bindings
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>

Someone at Qualcomm should be the maintainer here. Maybe you?

> +
> +description: |
> +  The Qualcomm SPMI PMICs use a QPNP scheme through SPMI interface.

What is QPNP?

> +  QPNP is effectively a partitioning scheme for dividing the SPMI extend=
ed
> +  register space up into logical pieces, and set of fixed register
> +  locations/definitions within these regions, with some of these regions
> +  specifically used for interrupt handling.
> +
> +  The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and =
are
> +  interfaced to the chip via the SPMI (System Power Management Interface=
) bus.
> +  Support for multiple independent functions are implemented by splittin=
g the
> +  16-bit SPMI slave address space into 256 smaller fixed-size regions, 2=
56 bytes
> +  each. A function can consume one or more of these fixed-size register =
regions.
> +
> +properties:
> +  spmi_bus:
> +    type: object
> +    description: SPMI bus node
> +
> +patternProperties:
> +  "^pmic@[0-9]$":
> +    description: Child PMIC nodes
> +    type: object
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              # Sorted based on subtype ID the device reports
> +              - qcom,pm8941
> +              - qcom,pm8841
> +              - qcom,pma8084
> +              - qcom,pm8019
> +              - qcom,pm8226
> +              - qcom,pm8110
> +              - qcom,pma8084
> +              - qcom,pmi8962
> +              - qcom,pmd9635
> +              - qcom,pm8994
> +              - qcom,pmi8994
> +              - qcom,pm8916
> +              - qcom,pm8004
> +              - qcom,pm8909
> +              - qcom,pm8950
> +              - qcom,pmi8950
> +              - qcom,pm8998
> +              - qcom,pmi8998
> +              - qcom,pm8005
> +              - qcom,pm660l
> +              - qcom,pm660
> +
> +          - enum:
> +              - qcom,spmi-pmic
> +
> +      reg:
> +        maxItems: 1
> +        description:
> +          Specifies the SPMI USID slave address for this device.
> +          For more information see bindings/spmi/spmi.txt
> +
> +    patternProperties:
> +      "@[0-9a-f]$":

Is that @ sign supposed to be a ^ sign? I thought the child nodes of a
pmic node were [a-zA-Z0-9-] or some sort of regex like that. Certainly
not an address that doesn't exist. They look to be things like 'rtc' or
'regulator'.

> +        description:
> +          Each child node of SPMI slave id represents a function of the =
PMIC.
> +          In the example below the rtc device node represents a peripher=
al of
> +          pm8941 SID =3D 0. The regulator device node represents a perip=
heral of
> +          pm8941 SID =3D 1.
> +        type: object
> +
> +        properties:
> +          interrupts:
> +            maxItems: 4
> +            description:
> +              Interrupts are specified as a 4-tuple. For more information

Seems like minItems is also 4 though, so should be a const 4 instead?
But then this is about how many interrupts there are, which would be 1
or 2?  It really can't be known in case there are many interrupts for a
child node so not sure we need to specify anything.

> +              see bindings/spmi/qcom,spmi-pmic-arb.txt
> +
> +          interrupt-names:
> +            description:
> +              Corresponding interrupt name to the interrupts property

I suspect we should drop these two properties and leave them up to the
binding for the function, like rtc, or regualator, etc.

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi_bus {
> +        compatible =3D "qcom,spmi-pmic-arb";
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +
> +        pmic@0 {
> +         compatible =3D "qcom,pm8941";
> +         reg =3D <0x0 SPMI_USID>;
> +
> +         rtc {
> +           compatible =3D "qcom,rtc";
> +           interrupts =3D <0x0 0x61 0x1 0x1>;
> +           interrupt-names =3D "alarm";
> +          };
> +        };
> +
> +        pmic@1 {
> +         compatible =3D "qcom,pm8941";
> +         reg =3D <0x1 SPMI_USID>;
> +
> +         regulator {
> +           compatible =3D "qcom,regulator";
> +           regulator-name =3D "8941_boost";
> +           };
> +          };
> +        };
> +...
