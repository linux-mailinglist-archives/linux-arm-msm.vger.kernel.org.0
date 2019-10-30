Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 371F3E9DB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 15:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfJ3OiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 10:38:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39659 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfJ3OiB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 10:38:01 -0400
Received: by mail-pl1-f193.google.com with SMTP id t12so1075614plo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2019 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=BBv3NprOG50sxvV01T9xKOwoL1vnOBWmmTcp5qlcolM=;
        b=NOjUeleY56P/LLUhY1pDoMnnIXClWmYXJvok8jOJp3QgI88kWTeW05aqKfpHLHACV3
         aF86H3C7FuC7GLtJHKwUB2suKcncbPKdqzYpyLaWsWbgKzop0W7t2tZIfB7PeQbD9gLX
         JMx0x2pXd7Bldrs+8e3NRyg15mHROuUwI9HIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=BBv3NprOG50sxvV01T9xKOwoL1vnOBWmmTcp5qlcolM=;
        b=iLUABFIoOppX0M+AavwVL9qyPQMhlMi+Fgq6S0JA/ikGI1IXHixqJ9v+k/NWcic08q
         al1wvZrYzkMm6agqYqrSG/lSDqrx/jwOPZDDKulal7CjiTGXnh42gKDG75FHz9jJxMT0
         3tS5BF9g/ouGiFm0rljmnLOi/Olavfi/Uw0f62PmeQOb2g0tUpKAy0eL5AurVXVe8mFc
         CRAVbWo2Kh8znJNqDEbI1r8hh7x84ROyFmYmJ5+g0GlYWs0i/PB165QDoS20wqUkrWpq
         I6DJuDfctRyuIGGhHOtLlRjyeaU3SWAhBsr9leQcY8YcRKcU9S7DRZbS+L9RuWOhVtUw
         i5bw==
X-Gm-Message-State: APjAAAXpdD13oYkPKNtJIqhE3K+oqvehnUYSObeFMYLSmznsvXGjqoZe
        L5XcXXWZ96GcyRNVD1gLWQk9ZA==
X-Google-Smtp-Source: APXvYqyHlRn1/yRrhaMo098pWSKHb/HjxYHgjr7bjEr7ArRvZo66VLas7ihQktLOpOA6X2+FVNay+A==
X-Received: by 2002:a17:902:6b06:: with SMTP id o6mr363566plk.154.1572446280248;
        Wed, 30 Oct 2019 07:38:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m12sm2273154pjk.13.2019.10.30.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:37:59 -0700 (PDT)
Message-ID: <5db9a047.1c69fb81.85ac7.7aa1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87ec773e0d92571c4bbed44eeb65cff5@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org> <20191023090219.15603-9-rnayak@codeaurora.org> <5db86b1b.1c69fb81.be45f.0bb2@mx.google.com> <87ec773e0d92571c4bbed44eeb65cff5@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: pm6150: Add PM6150/PM6150L PMIC peripherals
To:     kgunda@codeaurora.org
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
User-Agent: alot/0.8.1
Date:   Wed, 30 Oct 2019 07:37:58 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting kgunda@codeaurora.org (2019-10-30 00:06:05)
> On 2019-10-29 22:08, Stephen Boyd wrote:
> > Quoting Rajendra Nayak (2019-10-23 02:02:16)
> >> diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi=20
> >> b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> >> new file mode 100644
> >> index 000000000000..20eb928e5ce3
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> >> @@ -0,0 +1,85 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +// Copyright (c) 2019, The Linux Foundation. All rights reserved.
> >> +
> >> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> >> +#include <dt-bindings/input/linux-event-codes.h>
> >> +#include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/spmi/spmi.h>
> >> +#include <dt-bindings/thermal/thermal.h>
> >> +
> >> +&spmi_bus {
> >> +       pm6150_lsid0: pmic@0 {
> >> +               compatible =3D "qcom,pm6150", "qcom,spmi-pmic";
> >> +               reg =3D <0x0 SPMI_USID>;
> >> +               #address-cells =3D <1>;
> >> +               #size-cells =3D <0>;
> >> +
> >> +               pm6150_pon: pon@800 {
> >> +                       compatible =3D "qcom,pm8998-pon";
> >> +                       reg =3D <0x800>;
> >> +                       mode-bootloader =3D <0x2>;
> >> +                       mode-recovery =3D <0x1>;
> >=20
> > Can this have status =3D "disabled"? Or is the idea that if the pmic=20
> > power
> > button isn't used it should be disabled in the board dts file?
> >=20
> Yes. The idea is to go with latter option. Disable it in the board dts=20
> file if the
> pmic power button is not used.

Ok. Thanks.

> >> +
> >> +                       interrupt-names =3D "pm6150_gpio1",=20
> >> "pm6150_gpio2",
> >> +                                       "pm6150_gpio3",=20
> >> "pm6150_gpio4",
> >> +                                       "pm6150_gpio5",=20
> >> "pm6150_gpio6",
> >> +                                       "pm6150_gpio7",=20
> >> "pm6150_gpio8",
> >> +                                       "pm6150_gpio9",=20
> >> "pm6150_gpio10";
> >=20
> > And this? And have gpio-ranges and use the irqdomain work. Basically,
> > should look like pm8998.
> Ok.. We can go ahead with the pm8998 way as well. We will address it in=20
> next series.

Yes please use the pm8998 way..

