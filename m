Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D44449C4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 20:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbhKHTZg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 14:25:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:55824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236881AbhKHTZg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 14:25:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9B956125F;
        Mon,  8 Nov 2021 19:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636399371;
        bh=OyhdrCwmduas8Bf2SGokDWTFUEz0lqll6PmVnmcUhv4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=njub24Ve76vttifGaOD4cEPCM7kGx3yiceFq6ZTAuR3EXMIgQebgZYSrCyrAE9DTl
         tjaJN0O8IpYlmrYmdHNxhCziAiATbGBfsGDlliozbJvThGPA6hEY4wt+Izcf12VXTv
         bCQOHzSE5D7ey01XPBpJdQndvRJEJjp6qVdDef4wMaAmO5Rz3gdMi2mLJAagMkSzzy
         O0VtOJNZJ03sr7K+f1z8lpYvKUXfyVsKZ7kmJs5PUuxrjLNJKoacXWdtVFxZ4VDPaF
         w6T+YDcS6HN+es/R56bJckwGuzCtFrSQT6oeC5NtCCsdS6mIvVhIiKzXS4B6OgU5//
         aL2Ym54BX/tYQ==
Received: by mail-ed1-f50.google.com with SMTP id j21so66640221edt.11;
        Mon, 08 Nov 2021 11:22:51 -0800 (PST)
X-Gm-Message-State: AOAM5326AtUT2gNrSIFMWJaCpaivxSEujVKfjw56xP96Q434H1Y2pCUc
        5lBWuRKTmbHANhZMqmv4Cw1TuoHvts3tvTzH0w==
X-Google-Smtp-Source: ABdhPJxHy3XXfeSCxRM6y5yMWPG5BE73S7jjdC+obQdE/fzygBWUNNSaifQexXjzhpIRnlgxhjmon4sS/awswuFEGXg=
X-Received: by 2002:a17:907:3f24:: with SMTP id hq36mr2031288ejc.390.1636399369785;
 Mon, 08 Nov 2021 11:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-6-bryan.odonoghue@linaro.org> <YYlaqTYhe4hbXhFf@robh.at.kernel.org>
 <60841bf0-f5ea-314f-34c6-822a8812000d@linaro.org>
In-Reply-To: <60841bf0-f5ea-314f-34c6-822a8812000d@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 8 Nov 2021 13:22:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKtesGfaJ+81jaWzB1kD_qXeehv7hrvXh3x=cpo15Ny-g@mail.gmail.com>
Message-ID: <CAL_JsqKtesGfaJ+81jaWzB1kD_qXeehv7hrvXh3x=cpo15Ny-g@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 8, 2021 at 12:58 PM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 08/11/2021 17:13, Rob Herring wrote:
> > Looks like the h/w is all part of a
> > PMIC, so it should be part of the PMIC binding and probably merged with
> > one of the nodes these phandles point to.
>
> Not sure I really follow you here.
>
> The existing PMIC dts arch/arm64/boot/dts/qcom/pm8150b.dtsi has:
>
> pm8150b_gpios: gpio@c000 {
>      compatible = "qcom,pm8150b-gpio";
> }
> Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>
> and
>
> pm8150b_adc_tm: adc-tm@3500 {
>      compatible = "qcom,spmi-adc-tm5";
> };
> Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
>
> to which I'm adding :
>
> pm8150b_typec: typec@1500 {
>      compatible = "qcom,pm8150b-typec";
> };
>
> Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
>
> pm8150b_pdphy: pdphy@1700 {
>      compatible = "qcom,pm8150b-pdphy";
> };
>
> Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml

From what I gather, there is not a 3rd h/w device this binding
describes, but it is just a collection of all the data you happen to
want for your driver. That's assuming a specific structure for a
specific OS. Why can't most of this binding be part of
"qcom,pm8150b-typec" instead of making up some virtual device?

Rob
