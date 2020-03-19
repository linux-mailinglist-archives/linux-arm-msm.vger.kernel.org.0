Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC23618AA31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 02:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgCSBI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 21:08:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39092 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgCSBIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 21:08:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id b22so254900pgb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 18:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=HOrVTVj94hEqYzP+BNYpSkqs29uiFE6WXOJ/uoI1nY0=;
        b=MT0Y8soJkEXXSdQVlOiuDB77ehUHT9j37xPgvUaPEAjUfLvnUxhWsASSZRDBU80+UE
         4Yvm727E1zUBc7xZdiND5J9r7CGnI47FLMRXA/TzwP0VJmbe4GjX95BHgnmtZ5gbpDnq
         YVcYCFBwG76DaaWPMx5qXkx/DqtnKFixVSljU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=HOrVTVj94hEqYzP+BNYpSkqs29uiFE6WXOJ/uoI1nY0=;
        b=K0gXMPCKrjytKJVjLjyeHEpx0rtq7K4fD6aM5LQvnbJ7PKtHIkOkj5ATRbGrmaY2Ds
         xbM3RcVqiz/VOu6qn0QFBaN0mKi6ZHC9W085t87eBVDnmCIDSTKI9djNJ1U8zxyX5f7M
         Q3n1o4kXadtesxWNUHeHhpHnT25fk7j0+v5w5Vd4Qsl2B7ZiD1NRcHWxUSDjL+ILthDH
         UGTYiKHa3njInltErK7VMA9bxGvz/DjqMpyiy/zv+WVG/Hnb3mlY7fHibGNgDM/iHH6o
         Iz2zRalrXsE8jxtD0QxACWkP3Dnajeh2bhxW6MvlP+sntSV+tbf6lxt7156vCpFiBWTp
         2/OQ==
X-Gm-Message-State: ANhLgQ2jBAkTdmPJwUH6BTNoOBl3Ckc3CYUXz7cmItldF0w3EVpc/OSS
        oh0G8Ul6d6FARpk9xKb9HsqjXwSi3AI=
X-Google-Smtp-Source: ADFU+vuAWgIWajuJGpPlRJxuUxjrbJeZVY6ltZuXXUYT9Lo/14j2AaHjIDuHwCwpxd//vqXGygp/gA==
X-Received: by 2002:aa7:8bd1:: with SMTP id s17mr1130786pfd.225.1584580133274;
        Wed, 18 Mar 2020 18:08:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y15sm209863pfc.206.2020.03.18.18.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 18:08:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200311191501.8165-3-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org> <20200311191501.8165-3-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 2/7] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Date:   Wed, 18 Mar 2020 18:08:51 -0700
Message-ID: <158458013177.152100.17920784952083533825@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-03-11 12:14:56)
> A USB connector should be a child node of the USB controller
> connector/usb-connector.txt. This patch adds an example of how to do this
> to the dwc3 binding descriptions.

I read that as a child of the USB interface controller, which is not the
same as the USB controller. For example, we're talking about having the
usb connector be a child of the EC on ChromeOS devices because that
manages the connector

>=20
> It is necessary to declare a connector as a child-node of a USB controller
> for role-switching to work, so this example should be helpful to others
> implementing that.

Maybe it should be a virtual node at the root of the DT if it's GPIO
controlled? And then the phy can be connected to the usb connector
through the graph binding.

>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Felipe Balbi <balbi@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentati=
on/devicetree/bindings/usb/dwc3.txt
> index 66780a47ad85..4e1e4afccee6 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -121,4 +121,12 @@ dwc3@4a030000 {
>         interrupts =3D <0 92 4>
>         usb-phy =3D <&usb2_phy>, <&usb3,phy>;

Weird that there's a comma here        ^

Not a problem with this patch, just noticing it while reading the diff.

>         snps,incr-burst-type-adjustment =3D <1>, <4>, <8>, <16>;
> +
> +       usb_con: connector {
> +               compatible =3D "gpio-usb-b-connector";
> +               id-gpios =3D <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +               vbus-supply =3D <&usb3_vbus_reg>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usb3_id_pin>, <&usb3_vbus_pin>;
> +       };
