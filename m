Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11699192D22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 16:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbgCYPoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 11:44:05 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34934 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbgCYPoE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 11:44:04 -0400
Received: by mail-lj1-f194.google.com with SMTP id k21so2986394ljh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2020 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LBAifNBmrJnMhjXFj42AkkhqZk/DQgMX1I7zEeLO1KM=;
        b=BQj5OkGjAfRNIZLzNB09MAQd/d6rMp+y/3v/RIjRwrlpz81TLpzSf574xy/Fzl7TWc
         /CnJxZQkyKsuI2hoYgY/UcZrNpajW/YYPP0OOU7g5Nz/CllobgzdUZOJK22HsGxZmNBf
         SzrH6aZ5hgUTYeckKeYq9JSpshRCWflklBFg9xgRIjWUjef35vEidrAzDW6isEjPiRRV
         VZptdUit+XcCDzugpMaYWb0ADXPmkqRaKu2WGVuv6JDxh1NxtYWzsOUzkYZwiYwkN0Ri
         K32sgHweA6E+NuYJZWEucxvaA5w8ELuazdl49BTu7DSaKyFxSKhbTslV9+C+TNMsVfL5
         9fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LBAifNBmrJnMhjXFj42AkkhqZk/DQgMX1I7zEeLO1KM=;
        b=IBXHELu0h3/4dC2UOcWdRKXyvi1ynVfC05cM0Vm2xOnijhWVZGicjLtOAYFV2oNQ8Z
         bK3CsML1UhFMvflwrx9HxXOSjFz6G93lMpd/R28XOI4e8Bo4wjL3KvFfZZy9dqnsnoA7
         SdDg1IHKksdSmfPRv2CL5eDyFEjgK5Q9hsydkVDdwcCBss+DBHjR2o+lEp1cgKgjI6hO
         dx7nBG9ado9+K3nDrVM1RhAE1cEqzz8Z/hosa1f5NfN0lBL7obqlMtdbiytO/dPSQxaU
         5bGv6N9sQ0dNMabr3EUPTB1VdqDJDziel06BTF+XopvehqMpVwbgiLg152qZN4bLoRSh
         7TDw==
X-Gm-Message-State: ANhLgQ2H4sNN9IvM9Zjj6LeB2YKRMCjX+OV7eBWDK87EzWnuLmML2sJB
        4tnsnxvGCmsORL26scEhVRsVS6P4CvndnnqoBpRh0Q==
X-Google-Smtp-Source: APiQypLy1o1jAyUhx+0b/e3QcaAKhZzmljoMl1rKjv8eoyonaedCEKN0p1ZyRQD0GsUQPUQztHMcDRDH5VU2lJagPw8=
X-Received: by 2002:a2e:9497:: with SMTP id c23mr2340592ljh.286.1585151042137;
 Wed, 25 Mar 2020 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200324180513.3882-1-robh@kernel.org>
In-Reply-To: <20200324180513.3882-1-robh@kernel.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 25 Mar 2020 21:13:50 +0530
Message-ID: <CAP245DWvF+BPczjQgcwrSoYrAB7DxVaz+LSphbBMo00JT=O85w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: tsens: Fix nvmem-cell-names schema
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 24, 2020 at 11:35 PM Rob Herring <robh@kernel.org> wrote:
>
> There's a typo 'nvmem-cells-names' in the schema which means the correct
> 'nvmem-cell-names' in the examples are not checked. The possible values
> are wrong too both in that the 2nd entry is not specified correctly and the
> values are just wrong based on the dts files in the kernel.


Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> Fixes: a877e768f655 ("dt-bindings: thermal: tsens: Convert over to a yaml schema")
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Amit Kucheria <amit.kucheria@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index eac644d9e238..7a38d2116059 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -52,13 +52,12 @@ properties:
>      description:
>        Reference to an nvmem node for the calibration data
>
> -  nvmem-cells-names:
> +  nvmem-cell-names:
>      minItems: 1
>      maxItems: 2
>      items:
> -      - enum:
> -        - caldata
> -        - calsel
> +      - const: calib
> +      - const: calib_sel
>
>    "#qcom,sensors":
>      allOf:
> @@ -124,7 +123,7 @@ examples:
>                   <0x4a8000 0x1000>; /* SROT */
>
>             nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
> -           nvmem-cell-names = "caldata", "calsel";
> +           nvmem-cell-names = "calib", "calib_sel";
>
>             interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
>             interrupt-names = "uplow";
> --
> 2.20.1
>
