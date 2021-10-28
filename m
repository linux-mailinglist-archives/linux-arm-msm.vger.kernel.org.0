Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79C743F218
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 23:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhJ1V7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 17:59:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:37244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230476AbhJ1V7P (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 17:59:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A67560EFF;
        Thu, 28 Oct 2021 21:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635458208;
        bh=p1CgpYh4aVtdnX6MdBbbbhbddudo+aw//ZNbp0j3+c8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d4rAxZjeh2FEiYPF4uFQFptIetsY/Q0YZUVzaBQT5mcTcBmZwrniixzFBiFTiTFPA
         31//Yjvov6QH95zQDzVMYjZWcbG4/wi2OI5+VQUG34WQH0mJbra7YSS/iiIECESneE
         IlCXBMfXhrth6eqkObgjSYsMp8TqQNlDqvY/qBzMZBp3MiO226/XBLTkDlP0x9s+lW
         iU/j0SV17Oh6cdRNPZlVbFOtgeeeCyEpiDyjBzB0ilvgnDUzZ1VFBYOdAsKn0C014T
         OaWTszoJN1jhSY7G57HfA/uODPR1uC/5YSSxPWt0uX8p96tO+Smr2z7Kd4YCakZY+5
         oPNob95+R/FNg==
Received: by mail-ed1-f46.google.com with SMTP id 5so29855710edw.7;
        Thu, 28 Oct 2021 14:56:48 -0700 (PDT)
X-Gm-Message-State: AOAM532eoqhvHHoHQTMZR7O7bRY0j6Dp+/Q2WkszdC0x4iC1mgMFMzUz
        uMMBpWo5Xez1W9WmnUrYZCoiFgZPy9550LWJpA==
X-Google-Smtp-Source: ABdhPJyBZTHa1ojrhvI9yd99LoSOz9t2pRPDfh45BIbRWanmI5KCU7TATgBknuLMfpapt+/+JRbD8NqF5DmgcvkeHrk=
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr8354497ejc.466.1635458206566;
 Thu, 28 Oct 2021 14:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211028211753.573480-1-jaschultzMS@gmail.com> <20211028211753.573480-2-jaschultzMS@gmail.com>
In-Reply-To: <20211028211753.573480-2-jaschultzMS@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 28 Oct 2021 16:56:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxg3-Th85cYNJqCgQFYB0awgXV-=OkASk_aDY-H4Mk5g@mail.gmail.com>
Message-ID: <CAL_JsqLxg3-Th85cYNJqCgQFYB0awgXV-=OkASk_aDY-H4Mk5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: platform: microsoft: Document surface xbl
To:     Jarrett Schultz <jaschultzms@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 28, 2021 at 4:18 PM Jarrett Schultz <jaschultzms@gmail.com> wrote:
>
> Introduce yaml for surface xbl driver.

What's surface? What's xbl? Bindings are for h/w devices, not drivers.

Please send DT patches to the DT list. IOW, run get_maintainers.pl.

>
> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> ---
>  .../platform/microsoft/surface-xbl.yaml       | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
>
> diff --git a/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> new file mode 100644
> index 000000000000..3d2771322e72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please. Run checkpatch.pl as that will tell you this.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/platform/microsoft/surface-xbl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Surface Extensible Bootloader for Microsoft Surface Duo
> +
> +maintainers:
> +  - Jarrett Schultz <jaschultzMS@gmail.com>
> +
> +description: |
> +  Exposes device information to user space.

What does that mean?

> +
> +allOf:
> +  - $ref: /schemas/platform/microsoft/surface-xbl.c#

You have a C file with json-schema?

> +
> +properties:
> +  compatible:
> +    const: microsoft,sm8150-surface-duo-xbl
> +
> +  reg:
> +    maxItems: 1
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    xbl@146bfa94 {
> +      compatible = "microsoft,sm8150-surface-duo-xbl";
> +      reg = <0x00 0x146bfa94 0x00 0x100>;

That's an odd address. Is this part of some other block?

> +    };
> --
> 2.25.1
>
